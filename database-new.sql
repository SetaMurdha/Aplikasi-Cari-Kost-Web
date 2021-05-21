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

-- Membuang data untuk tabel carikost.admin: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
REPLACE INTO `admin` (`id`, `nama`, `ttl`, `jenis_kelamin`, `email`, `password`, `foto`) VALUES
	(4, 'Fany Parama Admaja', '2000-07-06', 'Laki-laki', 'admin1@gmail.com', '$2y$10$/jgC0Qpf2X.0bJX.kd60LuScbUkm.RhVOkLVY.6F55pjt86oetwoa', '13e21c54d3c8253f839e5e0487a04ab7.png'),
	(5, 'Mauren Helvia Devi', '2000-05-07', 'Perempuan', 'admin2@gmail.com', '$2y$10$/jgC0Qpf2X.0bJX.kd60LuScbUkm.RhVOkLVY.6F55pjt86oetwoa', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.data_kost: ~100 rows (lebih kurang)
/*!40000 ALTER TABLE `data_kost` DISABLE KEYS */;
REPLACE INTO `data_kost` (`id`, `nmkost`, `pemilik`, `id_kota_kab`, `alamat`, `telepon`, `harga`, `jenis`, `pembayaran`, `longitude`, `latitude`, `foto`) VALUES
	(1, 'Kost Pink', 'Ibu Rofiah', 1, 'Jl. Sunan Ampel I No.29, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6283177836675', 12000000, 'Putri', 'Tahunan', 112.6066666, -7.9495459, '8da3373fc82b21b3291d9dc9ffb7de85.jpg'),
	(2, 'Kos Putra Bu Tajab', 'Ibu Tajab', 1, 'Jl. Sunan Ampel 2 No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 8000000, 'Putri', 'Tahunan', 112.6047745, -7.9494915, 'f8c2c55d0accf243af69de3f256d29f7.jpg'),
	(3, 'Kost Bu Fikri', 'Ibu Fikri', 1, 'Jl. Sunan Ampel 2 No.4, RT.09/RW.02, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282244408050', 6750000, 'Putri', 'Tahunan', 112.6047363, -7.9493618, '2fe546233f4f504d31865e9d81c64e72.jpg'),
	(4, 'Kost Putri Kece', 'Ibu Sadiyah', 1, 'Jl. Sunan Ampel I No.18A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333273838', 11500000, 'Putri', 'Tahunan', 112.6051102, -7.9497824, 'fdeb83c886a38168ee6f87e93f2d6bed.jpg'),
	(5, 'Mami kos Zahra de cost', 'Ibu Zahra', 1, 'Jl. Sunan Ampel 3 No.3, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282233019290', 450000, 'Putri', 'Bulanan', 112.6051407, -7.9495287, '70c7367cc3b65838cdde6612bee1380b.jpg'),
	(6, 'Kost putri sunan ampel', 'Ibu Elok', 1, 'Jl. Sunan Ampel 3 No.8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281217365329', 450000, 'Putri', 'Bulanan', 112.6052704, -7.9494610, '7ee75f699222deabf55c7ed4874d7db7.jpg'),
	(7, 'Kost SUTERDAM', 'Bapak Sutar', 1, 'Jl. Sunan Ampel 3 No.5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282233818118', 475000, 'Putri', 'Bulanan', 112.6054001, -7.9496007, 'cb679ba93f6ec966afc95d5d68566f92.jpg'),
	(8, 'Popo Kost Putri I', 'Ibu Endah', 1, 'Jl. Sunan Ampel 4, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281217207708', 550000, 'Putri', 'Bulanan', 112.6053772, -7.9491525, '298741d9b9e52ff75280a7960d39e29f.jpg'),
	(9, 'Kost de hijau sunan ampel', 'Ibu Safira', 1, 'Jl. Sunan Ampel 3 No.8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 51253', '6281252415888', 3500000, 'Putri', 'Setengah Tahun', 112.6057281, -7.9496050, '67ffa9943a340ff3e14226334e72de4a.jpg'),
	(10, 'Kost Putri Malang Arumdalu', 'Ibu Arum', 1, 'Jl. Sunan Kalijaga, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285853464270', 6750000, 'Putri', 'Tahunan', 112.6039047, -7.9495964, '7a990853798be2cbbc3f1ce50bf8c596.jpg'),
	(11, 'Kost Harmony', 'Ibu Rinda', 1, 'Green kalijaga eksekutif No.C-5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281223657006', 750000, 'Putri', 'Bulanan', 112.6032715, -7.9500513, '6f3b349e1a2358b9b487c9c36a736b35.jpg'),
	(12, 'Kost Excellent', 'Ibu Dea', 1, 'Jl. Sunan Kalijaga Dalam blok b no. 6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282264711804', 400000, 'Putri', 'Bulanan', 112.6030045, -7.9501224, 'be0101c5543f8a3d5148c3f95a7507ac.jpg'),
	(13, 'AZ ZAHRA KOST Khusus Putri', 'Ibu Zahra', 1, 'Jl. Sunan Kalijaga Dalam No.23, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 62000000, 'Putri', 'Tahunan', 112.6023788, -7.9503617, '5c6686806f6585582e520f960563fe25.jpg'),
	(14, 'Oemah Kost B5', 'Ibu Budi', 1, 'Perumahan Green Kalijaga Jl. Simpang S. Kalijaga III No.B5, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281233873015', 4750000, 'Putri', 'Tahunan', 112.6032181, -7.9506507, '753c8395136b25425a47617dda314fe5.jpg'),
	(15, 'Kos putri ANUGERAH', 'Ibu Diana', 1, 'Perum. Green Kalijaga. Blok A no, 7 No.11, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282332352098', 5500000, 'Putri', 'Tahunan', 112.6032410, -7.9508100, '19d124b87c6ac804ab371a82fe615aee.jpg'),
	(16, 'Kost Griya Muslimah', 'Ibu Puji', 1, 'Jl. Sunan Kalijaga Dalam III No.12A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285335641186', 7500000, 'Putri', 'Tahunan', 112.6028366, -7.9509830, '9e07dc680b9bedcbb3e1f5d0adc08877.jpg'),
	(17, 'Kost Griya Eliva', 'Ibu Eliva', 1, 'III A / No. 10, Jl. Sunan Kalijaga No.dalam, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281291809851', 4500000, 'Putri', 'Tahunan', 112.6028595, -7.9507785, '35348357e6a74870bd21da9bdbb6ec46.jpg'),
	(19, 'Kos Putri Bani Wahid', 'Bapak Wahid', 1, 'Jl. Simpang Sunan Kalijaga Jl. Sigura - Gura No.11, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333319676', 550000, 'Putri', 'Bulanan', 112.6027145, -7.9514198, '7e7e2e5085d309c1c7fee2eab7c742e4.jpg'),
	(20, 'Kos Putri Muslimah Hidayah', 'Ibu Fatimah', 1, 'Jalan Simpang Sunan Kalijaga Nomor 6 Lowokwaru, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285736090902', 8000000, 'Putri', 'Tahunan', 112.6034622, -7.9513230, '1d22b18faa2bd7979ef0f09153f9eff9.jpg'),
	(21, 'Kos Bu Ros', 'Ibu Rosi', 1, 'BII/31-32, Jl. Simpang Sunan Kalijaga No.III, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282244408050', 525000, 'Putri', 'Bulanan', 112.6033325, -7.9514780, 'f7f8b33549d0771fddce30e6e008df01.jpg'),
	(22, 'Zhafira kost', 'Ibu Zhafira', 1, 'Jl. Simpang S. Kalijaga III No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281333273838', 475000, 'Putri', 'Bulanan', 112.6029892, -7.9516325, '48c969c75d98b8bb52a926361441a92e.jpg'),
	(24, 'Savana HS Kost Putri', 'Ibu Elexandra', 1, 'Jl. Simpang S. Kalijaga V No.2, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281234877068', 7500000, 'Putri', 'Tahunan', 112.6022110, -7.9514151, '9af964bc9cfe7adf32303c153f8fa229.jpg'),
	(25, 'Rumah Kost Audrey', 'Ibu Audrey', 1, 'Jl. Simpang S. Kalijaga II, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285204891400', 7500000, 'Putri', 'Tahunan', 112.6034164, -7.9518957, '27803e8d958fe5c89570901f46a99d72.jpg'),
	(26, 'Kost Putri Azzahra', 'Ibu Maryam', 1, 'IA Kavling 3, Jl. Simpang Sunan Kalijaga, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285335641186', 400000, 'Putri', 'Bulanan', 112.6035690, -7.9524732, '657aa9807371b43becfbf37e166661ad.jpg'),
	(27, 'KOST NISA', 'Ibu Nisa', 1, 'Jl. Sunan Muria II No.22, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281291809851', 675000, 'Putri', 'Bulanan', 112.6034164, -7.9527326, 'd9494fa4e17fb2e9c2e863455c7d36f6.jpg'),
	(28, 'De prima kost syariah', 'Ibu Prima', 1, 'I Kota Malang, Jl. Sunan Kalijaga No.7B, Dinoyo, Lowokwaru, Malang City, East Java 65149', '6281805000797', 8000000, 'Putri', 'Tahunan', 112.6040192, -7.9523134, 'cc2a954a385db9432ed74e77234aa691.jpg'),
	(29, 'Raditya Kost', 'Bapak Raditya', 1, 'Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282264711804', 550000, 'Putra', 'Bulanan', 112.6038971, -7.9527535, '25c0c75e96efe1ca1f2156fb87195c83.jpg'),
	(30, 'Kost Putri Mikhayla', 'Ibu Mikhayla', 1, 'Jl. Sunan Muria 6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281331673308', 525000, 'Putri', 'Bulanan', 112.6024094, -7.9537735, 'd91d2b0460fcc32d3accaea5cb163c8d.jpg'),
	(31, 'Happy homestay syariah', 'Ibu Fadil', 1, 'Jl. Sunan Muria VII No.3, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281805000797', 9000000, 'Putri', 'Bulanan', 112.6019363, -7.9539738, '3812d62fc775a8c5969203ae8dade92c.jpg'),
	(32, 'Kos 008 Estate', 'Bapak Cahyo', 1, 'Jl. Sunan Muria VII, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282126000270', 5350000, 'Putra', 'Bulanan', 112.6018906, -7.9541655, '8b9578f9c710e657c8d6e352fec061db.jpg'),
	(33, 'Embun Pagi Kost Putra', 'Bapak Aji', 1, 'Jl. Sunan Muria VI No. 1 Sigura-gura, Dinoyo, Kecamatan Lowokwaru, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6281333415807', 6750000, 'Putra', 'Bulanan', 112.6022873, -7.9545131, '03fb9c95e80c44ee16c9c17f2b335ef0.jpg'),
	(34, 'Kost Putra A310 Sigura Gura', 'Bapak Pamungkas', 1, 'Perum Pondok Alam Sigura-Gura Jl. Sigura - Gura No.10, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65145', '6281945708275', 4500000, 'Putra', 'Setengah Tahun', 112.6030884, -7.9550595, 'ecc90059bf7953a675a6e075f37f835c.jpg'),
	(35, 'Kos Panda Gembul', 'Ibu Fitri', 1, 'Jl. Bend. Siguragura Bar. III No.14, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6282233019290', 8000000, 'Putri', 'Tahunan', 112.6027145, -7.9557419, '5d3925a7b1ba11199c703a3be242b8d0.jpg'),
	(36, 'Kost Putri Hidayah', 'Ibu Khadijah', 1, 'Jl. Simpang Sunan Kalijaga No.6, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6285736090902', 6750000, 'Putri', 'Tahunan', 112.6017227, -7.9523563, '98bcd188fc059cb0e85d762f73af2620.jpg'),
	(37, 'Griya Kos Aira', 'Ibu Asri', 1, 'Jl. Sunan Muria 8, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6281225051511', 3500000, 'Putri', 'Setengah Tahun', 112.6016617, -7.9526348, '6a0362195e4d076f2b4ab5f6e86729e4.jpg'),
	(38, 'Kost Griya Aisyah', 'Ibu Aisyah', 1, 'Jl. Simpang Sunan Kalijaga No.b13, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6288803305024', 4750000, 'Putri', 'Setengah Tahun', 112.6017075, -7.9517994, 'c6a54272996f1292b67b048120b6d880.jpg'),
	(39, 'Rumah Kost Belakang UIN Malang', 'Ibu Rochmah', 1, 'Perumahan De Cluster Sigura Gura, Jl. Simp. Raya Candi 6, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65100', '6281217365329', 6750000, 'Putri', 'Tahunan', 112.6006088, -7.9513130, '30396e57d276649f2368d4316a95258b.jpg'),
	(40, 'KOS KOROOP VIP', 'Bapak Sugono', 1, 'Jl. Simp. Raya Candi 6 No.9a, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65149', '6282233818118', 2000000, 'Putri', 'Setengah Tahun', 112.6011429, -7.9511642, '4908f7411c5d706391e8932d4145fb82.jpg'),
	(41, 'Kos Putri SRC VI15', 'Ibu Aulia', 1, 'Jl. Simp. Raya Candi 6 No.15, Karangbesuki, Kec. Sukun, Kota Malang, Jawa Timur 65146', '6281217207708', 4500000, 'Putri', 'Tahunan', 112.6012268, -7.9506998, '5d9f34e6c2bca9ee2c60c15c357e6292.jpg'),
	(42, 'Griya Kost Nafisah', 'Ibu Nafisah', 1, 'kav 6 Perumahan edelwis, Jl. Sunan Kalijaga No.Dalam, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6285334000344', 2500000, 'Putri', 'Setengah Tahun', 112.6019821, -7.9499722, '5dd1ebf0ca07f2775ac8d22803b89d18.jpg'),
	(43, 'Kos Putra Edelweiss', 'Bapak Dani', 1, 'Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282330099843', 6750000, 'Putra', 'Tahunan', 112.6019516, -7.9498153, 'f8fd74465f01dae9a1d89387100a87e2.jpg'),
	(44, 'Kost Bu Komariah', 'Ibu Komariah', 1, 'Jl. Sunan Kalijaga No.03A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65149', '6282244408050', 3000000, 'Putri', 'Setengah Tahun', 112.6020737, -7.9492030, '872a237255ac406790a093183d979417.jpg'),
	(45, 'Kos Putri Malang UIN UB Unisma', 'Ibu Sukmawati', 1, 'Jl. Joyo Suko No.41, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285648456000', 5500000, 'Putri', 'Tahunan', 112.6016159, -7.9487576, 'bfbb8f06a890c3ff5238465d29dcc8f2.jpg'),
	(46, 'GODBLESS kost putri', 'Ibu Valen', 1, 'Jl. Mertojoyo Selatan Gg. 1, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281333198283', 4750000, 'Putri', 'Tahunan', 112.6021042, -7.9481859, '632ec961d9a9abf92d8dfc8c740fc57f.jpg'),
	(47, 'Kos Putra Pak Basori', 'Bapak Basori', 1, 'Jl. Metrojoyo Sel. Gg. III No.14, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6288803305024', 300000, 'Putra', 'Bulanan', 112.6034088, -7.9460177, '8b206c0025461d0fb4777a23622c7468.png'),
	(48, 'Kost alan', 'Bapak Alan', 1, 'Jl. Mertojoyo Sel. No.4, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281217365329', 550000, 'Putra', 'Bulanan', 112.6031342, -7.9448824, '2d145df71d2e3ae2572e3489f6496ad7.jpg'),
	(49, 'Kos Cemot', 'Ibu Sinta', 1, 'Jl. Mertojoyo Sel. No.C5/02, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282233818118', 4500000, 'Putri', 'Tahunan', 112.6030350, -7.9450502, '23d9e5055ab303a57416476e2aba2cbb.jpg'),
	(50, 'Kost Mbah Jamal', 'Bapak Jamal', 1, 'Gg. 9, Merjosari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281217207708', 475000, 'Putri', 'Bulanan', 112.6036682, -7.9432554, 'af7e6a2240f33b05846289962c3e5bb7.jpg'),
	(51, 'Kost Putri Malang BJ999', 'Ibu Dewi', 1, 'Jl. MT Haryono Gg. VIII, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6281334790461', 675000, 'Putri', 'Bulanan', 112.6054230, -7.9416947, 'ecbdaffa20445aba689c5ab0d0a73684.jpg'),
	(52, 'Kost Putra 950 A', 'Ibu Ayu', 1, 'Jl. Mt. Haryono Gg. 6B No.950A, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6285100001288', 7500000, 'Putra', 'Tahunan', 112.6064911, -7.9422302, 'c2843b3a8d120a098cc696e2527e60c7.jpg'),
	(53, 'Kost Putri Basra', 'Bapak Amar', 1, 'Jl. MT. Haryono XI No.348a, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6282126000270', 7500000, 'Putri', 'Tahunan', 112.6089554, -7.9418297, 'f48e31ba1f8b890627071409a236c91c.jpg'),
	(54, 'Kost Putra 335E', 'Bapak Drajat', 1, 'Jl. MT. Haryono No.42, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '628121647525', 5500000, 'Putra', 'Tahunan', 112.6091461, -7.9422584, '2707fe79c1ced3b938118ea088659025.jpg'),
	(55, 'Kos Putri MT Haryono IXB 331A', 'Ibu Fatimah', 1, 'Jl. Mt. Haryono 9B, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65144', '6287859341809', 8000000, 'Putri', 'Tahunan', 112.6088715, -7.9425426, '6086b49c57faed0b83d0ba45f71057ea.jpg'),
	(56, 'Kos Putri Pak Pram', 'Bapak Pram', 1, 'Jl. Mt. Haryono Gg. V No.273a, Dinoyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281805000797', 6750000, 'Putri', 'Bulanan', 112.6098099, -7.9438505, '32f581411d2ab7fa654e5a1ef75f119b.jpg'),
	(57, 'Kos Murah Nyaman Terusan Kembang Turi No 99E Dekat Polinema UB', 'Ibu Muzdalifah', 1, 'Jl. Kembang Turi No.99E, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282332061515', 5250000, 'Putri', 'Bulanan', 112.6110535, -7.9428339, 'ad617c4cc0d6672fa128b64e3ce94ab6.jpg'),
	(58, 'Kost Putih', 'Ibu Ida', 1, 'Jl. Terusan Jl. Kembang Turi No.32 C, Jatimulyo, Lowokwaru, Malang City, East Java 65141', '6281333500661', 4750000, 'Putri', 'Bulanan', 112.6116562, -7.9421501, '0b5d66b3a7abc25c873b4567e23781e1.jpg'),
	(59, 'Kost Kembang Turi No. 42B', 'Ibu Lailatul', 1, 'Jl. Kembang Turi No.42B, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282231744910', 6750000, 'Putri', 'Tahunan', 112.6119614, -7.9419274, '18f670c5f8dc842b4cc068ef8f9f9e86.jpg'),
	(60, 'Kost putra pak pairi', 'Bapak Pairi', 1, 'Jalan kembang turi gang 6 nomer 22, RT.3/RW.4, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282244408050', 5250000, 'Putra', 'Tahunan', 112.6124191, -7.9424405, 'dce560c98be21dc836b61bc78d5baca1.jpg'),
	(61, 'Kost Arif Subandi', 'Bapak Arif Subandi', 1, 'a, Kota Malang, Jl. Kembang Kertas No.27, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6281333273838', 5500000, 'Putra', 'Tahunan', 112.6132736, -7.9412866, '867a6c35bd89c5e2b6375bc6d7d9dfd2.jpg'),
	(62, 'Kost Putra Pak Suhar', 'Bapak Suhar', 1, 'Jl. Pisang Kipas No.32, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282233019290', 2250000, 'Putra', 'Setengah Tahun', 112.6134949, -7.9419513, '1ec8d8a233e974d1962fa70865b6e216.jpg'),
	(63, 'KOS PUTRA PAK EKO', 'Bapak Eko', 1, 'Jl. Kembang Kertas No.28, Jatimulyo, Lowokwaru, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6282174826711', 750000, 'Putra', 'Bulanan', 112.6132965, -7.9411602, '80c2d2fe53ebe667f63f3193993bf467.jpg'),
	(64, 'KOST PUTRA “BUK JUM”', 'Ibu Jumiati', 1, 'Jl. Kembang Kertas No.20, Jatimulyo, Kec. Lowokwaru, Kota Malang, Jawa Timur 65141', '6285755175995', 800000, 'Putra', 'Bulanan', 112.6149979, -7.9423814, '85d9a84f0593178ab64ab375e4e91a20.jpg'),
	(65, 'Kost Putra Halimah', 'Ibu Halimah', 1, 'Jl. Sumbersari III No.206, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '628123380468', 675000, 'Putra', 'Bulanan', 112.6073074, -7.9544792, '405f783a68986f901d84a93c1aff668e.jpg'),
	(66, 'Kost Putra 145 C', 'Bapak Ubed', 1, 'Jl. Sumbersari III No.145C, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281235333929', 475000, 'Putra', 'Bulanan', 112.6063766, -7.9537749, 'd05dbe5ebea76e792b367c416bf48f8a.jpg'),
	(67, 'Kos Putra Sigura-gura IV', 'Bapak Nyoman', 1, 'Jl. Sigura-gura IV kavling 7A, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6287854999665', 525000, 'Putra', 'Bulanan', 112.6078491, -7.9562421, '05b1e3661c20361d36a144a5b09b5448.jpg'),
	(68, 'Chiara Kost Putra', 'Bapak Agus', 1, 'Jalan Bendungan Sutami II No. 11A, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281230354579', 8000000, 'Putra', 'Tahunan', 112.6119385, -7.9593649, 'b9fdcf5a9d20f6a46556de2e5aea6909.jpg'),
	(69, 'Kost Putra Pak Mufid', 'Bapak Mufid', 1, 'Jl. Raya Sumbersari No.306, Ketawanggede, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281334570637', 8000000, 'Putra', 'Tahunan', 112.6103516, -7.9565773, '2cc62e18fac90e2d9614d3b5b2e38bd1.jpg'),
	(70, 'Kost Mahasiswa Putra Bu Masitah', 'Ibu Masitah', 1, 'Jl. Bend. Sutami Gg. I No.5, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6285330637104', 750000, 'Putra', 'Bulanan', 112.6123962, -7.9590263, '77c6f29c40a3c474cea5be599139d487.jpg'),
	(71, 'Kos Putra Bu Syamsiyah', 'Ibu Syamsiyah', 1, 'Jl. Jombang I No.1a, Gading Kasri, Klojen, Malang City, East Java 65115', '6281259672567', 525000, 'Putra', 'Bulanan', 112.6119308, -7.9646106, 'b8a72e316d511a72c2766a4cdc31a9e7.jpg'),
	(72, 'Kos Didi', 'Bapak Didi', 1, 'Jl. Terusan Surabaya No.4, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65115', '6281331541136', 675000, 'Putra', 'Bulanan', 112.6144104, -7.9645362, 'b1a605d6877a3946da0e74ac49a976e0.jpg'),
	(73, 'Kost Putri Josasa', 'Ibu Agus', 1, 'Jl. Jombang I No.1, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115', '6282229350922', 5250000, 'Putri', 'Tahunan', 112.6137085, -7.9655838, '87414bf06586c40a69e886d25e2ad9fa.jpg'),
	(74, 'Kos Putri Lavindy', 'Ibu Yuliani', 1, 'Jl. Terusan Surabaya No.49, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281252040060', 8000000, 'Putri', 'Tahunan', 112.6129532, -7.9639597, '1b795bda3ffe4b3ca543ed5d35f526a7.jpg'),
	(75, 'Kost Putri Kembang Galunggung', 'Ibu Hermin', 1, 'Jl. Galunggung No.92, Gading Kasri, Kec. Klojen, Kota Malang, Jawa Timur 65115', '6282264711804', 450000, 'Putri', 'Bulanan', 112.6114731, -7.9653506, '4a1aebacd17f5f4c4a37a8af95f305a4.jpg'),
	(76, 'Kost Putri Pinyo91', 'Ibu Indah', 1, 'Jl. Terusan Surabaya No.91, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '6281334790461', 750000, 'Putri', 'Bulanan', 112.6117325, -7.9639225, '9bd3a82a0b3bc3aa92848283ba9c7789.jpg'),
	(77, 'Kost Putri Bu Sulistyowati', 'Ibu Sulistyowati', 1, 'Jl. Terusan Surabaya No.40B, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65115', '6282142916724', 475000, 'Putri', 'Bulanan', 112.6130371, -7.9644566, '3d6931ef113f4643d2fc8962d155a718.JPG'),
	(78, 'Kost Putri Dekat UM', 'Ibu Suci', 1, 'Jl. Terusan Surabaya Gang Blok-A No.14-G, Sumbersari, Kec. Lowokwaru, Kota Malang, Jawa Timur 65145', '628123380468', 675000, 'Putri', 'Bulanan', 112.6136932, -7.9638286, '691dbf258908afdca147c6b6f33206f0.jpg'),
	(79, 'Kost, Dekat Unmer', 'Ibu Wiwik', 1, 'Jl. Garbis No.2, Bareng, Kec. Klojen, Kota Malang, Jawa Timur 65116', '6281333516878', 800000, 'Putri', 'Bulanan', 112.6111450, -7.9779272, '26f228c005ae24bef13f5c3ccfd23b00.jpg'),
	(80, 'Kost Elit Puncak Dieng Blok HH 16', 'Bapak Handoko', 1, 'Sumberjo, Kalisongo, Kec. Dau, Malang, Jawa Timur 65146', '6281230354579', 3000000, 'Putri', 'Setengah Tahun', 112.5945282, -7.9720874, 'fee51698921aa2c886fd4d3ab7923dc3.JPG'),
	(81, 'Kos Putra M10', 'Bapak Martin', 1, 'Jl. Villa Puncak Tidar No.62-64, Doro, Karangwidoro, Kec. Dau, Malang, Jawa Timur 65151', '6282330099843', 4750000, 'Putra', 'Tahunan', 112.5864258, -7.9586000, 'e5bd31ce50716028d9bc5f0d1469947e.jpg'),
	(82, 'Kost Villa Puncak Tidar M-6', 'Bapak Samsul', 1, 'Jl. Perum Villa Puncak Tidar V No.M-6, Doro, Bandungrejosari, Kec. Sukun, Kota Malang, Jawa Timur 65148', '6281233873015', 520000, 'Putra', 'Bulanan', 112.5872955, -7.9590044, 'd6fee6d86ef0e24381bcc1c387c174a7.jpg'),
	(83, 'Kost Putri Shelfa', 'Ibu Shelfa', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6285204891400', 5250000, 'Putri', 'Tahunan', 112.5961914, -7.9176126, '6e25eb7d6409a63831bb7b1c2f647788.jpeg'),
	(84, 'Kos FADHILAH (cowok)', 'Ibu Fadhilah', 1, 'Jl. Ketangi, RT27 RW07 Desa Tegalgondo-Ketangi Kec. Karangploso, Ketani, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65158', '6285335641186', 8000000, 'Putra', 'Tahunan', 112.6029282, -7.9217744, '3c012182d96c5345e12262324498bc15.jpg'),
	(85, 'Kost ArRahmah', 'Ibu Rahmah', 1, 'Jl. Raya Ketangi Tegalgondo No.16, Ketani, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281291809851', 4500000, 'Putri', 'Tahunan', 112.6036072, -7.9219913, 'bb2ee2ea58da54b550a3846bd0c8c923.jpg'),
	(86, 'Griya Mulia Asri (Rumah Kost)', 'Ibu Ratna', 1, 'Jl. Notojoyo, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282233848088', 750000, 'Putri', 'Bulanan', 112.5975266, -7.9191427, 'a75037a9bbf24a43ee9a987bb748b81b.jpg'),
	(87, 'Kos Kosan 107', 'Ibu Halimah', 1, 'Jl. Notojoyo No.107, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282132427608', 6750000, 'Putri', 'Tahunan', 112.5974197, -7.9182520, '8a6429d8ba7c7bb536adf66878d56847.jpg'),
	(88, 'Kost Putri 33', 'Bapak Jo', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281233873015', 8000000, 'Putri', 'Bulanan', 112.5967102, -7.9178758, '56ba1365497f8aa0ed66242128be2f98.jpg'),
	(89, 'Kost Putra Pak Jo', 'Bapak Jo', 1, 'Jl. Notojoyo No.99c, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281235616388', 4750000, 'Putra', 'Setengah Tahun', 112.5965576, -7.9175529, '5af6984aab0b6c6eb70f689b3471ae48.jpg'),
	(90, 'Griya Mulia Asri (Kos Putri)', 'Ibu Sri', 1, 'Jl. Notojoyo, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6283164049609', 8000000, 'Putri', 'Tahunan', 112.5967255, -7.9171214, 'c10b0911448eb1329626a0d2755dfa5c.jpg'),
	(91, 'Cluster Kos Amartha', 'Ibu Rahmita', 1, 'Perumahan IKIP Blok 3C No.14, Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281217207708', 3000000, 'Putri', 'Setengah Tahun', 112.5960007, -7.9145899, 'a97b75a1efa07bebb1aedb0a8bb85939.jpg'),
	(92, 'Rachmi Kost', 'Ibu Rachmi', 1, 'Babatan, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281225051511', 2500000, 'Putri', 'Setengah Tahun', 112.5970612, -7.9140034, 'dfe15a899c8f8879993b830e12061161.jpg'),
	(93, 'Rumah Kost Putri Al-Anshor', 'Bapak Anshori', 1, 'Jl. Tegalgondo No.6, Wunutsari, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6288803305024', 5000000, 'Putri', 'Tahunan', 112.5910568, -7.9152656, '839ab31bf5e5832b74fa3047d727a2b7.jpg'),
	(94, 'Kost Putra B. Luluk', 'Ibu Luluk', 1, 'Jl. Tegalgondo, Wunutsari, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6281217365329', 6000000, 'Putra', 'Tahunan', 112.5887375, -7.9126172, 'f6965a9b3bf486a72da523b8fd305103.jpg'),
	(95, 'Griya Kost 69', 'Bapak Gatot', 1, 'Jl. Tegalgondo No.78, Gondang, Tegalgondo, Kec. Karang Ploso, Malang, Jawa Timur 65152', '6282233818118', 550000, 'Putri', 'Bulanan', 112.5879059, -7.9115372, 'e93f6844b6b916c547744514fb438e2d.jpg'),
	(96, 'Kos Putra Kaneez', 'Bapak Romadi', 1, 'Jalan Tirto Utomo Gg V No.16 RT 02 RW 03 Dusun Rambaan, Desa, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6281217207708', 8000000, 'Putra', 'Tahunan', 112.5957413, -7.9267130, '2e543eb3b6d0521ce220f7216f7fa1c0.jpg'),
	(97, 'Kost Putra Sampoerna', 'Bapak Luthfi', 1, 'Jl. Tirto Utomo No.33, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6282244408050', 7500000, 'Putra', 'Tahunan', 112.5947876, -7.9256778, '1b76acf44bf3d46f4ac07140d587767e.jpg'),
	(98, 'Kost Putri Blue House', 'Ibu Khadijah', 1, 'Gg. IV No.26, Dusun Rambaan, Landungsari, Kec. Dau, Malang, Jawa Timur 65151', '6282264711804', 4000000, 'Putri', 'Setengah Tahun', 112.5943146, -7.9251509, 'bc7a5aab3b80e9335b2a63bb339de0f6.jpg'),
	(99, 'Kost Putri BCT Blok 9 Kav 64', 'Bapak Hidayat', 1, 'Perumahan, Jl. Bukit Cemara Tujuh, Dusun Rambaan, Tlogomas, Kec. Lowokwaru, Kota Malang, Jawa Timur 65151', '6281334790461', 6750000, 'Putri', 'Tahunan', 112.5927887, -7.9233737, '3287ba0d24d06a4fac3c18e20a76b36e.jpg'),
	(100, 'Kos Putra BCT A10', 'Bapak Hidayat', 1, 'Perumahan Bukit Cemara Tujuh Blok A No, 10, Mulyoagung, Kec. Dau, Malang, Jawa Timur 65151', '6281252151636', 675000, 'Putra', 'Bulanan', 112.5918427, -7.9223514, '84ba2c8baafe6120adccd79e8d4d550b.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.favorit: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `favorit` DISABLE KEYS */;
REPLACE INTO `favorit` (`id`, `id_user`, `id_kost`) VALUES
	(7, 1, 6);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Membuang data untuk tabel carikost.user: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `nama`, `ttl`, `jenis_kelamin`, `email`, `password`, `foto`) VALUES
	(1, 'Fany Parama Admaja', '2000-06-07', 'Laki-laki', 'admaja404@gmail.com', '$2y$10$d2TCqeQp6eTPAwUDQ7rlNey9m8.kXv5BG9KYPsY7dx9aUO3qp/EeO', 'a0e2e28087319124e4885c42f12fbd84.jpg'),
	(2, 'Karunia Ramadhani', '2004-06-22', 'Perempuan', 'karuniaraa@gmail.com', '$2y$10$o4OuoXNGx7VCdsoz9yrR/OCzharTNSsUSVE7kVaQeO6R/KANYK1IC', '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
