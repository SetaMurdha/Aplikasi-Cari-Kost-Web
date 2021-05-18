-- --------------------------------------------------------
-- Host:                         localhost
-- Versi server:                 5.7.24-log - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Membuang struktur basisdata untuk carikost
CREATE DATABASE IF NOT EXISTS `carikost` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `carikost`;

-- membuang struktur untuk table carikost.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL DEFAULT '0',
  `ttl` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `email` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(300) NOT NULL DEFAULT '0',
  `foto` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.admin: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`id`, `nama`, `ttl`, `jenis_kelamin`, `email`, `password`, `foto`) VALUES
	(4, 'Parama Admaja', '1985-05-01', 'Laki-laki', 'admin1@gmail.com', '$2y$10$/jgC0Qpf2X.0bJX.kd60LuScbUkm.RhVOkLVY.6F55pjt86oetwoa', 'ba12216b983abe6f87026e9f4d646b56.png'),
	(5, 'Mauren Helvia Devi', '2000-05-07', 'Perempuan', 'admin2@gmail.com', '$2y$10$/jgC0Qpf2X.0bJX.kd60LuScbUkm.RhVOkLVY.6F55pjt86oetwoa', NULL),
	(6, 'Fany Parama', '2000-06-07', 'Laki-laki', 'admin3@gmail.com', '$2y$10$t70Pge791dCT.OBOicVde.FW1qNtpgI1pLkRfLqNgwuvgFlJBq6KG', NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- membuang struktur untuk table carikost.data_kost
CREATE TABLE IF NOT EXISTS `data_kost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nmkost` varchar(150) NOT NULL DEFAULT '0',
  `pemilik` varchar(150) NOT NULL DEFAULT '0',
  `id_kota_kab` int(11) NOT NULL DEFAULT '0',
  `alamat` text,
  `telepon` varchar(40) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `jenis` enum('Putra','Putri') DEFAULT NULL,
  `pembayaran` enum('Bulanan','Setengah Tahun','Tahunan') DEFAULT 'Bulanan',
  `longitude` float(10,7) DEFAULT NULL,
  `latitude` float(10,7) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kota_kab` (`id_kota_kab`),
  CONSTRAINT `FK_data_kost_kota_kab` FOREIGN KEY (`id_kota_kab`) REFERENCES `kota_kab` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.data_kost: ~99 rows (lebih kurang)
/*!40000 ALTER TABLE `data_kost` DISABLE KEYS */;
REPLACE INTO `data_kost` (`id`, `nmkost`, `pemilik`, `id_kota_kab`, `alamat`, `telepon`, `harga`, `jenis`, `pembayaran`, `longitude`, `latitude`, `foto`) VALUES
	(1, 'Kost Pink', 'Ibu Rofiah', 1, 'Jl. Sunan Ampel I No.29, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6283177836675', 12000000, 'Putri', 'Tahunan', 112.6066666, -7.9495459, NULL),
	(2, 'Kos Putra Bu Tajab', 'Ibu Tajab', 1, 'Jl. Sunan Ampel 2 No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 8000000, 'Putra', 'Tahunan', 112.6047745, -7.9494915, NULL),
	(3, 'Kost Bu Fikri', 'Ibu Fikri', 1, 'Jl. Sunan Ampel 2 No.4, RT.09/RW.02, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282244408050', 6750000, 'Putri', 'Tahunan', 112.6047363, -7.9493618, NULL),
	(4, 'Kost Putri Kece', 'Ibu Sadiyah', 1, 'Jl. Sunan Ampel I No.18A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333273838', 11500000, 'Putri', 'Tahunan', 112.6051102, -7.9497824, NULL),
	(5, 'Mami kos Zahra de cost', 'Ibu Zahra', 1, 'Jl. Sunan Ampel 3 No.3, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282233019290', 450000, 'Putri', 'Bulanan', 112.6051407, -7.9495287, NULL),
	(6, 'Kost putri sunan ampel', 'Ibu Elok', 1, 'Jl. Sunan Ampel 3 No.8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281217365329', 450000, 'Putri', 'Bulanan', 112.6052704, -7.9494610, NULL),
	(7, 'Kost SUTERDAM', 'Bapak Sutar', 1, 'Jl. Sunan Ampel 3 No.5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282233818118', 475000, 'Putra', 'Bulanan', 112.6054001, -7.9496007, NULL),
	(8, 'Popo Kost Putri I', 'Ibu Endah', 1, 'Jl. Sunan Ampel 4, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281217207708', 550000, 'Putri', 'Bulanan', 112.6053772, -7.9491525, NULL),
	(9, 'Kost de hijau sunan ampel', 'Ibu Safira', 1, 'Jl. Sunan Ampel 3 No.8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 51253', '6281252415888', 3500000, 'Putri', 'Setengah Tahun', 112.6057281, -7.9496050, NULL),
	(10, 'Kost Putri Malang Arumdalu', 'Ibu Arum', 1, 'Jl. Sunan Kalijaga, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285853464270', 6750000, 'Putri', 'Tahunan', 112.6039047, -7.9495964, NULL),
	(11, 'Kost Harmony', 'Ibu Rinda', 1, 'Green kalijaga eksekutif No.C-5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281223657006', 750000, 'Putri', 'Bulanan', 112.6032715, -7.9500513, NULL),
	(12, 'Kost Excellent', 'Ibu Dea', 1, 'Jl. Sunan Kalijaga Dalam blok b no. 6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282264711804', 400000, 'Putri', 'Bulanan', 112.6030045, -7.9501224, NULL),
	(13, 'AZ ZAHRA KOST Khusus Putri', 'Ibu Zahra', 1, 'Jl. Sunan Kalijaga Dalam No.23, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 62000000, 'Putri', 'Tahunan', 112.6023788, -7.9503617, NULL),
	(14, 'Oemah Kost B5', 'Ibu Budi', 1, 'Perumahan Green Kalijaga Jl. Simpang S. Kalijaga III No.B5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281233873015', 4750000, 'Putri', 'Tahunan', 112.6032181, -7.9506507, NULL),
	(15, 'Kos putri ANUGERAH', 'Ibu Diana', 1, 'Perum. Green Kalijaga. Blok A no, 7 No.11, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282332352098', 5500000, 'Putri', 'Tahunan', 112.6032410, -7.9508100, NULL),
	(16, 'Kost Griya Muslimah', 'Ibu Puji', 1, 'Jl. Sunan Kalijaga Dalam III No.12A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285335641186', 7500000, 'Putri', 'Tahunan', 112.6028366, -7.9509830, NULL),
	(17, 'Kost Griya Eliva', 'Ibu Eliva', 1, 'III A / No. 10, Jl. Sunan Kalijaga No.dalam, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281291809851', 4500000, 'Putri', 'Tahunan', 112.6028595, -7.9507785, NULL),
	(19, 'Kos Putri Bani Wahid', 'Bapak Wahid', 1, 'Jl. Simpang Sunan Kalijaga Jl. Sigura - Gura No.11, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333319676', 550000, 'Putri', 'Bulanan', 112.6027145, -7.9514198, NULL),
	(20, 'Kos Putri Muslimah Hidayah', 'Ibu Fatimah', 1, 'Jalan Simpang Sunan Kalijaga Nomor 6 Lowokwaru, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285736090902', 8000000, 'Putri', 'Tahunan', 112.6034622, -7.9513230, NULL),
	(21, 'Kos Bu Ros', 'Ibu Rosi', 1, 'BII/31-32, Jl. Simpang Sunan Kalijaga No.III, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282244408050', 525000, 'Putri', 'Bulanan', 112.6033325, -7.9514780, NULL),
	(22, 'Zhafira kost', 'Ibu Zhafira', 1, 'Jl. Simpang S. Kalijaga III No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281333273838', 475000, 'Putri', 'Bulanan', 112.6029892, -7.9516325, NULL),
	(23, 'D_Fortune Boarding House', 'Ibu Cindy', 1, 'Jl. Simpang S. Kalijaga V No.8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '628118282190', 475000, 'Putri', 'Bulanan', 112.6023178, -7.9517288, NULL),
	(24, 'Savana HS Kost Putri', 'Ibu Elexandra', 1, 'Jl. Simpang S. Kalijaga V No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281234877068', 7500000, 'Putri', 'Tahunan', 112.6022110, -7.9514151, NULL),
	(25, 'Rumah Kost Audrey', 'Ibu Audrey', 1, 'Jl. Simpang S. Kalijaga II, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285204891400', 7500000, 'Putra', 'Tahunan', 112.6034164, -7.9518957, NULL),
	(26, 'Kost Putri Azzahra', 'Ibu Maryam', 1, 'IA Kavling 3, Jl. Simpang Sunan Kalijaga, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285335641186', 400000, 'Putri', 'Bulanan', 112.6035690, -7.9524732, NULL),
	(27, 'KOST NISA', 'Ibu Nisa', 1, 'Jl. Sunan Muria II No.22, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281291809851', 675000, 'Putri', 'Bulanan', 112.6034164, -7.9527326, NULL),
	(28, 'De prima kost syariah', 'Ibu Prima', 1, 'I Kota Malang, Jl. Sunan Kalijaga No.7B, Dinoyo, Lowokwaru, Malang City, East Java 65149', '6281805000797', 8000000, 'Putri', 'Tahunan', 112.6040192, -7.9523134, NULL),
	(29, 'Raditya Kost', 'Bapak Raditya', 1, 'Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282264711804', 550000, 'Putra', 'Bulanan', 112.6038971, -7.9527535, NULL),
	(30, 'Kost Putri Mikhayla', 'Ibu Mikhayla', 1, 'Jl. Sunan Muria 6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281331673308', 525000, 'Putri', 'Bulanan', 112.6024094, -7.9537735, NULL),
	(31, 'Happy homestay syariah', 'Ibu Fadil', 1, 'Jl. Sunan Muria VII No.3, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281805000797', 9000000, 'Putri', 'Bulanan', 112.6019363, -7.9539738, NULL),
	(32, 'Kos 008 Estate', 'Bapak Cahyo', 1, 'Jl. Sunan Muria VII, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282126000270', 5350000, 'Putri', 'Bulanan', 112.6018906, -7.9541655, NULL),
	(33, 'Embun Pagi Kost Putra', 'Bapak Aji', 1, 'Jl. Sunan Muria VI No. 1 Sigura-gura, Dinoyo, Kecamatan Lowokwaru, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6281333415807', 6750000, 'Putra', 'Bulanan', 112.6022873, -7.9545131, NULL),
	(34, 'Kost Putra A310 Sigura Gura', 'Bapak Pamungkas', 1, 'Perum Pondok Alam Sigura-Gura Jl. Sigura - Gura No.10, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65145', '6281945708275', 4500000, 'Putra', 'Setengah Tahun', 112.6030884, -7.9550595, NULL),
	(35, 'Kos Panda Gembul', 'Ibu Fitri', 1, 'Jl. Bend. Siguragura Bar. III No.14, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6282233019290', 8000000, 'Putri', 'Tahunan', 112.6027145, -7.9557419, NULL),
	(36, 'Kost Putri Hidayah', 'Ibu Khadijah', 1, 'Jl. Simpang Sunan Kalijaga No.6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6285736090902', 6750000, 'Putri', 'Tahunan', 112.6017227, -7.9523563, NULL),
	(37, 'Griya Kos Aira', 'Ibu Asri', 1, 'Jl. Sunan Muria 8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281225051511', 3500000, 'Putri', 'Setengah Tahun', 112.6016617, -7.9526348, NULL),
	(38, 'Kost Griya Aisyah', 'Ibu Aisyah', 1, 'Jl. Simpang Sunan Kalijaga No.b13, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6288803305024', 4750000, 'Putri', 'Setengah Tahun', 112.6017075, -7.9517994, NULL),
	(39, 'Rumah Kost Belakang UIN Malang', 'Ibu Rochmah', 1, 'Perumahan De Cluster Sigura Gura, Jl. Simp. Raya Candi 6, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65100', '6281217365329', 6750000, 'Putri', 'Tahunan', 112.6006088, -7.9513130, NULL),
	(40, 'KOS KOROOP VIP', 'Bapak Sugono', 1, 'Jl. Simp. Raya Candi 6 No.9a, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6282233818118', 2000000, 'Putri', 'Setengah Tahun', 112.6011429, -7.9511642, NULL),
	(41, 'Kos Putri SRC VI15', 'Ibu Aulia', 1, 'Jl. Simp. Raya Candi 6 No.15, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65146', '6281217207708', 4500000, 'Putri', 'Tahunan', 112.6012268, -7.9506998, NULL),
	(42, 'Griya Kost Nafisah', 'Ibu Nafisah', 1, 'kav 6 Perumahan edelwis, Jl. Sunan Kalijaga No.Dalam, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285334000344', 2500000, 'Putri', 'Setengah Tahun', 112.6019821, -7.9499722, NULL),
	(43, 'Kos Putra Edelweiss', 'Bapak Dani', 1, 'Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 6750000, 'Putra', 'Tahunan', 112.6019516, -7.9498153, NULL),
	(44, 'Kost Bu Komariah', 'Ibu Komariah', 1, 'Jl. Sunan Kalijaga No.03A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282244408050', 3000000, 'Putra', 'Setengah Tahun', 112.6020737, -7.9492030, NULL),
	(45, 'Kos Putri Malang UIN UB Unisma', 'Ibu Sukmawati', 1, 'Jl. Joyo Suko No.41, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285648456000', 5500000, 'Putri', 'Tahunan', 112.6016159, -7.9487576, NULL),
	(46, 'GODBLESS kost putri', 'Ibu Valen', 1, 'Jl. Mertojoyo Selatan Gg. 1, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333198283', 4750000, 'Putri', 'Tahunan', 112.6021042, -7.9481859, NULL),
	(47, 'Kos Putra Pak Basori', 'Bapak Basori', 1, 'Jl. Metrojoyo Sel. Gg. III No.14, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6288803305024', 300000, 'Putra', 'Bulanan', 112.6034088, -7.9460177, NULL),
	(48, 'Kost alan', 'Bapak Alan', 1, 'Jl. Mertojoyo Sel. No.4, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281217365329', 550000, 'Putra', 'Bulanan', 112.6031342, -7.9448824, NULL),
	(49, 'Kos Cemot', 'Ibu Sinta', 1, 'Jl. Mertojoyo Sel. No.C5/02, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282233818118', 4500000, 'Putra', 'Tahunan', 112.6030350, -7.9450502, NULL),
	(50, 'Kost Mbah Jamal', 'Bapak Jamal', 1, 'Gg. 9, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281217207708', 475000, 'Putra', 'Bulanan', 112.6036682, -7.9432554, NULL),
	(51, 'Kost Putri Malang BJ999', 'Ibu Dewi', 1, 'Jl. MT Haryono Gg. VIII, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281334790461', 675000, 'Putri', 'Bulanan', 112.6054230, -7.9416947, NULL),
	(52, 'Kost Putra 950 A', 'Ibu Ayu', 1, 'Jl. Mt. Haryono Gg. 6B No.950A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285100001288', 7500000, 'Putra', 'Tahunan', 112.6064911, -7.9422302, NULL),
	(53, 'Kost Putri Basra', 'Bapak Amar', 1, 'Jl. MT. Haryono XI No.348a, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282126000270', 7500000, 'Putri', 'Tahunan', 112.6089554, -7.9418297, NULL),
	(54, 'Kost Putra 335E', 'Bapak Drajat', 1, 'Jl. MT. Haryono No.42, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '628121647525', 5500000, 'Putra', 'Tahunan', 112.6091461, -7.9422584, NULL),
	(55, 'Kos Putri MT Haryono IXB 331A', 'Ibu Fatimah', 1, 'Jl. Mt. Haryono 9B, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6287859341809', 8000000, 'Putri', 'Tahunan', 112.6088715, -7.9425426, NULL),
	(56, 'Kos Putri Pak Pram', 'Bapak Pram', 1, 'Jl. Mt. Haryono Gg. V No.273a, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281805000797', 6750000, 'Putri', 'Bulanan', 112.6098099, -7.9438505, NULL),
	(57, 'Kos Murah Nyaman Terusan Kembang Turi No 99E Dekat Polinema UB', 'Ibu Muzdalifah', 1, 'Jl. Kembang Turi No.99E, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282332061515', 5250000, 'Putra', 'Bulanan', 112.6110535, -7.9428339, NULL),
	(58, 'Kost Putih', 'Ibu Ida', 1, 'Jl. Terusan Jl. Kembang Turi No.32 C, Jatimulyo, Lowokwaru, Malang City, East Java 65141', '6281333500661', 4750000, 'Putra', 'Bulanan', 112.6116562, -7.9421501, NULL),
	(59, 'Kost Kembang Turi No. 42B', 'Ibu Lailatul', 1, 'Jl. Kembang Turi No.42B, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282231744910', 6750000, 'Putra', 'Tahunan', 112.6119614, -7.9419274, NULL),
	(60, 'Kost putra pak pairi', 'Bapak Pairi', 1, 'Jalan kembang turi gang 6 nomer 22, RT.3/RW.4, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282244408050', 5250000, 'Putra', 'Tahunan', 112.6124191, -7.9424405, NULL),
	(61, 'Kost Arif Subandi', 'Bapak Arif Subandi', 1, 'a, Kota Malang, Jl. Kembang Kertas No.27, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6281333273838', 5500000, 'Putra', 'Tahunan', 112.6132736, -7.9412866, NULL),
	(62, 'Kost Putra Pak Suhar', 'Bapak Suhar', 1, 'Jl. Pisang Kipas No.32, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282233019290', 2250000, 'Putra', 'Setengah Tahun', 112.6134949, -7.9419513, NULL),
	(63, 'KOS PUTRA PAK EKO', 'Bapak Eko', 1, 'Jl. Kembang Kertas No.28, Jatimulyo, Lowokwaru, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282174826711', 750000, 'Putra', 'Bulanan', 112.6132965, -7.9411602, NULL),
	(64, 'KOST PUTRA “BUK JUM”', 'Ibu Jumiati', 1, 'Jl. Kembang Kertas No.20, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6285755175995', 800000, 'Putra', 'Bulanan', 112.6149979, -7.9423814, NULL),
	(65, 'Kost Putra Halimah', 'Ibu Halimah', 1, 'Jl. Sumbersari III No.206, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '628123380468', 675000, 'Putra', 'Bulanan', 112.6073074, -7.9544792, NULL),
	(66, 'Kost Putra 145 C', 'Bapak Ubed', 1, 'Jl. Sumbersari III No.145C, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281235333929', 475000, 'Putra', 'Bulanan', 112.6063766, -7.9537749, NULL),
	(67, 'Kos Putra Sigura-gura IV', 'Bapak Nyoman', 1, 'Jl. Sigura-gura IV kavling 7A, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6287854999665', 525000, 'Putra', 'Bulanan', 112.6078491, -7.9562421, NULL),
	(68, 'Chiara Kost Putra', 'Bapak Agus', 1, 'Jalan Bendungan Sutami II No. 11A, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281230354579', 8000000, 'Putra', 'Tahunan', 112.6119385, -7.9593649, NULL),
	(69, 'Kost Putra Pak Mufid', 'Bapak Mufid', 1, 'Jl. Raya Sumbersari No.306, Ketawanggede, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281334570637', 8000000, 'Putra', 'Tahunan', 112.6103516, -7.9565773, NULL),
	(70, 'Kost Mahasiswa Putra Bu Masitah', 'Ibu Masitah', 1, 'Jl. Bend. Sutami Gg. I No.5, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6285330637104', 750000, 'Putra', 'Bulanan', 112.6123962, -7.9590263, NULL),
	(71, 'Kos Putra Bu Syamsiyah', 'Ibu Syamsiyah', 1, 'Jl. Jombang I No.1a, Gading Kasri, Klojen, Malang City, East Java 65115', '6281259672567', 525000, 'Putra', 'Bulanan', 112.6119308, -7.9646106, NULL),
	(72, 'Kos Didi', 'Bapak Didi', 1, 'Jl. Terusan Surabaya No.4, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65115', '6281331541136', 675000, 'Putra', 'Bulanan', 112.6144104, -7.9645362, NULL),
	(73, 'Kost Putri Josasa', 'Ibu Agus', 1, 'Jl. Jombang I No.1, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115', '6282229350922', 5250000, 'Putri', 'Tahunan', 112.6137085, -7.9655838, NULL),
	(74, 'Kos Putri Lavindy', 'Ibu Yuliani', 1, 'Jl. Terusan Surabaya No.49, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281252040060', 8000000, 'Putri', 'Tahunan', 112.6129532, -7.9639597, NULL),
	(75, 'Kost Putri Kembang Galunggung', 'Ibu Hermin', 1, 'Jl. Galunggung No.92, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115', '6282264711804', 450000, 'Putri', 'Bulanan', 112.6114731, -7.9653506, NULL),
	(76, 'Kost Putri Pinyo91', 'Ibu Indah', 1, 'Jl. Terusan Surabaya No.91, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281334790461', 750000, 'Putri', 'Bulanan', 112.6117325, -7.9639225, NULL),
	(77, 'Kost Putri Bu Sulistyowati', 'Ibu Sulistyowati', 1, 'Jl. Terusan Surabaya No.40B, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65115', '6282142916724', 475000, 'Putri', 'Bulanan', 112.6130371, -7.9644566, NULL),
	(78, 'Kost Putri Dekat UM', 'Ibu Suci', 1, 'Jl. Terusan Surabaya Gang Blok-A No.14-G, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '628123380468', 675000, 'Putri', 'Bulanan', 112.6136932, -7.9638286, NULL),
	(79, 'Kost, Dekat Unmer', 'Ibu Wiwik', 1, 'Jl. Garbis No.2, Bareng, Kec. Klojen, Kota Malang, Jawa Timur 65116', '6281333516878', 800000, 'Putri', 'Bulanan', 112.6111450, -7.9779272, NULL),
	(80, 'Kost Elit Puncak Dieng Blok HH 16', 'Bapak Handoko', 1, 'Sumberjo, Kalisongo, Kec. Dau, Malang, Jawa Timur 65146', '6281230354579', 3000000, 'Putra', 'Setengah Tahun', 112.5945282, -7.9720874, NULL),
	(81, 'Kos Putra M10', 'Bapak Martin', 1, 'Jl. Villa Puncak Tidar No.62-64, Doro, Karangwidoro, Kec. Dau, Malang, Jawa Timur 65151', '6282330099843', 4750000, 'Putra', 'Tahunan', 112.5864258, -7.9586000, NULL),
	(82, 'Kost Villa Puncak Tidar M-6', 'Bapak Samsul', 1, 'Jl. Perum Villa Puncak Tidar V No.M-6, Doro, Bandungrejosari, Kec. Sukun, Kota Malang, Jawa Timur 65148', '6281233873015', 520000, 'Putra', 'Bulanan', 112.5872955, -7.9590044, NULL),
	(83, 'Kost Putri Shelfa', 'Ibu Shelfa', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6285204891400', 5250000, 'Putri', 'Tahunan', 112.5961914, -7.9176126, NULL),
	(84, 'Kos FADHILAH (cowok)', 'Ibu Fadhilah', 1, 'Jl. Ketangi, RT27 RW07 Desa Tegalgondo-Ketangi Kec. Karangploso, Ketani, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65158', '6285335641186', 8000000, 'Putra', 'Tahunan', 112.6029282, -7.9217744, NULL),
	(85, 'Kost ArRahmah', 'Ibu Rahmah', 1, 'Jl. Raya Ketangi Tegalgondo No.16, Ketani, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281291809851', 4500000, 'Putra', 'Tahunan', 112.6036072, -7.9219913, NULL),
	(86, 'Griya Mulia Asri (Rumah Kost)', 'Ibu Ratna', 1, 'Jl. Notojoyo, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282233848088', 750000, 'Putra', 'Bulanan', 112.5975266, -7.9191427, NULL),
	(87, 'Kos Kosan 107', 'Ibu Halimah', 1, 'Jl. Notojoyo No.107, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282132427608', 6750000, 'Putri', 'Tahunan', 112.5974197, -7.9182520, NULL),
	(88, 'Kost Putri 33', 'Bapak Jo', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281233873015', 8000000, 'Putri', 'Bulanan', 112.5967102, -7.9178758, NULL),
	(89, 'Kost Putra Pak Jo', 'Bapak Jo', 1, 'Jl. Notojoyo No.99c, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281235616388', 4750000, 'Putra', 'Setengah Tahun', 112.5965576, -7.9175529, NULL),
	(90, 'Griya Mulia Asri (Kos Putri)', 'Ibu Sri', 1, 'Jl. Notojoyo, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6283164049609', 8000000, 'Putri', 'Tahunan', 112.5967255, -7.9171214, NULL),
	(91, 'Cluster Kos Amartha', 'Ibu Rahmita', 1, 'Perumahan IKIP Blok 3C No.14, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281217207708', 3000000, 'Putri', 'Setengah Tahun', 112.5960007, -7.9145899, NULL),
	(92, 'Rachmi Kost', 'Ibu Rachmi', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281225051511', 2500000, 'Putra', 'Setengah Tahun', 112.5970612, -7.9140034, NULL),
	(93, 'Rumah Kost Putri Al-Anshor', 'Bapak Anshori', 1, 'Jl. Tegalgondo No.6, Wunutsari, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6288803305024', 5000000, 'Putri', 'Tahunan', 112.5910568, -7.9152656, NULL),
	(94, 'Kost Putra B. Luluk', 'Ibu Luluk', 1, 'Jl. Tegalgondo, Wunutsari, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281217365329', 6000000, 'Putra', 'Tahunan', 112.5887375, -7.9126172, NULL),
	(95, 'Griya Kost 69', 'Bapak Gatot', 1, 'Jl. Tegalgondo No.78, Gondang, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282233818118', 550000, 'Putra', 'Bulanan', 112.5879059, -7.9115372, NULL),
	(96, 'Kos Putra Kaneez', 'Bapak Romadi', 1, 'Jalan Tirto Utomo Gg V No.16 RT 02 RW 03 Dusun Rambaan, Desa, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6281217207708', 8000000, 'Putra', 'Tahunan', 112.5957413, -7.9267130, NULL),
	(97, 'Kost Putra Sampoerna', 'Bapak Luthfi', 1, 'Jl. Tirto Utomo No.33, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6282244408050', 7500000, 'Putra', 'Tahunan', 112.5947876, -7.9256778, NULL),
	(98, 'Kost Putri Blue House', 'Ibu Khadijah', 1, 'Gg. IV No.26, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6282264711804', 4000000, 'Putri', 'Setengah Tahun', 112.5943146, -7.9251509, NULL),
	(99, 'Kost Putri BCT Blok 9 Kav 64', 'Bapak Hidayat', 1, 'Perumahan, Jl. Bukit Cemara Tujuh, Dusun Rambaan, Tlogomas, Kec. Lowokwaru, Kota Malang, Jawa Timur 65151', '6281334790461', 6750000, 'Putri', 'Tahunan', 112.5927887, -7.9233737, NULL),
	(100, 'Kos Putra BCT A10', 'Bapak Hidayat', 1, 'Perumahan Bukit Cemara Tujuh Blok A No, 10, Mulyoagung, Kec. Dau, Malang, Jawa Timur 65151', '6281252151636', 675000, 'Putra', 'Bulanan', 112.5918427, -7.9223514, NULL);
/*!40000 ALTER TABLE `data_kost` ENABLE KEYS */;

-- membuang struktur untuk table carikost.favorit
CREATE TABLE IF NOT EXISTS `favorit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_kost` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__user` (`id_user`),
  KEY `FK__data_kost` (`id_kost`),
  CONSTRAINT `FK__data_kost` FOREIGN KEY (`id_kost`) REFERENCES `data_kost` (`id`),
  CONSTRAINT `FK__user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.favorit: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `favorit` DISABLE KEYS */;
REPLACE INTO `favorit` (`id`, `id_user`, `id_kost`) VALUES
	(4, 1, 33);
/*!40000 ALTER TABLE `favorit` ENABLE KEYS */;

-- membuang struktur untuk table carikost.kota_kab
CREATE TABLE IF NOT EXISTS `kota_kab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_kota_kab` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.kota_kab: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `kota_kab` DISABLE KEYS */;
REPLACE INTO `kota_kab` (`id`, `nm_kota_kab`) VALUES
	(1, 'Kota Malang');
/*!40000 ALTER TABLE `kota_kab` ENABLE KEYS */;

-- membuang struktur untuk table carikost.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(150) NOT NULL DEFAULT '0',
  `ttl` date DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL DEFAULT 'Laki-laki',
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL,
  `foto` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.user: ~1 rows (lebih kurang)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `nama`, `ttl`, `jenis_kelamin`, `email`, `password`, `foto`) VALUES
	(1, 'Fany Parama', '2000-06-07', 'Laki-laki', 'admaja404@gmail.com', '$2y$10$d2TCqeQp6eTPAwUDQ7rlNey9m8.kXv5BG9KYPsY7dx9aUO3qp/EeO', '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
