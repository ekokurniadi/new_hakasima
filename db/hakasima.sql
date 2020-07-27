-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2020 at 11:19 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hakasima`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `deskripsi_barang` text NOT NULL,
  `harga` int(100) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `kode_barang`, `nama_barang`, `deskripsi_barang`, `harga`, `foto`) VALUES
(5, 'BRG14112019001', '6 PCS COOKWARE SET', 'ini adalah deskripsi barang', 100000, 'AMAZING_PAN_HAKASIMA_png.jpg'),
(6, 'BRG14112019002', 'NEW AMAZING PAN', '', 150000, 'Hakasima_6_Pcs_Casserole_Set.jpg'),
(7, 'BRG05052020003', 'Ampia', 'Ampia', 250000, 'AMPIA.jpg'),
(8, 'BRG07062020004', 'Wajan', '<p>Wajan Penggorengan</p>\r\n', 150000, 'user1581563125.png'),
(9, 'BRG14112019001', '6 PCS COOKWARE SET', 'ini adalah deskripsi barang', 100000, 'AMAZING_PAN_HAKASIMA_png.jpg'),
(10, 'BRG14112019002', 'NEW AMAZING PAN', '', 150000, 'Hakasima_6_Pcs_Casserole_Set.jpg'),
(11, 'BRG05052020003', 'Ampia', 'Ampia', 250000, 'AMPIA.jpg'),
(12, 'BRG07062020004', 'Wajan', '<p>Wajan Penggorengan</p>\r\n', 150000, 'user1581563125.png'),
(13, 'BRG23062020005', 'dfasfas', '<p>ladkfjlajfkadf</p>\r\n', 400000, 'sales_stock2.PNG');

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `INST` AFTER INSERT ON `barang` FOR EACH ROW BEGIN
 INSERT INTO stok SET
 kode_barang = NEW.kode_barang,nama_barang=NEW.nama_barang,stok=0
 ON DUPLICATE KEY UPDATE nama_barang=NEW.nama_barang;
 END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id` int(100) NOT NULL,
  `id_barang_masuk` varchar(100) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id`, `id_barang_masuk`, `tanggal`) VALUES
(6, 'PNR-14112019-001', '2019-11-14'),
(7, 'PNR-14112019-002', '2019-11-14'),
(8, 'PNR-07062020-003', '2020-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `detail_barang_masuk`
--

CREATE TABLE `detail_barang_masuk` (
  `id` int(100) NOT NULL,
  `id_barang_masuk` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_barang_masuk`
--

INSERT INTO `detail_barang_masuk` (`id`, `id_barang_masuk`, `kode_barang`, `nama_barang`, `jumlah`, `tanggal`) VALUES
(17, 'PNR-14112019-001', 'BRG14112019001', '6 PCS COOKWARE SET', 17, '2019-11-14'),
(18, 'PNR-14112019-002', 'BRG14112019002', 'NEW AMAZING PAN', 19, '2019-11-14'),
(19, 'PNR-07062020-003', 'BRG07062020004', 'Wajan', 10, '2020-06-07');

--
-- Triggers `detail_barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `delete` AFTER DELETE ON `detail_barang_masuk` FOR EACH ROW BEGIN
UPDATE stok set stok=stok-OLD.jumlah where kode_barang = OLD.kode_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insert` AFTER INSERT ON `detail_barang_masuk` FOR EACH ROW BEGIN
UPDATE  stok set stok=stok + NEW.jumlah where kode_barang = NEW.kode_barang;
	END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_ongkir`
--

CREATE TABLE `detail_ongkir` (
  `id` int(11) NOT NULL,
  `kode_ongkir` varchar(50) NOT NULL,
  `ekspedisi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_provinsi` int(11) NOT NULL,
  `ongkir` double NOT NULL DEFAULT '0',
  `kabupaten` varchar(100) NOT NULL,
  `layanan` varchar(50) NOT NULL,
  `lama_pengiriman` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_ongkir`
--

INSERT INTO `detail_ongkir` (`id`, `kode_ongkir`, `ekspedisi`, `id_provinsi`, `ongkir`, `kabupaten`, `layanan`, `lama_pengiriman`) VALUES
(8, 'ONK01052020001', '1', 1, 10000, 'Kota Jambi', 'REG', 1),
(9, 'ONK01052020001', '1', 1, 15000, 'Kota Jambi', 'OKE', 2),
(10, 'ONK07062020002', '3', 4, 30000, 'kjalsdkfjlka', 'REG', 3),
(11, 'ONK07062020002', '3', 4, 28000, 'kjalsdkfjlka', 'OKE', 4),
(12, 'ONK07062020002', '3', 4, 40000, 'kjalsdkfjlka', 'Ekspress', 2);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `id` int(11) NOT NULL,
  `kode_pembelian` varchar(50) NOT NULL,
  `kode_barang` varchar(50) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` double NOT NULL DEFAULT '0',
  `qty` double NOT NULL DEFAULT '0',
  `total` double NOT NULL DEFAULT '0',
  `jenis_beli` varchar(50) NOT NULL,
  `tenor` double NOT NULL DEFAULT '0',
  `angsuran` double NOT NULL DEFAULT '0',
  `status` varchar(100) NOT NULL,
  `customer_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`id`, `kode_pembelian`, `kode_barang`, `nama_barang`, `harga`, `qty`, `total`, `jenis_beli`, `tenor`, `angsuran`, `status`, `customer_id`) VALUES
(66, 'TRX-CUS25042001', 'BRG14112019001', '6 PCS COOKWARE SET', 100000, 1, 100000, '', 0, 0, 'proses', 'CUS25042020001'),
(67, 'TRX-CUS25042002', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(68, 'TRX-CUS25042002', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(69, 'TRX-CUS25042002', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(70, 'TRX-CUS25042002', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(71, 'TRX-CUS25042002', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(72, 'TRX-CUS25042003', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(73, 'TRX-CUS25042004', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(74, 'TRX-CUS25042001', 'BRG14112019001', '6 PCS COOKWARE SET', 100000, 6, 100000, '', 0, 0, 'proses', 'CUS25042020001'),
(75, 'TRX-CUS25042001', 'BRG14112019001', '6 PCS COOKWARE SET', 100000, 6, 100000, '', 0, 0, 'proses', 'CUS25042020001'),
(77, 'TRX-CUS25042005', 'BRG07062020004', 'Wajan', 150000, 1, 150000, '', 0, 0, 'proses', 'CUS25042020001'),
(78, 'TRX-CUS25042005', 'BRG05052020003', 'Ampia', 250000, 1, 250000, '', 0, 0, 'proses', 'CUS25042020001');

--
-- Triggers `detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `add` BEFORE INSERT ON `detail_pembelian` FOR EACH ROW BEGIN
 UPDATE stok SET stok=stok-NEW.qty
 WHERE kode_barang=NEW.kode_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `detail_skema`
--

CREATE TABLE `detail_skema` (
  `id` int(100) NOT NULL,
  `id_skema` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL,
  `tenor` int(100) NOT NULL,
  `angsuran` int(100) NOT NULL,
  `komisi` int(100) NOT NULL,
  `kontes` int(100) NOT NULL,
  `jenis_pembelian` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_skema`
--

INSERT INTO `detail_skema` (`id`, `id_skema`, `kode_barang`, `harga`, `tenor`, `angsuran`, `komisi`, `kontes`, `jenis_pembelian`) VALUES
(5, 'SKM11112019016', 'BRG11112019006', 100000, 0, 0, 0, 0, 'CASH'),
(6, 'SKM11112019016', 'BRG11112019006', 150000, 3, 210000, 1000, 1000, 'KREDIT'),
(7, 'SKM11112019016', 'BRG11112019006', 100000, 2, 200000, 1000, 1000, 'KREDIT'),
(8, 'SKM15042020017', 'BRG14112019001', 123, 5, 100, 10, 10, 'KREDIT'),
(9, 'SKM15042020017', 'BRG14112019001', 234, 10, 200, 0, 0, 'KREDIT'),
(10, 'SKM05062020018', 'BRG05052020003', 100000, 6, 20000, 10000, 10000, 'KREDIT'),
(11, 'SKM07062020019', 'BRG14112019001', 150000, 2, 750000, 10000, 10000, 'KREDIT');

-- --------------------------------------------------------

--
-- Table structure for table `ekspedisi`
--

CREATE TABLE `ekspedisi` (
  `id` int(11) NOT NULL,
  `ekspedisi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ekspedisi`
--

INSERT INTO `ekspedisi` (`id`, `ekspedisi`) VALUES
(1, 'J&T'),
(2, 'JNE'),
(3, '<p>Sicepat</p>');

-- --------------------------------------------------------

--
-- Table structure for table `kabupaten`
--

CREATE TABLE `kabupaten` (
  `id` int(11) NOT NULL,
  `kode_provinsi` varchar(50) NOT NULL,
  `kode_kabupaten` varchar(50) NOT NULL,
  `kabupaten` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kabupaten`
--

INSERT INTO `kabupaten` (`id`, `kode_provinsi`, `kode_kabupaten`, `kabupaten`) VALUES
(1, '1', 'KAB001', 'Kota Jambi'),
(2, '1', 'KAB002', 'Sarolangun'),
(3, '2', 'KAB003', 'Bogor'),
(4, '4', 'KAB004', 'kjalsdkfjlka');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `no_ktp` varchar(100) DEFAULT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL DEFAULT 'konsumen'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`id`, `customer_id`, `nama_lengkap`, `no_ktp`, `no_hp`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `email`, `password`, `foto`, `role`) VALUES
(1, 'CUS25042020001', 'Diki', '1571020202950041', '085296072649', 'Laki-Laki', '2020-04-23', 'Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan', 'eko@gmail.com', '123', 'images_(7).jpeg', 'konsumen'),
(2, 'CUS29042020002', 'Angga', NULL, NULL, 'Laki-Laki', '2020-04-15', 'Tangkit', 'a@gmail.com', '123', 'user_admin.jpeg', 'konsumen'),
(3, 'CUS07062020003', 'Kurniadi', '1523686523125678', '081366424345', 'Laki-Laki', '2020-06-08', 'Jambi', 'ekokurniadi.02@gmail.com', '123', 'user1580114086.jpg', 'konsumen'),
(4, 'CUS09072020004', 'medi', '1571030404990044', '081272776041', 'Laki-Laki', '2020-07-09', 'JAMBI', 'medi@gmail.com', '123', 'Pelunasan_Invoice_Dealer.PNG', 'konsumen'),
(5, 'CUS09072020005', 'DIAN', '1571020202950041', '0831273171231', 'Perempuan', '2020-07-09', 'JAMBI', 'dian@gmail.com', '12345', 'sales_stock.PNG', 'konsumen'),
(6, 'CUS09072020006', 'a', '1571020202950041', '089955228555', 'Laki-Laki', '2020-07-09', 'JAMBI', 'do@gmail.com', '123', 'sales_stock2.PNG', 'konsumen'),
(7, 'CUS09072020007', 'Angga', '0000000000000123', '078', 'Laki-Laki', '2020-07-09', 'JAMBI', 'eka@gmail.com', '5555', 'Pelunasan_Invoice_Dealer.PNG', 'konsumen'),
(8, 'CUS09072020008', 'fasdfasf', '1571030404990044', '3', 'Laki-Laki', '2020-07-30', 'g', 'g@gmail.com', '123', 'Pelunasan_Invoice_Dealer.PNG', 'konsumen'),
(9, 'CUS09072020009', 'r', '7', '3', 'Laki-Laki', '2020-07-28', '3', '3@gmail.com', '123', 'sales_stock2.PNG', 'konsumen');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id` int(11) NOT NULL,
  `layanan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id`, `layanan`) VALUES
(1, 'REG'),
(2, 'OKE'),
(3, 'Ekspress'),
(4, 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id` int(11) NOT NULL,
  `kode_ongkir` varchar(100) NOT NULL,
  `ekspedisi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id`, `kode_ongkir`, `ekspedisi`) VALUES
(5, 'ONK01052020001', '1'),
(6, 'ONK07062020002', '3');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(100) NOT NULL,
  `id_prospek` varchar(100) NOT NULL,
  `id_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `no_ktp` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `jenis_pembelian` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL,
  `tenor` int(100) NOT NULL,
  `angsuran` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `nik_sales` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_prospek`, `id_customer`, `nama`, `alamat`, `tanggal`, `no_ktp`, `no_hp`, `kode_barang`, `nama_barang`, `jumlah`, `jenis_pembelian`, `harga`, `tenor`, `angsuran`, `status`, `nik_sales`) VALUES
(2, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'paid', '1401197'),
(6, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'paid', '1401197'),
(7, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'confirm', '1401197'),
(8, 'PRS-1401197-013', 'CUS14112019013', 'Ahmad Zaelani', '<p>JAMBI</p>', '2019-11-14', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'KREDIT', 100000, 2, 200000, 'paid', '1401197'),
(9, 'PRS-017', 'CUS05062020016', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-05-11', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'paid', 'admin'),
(10, 'PRS-019', 'CUS05062020017', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-05', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'paid', 'admin'),
(11, 'PRS-021', 'CUS07062020018', 'Eko Kurniadi', '<p>Jambi</p>', '2020-06-07', '1523686523125678', '081366424345', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'paid', 'admin'),
(12, 'PRS-025', 'CUS23062020020', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'paid', 'admin'),
(13, 'PRS-026', 'CUS23062020021', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'paid', 'admin'),
(14, 'PRS-CUS25042020001-027', 'CUS25042020001', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-24', '1571020202950041', '085296072649', 'BRG14112019001', '6 PCS COOKWARE SET', 1, 'KREDIT', 234, 10, 200, 'paid', 'admin');

--
-- Triggers `pembayaran`
--
DELIMITER $$
CREATE TRIGGER `kurangi` AFTER INSERT ON `pembayaran` FOR EACH ROW BEGIN
UPDATE stok set stok=stok-New.jumlah where kode_barang = NEW.kode_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `kode_pembelian` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `customer_id` varchar(50) NOT NULL,
  `alamat` text,
  `provinsi` varchar(30) DEFAULT NULL,
  `kecamatan` varchar(30) DEFAULT NULL,
  `kabupaten` varchar(30) DEFAULT NULL,
  `ekspedisi` varchar(50) DEFAULT NULL,
  `layanan` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `pengiriman` double NOT NULL DEFAULT '0',
  `bukti_transfer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `kode_pembelian`, `tanggal`, `customer_id`, `alamat`, `provinsi`, `kecamatan`, `kabupaten`, `ekspedisi`, `layanan`, `status`, `pengiriman`, `bukti_transfer`) VALUES
(1, 'TRX-CUS25042001', '2020-06-23', 'CUS25042020001', '<p>fadfa</p>', '1', NULL, 'Kota Jambi', '1', 'REG', 'proses', 0, ''),
(2, 'TRX-CUS25042001', '2020-06-23', 'CUS25042020001', '<p>fadfa</p>', '1', NULL, 'Kota Jambi', '1', 'REG', 'proses', 0, ''),
(3, 'TRX-CUS25042002', '2020-06-23', 'CUS25042020001', 'sdfasdfdagg', '1', NULL, 'Kota Jambi', '1', 'REG', 'baru', 10000, ''),
(4, 'TRX-CUS25042003', '2020-06-24', 'CUS25042020001', 'laksd;lfa', '1', NULL, 'Kota Jambi', '1', 'REG', 'baru', 10000, ''),
(5, 'TRX-CUS25042004', '2020-07-02', 'CUS25042020001', '<p>asdasdfasdf</p>', '1', NULL, 'Kota Jambi', '1', 'REG', 'selesai', 10000, ''),
(6, 'TRX-CUS25042005', '2020-07-27', 'CUS25042020001', '<p>adsfadsfadsfadf</p>', '1', NULL, 'Kota Jambi', '1', 'REG', 'proses', 10000, 'sales_stock2.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `prospek`
--

CREATE TABLE `prospek` (
  `id` int(100) NOT NULL,
  `id_prospek` varchar(100) NOT NULL,
  `id_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `no_ktp` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `nik_sales` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prospek`
--

INSERT INTO `prospek` (`id`, `id_prospek`, `id_customer`, `nama`, `alamat`, `tanggal`, `no_ktp`, `no_hp`, `kode_barang`, `nama_barang`, `jumlah`, `status`, `nik_sales`) VALUES
(1, 'PRS-1401197-010', 'CUS13112019010', 'Eko Kurniadi', '<p>jambi</p>', '2019-02-02', '1571020202950041', '089562100774', 'BRG10112019005', '6 PCS COOKWARE SET', 1, 'baru', '1401197'),
(2, 'PRS-ADMIN003', 'CUS11112019003', 'Ahmad Zaelani', '<p>Jambi</p>', '2019-11-11', '1571020202950042', '089562100774', 'BRG10112019005', '6 PCS COOKWARE SET', 1, 'DEAL', 'admin'),
(3, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'paid', '1401197'),
(4, 'PRS-1401197-013', 'CUS14112019013', 'Ahmad Zaelani', '<p>JAMBI</p>', '2019-11-14', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'paid', '1401197'),
(5, 'PRS-1401197-015', 'CUS14112019015', 'Ahmad Zaelani', '<p>JAMBI</p>', '2019-11-14', '1571020202950041', '089562100774', 'BRG14112019002', 'NEW AMAZING PAN', 1, 'DEAL', '1401197'),
(14, 'PRS-017', 'CUS05062020016', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-05-11', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'paid', 'admin'),
(15, 'PRS-019', 'CUS05062020017', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-05', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'paid', 'admin'),
(16, 'PRS-021', 'CUS07062020018', 'Eko Kurniadi', '<p>Jambi</p>', '2020-06-07', '1523686523125678', '081366424345', 'BRG05052020003', 'Ampia', 1, 'paid', 'admin'),
(17, 'PRS-025', 'CUS23062020020', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'paid', 'admin'),
(19, 'PRS-026', 'CUS23062020020', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'paid', 'admin'),
(20, 'PRS-CUS25042020001-027', 'CUS25042020001', 'Diki', 'Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan', '2020-06-24', '1571020202950041', '085296072649', 'BRG14112019001', '6 PCS COOKWARE SET', 1, 'paid', 'admin'),
(21, 'PRS-029', 'CUS25062020021', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-25', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'DEAL', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id` int(11) NOT NULL,
  `provinsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id`, `provinsi`) VALUES
(1, 'Jambi'),
(2, 'DKI Jakarta'),
(3, 'Bandung'),
(4, 'Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(1) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `customer` varchar(50) NOT NULL,
  `review` text NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id`, `kode_barang`, `customer`, `review`, `tanggal`) VALUES
(1, '', 'Diki', 'dfadsfadsf', '2020-07-09 17:00:00'),
(2, 'BRG14112019001', 'Diki', 'fasdfasdfasdf', '2020-07-09 17:00:00'),
(3, 'BRG07062020004', 'Diki', 'fdsfdgsdfgsdfg', '2020-07-09 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(100) NOT NULL,
  `nik` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `nomor_hp` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `nik`, `nama_lengkap`, `jenis_kelamin`, `nomor_hp`, `password`, `role`, `foto`) VALUES
(1, '1401197', 'Eko Kurniadi', 'Laki-Laki', '0895621008774', 'eko', 'Sales', 'EMC_3L.jpg'),
(2, '1401198', 'ARI', 'Laki-Laki', '0895621008774', '123', 'Sales', 'AMPIA.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sales_order`
--

CREATE TABLE `sales_order` (
  `id` int(100) NOT NULL,
  `id_prospek` varchar(100) NOT NULL,
  `id_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `tanggal` date NOT NULL,
  `no_ktp` varchar(100) NOT NULL,
  `no_hp` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jumlah` int(100) NOT NULL,
  `jenis_pembelian` varchar(100) NOT NULL,
  `harga` int(100) NOT NULL,
  `tenor` int(100) NOT NULL,
  `angsuran` int(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `nik_sales` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_order`
--

INSERT INTO `sales_order` (`id`, `id_prospek`, `id_customer`, `nama`, `alamat`, `tanggal`, `no_ktp`, `no_hp`, `kode_barang`, `nama_barang`, `jumlah`, `jenis_pembelian`, `harga`, `tenor`, `angsuran`, `status`, `nik_sales`) VALUES
(2, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'confirm', '1401197'),
(6, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'confirm', '1401197'),
(7, 'PRS-1401197-008', 'CUS11112019008', 'Joko', '<p>Jambi</p>', '2019-11-12', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'CASH', 100000, 0, 0, 'confirm', '1401197'),
(8, 'PRS-1401197-013', 'CUS14112019013', 'Ahmad Zaelani', '<p>JAMBI</p>', '2019-11-14', '1571020202950041', '089562100774', 'BRG11112019006', '6 PCS COOKWARE SET', 1, 'KREDIT', 100000, 2, 200000, 'confirm', '1401197'),
(9, 'PRS-017', 'CUS05062020016', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-05-11', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'confirm', 'admin'),
(10, 'PRS-021', 'CUS07062020018', 'Eko Kurniadi', '<p>Jambi</p>', '2020-06-07', '1523686523125678', '081366424345', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'confirm', 'admin'),
(11, 'PRS-025', 'CUS23062020020', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'confirm', 'admin'),
(12, 'PRS-026', 'CUS23062020021', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-23', '1571020202950041', '085296072649', 'BRG05052020003', 'Ampia', 1, 'KREDIT', 100000, 6, 20000, 'confirm', 'admin'),
(13, 'PRS-CUS25042020001-027', 'CUS25042020001', 'Diki', '<p>Jln. Ra. Kartini Rt.38 Kel.talang bakung Kecamatan Jambi selatan</p>', '2020-06-24', '1571020202950041', '085296072649', 'BRG14112019001', '6 PCS COOKWARE SET', 1, 'KREDIT', 234, 10, 200, 'paid', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `skema_kredit`
--

CREATE TABLE `skema_kredit` (
  `id` int(100) NOT NULL,
  `id_skema` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skema_kredit`
--

INSERT INTO `skema_kredit` (`id`, `id_skema`, `kode_barang`) VALUES
(4, 'SKM11112019014', 'BRG10112019005'),
(5, 'SKM11112019015', 'BRG10112019005'),
(6, 'SKM11112019016', 'BRG11112019006'),
(7, 'SKM15042020017', 'BRG14112019001'),
(8, 'SKM05062020018', 'BRG05052020003'),
(9, 'SKM07062020019', 'BRG14112019001');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `kode_barang`, `nama_barang`, `stok`) VALUES
(4, 'BRG14112019001', '6 PCS COOKWARE SET', 0),
(5, 'BRG14112019002', 'NEW AMAZING PAN', 19),
(6, 'BRG05052020003', 'Ampia', -6),
(7, 'BRG07062020004', 'Wajan', 9),
(8, 'BRG14112019001', '6 PCS COOKWARE SET', -17),
(9, 'BRG14112019002', 'NEW AMAZING PAN', 0),
(12, 'BRG14112019001', '6 PCS COOKWARE SET', 0),
(13, 'BRG14112019002', 'NEW AMAZING PAN', 19),
(14, 'BRG05052020003', 'Ampia', -6),
(15, 'BRG07062020004', 'Wajan', 9),
(16, 'BRG14112019001', '6 PCS COOKWARE SET', -17),
(17, 'BRG14112019002', 'NEW AMAZING PAN', 0),
(18, 'BRG05052020003', 'Ampia', -1),
(19, 'BRG07062020004', 'Wajan', -1),
(20, 'BRG23062020005', 'dfasfas', -1);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan_konsumen`
--

CREATE TABLE `tagihan_konsumen` (
  `id` int(11) NOT NULL,
  `id_prospek` varchar(30) NOT NULL,
  `id_customer` varchar(30) NOT NULL,
  `nama_konsumen` varchar(100) NOT NULL,
  `nominal` double NOT NULL DEFAULT '0',
  `tanggal_pembayaran` date NOT NULL,
  `keterangan` text NOT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tagihan_konsumen`
--

INSERT INTO `tagihan_konsumen` (`id`, `id_prospek`, `id_customer`, `nama_konsumen`, `nominal`, `tanggal_pembayaran`, `keterangan`, `status`) VALUES
(27, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '2020-06-23', '<p>Angsuran ke 1</p>', 'Angsuran'),
(28, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(29, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(30, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(31, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(32, 'PRS-026', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(33, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(34, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(35, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(36, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(37, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran'),
(38, 'PRS-025', 'CUS25042020001', 'Diki', 20000, '0000-00-00', '', 'Angsuran');

-- --------------------------------------------------------

--
-- Table structure for table `tentang`
--

CREATE TABLE `tentang` (
  `id` int(11) NOT NULL,
  `tentang_kami` text NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `atas_nama` varchar(100) NOT NULL,
  `no_rekening` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tentang`
--

INSERT INTO `tentang` (`id`, `tentang_kami`, `nama_bank`, `atas_nama`, `no_rekening`) VALUES
(1, '<p>Kami adalah perusahaan penjualan barang ABC terbesar di provinsi jambi</p>\r\n\r\n<p> </p>', 'BCA', 'HAKASIMA', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('Admin','Kasir') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `role`) VALUES
(1, 'admin', 'admin', '12345', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_ongkir`
--
ALTER TABLE `detail_ongkir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_skema`
--
ALTER TABLE `detail_skema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kabupaten`
--
ALTER TABLE `kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prospek`
--
ALTER TABLE `prospek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_order`
--
ALTER TABLE `sales_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skema_kredit`
--
ALTER TABLE `skema_kredit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tagihan_konsumen`
--
ALTER TABLE `tagihan_konsumen`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `tentang`
--
ALTER TABLE `tentang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `detail_barang_masuk`
--
ALTER TABLE `detail_barang_masuk`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `detail_ongkir`
--
ALTER TABLE `detail_ongkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `detail_skema`
--
ALTER TABLE `detail_skema`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ekspedisi`
--
ALTER TABLE `ekspedisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kabupaten`
--
ALTER TABLE `kabupaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `konsumen`
--
ALTER TABLE `konsumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `prospek`
--
ALTER TABLE `prospek`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_order`
--
ALTER TABLE `sales_order`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `skema_kredit`
--
ALTER TABLE `skema_kredit`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tagihan_konsumen`
--
ALTER TABLE `tagihan_konsumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tentang`
--
ALTER TABLE `tentang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
