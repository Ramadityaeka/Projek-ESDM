from fastapi import FastAPI, UploadFile, File, Form
from fastapi.responses import JSONResponse
import joblib
import pdfplumber
import tempfile
import re
import mysql.connector

# =========================
# KONFIGURASI DATABASE
# =========================
DB_HOST = "localhost"
DB_USER = "root"
DB_PASSWORD = ""          # <- ganti kalau MySQL kamu pakai password
DB_NAME = "esdm_db"       # <- GANTI dengan nama database kamu

# =========================
# LOAD MODEL & TOOLS SEKALI DI AWAL
# =========================
print("Load model & tools...")
model = joblib.load("model_svm.pkl")
tfidf = joblib.load("tfidf_vectorizer.pkl")
label_encoder = joblib.load("label_encoder.pkl")
print("Model & tools berhasil di-load.")

# =========================
# FUNGSI BANTU: PREPROCESS TEKS
# =========================
def preprocess(text: str) -> str:
    text = str(text).lower()
    text = re.sub(r'[^a-z0-9\s]', ' ', text)   # buang simbol
    text = re.sub(r'\s+', ' ', text).strip()   # rapikan spasi
    return text

# =========================
# FUNGSI BANTU: KONEKSI DB & AMBIL MASTER TEMUAN
# =========================
def get_koneksi_db():
    conn = mysql.connector.connect(
        host=DB_HOST,
        user=DB_USER,
        password=DB_PASSWORD,
        database=DB_NAME
    )
    return conn

def get_temuan_by_kode(kode_temuan: str):
    conn = get_koneksi_db()
    cur = conn.cursor(dictionary=True)
    cur.execute(
        "SELECT kode_temuan, nama_temuan, deskripsi_lengkap "
        "FROM master_temuan WHERE kode_temuan = %s LIMIT 1",
        (kode_temuan,)
    )
    row = cur.fetchone()
    cur.close()
    conn.close()
    return row

# =========================
# FUNGSI BANTU: PREDIKSI DARI TEKS
# =========================
def predict_from_text(text: str):
    clean = preprocess(text)
    X = tfidf.transform([clean])
    proba = model.predict_proba(X)[0]
    idx = proba.argmax()
    kode = label_encoder.inverse_transform([idx])[0]
    confidence = float(proba[idx])
    return kode, confidence

# =========================
# FUNGSI BANTU: EKSTRAK TEKS DARI PDF
# =========================
def extract_text_from_pdf(temp_path: str) -> str:
    text = ""
    with pdfplumber.open(temp_path) as pdf:
        for page in pdf.pages:
            page_text = page.extract_text() or ""
            text += page_text + "\n"
    return text

# =========================
# INISIALISASI FASTAPI
# =========================
app = FastAPI(
    title="API Klasifikasi Kode Temuan",
    description="API untuk klasifikasi dokumen ke kode temuan menggunakan SVM",
    version="1.0.0",
)

# =========================
# ENDPOINT 1: CEK SERVER
# =========================
@app.get("/")
def root():
    return {"message": "API Kode Temuan aktif."}

# =========================
# ENDPOINT 2: PREDIKSI DARI TEKS LANGSUNG (UNTUK UJI COBA)
# =========================
@app.post("/prediksi-teks")
def prediksi_teks(teks: str = Form(...)):
    """
    Kirim teks langsung (bukan PDF).
    Cocok untuk testing awal dengan Postman / Swagger.
    """
    if not teks.strip():
        return JSONResponse(
            {"success": False, "message": "Teks kosong"},
            status_code=400
        )

    kode, confidence = predict_from_text(teks)

    # Ambil detail temuan dari DB
    detail = get_temuan_by_kode(kode)
    if detail is None:
        # Kalau kode tidak ada di master_temuan
        return {
            "success": True,
            "kode_temuan": kode,
            "confidence": confidence,
            "nama_temuan": None,
            "deskripsi_lengkap": None,
            "warning": "Kode temuan tidak ditemukan di tabel master_temuan"
        }

    return {
        "success": True,
        "kode_temuan": detail["kode_temuan"],
        "confidence": confidence,
        "nama_temuan": detail["nama_temuan"],
        "deskripsi_lengkap": detail["deskripsi_lengkap"]
    }

# =========================
# ENDPOINT 3: PREDIKSI DARI PDF
# =========================
@app.post("/prediksi-pdf")
async def prediksi_pdf(file: UploadFile = File(...)):
    """
    Upload file PDF, API akan:
    - ekstrak teks
    - klasifikasikan
    - ambil detail kode temuan dari DB
    """
    if file.content_type != "application/pdf":
        return JSONResponse(
            {"success": False, "message": "File harus berformat PDF"},
            status_code=400
        )

    # Simpan sementara
    with tempfile.NamedTemporaryFile(delete=False, suffix=".pdf") as tmp:
        tmp.write(await file.read())
        temp_path = tmp.name

    # Ekstrak teks dari PDF
    raw_text = extract_text_from_pdf(temp_path)
    if not raw_text.strip():
        return JSONResponse(
            {"success": False, "message": "Teks di PDF kosong / tidak terbaca"},
            status_code=400
        )

    # Prediksi dari teks
    kode, confidence = predict_from_text(raw_text)

    # Ambil detail temuan dari DB
    detail = get_temuan_by_kode(kode)

    if detail is None:
        return {
            "success": True,
            "kode_temuan": kode,
            "confidence": confidence,
            "nama_temuan": None,
            "deskripsi_lengkap": None,
            "warning": "Kode temuan tidak ditemukan di tabel master_temuan"
        }

    return {
        "success": True,
        "kode_temuan": detail["kode_temuan"],
        "confidence": confidence,
        "nama_temuan": detail["nama_temuan"],
        "deskripsi_lengkap": detail["deskripsi_lengkap"]
    }
