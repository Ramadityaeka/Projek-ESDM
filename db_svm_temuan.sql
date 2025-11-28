-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 28, 2025 at 04:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_svm_temuan`
--

-- --------------------------------------------------------

--
-- Table structure for table `kode_jenis_rekomendasi`
--

CREATE TABLE `kode_jenis_rekomendasi` (
  `kode_temuan` varchar(4) DEFAULT NULL,
  `nama_temuan` varchar(248) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kode_jenis_rekomendasi`
--

INSERT INTO `kode_jenis_rekomendasi` (`kode_temuan`, `nama_temuan`) VALUES
('0001', 'Rekomendasi belum didefinisikan'),
('0101', 'Penyetoran kembali uang ke Kas negara'),
('0102', 'Penyetoran ke Kas Negara sisa beban sementara, Pajak dan non Pajak yang belum disetor atau menirim SPT ke KPP yang di dalamnya melaporakan pula kekurangan yang harus di setor'),
('0103', 'Penagihan dari pihak ketiga hak Negara berupa pajak dan non pajak dan penyetorannya ke Kas negara atau menirim SPT ke KPP yang di dalamnya melaporkan pula kekurangan yang harus di setor'),
('0104', 'Penyetoran kembali uang ke Kas Daerah'),
('0105', 'Penyetoran ke Kas Daerah sisa beban sementara, pajak daerah dan non pajak daerah'),
('0106', 'Penagihan dari pihak ketiga hak Daerah berupa pajak daerah dan non pajak daerah serta penyetorannya ke Kas Daerah'),
('0107', 'Penyetoran kembali uang ke Kas BUMN/BUMD'),
('0108', 'Penagihan dari pihak ketiga hak BUMN/BUMD dan pelunasannya oleh pihak ketiga'),
('0109', 'Pengenaan denda dan penyetoran denda ke Kas Negara/Kas Daerah/Kas BUMN/Kas BUMD'),
('0110', 'Tuntutan ganti rugi terhadap pegawai dan penyetoran ganti rugi ke Kas Negara/kas Daerah'),
('0111', 'Tuntutan ganti rugi terhadap pihak ketiga dan penyetoran ganti rugi ke Kas Negara/ Kas Daerah'),
('0112', 'Tuntutan ganti rugi terhadap pegawai BUMN/BUMD dan penyetoran ganti rugi ke Kas BUMN/BUMD'),
('0113', 'Tuntutan perbendaharaan terhadap Bendahatawan pusat dan penyetoran ganti rugi ke Kas Negara'),
('0114', 'Tuntutan perbendaharaan terhadap Bendaharawan Daerah dan penyetoran ganti rugi ke Kas Daerah'),
('0115', 'Tuntutan perbendaharaan terhadap pegawai penyimpan uang atau barang BUMN/BUMD dan penyetoran ganti rugi ke Kas BUMN/BUMD'),
('0116', 'Penagihan dari pegawai hak/tagihan negara dan penyetorannya ke Kas Negara/ Daerah'),
('0117', 'Penagihan dari pegawai BUMN/BUMD hak atau tagihan BUMN/ BUMD dan penyetorannya ke Kas BUMN/BUMD'),
('0118', 'Pembatalan pengeluaran yang tidak sesuai dengan mata anggarannya dan penyetorannya ke Kas Negara/Kas Daerah'),
('0119', 'Pembatalan pengeluaran yang melampaui anggarannya'),
('0120', 'Rekomendasi lainnya yang bersifat finansial'),
('0121', 'Pengembalian Pungli  kepada masyarakat'),
('0201', 'Pengembalian barang milik Negara'),
('0202', 'Penyerahan barang/jasa sebagai realisasi kontrak kepada Negara'),
('0203', 'Rekomendasi lain bersifat dapat dinilai dengan uang'),
('0204', 'Pengembalian bantuan yang dipotong kepada masyarakat'),
('0301', 'Pelaksanaan hukuman disiplin berdasarkan PP 30 th 1980'),
('0302', 'Pelaksanaan hukuman disiplin berdasarkan peraturan lainnya'),
('0303', 'Penyerahan kasus tindak pidana korupsi kepada Kejaksaan Agung'),
('0304', 'Penyerahan kasus tindak pidana umum kepada Kepolisian Negara'),
('0305', 'Penyerahan kasus perdata kepada BUPLN'),
('0306', 'Rekomendasi lain bersifat hukuman'),
('0401', 'Penyerahan kasus perdata kepada Pengadilan Negeri'),
('0402', 'Penyerahan kasus perselisihan kepada badan arbitrase'),
('0403', 'Rekomendasi lain bersifat perlunya ada arbitrase'),
('0501', 'Memperbaiki segera kegiatan atau keadaan agar sesuai dengan peraturan perundang-undangan yang belaku'),
('0502', 'Memperbaiki segara kegiatan atau keadaan agar sesuai dengan prosedur atau tata kerja yang berlaku bagi organisasi termasuk prinsip akuntansi yang lazim'),
('0503', 'Membatalkan keputusan atau pelaksanaan kegiatan yang tidak sesuai dengan pe raturan perundang-undangan atau prosedur dan tata kerja yang berlaku'),
('0504', 'Rekomendasi lain bersifat penegakan aturan'),
('0602', 'Penyempumaan kebijakan pengadaan sumber daya'),
('0603', 'Penyempurnaan prosedur pelaksanaan pengadaan sumber daya'),
('0604', 'Penyempumaan rencana yang sudah ada mengenai pengadaan sumber daya'),
('0605', 'Penyempumaan sistem pencatatan dan pelaporan dalam rangka meningkatkan efektivitas permantauan atasan untuk pengarahan & tindakan korektif terhadap penyimpangan yang terjadi dalam proses pengadaan sumber daya'),
('0606', 'Peningkatan mutu personil dan personil kunci yang terlibat dalam proses pengadaan sumber daya'),
('0607', 'Penyempumaan proses perumusan kebijakan pengadaan sumber daya'),
('0608', 'Penyempurnaan proses perencanaan pengadaan sumber daya'),
('0609', 'Penyempurnaan sistem informasi pasar dalam rangka pengadaan sumber daya'),
('0610', 'Penyempurnaan proses pengarahan dan tindakan korektif oleh atasan terhadap penyimpangan'),
('0611', 'Penyempumaan sistem evaluasi atasan terhadap proses dan hasil pengadaan sumber daya'),
('0612', 'Penyempurnaan lain dalam proses pengadaan sumber daya agar tercapai tujuan mendapatkan sumber daya dengan biaya yang terendah tanpa menurunkan pemenuhan fungsi & kualifikasi minimum sumber daya dalam kedudukannya sebagai masukan untuk mencapai tuju'),
('0701', 'Penyempumaan standar masukan/ keluaran atau masukan/keluaran bagian/ bidang tertentu (pusat-pusat tanggungjawab)'),
('0702', 'Penyempumaan pemantauan atasan terhadap penyimpangan pusat tanggungj awab dari standar dalam rangka mening katkan efektivitas pengarahan atasan dan atau tindakan korektif atasan teradap penyimpangan dari standar tersebut'),
('0703', 'Penyempumaan unsur-unsur sistem pengendalian (sarana waskat) dalam rangka meningkatkan efektivitas pengendalian terhadap efisiensi penggunaan sumber daya dan tata kerja (dibandingkan tata kerja lainnya yang mungkin) dalam mencapai tujuan organisasi'),
('0704', 'Penyempurnaan pelaksanaan pemantauan oleh atasan terhadap penggunaan sumber daya dan tata kerja untuk menghasilkan keluaran dalam rangka meningkatkan efektivitas pengarahan dan atau tindakan korektif atasan terhadap keadaan yang menurunkan efisiens'),
('0705', 'Penyempurnaan sistem evaluasi atasan terhadap efisiensi operasional pusat - pusat tanggungjawab dan efisiensi tata kerja organisasi (dibandingkan tata kerja lain yang mungkin) dalam mencapai tujuan organisasi secara efektif'),
('0706', 'Penyempurnaan lain penggunaan sumber daya, hasil yang diperoleh dan tata kerja dalam rangka meningkatkan efisiensi penggunaan sumber daya dan tata kerja menghasilkan keluaran dalam mencapai tujuan antara atau tujuan organisasi secara efektif'),
('0801', 'Penyempurnaan kuantifikasi keluaran organisasi'),
('0802', 'Penyempumaan kuantifikasi tujuan yang ingin dicapai organisasi atau indikator keberhasilan organisasi'),
('0803', 'Penyempumaan kejelasan tujuan organisasi'),
('0804', 'Penyempurnaan strategi manajemen (kebijakan dan program pokok) dalam mencapai tujuan organisasi secara efisien dan efektif'),
('0805', 'Penyempurnaan alokasi sumber daya untuk meningkatkan efisiensi dan efektivitas pencapaian tujuan organisasi'),
('0806', 'Penyempurnaan unsur-unsur sistem pengendalian (sarana waskat) dalam rangka meningkatkan pengendalian atasan terhadap efisensi dan efektivitas pencapaian tujuan organisasi'),
('0807', 'Penyempurnaan pelaksanaan pemantauan oleh atasan terhadap penggunaan sumber daya dan kegiatan mencapai tujuan dalam rangka meningkatkan efektivitas pengarahan dan atau tindakan korektif atasan terhadap penyimpangan yang akan menghambat/menghalangi'),
('0808', 'Penyempurnaan sistem penilaian atasan terhadap penggunaan sumber daya dan tata kerja mencapai tujuan & terhadap tujuan yang dapat dicapai untuk bahan masukan bagi pelaksana siklus pengelolaan berikutnya'),
('0809', 'Penyempurnaan lain terhadap alokasi sumber daya, susunan sumber daya dan kegiatan organisasi dalam rangka pencapaian tujuan organisasi secara efisien dan efektif'),
('0810', 'Penyederhanaan kerja (work simplication) di bidang pelayanan perijinan dan rekomendasi instansi untuk penerbitan perijinan'),
('0811', 'Penyederhanan kerja (work simplication) di bidang pelaksanaan pelayanan sebagai tugas pokok instansi/BUMN/BUMD'),
('0812', 'Penyempurnaan penyebarluasan tatacara dan persyaratan perijinan/ pelayanan kepada masyarakat'),
('0813', 'Penyempurnaan koordinasi antar instansi dalam pelaksanaan pelayanan kepada masyarakat'),
('0901', 'Penyempurnaan organisasi. (9001)'),
('0902', 'Penyempurnaan kebijakan. (9002)'),
('0903', 'Penyempurnaan perencanaan. (9003)'),
('0904', 'Penyempurnaan pembinaan personil. (9004)'),
('0905', 'Penyempurnaan prosedur. (9005)'),
('0906', 'Penyempurnaan pencatatan dan pelaporan. (9006)'),
('0907', 'Penyempurnaan review/pengawasan intern. (9007)'),
('1001', 'Hukuman teguran Lisan'),
('1002', 'Hukuman teguran tertulis'),
('1003', 'Pernyataan tidak puas secara tertulis'),
('1101', 'Penundaan gaji berkala untuk paling lama (1) satu tahun'),
('1102', 'Penurunan gaji sebesar satu kali kenaikan gaji berkala untuk paling lama (1) satu tahun'),
('1103', 'Penundaan kenaikan pangkat untuk paling lama (1) satu tahun'),
('1201', 'Penurunan pangkat pada pangkat yang setingkat lebih rendah untuk paling lama (1) satu tahun'),
('1202', 'Pembebasan Jabatan'),
('1203', 'Pemberhentian dengan hormat tidak atas permintaan sendiri sebagai PNS'),
('1204', 'Pemberhentian tidak dengan hormat sebagai PNS');

-- --------------------------------------------------------

--
-- Table structure for table `master_temuan`
--

CREATE TABLE `master_temuan` (
  `id` int(11) NOT NULL,
  `kode_temuan` varchar(10) DEFAULT NULL,
  `nama_temuan` varchar(150) DEFAULT NULL,
  `deskripsi_lengkap` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `master_temuan`
--
ALTER TABLE `master_temuan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_temuan` (`kode_temuan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `master_temuan`
--
ALTER TABLE `master_temuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
