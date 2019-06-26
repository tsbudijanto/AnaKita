-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2019 at 09:19 AM
-- Server version: 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `riwayat`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_groups`
--

CREATE TABLE `admin_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Webmaster'),
(2, 'admin', 'Administrator'),
(3, 'manager', 'Manager'),
(4, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_attempts`
--

CREATE TABLE `admin_login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, 1451900190, 1514031698, 1, 'Webmaster', ''),
(2, '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, 'MDtY7wx/6B6RsdV.E13CGO', 1451900228, 1513772603, 1, 'Admin', ''),
(3, '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, 1451900430, 1465489585, 1, 'Manager', ''),
(4, '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, 1451900439, 1465489590, 1, 'Staff', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_groups`
--

CREATE TABLE `admin_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `api_access`
--

CREATE TABLE `api_access` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'anonymous', 1, 1, 0, NULL, 1463388382);

-- --------------------------------------------------------

--
-- Table structure for table `api_limits`
--

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(11) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `pos`, `title`) VALUES
(1, 2, 'Berita Utama'),
(2, 1, 'Running Text'),
(3, 3, 'Breaking News');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `author_id` int(11) NOT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `content_brief` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('draft','active','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `category_id`, `author_id`, `title`, `image_url`, `content_brief`, `content`, `publish_time`, `status`) VALUES
(1, 1, 2, 'Blog Post 1', '', '<p>Isi berita singkat untuk kategori satu dan blog post satu</p>\r\n', 'Direktorat Jenderal Bina Marga mempunyai tugas menyelenggarakan perumusan dan pelaksanaan kebijakan di bidang penyelenggaraan jalan sesuai dengan ketentuan peraturan perundang-undangan. <br/>Direktorat Jenderal Bina Marga menyelenggarakan fungsi:\r\n<table style=\"width:100%\">\r\n  <tr>\r\n    <td valign=\"top\">1. </td>\r\n    <td>perumusan kebijakan di bidang penyelenggaraan jalan sesuai dengan ketentuan peraturan perundangundangan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>2. </td>\r\n    <td>pelaksanaan kebijakan di bidang penyelenggaraan jalan nasional;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>3. </td>\r\n    <td>pelaksanaan kebijakan di bidang penguatan konektivitas yang menjadi prioritas nasional;</td>\r\n  </tr>\r\n    <td>4. </td>\r\n    <td>penyusunan norma, standar, prosedur, dan kriteria di bidang jalan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>5. </td>\r\n    <td>pemberian bimbingan teknis dan supervisi di bidang penyelenggaraan jalan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>6. </td>\r\n    <td>pelaksanaan evaluasi dan pelaporan di bidang penyelenggaraan jalan;</td>\r\n  </tr>\r\n    <td>7. </td>\r\n    <td>pelaksanaan administrasi Direktorat Jenderal Bina Marga; dan</td>\r\n  </tr>\r\n  <tr>\r\n    <td>8. </td>\r\n    <td>pelaksanaan fungsi lain yang diberikan oleh Menteri.</td>\r\n  </tr>\r\n</table>', '2015-09-25 17:00:00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts_tags`
--

CREATE TABLE `blog_posts_tags` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_posts_tags`
--

INSERT INTO `blog_posts_tags` (`id`, `post_id`, `tag_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `title`) VALUES
(1, 'Tag 1'),
(2, 'Tag 2'),
(3, 'Tag 3');

-- --------------------------------------------------------

--
-- Table structure for table `bm_photos_categories`
--

CREATE TABLE `bm_photos_categories` (
  `id` int(11) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bm_photos_categories`
--

INSERT INTO `bm_photos_categories` (`id`, `pos`, `title`) VALUES
(1, 3, 'Image'),
(2, 1, 'Video'),
(3, 4, 'MS Word'),
(4, 5, 'MS Excel'),
(5, 6, 'MS PowerPoint'),
(6, 7, 'PDF'),
(7, 2, 'WEBM Videos');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_id`, `city_name`) VALUES
(1, 'Angkasa'),
(2, 'Amerika');

-- --------------------------------------------------------

--
-- Table structure for table `cover_photos`
--

CREATE TABLE `cover_photos` (
  `id` int(11) NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  `image_url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','hidden') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cover_photos`
--

INSERT INTO `cover_photos` (`id`, `pos`, `image_url`, `status`) VALUES
(1, 2, '45296-2.jpg', 'active'),
(2, 1, '2934f-1.jpg', 'active'),
(3, 3, '3717d-3.jpg', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `foto_td`
--

CREATE TABLE `foto_td` (
  `id_ftd` int(11) NOT NULL,
  `lokasi_ftd` varchar(300) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `nama_ftd` varchar(100) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `publish_ftd` date NOT NULL,
  `status_ftd` int(4) NOT NULL,
  `insertkey` varchar(32) COLLATE latin1_general_ci DEFAULT NULL,
  `id_alb` int(11) NOT NULL
) ENGINE=MyISAM AVG_ROW_LENGTH=108 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `foto_td`
--

INSERT INTO `foto_td` (`id_ftd`, `lokasi_ftd`, `nama_ftd`, `publish_ftd`, `status_ftd`, `insertkey`, `id_alb`) VALUES
(550, '.jpg', '.', '2012-10-03', 1, 'c716669076d91de60a8b26b24eca2e7d', 3),
(552, '.jpg', '.', '2012-10-03', 1, 'a6441901f2027ad947c224628529cdca', 3),
(551, '.jpg', '.', '2012-10-03', 1, '0b0bd736eb5de2ded36d800f942ba134', 3),
(553, '.jpg', '.', '2012-10-03', 1, 'd385b3be5528ae1845ecdd64dfbefe0d', 3),
(554, '.jpg', '.', '2012-10-03', 1, '6afcd4fe3d110b3c2905c00e78ed2299', 3),
(555, '.jpg', '.', '2012-10-03', 1, 'cb5232b067c4ab27a89bc64ea8551f18', 3),
(556, '.jpg', '.', '2012-10-03', 1, 'e5a677ad37914cba61cfb502a84a9c16', 3),
(557, '.jpg', '.', '2012-10-03', 1, '19b73c5dd06a9a599cf6e90c0c166872', 3),
(558, '.jpg', '.', '2012-10-03', 1, 'a454769a4bc0b17b4aa7b3ffb75b99e8', 4),
(559, '.jpg', '.', '2012-10-03', 1, '4159bb3b11b6202b634f2a4da6b5eb1f', 4),
(560, '.jpg', '.', '2012-10-03', 1, '2f5c62670d19e02e6b0606ce1bf08c30', 4),
(561, '.jpg', '.', '2012-10-03', 1, '930e2324b5e00cc4410270e314ead652', 4),
(562, '.jpg', '.', '2012-10-03', 1, '2dfce8dcc7f568104d5cd890b8f723bc', 4),
(563, '.jpg', '.', '2012-10-03', 1, '9984da617ea05ee6bce424648a324470', 4),
(564, '.jpg', '.', '2012-10-03', 1, 'c749be0e6a27dc6adb5e324305cf70f5', 4),
(565, '.jpg', '.', '2012-10-03', 1, 'd73c193632c656cc47b507f8a134db23', 4),
(566, '.jpg', '.', '2012-10-03', 1, '9d4c686f8626c837d27118b8f1f3d4c6', 4),
(567, '.jpg', '.', '2012-10-03', 1, 'f9cc8373f94ac0fed24fe5986a7307b8', 5),
(568, '.jpg', '.', '2012-10-03', 1, '26d7fd5542980af127e9af78ee4c6090', 5),
(569, '.jpg', '.', '2012-10-03', 1, '202344a9f591d650845afec96b9b08e5', 5),
(570, '.jpg', '.', '2012-10-03', 1, 'b41eb07262b30e9193d8d3149ad3ff0d', 6),
(571, '.jpg', '.', '2012-10-03', 1, 'e9ec068d18063d7b46e91d8f8ac3231e', 6),
(572, '.jpg', '.', '2012-10-03', 1, '050fc35a0a21512f77722a5734cce862', 6),
(573, '.jpg', '.', '2012-10-03', 1, '99bc3d7dbeab586d79c93f9c178b8144', 6),
(574, '.jpg', '.', '2012-10-03', 1, '8fb47935e79314260eb12709f302fa20', 6),
(575, '.jpg', '.', '2012-10-03', 1, 'd4eefd5103f709520b40aff5d4c80d52', 6),
(577, '.jpg', 'Jembatan Tradisional', '2012-12-04', 1, '96bbc0571e24ee549e333402ac615fa1', 8),
(578, '.jpg', 'Jembatan Kampung', '2012-12-03', 1, 'e65f2fd361e1f10cd7d95a9803816313', 8),
(579, '.jpg', 'Prasarana Sungai', '2012-12-04', 1, 'a7a0de5f1454a014073291f05c45cbab', 8),
(580, '.jpg', 'kawasan strategis3', '2013-09-22', 1, 'ba27a90083aa9b7774a97f3d49a41773', 12),
(581, '.jpg', 'Peta Struktur Ruang', '2013-09-22', 1, '5507e69217a00e8e3ec8d62132a0345b', 12),
(582, '.jpg', 'Pola Ruang', '2013-09-22', 1, '4e2a97ea95675200bc788a43b60ea49c', 12);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `tipe` int(11) DEFAULT NULL,
  `tampil` char(1) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image_url`, `judul`, `tipe`, `tampil`) VALUES
(1, '84779-i2.jpg', 'Foto Kegiatan Direktorat PJJ', 1, '1'),
(2, '23532-vid-20170805-wa0039.mp4', 'Aceh - Pembukaan Jalan baru', 2, '1'),
(3, '203d3-vid-20170807-wa0001.mp4', 'Intermeso satu', 2, '1'),
(4, 'http://www.youtube.com/watch?v=Tn9QZ4egBNE', 'images/2.jpg', 2, '1'),
(5, 'http://www.youtube.com/watch?v=3MWQhVmy65U', 'images/3.jpg', 2, '1'),
(6, 'http://www.youtube.com/watch?v=tsOzthJFmpk', 'images/4.jpg', 2, '1'),
(7, 'http://www.youtube.com/watch?v=WQluMmpnO-s', 'images/5.jpg', 2, '1'),
(8, 'http://www.youtube.com/watch?v=hYUuKH_WHyc', 'images/6.jpg', 2, '1'),
(9, 'http://www.youtube.com/watch?v=o7nAp7E7bow', 'images/7.jpg', 2, '1'),
(10, '96c0b-ponselpay-business-requirement_help-desk.doc', 'Business Requirements', 3, '1');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` varchar(8) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
('1', 'UPMT', 'Muara Tawar'),
('10', 'UPHB', 'Unit Pemeliharaan Wilayah Barat'),
('11', 'UPHT', 'Unit Pemeliharaan Wilayah Timur'),
('2', 'UPMK', 'Muara Karang'),
('3', 'BPWC', 'Badan Pengelola Waduk Cirata'),
('4', 'UCRT', 'Cirata'),
('5', 'PJB2', 'Kantor Pusat PJB'),
('6', 'SGRK', 'Gresik'),
('7', 'SPTN', 'Paiton'),
('8', 'BRSA', 'Brantas 1'),
('9', 'BRSB', 'Brantas 2');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `sectorCode` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `sectorName` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `subsectorname` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `subsectornameid` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `sectorCode`, `sectorName`, `subsectorname`, `subsectornameid`) VALUES
(1, 'SP', 'Transportation', 'Sea Port', 'Pelabuhan Laut'),
(2, 'BT', 'Transportation', 'Land Transportation', 'Transportasi Darat'),
(3, 'AP', 'Transportation', 'Air Transport ', 'Transportasi Udara'),
(4, 'RW', 'Transportation', 'Rail Transport ', 'Transportasi Kereta Api'),
(5, 'TR', 'Transportation', 'Toll Road', 'Jalan Tol'),
(6, 'WM', 'Environmental / Sanitation', 'Solid Waste Treatment', 'Limbah Padat'),
(7, 'OT', 'Other Infrastructure', 'Urban Infrastructure', 'Infrastruktur Urban'),
(8, 'MK', 'Other Infrastructure', 'Market', 'Pasar'),
(9, 'EN', 'Energy', 'Power Plant', 'Pembangkit Listrik'),
(10, 'WS', 'Water', 'Water Supply', 'Air Minum'),
(11, 'WB', 'Water', 'Water Sanitation', ''),
(12, 'IC', 'Telco & Information', 'Telecomunication', 'Telekomunikasi'),
(13, 'EG', 'Telco & Information', 'e-Government', 'e-Government'),
(14, 'O2', 'Others', 'Others', 'Lain-lain');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `master_aplikasi`
--

CREATE TABLE `master_aplikasi` (
  `noform` char(9) NOT NULL DEFAULT '',
  `periode` char(4) DEFAULT NULL,
  `kodepropinsi` char(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `master_aplikasi`
--

INSERT INTO `master_aplikasi` (`noform`, `periode`, `kodepropinsi`) VALUES
('0110-11', '0110', '11'),
('0110-1103', '0110', '11'),
('0210-11', '0210', '11'),
('0210-1103', '0210', '11'),
('0110-12', '0110', '12'),
('0110-32', '0110', '32'),
('0110-76', '0110', '76'),
('0110-36', '0110', '36'),
('0110-17', '0110', '17'),
('2010-32', '2010', '32'),
('2011-32', '2011', '32'),
('2010-11', '2010', '11'),
('0110-33', '0110', '33'),
('0210-32', '0210', '32'),
('0610-32', '0610', '32'),
('0110-3204', '0110', '32'),
('0310-32', '0310', '32'),
('0110-3528', '0110', '35'),
('0210-3528', '0210', '35'),
('0210-3204', '0210', '32'),
('0710-3204', '0710', '32'),
('0110-1306', '0110', '13'),
('0110-13', '0110', '13'),
('0210-13', '0210', '13'),
('2010-13', '2010', '13'),
('2011-13', '2011', '13'),
('0910-13', '0910', '13'),
('0113-13', '0113', '13'),
('0113-<b', '0113', '<b'),
('0213-13', '0213', '13');

-- --------------------------------------------------------

--
-- Table structure for table `master_desa`
--

CREATE TABLE `master_desa` (
  `kddesa` varchar(10) NOT NULL,
  `nmdesa` text,
  `kdkec` varchar(7) DEFAULT NULL,
  `kdkab` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `master_kabupaten`
--

CREATE TABLE `master_kabupaten` (
  `id_kab21` int(3) NOT NULL,
  `nama_kabupaten` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id_propinsi` int(2) NOT NULL,
  `id_kabupaten` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_kabupaten`
--

INSERT INTO `master_kabupaten` (`id_kab21`, `nama_kabupaten`, `id_propinsi`, `id_kabupaten`) VALUES
(1, 'Kabupaten Aceh Barat', 11, 11001),
(2, 'Kabupaten Aceh Barat Daya', 11, 11002),
(3, 'Kabupaten Aceh Besar', 11, 11003),
(4, 'Kabupaten Aceh Jaya', 11, 11004),
(5, 'Kabupaten Aceh Selatan', 11, 11005),
(6, 'Kabupaten Aceh Singkil', 11, 11006),
(7, 'Kabupaten Aceh Tamiang', 11, 11007),
(8, 'Kabupaten Aceh Tengah', 11, 11008),
(9, 'Kabupaten Aceh Tenggara', 11, 11009),
(10, 'Kabupaten Aceh Timur', 11, 11010),
(11, 'Kabupaten Aceh Utara', 11, 11011),
(12, 'Kabupaten Bener Meriah', 11, 11012),
(13, 'Kabupaten Bireuen', 11, 11013),
(14, 'Kabupaten Gayo Lues', 11, 11014),
(15, 'Kabupaten Nagan Raya', 11, 11015),
(16, 'Kabupaten Pidie', 11, 11016),
(17, 'Kabupaten Pidie Jaya', 11, 11017),
(18, 'Kabupaten Simeulue', 11, 11018),
(19, 'Kota Banda Aceh', 11, 11019),
(20, 'Kota Langsa', 11, 11020),
(21, 'Kota Lhokseumawe', 11, 11021),
(22, 'Kota Sabang', 11, 11022),
(23, 'Kota Subulussalam', 11, 11023),
(24, 'Kabupaten Asahan', 12, 12024),
(25, 'Kabupaten Batu Bara', 12, 12025),
(26, 'Kabupaten Dairi', 12, 12026),
(27, 'Kabupaten Deli Serdang', 12, 12027),
(28, 'Kabupaten Humbang Hasundutan', 12, 12028),
(29, 'Kabupaten Karo', 12, 12029),
(30, 'Kabupaten Labuhanbatu', 12, 12030),
(31, 'Kabupaten Labuhanbatu Selatan', 12, 12031),
(32, 'Kabupaten Labuhanbatu Utara', 12, 12032),
(33, 'Kabupaten Langkat', 12, 12033),
(34, 'Kabupaten Mandailing Natal', 12, 12034),
(35, 'Kabupaten Nias', 12, 12035),
(36, 'Kabupaten Nias Barat', 12, 12036),
(37, 'Kabupaten Nias Selatan', 12, 12037),
(38, 'Kabupaten Nias Utara', 12, 12038),
(39, 'Kabupaten Padang Lawas', 12, 12039),
(40, 'Kabupaten Padang Lawas Utara', 12, 12040),
(41, 'Kabupaten Pakpak Bharat', 12, 12041),
(42, 'Kabupaten Samosir', 12, 12042),
(43, 'Kabupaten Serdang Bedagai', 12, 12043),
(44, 'Kabupaten Simalungun', 12, 12044),
(45, 'Kabupaten Tapanuli Selatan', 12, 12045),
(46, 'Kabupaten Tapanuli Tengah', 12, 12046),
(47, 'Kabupaten Tapanuli Utara', 12, 12047),
(48, 'Kabupaten Toba Samosir', 12, 12048),
(49, 'Kota Binjai', 12, 12049),
(50, 'Kota Gunung Sitoli', 12, 12050),
(51, 'Kota Medan', 12, 12051),
(52, 'Kota Padang Sidempuan', 12, 12052),
(53, 'Kota Pematangsiantar', 12, 12053),
(54, 'Kota Sibolga', 12, 12054),
(55, 'Kota Tanjung Balai', 12, 12055),
(56, 'Kota Tebing Tinggi', 12, 12056),
(57, 'Kabupaten Bengkulu Selatan', 17, 17057),
(58, 'Kabupaten Bengkulu Tengah', 17, 17058),
(59, 'Kabupaten Bengkulu Utara', 17, 17059),
(60, 'Kabupaten Benteng', 17, 17060),
(61, 'Kabupaten Kaur', 17, 17061),
(62, 'Kabupaten Kepahiang', 17, 17062),
(63, 'Kabupaten Lebong', 17, 17063),
(64, 'Kabupaten Mukomuko', 17, 17064),
(65, 'Kabupaten Rejang Lebong', 17, 17065),
(66, 'Kabupaten Seluma', 17, 17066),
(67, 'Kota Bengkulu', 17, 17067),
(68, 'Kabupaten Batang Hari', 15, 15068),
(69, 'Kabupaten Bungo', 15, 15069),
(70, 'Kabupaten Kerinci', 15, 15070),
(71, 'Kabupaten Merangin', 15, 15071),
(72, 'Kabupaten Muaro Jambi', 15, 15072),
(73, 'Kabupaten Sarolangun', 15, 15073),
(74, 'Kabupaten Tanjung Jabung Barat', 15, 15074),
(75, 'Kabupaten Tanjung Jabung Timur', 15, 15075),
(76, 'Kabupaten Tebo', 15, 15076),
(77, 'Kota Jambi', 15, 15077),
(78, 'Kota Sungai Penuh', 15, 15078),
(79, 'Kabupaten Bengkalis', 14, 14079),
(80, 'Kabupaten Indragiri Hilir', 14, 14080),
(81, 'Kabupaten Indragiri Hulu', 14, 14081),
(82, 'Kabupaten Kampar', 14, 14082),
(83, 'Kabupaten Kuantan Singingi', 14, 14083),
(84, 'Kabupaten Pelalawan', 14, 14084),
(85, 'Kabupaten Rokan Hilir', 14, 14085),
(86, 'Kabupaten Rokan Hulu', 14, 14086),
(87, 'Kabupaten Siak', 14, 14087),
(88, 'Kota Pekanbaru', 14, 14088),
(89, 'Kota Dumai', 14, 14089),
(90, 'Kabupaten Kepulauan Meranti', 14, 14090),
(91, 'Kabupaten Agam', 13, 13091),
(92, 'Kabupaten Dharmasraya', 13, 13092),
(93, 'Kabupaten Kepulauan Mentawai', 13, 13093),
(94, 'Kabupaten Lima Puluh Kota', 13, 13094),
(95, 'Kabupaten Padang Pariaman', 13, 13095),
(96, 'Kabupaten Pasaman', 13, 13096),
(97, 'Kabupaten Pasaman Barat', 13, 13097),
(98, 'Kabupaten Pesisir Selatan', 13, 13098),
(99, 'Kabupaten Sijunjung', 13, 13099),
(100, 'Kabupaten Solok', 13, 13100),
(101, 'Kabupaten Solok Selatan', 13, 13101),
(102, 'Kabupaten Tanah Datar', 13, 13102),
(103, 'Kota Bukittinggi', 13, 13103),
(104, 'Kota Padang', 13, 13104),
(105, 'Kota Padangpanjang', 13, 13105),
(106, 'Kota Pariaman', 13, 13106),
(107, 'Kota Payakumbuh', 13, 13107),
(108, 'Kota Sawahlunto', 13, 13108),
(109, 'Kota Solok', 13, 13109),
(110, 'Kabupaten Banyuasin', 16, 16110),
(111, 'Kabupaten Empat Lawang', 16, 16111),
(112, 'Kabupaten Lahat', 16, 16112),
(113, 'Kabupaten Muara Enim', 16, 16113),
(114, 'Kabupaten Musi Banyuasin', 16, 16114),
(115, 'Kabupaten Musi Rawas', 16, 16115),
(116, 'Kabupaten Ogan Ilir', 16, 16116),
(117, 'Kabupaten Ogan Komering Ilir', 16, 16117),
(118, 'Kabupaten Ogan Komering Ulu', 16, 16118),
(119, 'Kabupaten Ogan Komering Ulu Selatan', 16, 16119),
(120, 'Kabupaten Ogan Komering Ulu Timur', 16, 16120),
(121, 'Kota Lubuklinggau', 16, 16121),
(122, 'Kota Pagar Alam', 16, 16122),
(123, 'Kota Palembang', 16, 16123),
(124, 'Kota Prabumulih', 16, 16124),
(125, 'Kabupaten Lampung Barat', 18, 18125),
(126, 'Kabupaten Lampung Selatan', 18, 18126),
(127, 'Kabupaten Lampung Tengah', 18, 18127),
(128, 'Kabupaten Lampung Timur', 18, 18128),
(129, 'Kabupaten Lampung Utara', 18, 18129),
(130, 'Kabupaten Mesuji', 18, 18130),
(131, 'Kabupaten Pesawaran', 18, 18131),
(132, 'Kabupaten Pringsewu', 18, 18132),
(133, 'Kabupaten Tanggamus', 18, 18133),
(134, 'Kabupaten Tulang Bawang', 18, 18134),
(135, 'Kabupaten Tulang Bawang Barat', 18, 18135),
(136, 'Kabupaten Way Kanan', 18, 18136),
(137, 'Kota Bandar Lampung', 18, 18137),
(138, 'Kota Metro', 18, 18138),
(139, 'Kabupaten Bangka', 19, 19139),
(140, 'Kabupaten Bangka Barat', 19, 19140),
(141, 'Kabupaten Bangka Selatan', 19, 19141),
(142, 'Kabupaten Bangka Tengah', 19, 19142),
(143, 'Kabupaten Belitung', 19, 19143),
(144, 'Kabupaten Belitung Timur', 19, 19144),
(145, 'Kota Pangkal Pinang', 19, 19145),
(146, 'Kabupaten Bintan', 21, 21146),
(147, 'Kabupaten Karimun', 21, 21147),
(148, 'Kabupaten Kepulauan Anambas', 21, 21148),
(149, 'Kabupaten Lingga', 21, 21149),
(150, 'Kabupaten Natuna', 21, 21150),
(151, 'Kota Batam', 21, 21151),
(152, 'Kota Tanjung Pinang', 21, 21152),
(153, 'Kabupaten Lebak', 36, 36153),
(154, 'Kabupaten Pandeglang', 36, 36154),
(155, 'Kabupaten Serang', 36, 36155),
(156, 'Kabupaten Tangerang', 36, 36156),
(157, 'Kota Cilegon', 36, 36157),
(158, 'Kota Serang', 36, 36158),
(159, 'Kota Tangerang', 36, 36159),
(160, 'Kota Tangerang Selatan', 36, 36160),
(161, 'Kabupaten Bandung', 32, 32161),
(162, 'Kabupaten Bandung Barat', 32, 32162),
(163, 'Kabupaten Bekasi', 32, 32163),
(164, 'Kabupaten Bogor', 32, 32164),
(165, 'Kabupaten Ciamis', 32, 32165),
(166, 'Kabupaten Cianjur', 32, 32166),
(167, 'Kabupaten Cirebon', 32, 32167),
(168, 'Kabupaten Garut', 32, 32168),
(169, 'Kabupaten Indramayu', 32, 32169),
(170, 'Kabupaten Karawang', 32, 32170),
(171, 'Kabupaten Kuningan', 32, 32171),
(172, 'Kabupaten Majalengka', 32, 32172),
(173, 'Kabupaten Purwakarta', 32, 32173),
(174, 'Kabupaten Subang', 32, 32174),
(175, 'Kabupaten Sukabumi', 32, 32175),
(176, 'Kabupaten Sumedang', 32, 32176),
(177, 'Kabupaten Tasikmalaya', 32, 32177),
(178, 'Kota Bandung', 32, 32178),
(179, 'Kota Banjar', 32, 32179),
(180, 'Kota Bekasi', 32, 32180),
(181, 'Kota Bogor', 32, 32181),
(182, 'Kota Cimahi', 32, 32182),
(183, 'Kota Cirebon', 32, 32183),
(184, 'Kota Depok', 32, 32184),
(185, 'Kota Sukabumi', 32, 32185),
(186, 'Kota Tasikmalaya', 32, 32186),
(187, 'Kabupaten Administrasi Kepulauan Seribu', 31, 31187),
(188, 'Kota Administrasi Jakarta Barat', 31, 31188),
(189, 'Kota Administrasi Jakarta Pusat', 31, 31189),
(190, 'Kota Administrasi Jakarta Selatan', 31, 31190),
(191, 'Kota Administrasi Jakarta Timur', 31, 31191),
(192, 'Kota Administrasi Jakarta Utara', 31, 31192),
(193, 'Kabupaten Banjarnegara', 33, 33193),
(194, 'Kabupaten Banyumas', 33, 33194),
(195, 'Kabupaten Batang', 33, 33195),
(196, 'Kabupaten Blora', 33, 33196),
(197, 'Kabupaten Boyolali', 33, 33197),
(198, 'Kabupaten Brebes', 33, 33198),
(199, 'Kabupaten Cilacap', 33, 33199),
(200, 'Kabupaten Demak', 33, 33200),
(201, 'Kabupaten Grobogan', 33, 33201),
(202, 'Kabupaten Jepara', 33, 33202),
(203, 'Kabupaten Karanganyar', 33, 33203),
(204, 'Kabupaten Kebumen', 33, 33204),
(205, 'Kabupaten Kendal', 33, 33205),
(206, 'Kabupaten Klaten', 33, 33206),
(207, 'Kabupaten Kudus', 33, 33207),
(208, 'Kabupaten Magelang', 33, 33208),
(209, 'Kabupaten Pati', 33, 33209),
(210, 'Kabupaten Pekalongan', 33, 33210),
(211, 'Kabupaten Pemalang', 33, 33211),
(212, 'Kabupaten Purbalingga', 33, 33212),
(213, 'Kabupaten Purworejo', 33, 33213),
(214, 'Kabupaten Rembang', 33, 33214),
(215, 'Kabupaten Semarang', 33, 33215),
(216, 'Kabupaten Sragen', 33, 33216),
(217, 'Kabupaten Sukoharjo', 33, 33217),
(218, 'Kabupaten Tegal', 33, 33218),
(219, 'Kabupaten Temanggung', 33, 33219),
(220, 'Kabupaten Wonogiri', 33, 33220),
(221, 'Kabupaten Wonosobo', 33, 33221),
(222, 'Kota Magelang', 33, 33222),
(223, 'Kota Pekalongan', 33, 33223),
(224, 'Kota Salatiga', 33, 33224),
(225, 'Kota Semarang', 33, 33225),
(226, 'Kota Surakarta', 33, 33226),
(227, 'Kota Tegal', 33, 33227),
(228, 'Kabupaten Bangkalan', 35, 35228),
(229, 'Kabupaten Banyuwangi', 35, 35229),
(230, 'Kabupaten Blitar', 35, 35230),
(231, 'Kabupaten Bojonegoro', 35, 35231),
(232, 'Kabupaten Bondowoso', 35, 35232),
(233, 'Kabupaten Gresik', 35, 35233),
(234, 'Kabupaten Jember', 35, 35234),
(235, 'Kabupaten Jombang', 35, 35235),
(236, 'Kabupaten Kediri', 35, 35236),
(237, 'Kabupaten Lamongan', 35, 35237),
(238, 'Kabupaten Lumajang', 35, 35238),
(239, 'Kabupaten Madiun', 35, 35239),
(240, 'Kabupaten Magetan', 35, 35240),
(241, 'Kabupaten Malang', 35, 35241),
(242, 'Kabupaten Mojokerto', 35, 35242),
(243, 'Kabupaten Nganjuk', 35, 35243),
(244, 'Kabupaten Ngawi', 35, 35244),
(245, 'Kabupaten Pacitan', 35, 35245),
(246, 'Kabupaten Pamekasan', 35, 35246),
(247, 'Kabupaten Pasuruan', 35, 35247),
(248, 'Kabupaten Ponorogo', 35, 35248),
(249, 'Kabupaten Probolinggo', 35, 35249),
(250, 'Kabupaten Sampang', 35, 35250),
(251, 'Kabupaten Sidoarjo', 35, 35251),
(252, 'Kabupaten Situbondo', 35, 35252),
(253, 'Kabupaten Sumenep', 35, 35253),
(254, 'Kabupaten Trenggalek', 35, 35254),
(255, 'Kabupaten Tuban', 35, 35255),
(256, 'Kabupaten Tulungagung', 35, 35256),
(257, 'Kota Batu', 35, 35257),
(258, 'Kota Blitar', 35, 35258),
(259, 'Kota Kediri', 35, 35259),
(260, 'Kota Madiun', 35, 35260),
(261, 'Kota Malang', 35, 35261),
(262, 'Kota Mojokerto', 35, 35262),
(263, 'Kota Pasuruan', 35, 35263),
(264, 'Kota Probolinggo', 35, 35264),
(265, 'Kota Surabaya', 35, 35265),
(266, 'Kabupaten Bantul', 34, 34266),
(267, 'Kabupaten Gunung Kidul', 34, 34267),
(268, 'Kabupaten Kulon Progo', 34, 34268),
(269, 'Kabupaten Sleman', 34, 34269),
(270, 'Kota Yogyakarta', 34, 34270),
(271, 'Kabupaten Badung', 51, 51271),
(272, 'Kabupaten Bangli', 51, 51272),
(273, 'Kabupaten Buleleng', 51, 51273),
(274, 'Kabupaten Gianyar', 51, 51274),
(275, 'Kabupaten Jembrana', 51, 51275),
(276, 'Kabupaten Karangasem', 51, 51276),
(277, 'Kabupaten Klungkung', 51, 51277),
(278, 'Kabupaten Tabanan', 51, 51278),
(279, 'Kota Denpasar', 51, 51279),
(280, 'Kabupaten Bima', 52, 52280),
(281, 'Kabupaten Dompu', 52, 52281),
(282, 'Kabupaten Lombok Barat', 52, 52282),
(283, 'Kabupaten Lombok Tengah', 52, 52283),
(284, 'Kabupaten Lombok Timur', 52, 52284),
(285, 'Kabupaten Lombok Utara', 52, 52285),
(286, 'Kabupaten Sumbawa', 52, 52286),
(287, 'Kabupaten Sumbawa Barat', 52, 52287),
(288, 'Kota Bima', 52, 52288),
(289, 'Kota Mataram', 52, 52289),
(290, 'Kabupaten Kupang', 53, 53290),
(291, 'Kabupaten Timor Tengah Selatan', 53, 53291),
(292, 'Kabupaten Timor Tengah Utara', 53, 53292),
(293, 'Kabupaten Belu', 53, 53293),
(294, 'Kabupaten Alor', 53, 53294),
(295, 'Kabupaten Flores Timur', 53, 53295),
(296, 'Kabupaten Sikka', 53, 53296),
(297, 'Kabupaten Ende', 53, 53297),
(298, 'Kabupaten Ngada', 53, 53298),
(299, 'Kabupaten Manggarai', 53, 53299),
(300, 'Kabupaten Sumba Timur', 53, 53300),
(301, 'Kabupaten Sumba Barat', 53, 53301),
(302, 'Kabupaten Lembata', 53, 53302),
(303, 'Kabupaten Rote Ndao', 53, 53303),
(304, 'Kabupaten Manggarai Barat', 53, 53304),
(305, 'Kabupaten Nagekeo', 53, 53305),
(306, 'Kabupaten Sumba Tengah', 53, 53306),
(307, 'Kabupaten Sumba Barat Daya', 53, 53307),
(308, 'Kabupaten Manggarai Timur', 53, 53308),
(309, 'Kabupaten Sabu Raijua', 53, 53309),
(310, 'Kota Kupang', 53, 53310),
(311, 'Kabupaten Bengkayang', 61, 61311),
(312, 'Kabupaten Kapuas Hulu', 61, 61312),
(313, 'Kabupaten Kayong Utara', 61, 61313),
(314, 'Kabupaten Ketapang', 61, 61314),
(315, 'Kabupaten Kubu Raya', 61, 61315),
(316, 'Kabupaten Landak', 61, 61316),
(317, 'Kabupaten Melawi', 61, 61317),
(318, 'Kabupaten Pontianak', 61, 61318),
(319, 'Kabupaten Sambas', 61, 61319),
(320, 'Kabupaten Sanggau', 61, 61320),
(321, 'Kabupaten Sekadau', 61, 61321),
(322, 'Kabupaten Sintang', 61, 61322),
(323, 'Kota Pontianak', 61, 61323),
(324, 'Kota Singkawang', 61, 61324),
(325, 'Kabupaten Balangan', 63, 63325),
(326, 'Kabupaten Banjar', 63, 63326),
(327, 'Kabupaten Barito Kuala', 63, 63327),
(328, 'Kabupaten Hulu Sungai Selatan', 63, 63328),
(329, 'Kabupaten Hulu Sungai Tengah', 63, 63329),
(330, 'Kabupaten Hulu Sungai Utara', 63, 63330),
(331, 'Kabupaten Kotabaru', 63, 63331),
(332, 'Kabupaten Tabalong', 63, 63332),
(333, 'Kabupaten Tanah Bumbu', 63, 63333),
(334, 'Kabupaten Tanah Laut', 63, 63334),
(335, 'Kabupaten Tapin', 63, 63335),
(336, 'Kota Banjarbaru', 63, 63336),
(337, 'Kota Banjarmasin', 63, 63337),
(338, 'Kabupaten Barito Selatan', 62, 62338),
(339, 'Kabupaten Barito Timur', 62, 62339),
(340, 'Kabupaten Barito Utara', 62, 62340),
(341, 'Kabupaten Gunung Mas', 62, 62341),
(342, 'Kabupaten Kapuas', 62, 62342),
(343, 'Kabupaten Katingan', 62, 62343),
(344, 'Kabupaten Kotawaringin Barat', 62, 62344),
(345, 'Kabupaten Kotawaringin Timur', 62, 62345),
(346, 'Kabupaten Lamandau', 62, 62346),
(347, 'Kabupaten Murung Raya', 62, 62347),
(348, 'Kabupaten Pulang Pisau', 62, 62348),
(349, 'Kabupaten Sukamara', 62, 62349),
(350, 'Kabupaten Seruyan', 62, 62350),
(351, 'Kota Palangka Raya', 62, 62351),
(352, 'Kabupaten Berau', 64, 64352),
(353, 'Kabupaten Bulungan', 64, 64353),
(354, 'Kabupaten Kutai Barat', 64, 64354),
(355, 'Kabupaten Kutai Kartanegara', 64, 64355),
(356, 'Kabupaten Kutai Timur', 64, 64356),
(357, 'Kabupaten Malinau', 64, 64357),
(358, 'Kabupaten Nunukan', 64, 64358),
(359, 'Kabupaten Paser', 64, 64359),
(360, 'Kabupaten Penajam Paser Utara', 64, 64360),
(361, 'Kabupaten Tana Tidung', 64, 64361),
(362, 'Kota Balikpapan', 64, 64362),
(363, 'Kota Bontang', 64, 64363),
(364, 'Kota Samarinda', 64, 64364),
(365, 'Kota Tarakan', 64, 64365),
(366, 'Kabupaten Boalemo', 75, 75366),
(367, 'Kabupaten Bone Bolango', 75, 75367),
(368, 'Kabupaten Gorontalo', 75, 75368),
(369, 'Kabupaten Gorontalo Utara', 75, 75369),
(370, 'Kabupaten Pohuwato', 75, 75370),
(371, 'Kota Gorontalo', 75, 75371),
(372, 'Kabupaten Bantaeng', 73, 73372),
(373, 'Kabupaten Barru', 73, 73373),
(374, 'Kabupaten Bone', 73, 73374),
(375, 'Kabupaten Bulukumba', 73, 73375),
(376, 'Kabupaten Enrekang', 73, 73376),
(377, 'Kabupaten Gowa', 73, 73377),
(378, 'Kabupaten Jeneponto', 73, 73378),
(379, 'Kabupaten Kepulauan Selayar', 73, 73379),
(380, 'Kabupaten Luwu', 73, 73380),
(381, 'Kabupaten Luwu Timur', 73, 73381),
(382, 'Kabupaten Luwu Utara', 73, 73382),
(383, 'Kabupaten Maros', 73, 73383),
(384, 'Kabupaten Pangkajene dan Kepulauan', 73, 73384),
(385, 'Kabupaten Pinrang', 73, 73385),
(386, 'Kabupaten Sidenreng Rappang', 73, 73386),
(387, 'Kabupaten Sinjai', 73, 73387),
(388, 'Kabupaten Soppeng', 73, 73388),
(389, 'Kabupaten Takalar', 73, 73389),
(390, 'Kabupaten Tana Toraja', 73, 73390),
(391, 'Kabupaten Toraja Utara', 73, 73391),
(392, 'Kabupaten Wajo', 73, 73392),
(393, 'Kota Makassar', 73, 73393),
(394, 'Kota Palopo', 73, 73394),
(395, 'Kota Parepare', 73, 73395),
(396, 'Kabupaten Bombana', 74, 74396),
(397, 'Kabupaten Buton', 74, 74397),
(398, 'Kabupaten Buton Utara', 74, 74398),
(399, 'Kabupaten Kolaka', 74, 74399),
(400, 'Kabupaten Kolaka Utara', 74, 74400),
(401, 'Kabupaten Konawe', 74, 74401),
(402, 'Kabupaten Konawe Selatan', 74, 74402),
(403, 'Kabupaten Konawe Utara', 74, 74403),
(404, 'Kabupaten Muna', 74, 74404),
(405, 'Kabupaten Wakatobi', 74, 74405),
(406, 'Kota Bau-Bau', 74, 74406),
(407, 'Kota Kendari', 74, 74407),
(408, 'Kabupaten Banggai', 72, 72408),
(409, 'Kabupaten Banggai Kepulauan', 72, 72409),
(410, 'Kabupaten Buol', 72, 72410),
(411, 'Kabupaten Donggala', 72, 72411),
(412, 'Kabupaten Morowali', 72, 72412),
(413, 'Kabupaten Parigi Moutong', 72, 72413),
(414, 'Kabupaten Poso', 72, 72414),
(415, 'Kabupaten Tojo Una-Una', 72, 72415),
(416, 'Kabupaten Toli-Toli', 72, 72416),
(417, 'Kabupaten Sigi', 72, 72417),
(418, 'Kota Palu', 72, 72418),
(419, 'Kabupaten Bolaang Mongondow', 71, 71419),
(420, 'Kabupaten Bolaang Mongondow Selatan', 71, 71420),
(421, 'Kabupaten Bolaang Mongondow Timur', 71, 71421),
(422, 'Kabupaten Bolaang Mongondow Utara', 71, 71422),
(423, 'Kabupaten Kepulauan Sangihe', 71, 71423),
(424, 'Kabupaten Kepulauan Siau Tagulandang Biaro', 71, 71424),
(425, 'Kabupaten Kepulauan Talaud', 71, 71425),
(426, 'Kabupaten Minahasa', 71, 71426),
(427, 'Kabupaten Minahasa Selatan', 71, 71427),
(428, 'Kabupaten Minahasa Tenggara', 71, 71428),
(429, 'Kabupaten Minahasa Utara', 71, 71429),
(430, 'Kota Bitung', 71, 71430),
(431, 'Kota Kotamobagu', 71, 71431),
(432, 'Kota Manado', 71, 71432),
(433, 'Kota Tomohon', 71, 71433),
(434, 'Kabupaten Majene', 76, 76434),
(435, 'Kabupaten Mamasa', 76, 76435),
(436, 'Kabupaten Mamuju', 76, 76436),
(437, 'Kabupaten Mamuju Utara', 76, 76437),
(438, 'Kabupaten Polewali Mandar', 76, 76438),
(439, 'Kabupaten Buru', 81, 81439),
(440, 'Kabupaten Buru Selatan', 81, 81440),
(441, 'Kabupaten Kepulauan Aru', 81, 81441),
(442, 'Kabupaten Maluku Barat Daya', 81, 81442),
(443, 'Kabupaten Maluku Tengah', 81, 81443),
(444, 'Kabupaten Maluku Tenggara', 81, 81444),
(445, 'Kabupaten Maluku Tenggara Barat', 81, 81445),
(446, 'Kabupaten Seram Bagian Barat', 81, 81446),
(447, 'Kabupaten Seram Bagian Timur', 81, 81447),
(448, 'Kota Ambon', 81, 81448),
(449, 'Kota Tual', 81, 81449),
(450, 'Kabupaten Halmahera Barat', 82, 82450),
(451, 'Kabupaten Halmahera Tengah', 82, 82451),
(452, 'Kabupaten Halmahera Utara', 82, 82452),
(453, 'Kabupaten Halmahera Selatan', 82, 82453),
(454, 'Kabupaten Kepulauan Sula', 82, 82454),
(455, 'Kabupaten Halmahera Timur', 82, 82455),
(456, 'Kabupaten Pulau Morotai', 82, 82456),
(457, 'Kota Ternate', 82, 82457),
(458, 'Kota Tidore Kepulauan', 82, 82458),
(459, 'Kabupaten Asmat', 94, 94459),
(460, 'Kabupaten Biak Numfor', 94, 94460),
(461, 'Kabupaten Boven Digoel', 94, 94461),
(462, 'Kabupaten Deiyai', 94, 94462),
(463, 'Kabupaten Dogiyai', 94, 94463),
(464, 'Kabupaten Intan Jaya', 94, 94464),
(465, 'Kabupaten Jayapura', 94, 94465),
(466, 'Kabupaten Jayawijaya', 94, 94466),
(467, 'Kabupaten Keerom', 94, 94467),
(468, 'Kabupaten Kepulauan Yapen', 94, 94468),
(469, 'Kabupaten Lanny Jaya', 94, 94469),
(470, 'Kabupaten Mamberamo Raya', 94, 94470),
(471, 'Kabupaten Mamberamo Tengah', 94, 94471),
(472, 'Kabupaten Mappi', 94, 94472),
(473, 'Kabupaten Merauke', 94, 94473),
(474, 'Kabupaten Mimika', 94, 94474),
(475, 'Kabupaten Nabire', 94, 94475),
(476, 'Kabupaten Nduga', 94, 94476),
(477, 'Kabupaten Paniai', 94, 94477),
(478, 'Kabupaten Pegunungan Bintang', 94, 94478),
(479, 'Kabupaten Puncak', 94, 94479),
(480, 'Kabupaten Puncak Jaya', 94, 94480),
(481, 'Kabupaten Sarmi', 94, 94481),
(482, 'Kabupaten Supiori', 94, 94482),
(483, 'Kabupaten Tolikara', 94, 94483),
(484, 'Kabupaten Waropen', 94, 94484),
(485, 'Kabupaten Yahukimo', 94, 94485),
(486, 'Kabupaten Yalimo', 94, 94486),
(487, 'Kota Jayapura', 94, 94487),
(488, 'Kabupaten Fakfak', 91, 91488),
(489, 'Kabupaten Kaimana', 91, 91489),
(490, 'Kabupaten Manokwari', 91, 91490),
(491, 'Kabupaten Maybrat', 91, 91491),
(492, 'Kabupaten Raja Ampat', 91, 91492),
(493, 'Kabupaten Sorong', 91, 91493),
(494, 'Kabupaten Sorong Selatan', 91, 91494),
(495, 'Kabupaten Tambrauw', 91, 91495),
(496, 'Kabupaten Teluk Bintuni', 91, 91496),
(497, 'Kabupaten Teluk Wondama', 91, 91497),
(498, 'Kota Sorong', 91, 91498);

-- --------------------------------------------------------

--
-- Table structure for table `master_kecamatan`
--

CREATE TABLE `master_kecamatan` (
  `kdkec` varchar(7) NOT NULL,
  `nmkec` varchar(30) NOT NULL,
  `jdesa` int(5) NOT NULL,
  `jpend` double NOT NULL,
  `kdkab` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_kecamatan`
--

INSERT INTO `master_kecamatan` (`kdkec`, `nmkec`, `jdesa`, `jpend`, `kdkab`) VALUES
('1701040', 'Manna', 18, 13417, '1701'),
('1701041', 'Kota Manna', 11, 25528, '1701'),
('1701042', 'Kedurang', 19, 13031, '1701'),
('1701050', 'Seginim', 22, 17778, '1701'),
('1701060', 'Pino', 16, 13410, '1701'),
('1701061', 'Pinoraya', 22, 20271, '1701'),
('1705010', 'Semidang Alas Maras', 20, 22342, '1705'),
('1705020', 'Semidang Alas', 20, 15566, '1705'),
('1705030', 'Talo', 14, 11669, '1705'),
('1705041', 'Seluma Selatan', 11, 10655, '1705'),
('1705042', 'Seluma Barat', 8, 8688, '1705'),
('1705043', 'Seluma Timur', 8, 9682, '1705'),
('1705044', 'Seluma Utara', 8, 9141, '1705'),
('1705050', 'Sukaraja', 18, 31010, '1705'),
('1708010', 'Kepahiang', 10, 21249, '1708'),
('1708020', 'Bermani Ilir', 17, 16137, '1708'),
('1708040', 'Tebat Karai', 14, 14242, '1708'),
('1708070', 'Ujan Mas', 17, 22328, '1708'),
('1804010', 'Metro Kibang', 7, 19108, '1804'),
('1804061', 'Pasir Sakti', 8, 35084, '1804'),
('1804062', 'Waway Karya', 11, 36729, '1804'),
('1804071', 'Mataram Baru', 7, 26621, '1804'),
('1804073', 'Melinting', 6, 26665, '1804'),
('1804081', 'Braja Selebah', 7, 22582, '1804'),
('1804110', 'Raman Utara', 11, 34750, '1804'),
('1806041', 'Kotabumi Utara', 8, 27972, '1806'),
('1806042', 'Kotabumi Selatan', 14, 59226, '1806'),
('1806050', 'Abung Selatan', 16, 45916, '1806'),
('1806051', 'Abung Semuli', 7, 23093, '1806'),
('1807021', 'Gunung Labuhan', 19, 28987, '1807'),
('1807041', 'Way Tuba', 12, 21363, '1807'),
('1807042', 'Negeri Agung', 18, 34155, '1807'),
('1807050', 'Bahuga', 8, 9502, '1807'),
('1807061', 'Negara Batin', 14, 29444, '1807'),
('1807062', 'Negeri Besar', 10, 21343, '1807'),
('5301030', 'Wewewa Barat', 14, 42405, '5301'),
('5301040', 'Wewewa Selatan', 8, 22748, '5301'),
('5301070', 'Wewewa Timur', 20, 52552, '5301'),
('5301080', 'Wewewa Utara/Palla', 6, 12141, '5301'),
('5301090', 'Loura', 12, 29518, '5301'),
('5301120', 'Loli', 8, 25262, '5301'),
('5304011', 'Fatumnasi', 4, 8695, '5304'),
('5304021', 'Polen', 10, 14627, '5304'),
('5304071', 'Kolbano', 11, 18582, '5304'),
('5304072', 'Oenino', 7, 10849, '5304'),
('5304091', 'Kot Olin', 8, 11008, '5304'),
('5304101', 'Boking', 6, 9992, '5304'),
('5304102', 'Nunkolo', 9, 14578, '5304'),
('5304111', 'Toianas', 7, 13245, '5304'),
('5306012', 'Wewiku', 12, 19725, '5306'),
('5306013', 'Weliman', 14, 19710, '5306'),
('5306021', 'Sasita Mean', 9, 10158, '5306'),
('5306031', 'Laen Manen', 9, 11596, '5306'),
('5306032', 'Rai Manuk', 9, 13516, '5306'),
('5306072', 'Lasiolat', 7, 6668, '5306'),
('5308011', 'Wulandoni', 12, 8132, '5308'),
('5309011', 'Titehena', 12, 12598, '5309'),
('5309020', 'Tanjung Bunga', 14, 11729, '5309'),
('5309031', 'Ile Mandiri', 8, 8996, '5309'),
('5309060', 'Adonara Barat', 16, 11254, '5309'),
('5309061', 'Wotan Ulu Mado', 12, 7916, '5309'),
('5309071', 'Ile Boleng', 20, 13622, '5309'),
('5309072', 'Witihama', 13, 14594, '5309'),
('5309073', 'Kelubagolit', 12, 10251, '5309'),
('6101030', 'Tebas', 23, 69645, '6101'),
('6101031', 'Tekarang', 7, 14749, '6101'),
('6101041', 'Subah', 11, 19199, '6101'),
('6101042', 'Sebawi', 7, 16291, '6101'),
('6101043', 'Sajad', 4, 9786, '6101'),
('6101050', 'Jawai', 11, 38792, '6101'),
('6101051', 'Jawai Selatan', 9, 20499, '6101'),
('6101060', 'Teluk Keramat', 24, 64488, '6101'),
('6101061', 'Galing', 10, 19850, '6101'),
('6102010', 'Sungai Raya', 5, 24352, '6102'),
('6102030', 'Samalantan', 7, 18321, '6102'),
('6102031', 'Monterado', 11, 23993, '6102'),
('6102040', 'Bengkayang', 6, 22944, '6102'),
('6102041', 'Teliak', 18, 13491, '6102'),
('6102050', 'Ledo', 12, 11436, '6102'),
('6102051', 'Suti Semarang', 8, 4536, '6102'),
('6102060', 'Sanggau Ledo', 5, 11392, '6102'),
('6102070', 'Seluas', 6, 13825, '6102'),
('6102080', 'Jagoi Babang', 6, 6129, '6102'),
('6105010', 'Toba', 7, 12056, '6105'),
('6105020', 'Meliau', 18, 42475, '6105'),
('6105060', 'Sanggau Kapuas', 25, 69692, '6105'),
('6105070', 'Mukok', 8, 16177, '6105'),
('6105120', 'Jangkang', 11, 26360, '6105'),
('6105140', 'Parindu', 14, 29586, '6105'),
('6105160', 'Balai', 12, 23272, '6105'),
('6105180', 'Kembayan', 11, 25531, '6105'),
('6105210', 'Sekayan', 10, 27588, '6105'),
('6202021', 'Teluk Sampit', 4, 8421, '6202'),
('6202070', 'Mentaya Hilir Utara', 7, 11808, '6202'),
('6202121', 'Seranau', 5, 10748, '6202'),
('6202191', 'Cempaga Hulu', 9, 15772, '6202'),
('6202230', 'Antang Kalang', 30, 27793, '6202'),
('6208020', 'Danau Sembuluh', 13, 15399, '6208'),
('6208040', 'Seruyan Tengah', 29, 29954, '6208'),
('6208050', 'Seruyan Hulu', 29, 15207, '6208'),
('6209020', 'Mendawai', 7, 6578, '6209'),
('6209030', 'Kamipang', 9, 8397, '6209'),
('6209040', 'Tasik Payawan', 8, 6743, '6209'),
('6209060', 'Tewang Sangalang Garing', 10, 11851, '6209'),
('6209070', 'Pulau Malan', 14, 7672, '6209'),
('6209080', 'Katingan Tengah', 16, 22324, '6209'),
('6209090', 'Sanaman Mantikei', 14, 9216, '6209'),
('6209100', 'Marikit', 18, 6755, '6209'),
('6209110', 'Katingan Hulu', 23, 7704, '6209'),
('7202010', 'Toili', 26, 47422, '7202'),
('7202011', 'Toili Barat', 16, 20287, '7202'),
('7202050', 'Luwuk', 21, 63546, '7202'),
('7202051', 'Luwuk Timur', 9, 12313, '7202'),
('7202061', 'Boalemo', 16, 16196, '7202'),
('7202071', 'Masama', 11, 11063, '7202'),
('7203010', 'Menui Kepulauan', 19, 13259, '7203'),
('7203021', 'Bahodopi', 12, 6463, '7203'),
('7203030', 'Bungku Tengah', 29, 23206, '7203'),
('7203040', 'Bungku Barat', 10, 8816, '7203'),
('7203050', 'Lembo', 24, 18897, '7203'),
('7203071', 'Soyo Jaya', 9, 7664, '7203'),
('7203080', 'Bungku Utara', 20, 14012, '7203'),
('7203081', 'Mamosalato', 14, 9033, '7203'),
('7204011', 'Pamona Barat', 5, 8533, '7204'),
('7204020', 'Lore Selatan', 8, 6056, '7204'),
('7204030', 'Pamona Utara', 20, 30179, '7204'),
('7204031', 'Pamona Timur', 12, 9657, '7204'),
('7204041', 'Lore Tengah', 8, 4235, '7204'),
('7204051', 'Poso Pesisir Selatan', 8, 8432, '7204'),
('7204052', 'Poso Pesisir Utara', 9, 14023, '7204'),
('7204060', 'Lage', 14, 15849, '7204'),
('7204070', 'Poso Kota', 4, 17442, '7204'),
('7209050', 'Ampana Kota', 11, 35134, '7209'),
('7209070', 'Togean', 14, 9839, '7209'),
('8101011', 'PP Wetar', 23, 7691, '8101'),
('8101030', 'Babar Barat', 17, 8255, '8101'),
('8101031', 'Babar Timur', 28, 9045, '8101'),
('8101041', 'Wertamrian', 8, 11042, '8101'),
('8101042', 'Wermaktian', 8, 10929, '8101'),
('8101043', 'Selaru', 6, 11549, '8101'),
('8101051', 'Yaru', 6, 5231, '8101'),
('8101052', 'Wuarlabobar', 12, 9424, '8101'),
('8101053', 'Nirunmas', 5, 6851, '8101'),
('8101054', 'Kormolin', 9, 6612, '8101'),
('8102012', 'Kei Kecil Barat', 8, 6288, '8102'),
('8102013', 'Kei Kecil Timur', 13, 12289, '8102'),
('8102021', 'Kei Besar Utara Timur', 9, 11436, '8102'),
('8102022', 'Kei Besar Selatan', 14, 9247, '8102'),
('8103040', 'Tehoru', 20, 36640, '8103'),
('8103050', 'Amahai', 11, 36805, '8103'),
('8103051', 'Kota Masohi', 5, 36069, '8103'),
('8103060', 'Teon Nila Serua', 17, 14000, '8103'),
('8103081', 'Nusa Laut', 7, 5562, '8103'),
('8103140', 'Seram Utara', 32, 39920, '8103'),
('8104020', 'Namlea', 11, 32221, '8104'),
('8104021', 'Waepo', 21, 33561, '8104'),
('8104022', 'Waplau', 9, 10514, '8104'),
('8104023', 'Bata bual', 5, 9847, '8104'),
('8104030', 'Air Buaya', 8, 19395, '8104'),
('8107010', 'Pulau Gorom', 20, 37518, '8107'),
('8107030', 'Werinama', 10, 11284, '8107'),
('8107040', 'Bula', 15, 18375, '8107'),
('8172010', 'Pp. Kur Mangur', 11, 5563, '8172'),
('8172020', 'Tayando Tam', 5, 6013, '8172'),
('8172030', 'Dullah Utara', 8, 14371, '8172'),
('8172040', 'Dulla Selatan', 5, 30986, '8172'),
('8201090', 'Jailolo', 29, 26611, '8201'),
('8201091', 'Jailolo Selatan', 18, 16491, '8201'),
('8201100', 'Sahu', 16, 9796, '8201'),
('8202031', 'Weda Selatan', 5, 4560, '8202'),
('8202032', 'Weda Utara', 7, 5310, '8202'),
('8202041', 'Pulau Gebe', 5, 3706, '8202'),
('8202043', 'Patani Utara', 5, 8919, '8202'),
('8203010', 'Sula Besi Barat', 6, 5447, '8203'),
('8203030', 'Mangoli Timur', 5, 5810, '8203'),
('8203040', 'Mangoli Barat', 7, 7516, '8203'),
('8204050', 'Bacan Barat', 7, 4630, '8204'),
('8204060', 'Kayoa', 14, 8637, '8204'),
('8204070', 'Pulau Makian', 15, 10513, '8204'),
('8205010', 'Maliput', 22, 10130, '8205'),
('8205020', 'Kao 2', 14, 7544, '8205'),
('8205030', 'Tobelo Selatan', 13, 12714, '8205'),
('8205040', 'Tobelo', 10, 24769, '8205'),
('8205050', 'Galela', 7, 7557, '8205'),
('8205060', 'Loloda Utara', 18, 9278, '8205'),
('8205070', 'Morotai Selatan Barat', 17, 12238, '8205');

-- --------------------------------------------------------

--
-- Table structure for table `master_propinsi`
--

CREATE TABLE `master_propinsi` (
  `id_propinsi` int(2) NOT NULL,
  `nama_propinsi` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `master_propinsi`
--

INSERT INTO `master_propinsi` (`id_propinsi`, `nama_propinsi`) VALUES
(11, 'Aceh'),
(12, 'Sumatera Utara'),
(17, 'Bengkulu'),
(15, 'Jambi'),
(14, 'Riau'),
(13, 'Sumatera Barat'),
(16, 'Sumatera Selatan'),
(18, 'Lampung'),
(19, 'Kepulauan Bangka Belitung'),
(21, 'Kepulauan Riau'),
(36, 'Banten'),
(32, 'Jawa Barat'),
(31, 'DKI Jakarta'),
(33, 'Jawa Tengah'),
(35, 'Jawa Timur'),
(34, 'Daerah Istimewa Yogyakarta'),
(51, 'Bali'),
(52, 'Nusa Tenggara Barat'),
(53, 'Nusa Tenggara Timur'),
(61, 'Kalimantan Barat'),
(63, 'Kalimantan Selatan'),
(62, 'Kalimantan Tengah'),
(64, 'Kalimantan Timur'),
(75, 'Gorontalo'),
(73, 'Sulawesi Selatan'),
(74, 'Sulawesi Tenggara'),
(72, 'Sulawesi Tengah'),
(71, 'Sulawesi Utara'),
(76, 'Sulawesi Barat'),
(81, 'Maluku'),
(82, 'Maluku Utara'),
(94, 'Papua'),
(91, 'Papua Barat'),
(65, 'Kalimantan Utara');

-- --------------------------------------------------------

--
-- Table structure for table `org_structure`
--

CREATE TABLE `org_structure` (
  `node_id` varchar(10) NOT NULL,
  `node_title` varchar(254) NOT NULL,
  `node_parent` varchar(10) NOT NULL,
  `node_desc` text NOT NULL,
  `image_url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `org_structure`
--

INSERT INTO `org_structure` (`node_id`, `node_title`, `node_parent`, `node_desc`, `image_url`) VALUES
('DJBM', 'SEKRETARIAT DIREKTORAT JENDERAL BINA MARGA', '', 'Direktorat Jenderal Bina Marga mempunyai tupoksi yaitu pertama adalah 1. kedua adalah ketiga adalah keempat adalah elima adalah', ''),
('PJ', 'Bagian Keuangan dan Umum', 'DJBM', '<p>irektorat Pengembangan Jaringan Jalan mempunyai</p>\r\n', ''),
('PJJ', 'BAGIAN KEPEGAWAIAN, ORGANISASI DAN TATA LAKSANA', 'DJBM', 'Direktorat Pengembangan Jaringan Jalan mempunyai tupoksi yaitu pertama adalah 1. kedua adalah ketiga adalah keempat adalah elima adalah', ''),
('PJJ_01', 'Subbagian Pengembangan Pegawai', 'PJJ_TU', 'Sekretariat Direktorat Jenderal Bina Marga mempunyai tupoksi yaitu pertama adalah 1. kedua adalah ketiga adalah keempat adalah elima adalah', ''),
('PJJ_02', 'Subbagian Organisasi dan Tata Laksana', 'PJJ_01', 'test', ''),
('PJJ_TU', 'Subbagian Tata Usaha Kepegawaian', 'PJJ', 'Sekretariat Direktorat Jenderal Bina Marga mempunyai tupoksi yaitu pertama adalah 1. kedua adalah ketiga adalah keempat adalah elima adalah', '');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sex` int(11) NOT NULL,
  `birthyear` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`id`, `name`, `sex`, `birthyear`) VALUES
(1, 'Safaat H', 1, 1970),
(2, 'Santoso', 2, 2010),
(3, 'Nazruddin Safaat H', 1, 1996),
(4, 'Budi Santoso', 2, 1982),
(0, 'meizano', 1, 1980);

-- --------------------------------------------------------

--
-- Table structure for table `pic`
--

CREATE TABLE `pic` (
  `idpic` int(11) NOT NULL,
  `nama` varchar(45) CHARACTER SET latin1 NOT NULL,
  `group` int(11) DEFAULT NULL,
  `password` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `hp` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pic`
--

INSERT INTO `pic` (`idpic`, `nama`, `group`, `password`, `email`, `phone`, `hp`, `fax`) VALUES
(2, 'admin', 2, 'bnpb@14', 'admin@example.com', NULL, NULL, NULL),
(4, '64', 2, 'bnpb2014', NULL, NULL, NULL, NULL),
(5, '11', 2, 'bnpb2014', 'jakasumanta@yahoo.com', NULL, NULL, NULL),
(6, '21', 2, 'bnpb2014', 'louis.braam@rebelgroup.com', NULL, NULL, NULL),
(8, '31', 2, 'bnpb2014', 'dodi.miharjana@gmail.com', NULL, NULL, NULL),
(9, '51', 2, 'bnpb2014', 'mis.irsdp@gmail.com', NULL, NULL, NULL),
(13, '61', 2, 'bnpb2014', 'firdaus88@gmail.com', NULL, NULL, NULL),
(15, '71', 2, 'bnpb2014', 'mitra_ratih@yahoo.com', NULL, NULL, NULL),
(16, '94', 2, 'bnpb2014', 'lucasoc@yahoo.com', NULL, NULL, NULL),
(17, '91', 2, 'bnpb2014', 'anthodwi@yahoo.com', NULL, NULL, NULL),
(19, '12', 2, 'bnpb2014', 'nda_1309@yahoo.com', NULL, NULL, NULL),
(20, '13', 2, 'bnpb2014', 'nsarwani@gmail.com', NULL, NULL, NULL),
(21, '14', 2, 'bnpb2014', 'doni_puri@yahoo.com', NULL, NULL, NULL),
(25, '15', 2, 'bnpb2014', 'paulreddel@gmail.com', '', '081281855924', ''),
(26, '16', 2, 'bnpb2014', 'pandiagamel@gmail.com', '', '081241356619', ''),
(27, '18', 2, 'bnpb2014', 'jubardiono@gmail.com', '', '', ''),
(28, '35', 2, 'bnpb2014', 'afirmandi@gmail.com', '', '081519003434', ''),
(29, '32', 2, 'bnpb2014', 'totowidy@gmail.com', '', '0811179443', ''),
(30, '33', 2, 'bnpb2014', 'bembenx74@yahoo.com', '', '0817149674', ''),
(31, '19', 2, 'bnpb2014', 'moh.zulfikar@gmail.com', '', '0816931872', ''),
(32, '34', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(33, '53', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(34, '82', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(35, '74', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(36, '17', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(37, '63', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(38, '76', 2, 'bnpb2014', 's_haryanta@yahoo.com', '', '081315991450', ''),
(39, '81', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(40, '36', 2, 'bnpb2014', 'andik_y@yahoo.com', '', '', ''),
(41, '65', 2, 'bnpb2014', 'laila.horton@gmail.com', '', '081319404182', ''),
(44, '52', 2, 'bnpb2014', 'antonius.pujianto@yahoo.co.id', '02191913125', '', ''),
(45, '72', 2, 'bnpb2014', 'kapalbeton@yahoo.co.id', '', '08569717776', ''),
(47, '75', 2, 'bnpb2014', 'ria_htb@hotmail.com', '', '081329385360', ''),
(48, '73', 2, 'bnpb2014', 'novalusi24@gmail.com', '', '081315365267', ''),
(49, '62', 2, 'bnpb2014', 'user@example.com', '', '', ''),
(50, 'ukke', 3, 'bnpb2014', 'user@example.com', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `pos_master_menu`
--

CREATE TABLE `pos_master_menu` (
  `id` int(11) NOT NULL,
  `menu_code` varchar(10) NOT NULL,
  `menu_cat` varchar(20) NOT NULL,
  `menu_desc` varchar(100) NOT NULL,
  `menu_unit_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_master_menu`
--

INSERT INTO `pos_master_menu` (`id`, `menu_code`, `menu_cat`, `menu_desc`, `menu_unit_price`) VALUES
(49, 'D-3', 'D', 'Ikat Pinggang Wanita', 20000),
(48, 'D-2', 'D', 'Sepatu Wanita', 16000),
(47, 'D-1', 'D', 'Atasan Wanita', 17000),
(46, 'D-0', 'D', 'Atasan Pria', 19000),
(45, 'B-8', 'B', 'Uquil', 24000),
(44, 'B-7', 'B', 'Le Mineral', 22000),
(43, 'B-6', 'B', 'Cleo', 18000),
(42, 'B-5', 'B', 'Super O2', 17000),
(41, 'B-4', 'B', 'Air Mineral Hijau', 12000),
(40, 'B-3', 'B', 'Teh Botol', 15000),
(39, 'B-2', 'B', 'Energy Drink', 26000),
(38, 'B-1', 'B', 'Fresh Soda', 27000),
(37, 'B-0', 'B', 'Good Day', 25000),
(36, 'F-8', 'F', 'Brokoli', 54000),
(35, 'F-7', 'F', 'Terong Ungu', 22000),
(34, 'F-6', 'F', 'Kol', 18000),
(33, 'F-5', 'F', 'Singkong', 15000),
(32, 'F-4', 'F', 'Pisang', 26000),
(31, 'F-3', 'F', 'Kentang', 15000),
(30, 'F-2', 'F', 'Gandum', 25000),
(29, 'F-1', 'F', 'Jagung', 36000),
(28, 'F-0', 'F', 'Roti Tawar', 45000),
(50, 'D-4', 'D', 'Tas Wanita', 12000),
(51, 'D-5', 'D', 'Jilbab', 27000),
(52, 'D-6', 'D', 'Perhiasan', 28000),
(53, 'D-7', 'D', 'Kacamata', 22000),
(54, 'D-8', 'D', 'Sepatu Pria', 24000);

-- --------------------------------------------------------

--
-- Table structure for table `pos_order_detail`
--

CREATE TABLE `pos_order_detail` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `menu_code` varchar(10) NOT NULL,
  `menu_qty` int(11) NOT NULL,
  `menu_amount` double NOT NULL,
  `discount_code` varchar(10) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `service_charge` int(11) NOT NULL,
  `update_status` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_order_payment`
--

CREATE TABLE `pos_order_payment` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `cash_payment` double NOT NULL,
  `card_payment` double NOT NULL,
  `card_number` varchar(50) NOT NULL,
  `payment_dtcompleted` varchar(50) NOT NULL,
  `update_status` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_order_trans0`
--

CREATE TABLE `pos_order_trans0` (
  `id` varchar(50) NOT NULL,
  `order_datetime` varchar(50) DEFAULT NULL,
  `dine_in` varchar(1) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_telephone` varchar(50) DEFAULT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `goes_to_table` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `order_status` varchar(1) DEFAULT NULL,
  `kitchen_status` varchar(1) NOT NULL,
  `order_dtcompleted` varchar(50) DEFAULT NULL,
  `update_status` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pos_table_status`
--

CREATE TABLE `pos_table_status` (
  `table_no` varchar(50) NOT NULL,
  `position` int(11) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_table_status`
--

INSERT INTO `pos_table_status` (`table_no`, `position`, `status`) VALUES
('1-1', 1, 1),
('1-2', 1, 1),
('1-3', 1, 1),
('1-4', 1, 1),
('1-5', 1, 1),
('1-6', 1, 0),
('1-7', 1, 0),
('1-8', 1, 1),
('1-9', 1, 0),
('1-10', 1, 0),
('1-11', 1, 0),
('1-12', 1, 0),
('1-13', 1, 0),
('1-14', 1, 0),
('1-15', 1, 0),
('1-16', 1, 0),
('1-17', 1, 0),
('1-18', 1, 0),
('1-19', 1, 0),
('1-20', 1, 0),
('2-11', 2, 0),
('2-12', 2, 0),
('2-13', 2, 0),
('2-14', 2, 0),
('2-15', 2, 0),
('2-16', 2, 0),
('2-17', 2, 1),
('2-18', 2, 0),
('2-19', 2, 0),
('2-20', 2, 0),
('2-1', 2, 0),
('2-2', 2, 1),
('2-3', 2, 0),
('2-4', 2, 0),
('2-5', 2, 0),
('2-6', 2, 0),
('2-7', 2, 0),
('2-8', 2, 0),
('2-9', 2, 0),
('2-10', 2, 0),
('2-21', 2, 0),
('2-22', 2, 0),
('2-23', 2, 0),
('2-24', 2, 0),
('2-25', 2, 0),
('2-26', 2, 0),
('2-27', 2, 0),
('2-28', 2, 0),
('2-29', 2, 0),
('2-30', 2, 0),
('1-21', 1, 0),
('1-22', 1, 0),
('1-23', 1, 0),
('1-24', 1, 0),
('1-25', 1, 0),
('1-26', 1, 0),
('1-27', 1, 0),
('1-28', 1, 0),
('1-29', 1, 0),
('1-30', 1, 0),
('3-1', 3, 0),
('3-2', 3, 1),
('3-3', 3, 0),
('3-4', 3, 1),
('3-5', 3, 0),
('3-6', 3, 0),
('3-7', 3, 0),
('3-8', 3, 0),
('3-9', 3, 0),
('3-10', 3, 0),
('3-11', 3, 0),
('3-12', 3, 0),
('3-13', 3, 0),
('3-14', 3, 0),
('3-15', 3, 0),
('3-16', 3, 0),
('3-17', 3, 0),
('3-18', 3, 0),
('3-19', 3, 0),
('3-20', 3, 0),
('3-21', 3, 0),
('3-22', 3, 0),
('3-23', 3, 0),
('3-24', 3, 0),
('3-25', 3, 0),
('3-26', 3, 0),
('3-27', 3, 0),
('3-28', 3, 0),
('3-29', 3, 0),
('3-30', 3, 0),
('1-0', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pos_users`
--

CREATE TABLE `pos_users` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pos_users`
--

INSERT INTO `pos_users` (`Id`, `Name`) VALUES
(1, 'budi'),
(2, 'budiyanto'),
(3, 'kartinah'),
(4, 'hasnan'),
(5, 'anis');

-- --------------------------------------------------------

--
-- Table structure for table `profil_kabupaten`
--

CREATE TABLE `profil_kabupaten` (
  `id_profil` varchar(50) DEFAULT NULL,
  `id_kabupaten` int(5) NOT NULL,
  `nomor_perda` varchar(100) DEFAULT NULL,
  `tanggal_perda` date DEFAULT NULL,
  `catatan` text,
  `file_perda` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profil_kabupaten`
--

INSERT INTO `profil_kabupaten` (`id_profil`, `id_kabupaten`, `nomor_perda`, `tanggal_perda`, `catatan`, `file_perda`) VALUES
('11007_01', 11007, '02/PERDA/2012', '0000-00-00', 'Perda ini dibuat antara DPRD dan Pemerintah daerah Tingkat II.', 'perda6_2011_kotaserang.pdf'),
('21146_01', 21146, 'NOMOR : 2 TAHUN 2012', '2012-12-15', 'perlu diperjelas apa maksud dari ada nya perda ini', '0'),
('21147_01', 21147, 'NOMOR : 5 TAHUN 2012', '2012-12-05', 'masih perlu didiskusikan dengan Dinas Kehutanan dan Perkebunan.', 'perda_21147.pdf'),
('21148_01', 21148, 'NOMOR : 15 TAHUN 2012', '2012-12-04', 'tidak adanya bahan pendamping untuk mengevaluasi perda ini.', 'perda_21148.pdf'),
('21149_01', 21149, 'NOMOR : 315 TAHUN 2012', '2013-01-03', 'Perlu ditingkatkan koordinasi antar instansi dalam menysukseskan Penyusunan Perda Tata Ruang Kabupaten Lingga', '0');

-- --------------------------------------------------------

--
-- Table structure for table `profil_propinsi`
--

CREATE TABLE `profil_propinsi` (
  `id_profil` varchar(50) DEFAULT NULL,
  `id_propinsi` int(2) NOT NULL,
  `nomor_perda` varchar(100) DEFAULT NULL,
  `tentang` text,
  `ktr_ksap` varchar(100) DEFAULT NULL,
  `tanggal_perda` date DEFAULT NULL,
  `catatan` text,
  `file_perda` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regulasi`
--

CREATE TABLE `regulasi` (
  `info_id` smallint(6) NOT NULL,
  `year` int(4) NOT NULL,
  `display_id` smallint(6) DEFAULT NULL,
  `catinfo_id` smallint(6) DEFAULT NULL,
  `title` text,
  `about` text NOT NULL,
  `dateposting` datetime DEFAULT NULL,
  `files` varchar(100) DEFAULT NULL,
  `law_cat` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regulasi`
--

INSERT INTO `regulasi` (`info_id`, `year`, `display_id`, `catinfo_id`, `title`, `about`, `dateposting`, `files`, `law_cat`) VALUES
(398, 2004, 2, 1, 'UNDANG-UNDANG No. 33 Tahun  2004', 'PERIMBANGAN KEUANGAN ANTARA PEMERINTAH PUSAT DAN PEMERINTAHAN DAERAH ', NULL, 'uu/Otonomi Daerah/UU No 33 2004_Perimbangan Keuangan.pdf', 'Otonomi Daerah'),
(399, 2005, 0, 2, 'Perpress No. 36 / 2005', 'PENGADAAN TANAH BAGI PELAKSANAAN PEMBANGUNAN  UNTUK KEPENTINGAN UMUM  ', NULL, 'uu/Pengadaan Tanah/6. Perpres 36 tahun 2005.pdf', 'Pengadaan Tanah'),
(400, 2006, 0, 2, 'PerPres No. 65 Tahun 2006', 'PERUBAHAN ATAS PERATURAN PRESIDEN NOMOR 36 TAHUN 2005 TENTANG PENGADAAN TANAH BAGI PELAKSANAAN PEMBANGUNAN UNTUK KEPENTINGAN UMUM ', NULL, 'uu/Pengadaan Tanah/7. perpres 65 tahun 2006.pdf', 'Pengadaan Tanah'),
(401, 2006, 0, 1, 'PP  No.6   Tahun  2006', 'PENGELOLAAN BARANG MILIK NEGARA/DAERAH ', NULL, 'uu/Otonomi Daerah/PP No  6 Thn 2006 Tentang Pengelolaan Barang Milik Negara Daerah.pdf', 'Otonomi Daerah'),
(402, 2007, 0, 1, 'PP 38 2007', 'PP 38 2007 Lampiran ', NULL, 'uu/Otonomi Daerah/12. PP 38 2007 Lampiran.pdf', 'Otonomi Daerah'),
(403, 2007, 0, 1, 'UNDANG-UNDANG No. 26  Tahun 2007', 'PENATAAN RUANG ', NULL, 'uu/Otonomi Daerah/UU No_26_th_2007 tentang PENATAAN RUANG.pdf', 'Otonomi Daerah'),
(404, 2007, 0, 1, 'PP No. 38  Tahun  2007', 'PEMBAGIAN URUSAN PEMERINTAHAN ANTARA PEMERINTAH, PEMERINTAHAN DAERAH PROVINSI, DAN PEMERINTAHAN DAERAH KABUPATEN/KOTA ', NULL, 'uu/Otonomi Daerah/pp38-2008.pdf', 'Otonomi Daerah'),
(405, 2007, 0, 1, 'PP No. 50  Tahun  2007', 'TATA CARA PELAKSANAAN KERJA SAMA DAERAH ', NULL, 'uu/Otonomi Daerah/11.pp no 50 2007.pdf', 'Otonomi Daerah'),
(406, 2009, 2, 1, 'UNDANG-UNDANG No. 32  Tahun  2009', 'PERLINDUNGAN DAN PENGELOLAAN LINGKUNGAN HIDUP', NULL, 'uu/Otonomi Daerah/UU 32 Tahun 2009 PERLINDUNGAN DAN PENGELOLAAN LINGKUNGAN HIDUP.pdf', 'Otonomi Daerah'),
(407, 2009, 0, 1, 'PP No.  34 Tahun  2009', 'PEDOMAN PENGELOLAAN KAWASAN PERKOTAAN ', NULL, 'uu/Otonomi Daerah/PP 34 Tahun 2009 PEDOMAN PENGELOLAAN KAWASAN PERKOTAAN.pdf', 'Otonomi Daerah'),
(459, 2010, 0, 4, 'PERATURAN PRESIDEN REPUBLIK INDONESIA NOMOR 13 TAHUN 2010', 'TATA CARA PENGADAAN BADAN USAHA DALAM RANGKA PERJANJIAN KERJASAMA PEMERINTAH DENGAN BADAN \nUSAHA DALAM PENYEDIAAN INFRASTRUKTUR', NULL, 'uu/Proses Kerjasama Pemerintah dan Swasta/Perpres_13-2010.pdf', 'Proses KPS');

-- --------------------------------------------------------

--
-- Table structure for table `regulasi_categories`
--

CREATE TABLE `regulasi_categories` (
  `catinfo_id` smallint(6) NOT NULL,
  `secid` varchar(5) NOT NULL,
  `catinfo_name` varchar(100) DEFAULT NULL,
  `catinfo_name_en` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regulasi_categories`
--

INSERT INTO `regulasi_categories` (`catinfo_id`, `secid`, `catinfo_name`, `catinfo_name_en`) VALUES
(1, 'A', 'Undang-Undang (UU)', ''),
(2, 'B', 'Peraturan Pemerintah Pengganti UU', 'Perpu'),
(3, 'C', 'Peraturan Pemerintah', 'PP'),
(6, 'F', 'Peraturan Presiden', 'Perpres'),
(7, 'G', 'Instruksi Presiden ', 'Inpres'),
(8, 'H', 'Keputusan Presiden', 'Kepres'),
(9, 'I', 'Peraturan Menteri', 'PM'),
(10, 'J', 'Instruksi Menteri', 'Instruksi Menteri'),
(11, 'K', 'Keputusan Menteri', 'Keputusan Menteri');

-- --------------------------------------------------------

--
-- Table structure for table `survey01_imgbatas`
--

CREATE TABLE `survey01_imgbatas` (
  `id` int(11) NOT NULL,
  `id_data` varchar(50) NOT NULL,
  `image` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `survey01_lokasi`
--

CREATE TABLE `survey01_lokasi` (
  `id_data` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `kode_tapak` varchar(200) NOT NULL,
  `longitude` varchar(200) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `tgl_survey` varchar(50) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `nama_bumn` varchar(200) NOT NULL,
  `no_tgl_penetapan` varchar(250) NOT NULL,
  `nama_asset` varchar(200) NOT NULL,
  `nomor_asset` varchar(50) NOT NULL,
  `banjir` int(1) NOT NULL,
  `jarak_tapak_1` varchar(50) NOT NULL,
  `jarak_tapak_2` varchar(50) NOT NULL,
  `kemudahan` int(1) NOT NULL,
  `transportasi_umum` varchar(100) NOT NULL,
  `jarak_ke_terminal` varchar(50) DEFAULT NULL,
  `nama_terminal` varchar(100) DEFAULT NULL,
  `transport_01` varchar(100) NOT NULL,
  `transport_02` varchar(50) NOT NULL,
  `alternatif1` float NOT NULL COMMENT 'Berat badan',
  `alternatif2` float NOT NULL COMMENT 'Tinggi badan',
  `alternatif3` float NOT NULL COMMENT 'Indeks massa tubuh',
  `sketsa_lokasi` float DEFAULT NULL COMMENT 'Suhu badan',
  `approval` float NOT NULL COMMENT 'Tekanan Darah',
  `respond` varchar(100) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey01_lokasi`
--

INSERT INTO `survey01_lokasi` (`id_data`, `group_id`, `kode_tapak`, `longitude`, `latitude`, `alamat`, `tgl_survey`, `pic`, `nama_bumn`, `no_tgl_penetapan`, `nama_asset`, `nomor_asset`, `banjir`, `jarak_tapak_1`, `jarak_tapak_2`, `kemudahan`, `transportasi_umum`, `jarak_ke_terminal`, `nama_terminal`, `transport_01`, `transport_02`, `alternatif1`, `alternatif2`, `alternatif3`, `sketsa_lokasi`, `approval`, `respond`, `status`) VALUES
('180105101335_0700', '3', 'Jalan Tidar No 157', '1801051013351013', 'Solotigo', 'VIla Pamulang Blok CE 2/27', '2018-01-05', '8010510133510141', 'Jaka Subagyono', '8010510133510152', 'Kurnia Sandi', '', 1, '0810510133', 'Sularsi', 0, '0810510132', 'Kurnia Sandi', 'Jalan Tidar No 157', 'Jl. Harapan Indah Boulevard01', '0810510133', 25.34, 150.34, 13.34, 37, 118.45, 'Kondisi secara umum baik.', 0),
('180105104211_0700', '2', 'Jl. Gardenia Indah X HM1-27', '1801051042111042', 'Magelang', 'Jl. Gardenia Indah X HM1-27', '2018-01-27', '8010510421110431', 'Munardi Munir', '8010510421110442', 'Suwarno', '', 1, '0810510421', 'Siti Aminah', 0, '0810510420', 'Suwarno', 'Jl. Gardenia Indah X HM1-27', 'Jl. Harapan Indah Boulevard04', '0810510421', 0, 0, 0, 37, 0, '', 0),
('180105104725_0700', '3', '', '1801051047251047', 'Sragen', '', '2018-09-17', '8010510472510481', 'Nur Yasin', '8010510472510492', 'Gunawan Wibisono', '', 0, '0810510472', 'Suharyanti', 2, '0810510471', 'Gunawan Wibisono', '', 'Jl. Harapan Indah Boulevard04', '0810510472', 0, 100, 0, 37, 0, '', 0),
('180105105645_0700', '2', 'Jl. Gardenia Indah VIII HM6-9', '1801051056451056', 'Boyolali', 'Jl. Gardenia Indah VIII HM6-9', '2018-01-16', '8010510564510571', 'Singgih Suharso', '8010510564510582', 'Tundjung Setyawan', '', 1, '0810510564', 'Rini Subono', 0, '0810510563', 'Tundjung Setyawan', 'Jl. Gardenia Indah VIII HM6-9', 'Jl. Harapan Indah Boulevard05', '0810510564', 0, 0, 0, 37, 0, '', 0),
('180105110422_0700', '2', 'Jl. Gardenia Indah VIII HM6-10', '1801051104221104', 'Surakarta', 'Jl. Gardenia Indah VIII HM6-10', '2018-01-25', '8010511042211051', 'Audry Kawulusan', '8010511042211062', 'Tidar Panunjung', '', 0, '0810511042', 'Endang Tri Rusmini', 0, '0810511041', 'Tidar Panunjung', 'Jl. Gardenia Indah VIII HM6-10', 'Jl. Harapan Indah Boulevard10', '0810511042', 0, 0, 0, 37, 0, '', 0),
('180105110604_0700', '2', 'Jl. Gardenia Indah VIII HM6-11', '1801051106041106', 'Semarang', 'Jl. Gardenia Indah VIII HM6-11', '2018-01-26', '8010511060411071', 'Eny Hidayati', '8010511060411082', 'Hasto Riyatno', '', 0, '0810511060', 'Erni Banowati', 0, '0810511059', 'Hasto Riyatno', 'Jl. Gardenia Indah VIII HM6-11', 'Jl. Harapan Indah Boulevard10', '0810511060', 0, 0, 0, 37, 0, '', 0),
('180105111631_0700', '3', 'Jl. Gardenia Indah VII HM6-17', '1801051116311116', 'Klungkung', 'Jl. Gardenia Indah VII HM6-17', '2018-01-05', '8010511163111171', 'Taufan Wijayanto', '8010511163111182', 'Agung Hidayat', '', 1, '0810511163', 'Erni Wuryanti', 2, '0810511162', 'Agung Hidayat', 'Jl. Gardenia Indah VII HM6-17', 'Jl. Harapan Indah Boulevard11', '0810511163', 0, 0, 0, 37, 0, '', 0),
('180105111755_0700', '4', 'Jl. Gardenia Indah VII HM6-18', '1801051117551117', 'Bangli', 'Jl. Gardenia Indah VII HM6-18', '2018-01-26', '8010511175511181', 'Sumarno Sugeng', '8010511175511192', 'Andi Kusnanto', '', 1, '0810511175', 'Sri Rejeki', 0, '0810511174', 'Andi Kusnanto', 'Jl. Gardenia Indah VII HM6-18', 'Jl. Harapan Indah Boulevard11', '0810511175', 0, 0, 0, 37, 0, '', 0),
('180105112204_0700', '3', 'Jl. Gardenia Indah VII HM6-19', '1801051122041122', 'Nusa Dua', 'Jl. Gardenia Indah VII HM6-19', '2018-01-05', '8010511220411231', 'Rosalia', '8010511220411242', 'Anang Hermansyah', '', 0, '0810511220', 'Siti NurHalimah', 2, '0810511219', 'Anang Hermansyah', 'Jl. Gardenia Indah VII HM6-19', 'Jl. Harapan Indah Boulevard12', '0810511220', 0, 0, 0, 37, 0, '', 0),
('180105112312_0700', '4', 'Jl. Gardenia Indah VII HM6-20', '1801051123121123', 'Bekasi', 'Jl. Gardenia Indah VII HM6-20', '2018-01-18', '8010511231211241', 'Titik Wulandari', '8010511231211252', 'Setia Negara', '', 0, '0810511231', 'Airin Tri Danarti', 0, '0810511230', 'Setia Negara', 'Jl. Gardenia Indah VII HM6-20', 'Jl. Harapan Indah Boulevard12', '0810511231', 0, 0, 0, 37, 0, '', 0),
('180105112439_0700', '', 'Jl. Gardenia Indah VII HM6-21', '1801051124391124', 'Bandung', 'Jl. Gardenia Indah VII HM6-21', '2018-01-31', '8010511243911251', 'Anom Suryawan', '8010511243911262', 'Ginajar Hadi', '', 1, '0810511243', 'Sri Wahyuni', 0, '0810511242', 'Ginajar Hadi', 'Jl. Gardenia Indah VII HM6-21', 'Jl. Harapan Indah Boulevard12', '0810511243', 0, 0, 0, 37, 0, '', 0),
('180105112702_0700', '1', 'Jl. Gardenia Indah VII HM6-22', '1801051127021127', 'Soreang', 'Jl. Gardenia Indah VII HM6-22', '2018-01-26', '8010511270211281', 'Agung Hidayat', '8010511270211292', 'Hadi Waluyo', '', 1, '0810511270', 'Sri Rusmini', 0, '0810511269', 'Hadi Waluyo', 'Jl. Gardenia Indah VII HM6-22', 'Jl. Harapan Indah Boulevard12', '0810511270', 0, 0, 0, 37, 0, '', 0),
('180105113006_0700', '1', 'Jl. Gardenia Indah VII HM6-23', '1801051130061130', 'Cimahi', 'Jl. Gardenia Indah VII HM6-23', '2018-02-21', '8010511300611311', 'Hasan Azumardi', '8010511300611322', 'Sentot Suryono', '', 1, '0810511300', 'Sri Sulastri', 0, '0810511299', 'Sentot Suryono', 'Jl. Gardenia Indah VII HM6-23', 'Jl. Harapan Indah Boulevard13', '0810511300', 0, 0, 0, 37, 0, '', 0),
('180105134447_0700', '4', '', '1801051344471344', 'Denpasar', '', '2018-09-04', '8010513444713451', 'Kukuh Widyanto', '8010513444713462', 'Kanang Wibisono', '', 0, '0810513444', 'Suharyanti Taslim', 0, '0810513443', 'Kanang Wibisono', '', 'Jl. Harapan Indah Boulevard34', '0810513444', 0, 0, 0, 37, 0, '', 0),
('180105141238_0700', '1', 'Jl. Gardenia Indah IX HM6-27', '1801051412381412', 'Manado', 'Jl. Gardenia Indah IX HM6-27', '2018-01-05', '8010514123814131', 'Jajang Nurjanah', '8010514123814142', 'I Gusti Ngurah Rai', '', 1, '0810514123', 'Renata Suharsi', 2, '0810514122', 'I Gusti Ngurah Rai', 'Jl. Gardenia Indah IX HM6-27', 'Jl. Harapan Indah Boulevard41', '0810514123', 0, 0, 0, 37, 0, '', 0),
('180105141431_0700', '4', 'Jl. Gardenia Indah IX HM6-28', '1801051414311414', 'Palangkaraya', 'Jl. Gardenia Indah IX HM6-28', '2018-01-26', '8010514143114151', 'Ragil Prasetyo', '8010514143114162', 'Dimas Hanggono', '', 1, '0810514143', 'Ria Taslim', 0, '0810514142', 'Dimas Hanggono', 'Jl. Gardenia Indah IX HM6-28', 'Jl. Harapan Indah Boulevard41', '0810514143', 0, 0, 0, 37, 0, '', 0),
('180105141613_0700', '1', 'Jl. Gardenia Indah IX HM6-29', '1801051416131416', 'Palembang', 'Jl. Gardenia Indah IX HM6-29', '2018-01-05', '8010514161314171', 'Dani Kristianto', '8010514161314182', 'Ganjar Pranowo', '', 1, '0810514161', 'Eny Sihombing', 2, '0810514160', 'Ganjar Pranowo', 'Jl. Gardenia Indah IX HM6-29', 'Jl. Harapan Indah Boulevard41', '0810514161', 0, 0, 0, 37, 0, '', 0),
('180105141726_0700', '1', 'Jl. Gardenia Indah IX HM6-30', '1801051417261417', 'Pekanbaru', 'Jl. Gardenia Indah IX HM6-30', '2018-01-05', '8010514172614181', 'Tundjung Rahmanto', '8010514172614192', 'Ki Narto Sabdo', '', 1, '0810514172', 'Eny Kusrini', 2, '0810514171', 'Ki Narto Sabdo', 'Jl. Gardenia Indah IX HM6-30', 'Jl. Harapan Indah Boulevard41', '0810514172', 0, 0, 0, 37, 0, '', 0),
('180105141911_0700', '1', 'Jl. Gardenia Indah IX HM6-31', '1801051419111419', 'Pangkal Pinang', 'Jl. Gardenia Indah IX HM6-31', '2018-01-05', '80105141911142e1', 'Luluk Fadillah', '8010514191114212', 'Anom Suroto', '', 0, '0810514191', 'Sapto Rini', 2, '0810514190', 'Anom Suroto', 'Jl. Gardenia Indah IX HM6-31', 'Jl. Harapan Indah Boulevard41', '0810514191', 0, 0, 0, 37, 0, '', 0),
('180105142009_0700', '1', 'Jl. Gardenia Indah IX HM6-32', '1801051420091420', 'Ciamis', 'Jl. Gardenia Indah IX HM6-32', '2018-01-05', '8010514200914211', 'Fitriani Subarjo', '8010514200914222', 'Cipto Suwarno', '', 0, '0810514200', 'Ernawati', 2, '0810514199', 'Cipto Suwarno', 'Jl. Gardenia Indah IX HM6-32', 'Jl. Harapan Indah Boulevard42', '0810514200', 0, 0, 0, 37, 0, '', 0),
('180105142137_0700', '1', 'Jl. Gardenia Indah IX HM6-33', '1801051421371421', 'Jakarta', 'Jl. Gardenia Indah IX HM6-33', '2018-01-05', '8010514213714221', 'Kartinah Ningsih', '8010514213714232', 'Hadi Maryono', '', 0, '0810514213', 'Meriam Belina', 2, '0810514212', 'Hadi Maryono', 'Jl. Gardenia Indah IX HM6-33', 'Jl. Harapan Indah Boulevard42', '0810514213', 0, 0, 0, 37, 0, '', 0),
('180105142426_0700', '1', 'Jl. Gardenia Indah VIII HM7-18', '1801051424261424', 'Wonogiri', 'Jl. Gardenia Indah VIII HM7-18', '2018-01-05', '8010514242614251', 'Anisah Nuraini', '8010514242614262', 'Sumaryono', '', 0, '0810514242', 'Asti Ananata', 2, '0810514241', 'Sumaryono', 'Jl. Gardenia Indah VIII HM7-18', 'Jl. Harapan Indah Boulevard42', '0810514242', 0, 0, 0, 37, 0, '', 0),
('180105142534_0700', '1', 'Jl. Gardenia Indah VIII HM7-19', '1801051425341425', 'Bantul', 'Jl. Gardenia Indah VIII HM7-19', '2018-01-05', '8010514253414261', 'Halimah Saidah', '8010514253414272', 'Slamet Santoso', '', 0, '0810514253', 'Suzi Susanti', 2, '0810514252', 'Slamet Santoso', 'Jl. Gardenia Indah VIII HM7-19', 'Jl. Harapan Indah Boulevard42', '0810514253', 0, 0, 0, 37, 0, '', 0),
('180105142626_0700', '1', 'Jl. Gardenia Indah VIII HM7-20', '1801051426261426', 'Magelang', 'Jl. Gardenia Indah VIII HM7-20', '2018-01-05', '8010514262614271', 'Ayu Margawati', '8010514262614282', 'Oerip S Santoso', '', 0, '0810514262', 'Siti Nurhaliza', 2, '0810514261', 'Oerip S Santoso', 'Jl. Gardenia Indah VIII HM7-20', 'Jl. Harapan Indah Boulevard42', '0810514262', 0, 0, 0, 37, 0, '', 0),
('181026053105_0000', '4', 'VIla Ayah Pamulang Blok CE 2/27', '1810260531050531', 'Sragen', '', '2018-09-26', '8102605310505321', 'Samidi Ihsan', '8102605310505332', 'Satya Atmadja', '', 0, '0810508360', 'Sunarti', 0, '0810508359', 'Wali Satya Atmadja', 'Wali VIla Pamulang Blok CE 2/27', 'Jl. Harapan Indah Boulevard83', '088810508360', 0, 0, 0, 37, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `survey02_jalan`
--

CREATE TABLE `survey02_jalan` (
  `id_data` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `ada_jalan` tinyint(1) NOT NULL,
  `kode_tapak` varchar(100) NOT NULL,
  `peruntukan` int(1) NOT NULL,
  `peruntukan_lainnya` varchar(200) NOT NULL,
  `kdb` varchar(50) NOT NULL,
  `klb` varchar(50) NOT NULL,
  `gsb` varchar(50) NOT NULL,
  `tinggi_maks` varchar(50) NOT NULL,
  `sesuai_peraturan` varchar(50) NOT NULL,
  `sesuai_eksisting` tinyint(1) NOT NULL,
  `lebar_jalan` double NOT NULL,
  `kelas_jalan` int(1) NOT NULL,
  `jumlah_lajur` int(1) NOT NULL,
  `kondisi_lalin` int(1) NOT NULL,
  `permukaan_jalan` int(1) NOT NULL,
  `kondisi` int(1) NOT NULL,
  `drainase` int(1) NOT NULL,
  `penerangan` int(1) NOT NULL,
  `petunjuk1` text NOT NULL,
  `petunjuk2` text NOT NULL,
  `petunjuk3` text NOT NULL,
  `petunjuk4` text NOT NULL,
  `petunjuk5` text NOT NULL,
  `petunjuk6` text NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey02_jalan`
--

INSERT INTO `survey02_jalan` (`id_data`, `group_id`, `user_id`, `ada_jalan`, `kode_tapak`, `peruntukan`, `peruntukan_lainnya`, `kdb`, `klb`, `gsb`, `tinggi_maks`, `sesuai_peraturan`, `sesuai_eksisting`, `lebar_jalan`, `kelas_jalan`, `jumlah_lajur`, `kondisi_lalin`, `permukaan_jalan`, `kondisi`, `drainase`, `penerangan`, `petunjuk1`, `petunjuk2`, `petunjuk3`, `petunjuk4`, `petunjuk5`, `petunjuk6`, `approval`, `respond`) VALUES
('180105101335_0700', '5', 'prie2474@gmail.com', 1, '', 6, 'Fasilitas Umum', '50', '5', '4', '', 'Peraturan Walikota Surabaya No 57 tahun 2015', 1, 6, 4, 2, 3, 1, 2, 1, 1, 'Komplek PLN', 'Apartemen Gunawangsa Tidar', 'Polsek Sawahan', 'Masjid Al Kautsar', 'Tidar Mas Square', '', 0, ''),
('180105104211_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/01', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 14, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105104725_0700', '3', '', 0, 'bpwc/5', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', 0, ''),
('180105105645_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/02', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105110422_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/03', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105110604_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/04', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105111631_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/05', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105111755_0700', '1', 'femmyandri02@gmail.com', 2, 'UPMT/06', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105112204_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/07', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105112312_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/08', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105112439_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/09', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105112702_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/10', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10/Bekasi', '', '', 0, ''),
('180105113006_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/11', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105134447_0700', '3', '', 0, 'bpwc/5', 0, '', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', 0, ''),
('180105141238_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/12', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105141431_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/13', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105141613_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/14', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105141726_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/15', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105141911_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/16', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105142009_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/17', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105142137_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/18', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105142426_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/19', 0, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105142534_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/20', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, ''),
('180105142626_0700', '1', 'femmyandri02@gmail.com', 1, 'UPMT/21', 1, '', '', '', '', '', 'Perda Kab. Bekasi No. 12 Tahun 2011', 1, 10, 4, 2, 4, 1, 1, 1, 1, 'Kantor Kepala Desa Pusaka Rakyat', 'Pasar Modern Taman Harapan Indah', 'SMPN 19 Bekasi', 'SMAN 10 Bekasi', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey03_pasar`
--

CREATE TABLE `survey03_pasar` (
  `id_data` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `kode_tapak` varchar(100) NOT NULL,
  `nama_pasar` varchar(100) NOT NULL,
  `jarak` double NOT NULL,
  `sarana_umum_11` int(1) NOT NULL,
  `sarana_umum_12` int(1) NOT NULL,
  `sarana_umum_13` int(1) NOT NULL,
  `sarana_umum_14` int(1) NOT NULL,
  `sarana_umum_15` int(1) NOT NULL,
  `sarana_umum_16` int(1) NOT NULL,
  `sarana_umum_17` int(1) NOT NULL,
  `sarana_umum_desc` text,
  `sarana_tersambung_11` int(1) NOT NULL,
  `sarana_tersambung_12` int(1) NOT NULL,
  `sarana_tersambung_13` int(1) NOT NULL,
  `sarana_tersambung_14` int(1) NOT NULL,
  `sarana_tersambung_15` int(1) NOT NULL,
  `sarana_tersambung_16` int(1) NOT NULL,
  `sarana_tersambung_17` int(1) NOT NULL,
  `sarana_tersam_desc` text,
  `bentuk_tapak` int(1) NOT NULL,
  `bentuk_tapak_d` text,
  `topografi` int(1) NOT NULL,
  `topografi_d` text,
  `jenis_tanah` int(11) NOT NULL,
  `jenis_tanah_d` text,
  `elevasi` int(1) NOT NULL,
  `elevasi_meter` double NOT NULL,
  `batas_barat` text NOT NULL,
  `batas_timur` text NOT NULL,
  `batas_utara` text NOT NULL,
  `batas_selatan` text NOT NULL,
  `view_terbaik` int(11) NOT NULL,
  `view_keterangan` text NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey03_pasar`
--

INSERT INTO `survey03_pasar` (`id_data`, `group_id`, `user_id`, `kode_tapak`, `nama_pasar`, `jarak`, `sarana_umum_11`, `sarana_umum_12`, `sarana_umum_13`, `sarana_umum_14`, `sarana_umum_15`, `sarana_umum_16`, `sarana_umum_17`, `sarana_umum_desc`, `sarana_tersambung_11`, `sarana_tersambung_12`, `sarana_tersambung_13`, `sarana_tersambung_14`, `sarana_tersambung_15`, `sarana_tersambung_16`, `sarana_tersambung_17`, `sarana_tersam_desc`, `bentuk_tapak`, `bentuk_tapak_d`, `topografi`, `topografi_d`, `jenis_tanah`, `jenis_tanah_d`, `elevasi`, `elevasi_meter`, `batas_barat`, `batas_timur`, `batas_utara`, `batas_selatan`, `view_terbaik`, `view_keterangan`, `approval`, `respond`) VALUES
('180105101335_0700', '5', 'prie2474@gmail.com', '', 'Tidar Mas Square', 500, 1, 0, 1, 1, 1, 0, 0, '', 1, 0, 1, 0, 0, 0, 0, '', 2, '', 1, '', 1, '', 0, 0, 'Perumahan PLN Sawahan', 'Jalan Lingkungan (Tidar)', 'Jalan Lingkungan (Tidar)', 'Jalan Lingkungan (Tidar)', 1, 'Jalan Lingkungan (Tidar)', 0, ''),
('180105104211_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, '', 1, 0, 1, 1, 1, 0, 0, '', 1, '', 1, '', 1, '', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105104725_0700', '3', '', 'bpwc/5', '', 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '', '', '', '', 0, '', 0, ''),
('180105105645_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105110422_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105110604_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105111631_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105111755_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105112204_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105112312_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 0, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105112439_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105112702_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 0, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105113006_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 0, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105134447_0700', '3', '', 'bpwc/5', '', 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, 0, '', '', '', '', 0, '', 0, ''),
('180105141238_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105141431_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105141613_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105141726_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105141911_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105142009_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105142137_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 'Rumah Tinggal', 1, '', 0, ''),
('180105142426_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Jalan Lingkungan', 2, '', 0, ''),
('180105142534_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Japan Lingkungan', 2, '', 0, ''),
('180105142626_0700', '1', 'femmyandri02@gmail.com', '', 'Pasar Modern Taman Harapan Indah', 750, 1, 0, 1, 1, 1, 0, 0, 'null', 1, 0, 1, 1, 1, 0, 0, 'null', 1, 'null', 1, 'null', 1, 'null', 0, 0, 'Rumah Tinggal', 'Rumah Tinggal', 'Rumah Tinggal', 'Japan Lingkungan', 2, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey04_status`
--

CREATE TABLE `survey04_status` (
  `id_data_status` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `id_data` varchar(50) NOT NULL COMMENT '1-n from survey01_lokasi',
  `id_asset_internal` varchar(50) NOT NULL,
  `nomor_asset` varchar(100) NOT NULL,
  `status_tanah` int(1) NOT NULL,
  `status_tanah_ajb_d` text NOT NULL,
  `status_tanah_desc1` text NOT NULL,
  `status_tanah_desc2` text NOT NULL,
  `luas_tapak` double NOT NULL,
  `nomor_surat` varchar(100) NOT NULL,
  `kode_sertifikat` varchar(50) NOT NULL,
  `nama_pemegang` varchar(100) NOT NULL,
  `tgl_terbit` varchar(50) NOT NULL,
  `tgl_berakhir` varchar(50) NOT NULL,
  `no_tgl_sk` varchar(100) NOT NULL,
  `no_peta_pendaftaran` varchar(100) NOT NULL,
  `no_gambar_situasi` varchar(50) NOT NULL,
  `tgl_surat_ukur` varchar(50) DEFAULT NULL,
  `keadaan_tanah` varchar(200) DEFAULT NULL,
  `perubahan_sertifikat` tinyint(1) DEFAULT NULL,
  `jenis_perubahan` tinyint(1) DEFAULT NULL,
  `pembebasan_hak` varchar(200) DEFAULT NULL,
  `jenis_bukti` varchar(1) DEFAULT NULL,
  `nomor_bukti` varchar(50) DEFAULT NULL,
  `tanggal_bukti` varchar(50) DEFAULT NULL,
  `nilai_wajar` double NOT NULL COMMENT 'nilai wajar dari Appraisal (Penilai) atas tanah tersebut',
  `bukti_perhitungan` varchar(200) NOT NULL COMMENT 'lokasi file PDF bukti perhitungan nilai wajar',
  `clear` tinyint(1) NOT NULL,
  `clean` tinyint(1) NOT NULL,
  `rekomendasi` text NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey04_status`
--

INSERT INTO `survey04_status` (`id_data_status`, `group_id`, `user_id`, `id_data`, `id_asset_internal`, `nomor_asset`, `status_tanah`, `status_tanah_ajb_d`, `status_tanah_desc1`, `status_tanah_desc2`, `luas_tapak`, `nomor_surat`, `kode_sertifikat`, `nama_pemegang`, `tgl_terbit`, `tgl_berakhir`, `no_tgl_sk`, `no_peta_pendaftaran`, `no_gambar_situasi`, `tgl_surat_ukur`, `keadaan_tanah`, `perubahan_sertifikat`, `jenis_perubahan`, `pembebasan_hak`, `jenis_bukti`, `nomor_bukti`, `tanggal_bukti`, `nilai_wajar`, `bukti_perhitungan`, `clear`, `clean`, `rekomendasi`, `approval`, `respond`) VALUES
('180105104211_0700', '1', 'femmyandri02@gmail.com', '180105104211_0700', 'UPMT/01/1-1', 'UPMT-177-1', 2, '', '', '', 126, 'SHGB No. 255/Desa Pusaka Rakyat', '10.05.01.03.3.00255', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HN 1-27', '166/205', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105104725_0700', '3', '', '180105104725_0700', '', '', 0, '', '', '', 0, '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0, '', 0, ''),
('180105105645_0700', '1', 'femmyandri02@gmail.com', '180105105645_0700', 'UPMT/02/1-1', 'UPMT-149-1', 2, '', '', '', 126, 'SHGB No. 273/Desa Pusaka Rakyat', '10.05.01.03.3.00273', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-9', '91/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105110422_0700', '1', 'femmyandri02@gmail.com', '180105110422_0700', 'UPMT/03/1-1', 'UPMT=150=1', 2, '', '', '', 126, 'SHGB No. 270/Desa Pusaka Rakyat', '10.05.01.03.3.00270', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-10', '92/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105110604_0700', '1', 'femmyandri02@gmail.com', '180105110604_0700', 'UPMT/04/1-1', 'UPMT-151-1', 2, '', '', '', 126, 'SHGB No. 269/ Desa Pusaka Rakyat', '10.05.01.03.3.00269', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-11', '93/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105111631_0700', '1', 'femmyandri02@gmail.com', '180105111631_0700', 'UPMT/05/1-1', 'UPMT-164-1', 2, '', '', '', 126, 'SHGB No. 181/ Desa Pusaka Rakyat', '10.05.01.03.3.00181', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-17', '97/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105111755_0700', '1', 'femmyandri02@gmail.com', '180105111755_0700', 'UPMT/06/1-1', 'UPMT-165-1', 2, '', '', '', 126, 'SHGB No. 241/Desa Pusaka Rakyat', '10.05.01.03.3.00241', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-18', '98/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105112204_0700', '1', 'femmyandri02@gmail.com', '180105112204_0700', 'UPMT/07/1-1', 'UPMT-152-1', 2, '', '', '', 126, 'SHGB No. 180/Desa Pusaka Rakyat', '10.05.01.03.3.00180', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-19', '99/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105112312_0700', '1', 'femmyandri02@gmail.com', '180105112312_0700', 'UPMT/08/1-1', 'UPMT-153-1', 2, '', '', '', 126, 'SHGB No. 214/Desa Pusaka Rakyat', '10.05.01.03.3.00214', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-20', '100/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105112439_0700', '1', 'femmyandri02@gmail.com', '180105112439_0700', 'UPMT/09/1-1', 'UPMT-154-1', 2, '', '', '', 126, 'SHGB No. 215/Desa Pusaka Rakyat', '10.05.01.03.3.00215', 'PT PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No. Kav: HM 6-21', '101/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105112702_0700', '1', 'femmyandri02@gmail.com', '180105112702_0700', 'UPMT/10/1-1', 'UPMT-155-1', 2, '', '', '', 126, 'SHGB No. 268/Desa Pusaka Rakyat', '10.05.01.03.3.00268', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2005', '', 'Blok/No.Kav: HM.6-22', '102/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105113006_0700', '1', 'femmyandri02@gmail.com', '180105113006_0700', 'UPMT/11/1-1', 'UPMT-156-1', 2, '', '', '', 126, 'SHGB No. 267/Desa Pusaka Rakyat', '10.05.01.03.3.000267', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-23', '103/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105134447_0700', '3', 'only_ganda@yahoo.com', '180105134447_0700', 'BPWC/2/1-1', '', 4, '', '', '', 27704, '00003', '10.13.05.04.4.00003', 'PT. Pembangkitan Jawa Bali', '31-12-2014', '22-12-2039', '15/HP/BPN.32/2014, 17-12-2014', '48.2-44.080-07', '00008/Ciroyom/2014', '23-12-2014', 'Sebidang Tanah Kosong', 0, 0, '', '', '', '', 0, '', 0, 0, '', 1, 'ok'),
('180105141238_0700', '1', 'femmyandri02@gmail.com', '180105141238_0700', 'UPMT/12/1-1', 'UPMT-157-1', 2, '', '', '', 126, 'SHGB No. 205/Desa Pusaka Rakyat', '10.05.01.03.3.00205', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-27', '106/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105141431_0700', '1', 'femmyandri02@gmail.com', '180105141431_0700', 'UPMT/13/1-1', 'UPMT-158-1', 2, '', '', '', 126, 'SHGB No. 184/Desa Pusaka Rakyat', '10.05.01.03.3.00184', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', '107/2005', 'Blok/No.Kav: HM 6-28', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105141613_0700', '1', 'femmyandri02@gmail.com', '180105141613_0700', 'UPMT/14/1-1', 'UPMT-159-1', 2, '', '', '', 126, 'SHGB No. 183/Desa Pusaka Rakyat', '10.05.01.03.3.00183', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-082033', '', 'Blok/No.Kav: HM 6-29', '108/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105141726_0700', '1', 'femmyandri02@gmail.com', '180105141726_0700', 'UPMT/15/1-1', 'UPMT-160-1', 2, '', '', '', 126, 'SHGB No. 242/Desa Pusaka Rakyat', '10.05.01.03.3.00242', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-30', '109/2005', '14-11-2005', '', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105141911_0700', '1', 'femmyandri02@gmail.com', '180105141911_0700', 'UPMT/16/1-1', 'UPMT-161-1', 2, '', '', '', 126, 'SHGB No. 240/Desa Pusaka Rakyat', '10.05.01.03.3.00240', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-31', '110/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105142009_0700', '1', 'femmyandri02@gmail.com', '180105142009_0700', 'UPMT/17/1-1', 'UPMT-162-1', 2, '', '', '', 126, 'SHGB No. 178/Desa Pusaka Rakyat', '10.05.01.03.3.00178', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 6-32', '111/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105142137_0700', '1', 'femmyandri02@gmail.com', '180105142137_0700', 'UPMT/18/1-1', 'UPMT-163-1', 2, '', '', '', 126, 'SHGB No. 179/Desa Pusaka Rakyat', '10.05.01.03.3.00179', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '16-08-2033', '', 'Blok/No.Kav: HM 6-33', '112/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105142426_0700', '1', 'femmyandri02@gmail.com', '180105142426_0700', 'UPMT/19/1-1', 'UPMT-166-1', 2, '', '', '', 126, 'SHGB No. 169/Desa Pusaka Rakyat', '10.05.01.03.3.00169', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 7-18', '128/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105142534_0700', '1', 'femmyandri02@gmail.com', '180105142534_0700', 'UPMT/20/1-1', 'UPMT-167-1', 2, '', '', '', 126, 'SHGB No. 170/Desa Pusaka Rakyat', '10.05.01.03.3.00170', 'PT. PEMBANGKITAN JAWA BALI', '18-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 7-19', '129/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180105142626_0700', '1', 'femmyandri02@gmail.com', '180105142626_0700', 'UPMT/21/1-1', 'UPMT-168-1', 2, '', '', '', 126, 'SHGB No. 172/Desa Pusaka Rakyat', '10.05.01.03.3.00172', 'PT. PEMBANGKITAN JAWA BALI', '28-11-2005', '26-08-2033', '', 'Blok/No.Kav: HM 7-20', '130/2005', '14-11-2005', 'null', 2, 0, 'null', '', 'null', 'null', 0, '', 0, 0, '', 0, ''),
('180118105257_0004', '5', 'prie2474@gmail.com', '180105101335_0700', 'PJB2/2/1-1', '', 2, '', '', '', 4229, '444', '12.01.06.05.3.00444', '', '27/11/2006', '11/09/2026', '233.-660.2-35.-2006 tanggal 19-07-2006', '49.2-32.070-08-3', '1149/Petemon/2006', '13/10/2006', 'Pekarangan diatasnya berdiri bangunan dari batu', 2, 0, '', '', '', '', 0, '', 0, 0, '', 0, ''),
('181106073444_0008', '', '', '180105101335_0700', '', '', 1, 'test', 'tes2', '', 45, '', '', '', '', '', '', '', '', '', '', 0, 0, '', '', '', '', 0, '', 0, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey06_kelola`
--

CREATE TABLE `survey06_kelola` (
  `id_kelola` varchar(50) NOT NULL,
  `id_data` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `status_kelola` int(1) DEFAULT NULL,
  `status_kelola_d` text,
  `pengguna` int(11) DEFAULT NULL,
  `pengguna_bidang` varchar(50) DEFAULT NULL,
  `pengguna_bagian` varchar(50) DEFAULT NULL,
  `status_manfaat` int(1) DEFAULT NULL,
  `status_manfaat_m` int(2) DEFAULT NULL,
  `status_legal` int(1) DEFAULT NULL,
  `catatan_unclear` text,
  `catatan_unclean` text,
  `sengketa` int(1) NOT NULL,
  `sengketa_d` text NOT NULL,
  `mediasi` int(1) NOT NULL,
  `mediasi_d` text NOT NULL,
  `gugatan` int(1) NOT NULL,
  `gugatan_d` text NOT NULL,
  `pemblokiran` int(1) NOT NULL,
  `pemblokiran_d` text NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey06_kelola`
--

INSERT INTO `survey06_kelola` (`id_kelola`, `id_data`, `group_id`, `user_id`, `status_kelola`, `status_kelola_d`, `pengguna`, `pengguna_bidang`, `pengguna_bagian`, `status_manfaat`, `status_manfaat_m`, `status_legal`, `catatan_unclear`, `catatan_unclean`, `sengketa`, `sengketa_d`, `mediasi`, `mediasi_d`, `gugatan`, `gugatan_d`, `pemblokiran`, `pemblokiran_d`, `approval`, `respond`) VALUES
('180105104211_0700', '180105104211_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105104725_0700', '180105104725_0700', '3', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, '', 0, '', 0, '', 0, ''),
('180105105645_0700', '180105105645_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105110422_0700', '180105110422_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105110604_0700', '180105110604_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105111631_0700', '180105111631_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105111755_0700', '180105111755_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105112204_0700', '180105112204_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105112312_0700', '180105112312_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105112439_0700', '180105112439_0700', '1', 'femmyandri02@gmail.com', 1, '', 0, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105112702_0700', '180105112702_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105113006_0700', '180105113006_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105134447_0700', '180105134447_0700', '3', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, '', 0, '', 0, '', 0, ''),
('180105141238_0700', '180105141238_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105141431_0700', '180105141431_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105141613_0700', '180105141613_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105141726_0700', '180105141726_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105141911_0700', '180105141911_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105142009_0700', '180105142009_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, 'null', 'null', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105142137_0700', '180105142137_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105142426_0700', '180105142426_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105142534_0700', '180105142534_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180105142626_0700', '180105142626_0700', '1', 'femmyandri02@gmail.com', 1, '', 1, 'UP Muara Tawar', '', 1, 0, 1, '', '', 2, '', 2, '', 2, '', 2, '', 0, ''),
('180118105320_0000', '180105101335_0700', '5', 'prie2474@gmail.com', 1, '', 1, '', '', 2, 0, 1, '', '', 0, '', 0, '', 0, '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey07_hbu`
--

CREATE TABLE `survey07_hbu` (
  `id_data_hbu` varchar(50) NOT NULL,
  `id_data` varchar(50) DEFAULT NULL,
  `id_asset_internal` varchar(50) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `penggunaan_lahan` int(1) NOT NULL,
  `penggunaan_lahan_d` text NOT NULL,
  `pemanfaatan_lahan` int(1) NOT NULL,
  `pemanfaatan_lahan_d` text NOT NULL,
  `kesesuaian_lahan` int(1) NOT NULL,
  `kesesuaian_lahan_d` text NOT NULL,
  `optimalisasi_asset` int(1) NOT NULL,
  `optimalisasi_asset_d` text NOT NULL,
  `jenis_properti` int(1) DEFAULT NULL,
  `jenis_properti2` int(1) NOT NULL,
  `jenis_properti3` int(1) NOT NULL,
  `jenis_properti4` int(1) NOT NULL,
  `jenis_properti5` int(1) NOT NULL,
  `jenis_properti6` int(1) NOT NULL,
  `jenis_properti7` int(1) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `luas_tanah` double NOT NULL,
  `luas_bangunan` double NOT NULL,
  `jarak_tapak` double NOT NULL,
  `jumlah_kamar` int(4) NOT NULL,
  `kelas_hotel` int(1) DEFAULT NULL,
  `grade_apartemen` int(1) DEFAULT NULL,
  `grade_perkantoran` int(1) DEFAULT NULL,
  `grade_ruko` int(1) DEFAULT NULL,
  `grade_mall` int(1) DEFAULT NULL,
  `grade_perumahan` int(1) DEFAULT NULL,
  `kawasan_wisata` int(1) NOT NULL,
  `rekomendasi` varchar(200) NOT NULL COMMENT 'rekomendasi apa untuk tapak tersebut: apakah hotel, restoran, kantor, dsb',
  `nilai_investasi` double NOT NULL COMMENT 'nilai investasi yang diperlukan untuk mewujudkan rekomendasi tsb',
  `irr` varchar(50) NOT NULL COMMENT 'aspek IRR dalam penilaian asset',
  `npv` varchar(50) NOT NULL COMMENT 'aspek NPV dalam penilaian asset',
  `laporan_lengkap` varchar(200) NOT NULL COMMENT 'lokasi file PDF bukti laporan lengkap perhitungan investasi tersebut',
  `keterangan` text NOT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey07_hbu`
--

INSERT INTO `survey07_hbu` (`id_data_hbu`, `id_data`, `id_asset_internal`, `group_id`, `user_id`, `penggunaan_lahan`, `penggunaan_lahan_d`, `pemanfaatan_lahan`, `pemanfaatan_lahan_d`, `kesesuaian_lahan`, `kesesuaian_lahan_d`, `optimalisasi_asset`, `optimalisasi_asset_d`, `jenis_properti`, `jenis_properti2`, `jenis_properti3`, `jenis_properti4`, `jenis_properti5`, `jenis_properti6`, `jenis_properti7`, `nama`, `luas_tanah`, `luas_bangunan`, `jarak_tapak`, `jumlah_kamar`, `kelas_hotel`, `grade_apartemen`, `grade_perkantoran`, `grade_ruko`, `grade_mall`, `grade_perumahan`, `kawasan_wisata`, `rekomendasi`, `nilai_investasi`, `irr`, `npv`, `laporan_lengkap`, `keterangan`, `approval`, `respond`) VALUES
('180105104211_0700', '180105104211_0700', '', '', '', 0, 'test gejala1', 0, 'catatan dokter1', 0, 'obat diresepkan1', 1, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, '', '', '', '', 0, ''),
('180105104725_0700', '180105104725_0700', '', '3', '', 1, '', 0, '', 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105105645_0700', '180105105645_0700', 'UPMT/02', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105110422_0700', '180105110422_0700', 'UPMT/03', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105110604_0700', '180105110604_0700', 'UPMT04', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105111631_0700', '180105111631_0700', 'UPMT/05', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105111755_0700', '180105111755_0700', 'UPMT/06', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105112204_0700', '180105112204_0700', 'UPMT/07', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105112312_0700', '180105112312_0700', 'UPMT/08', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105112439_0700', '180105112439_0700', 'UPMT/09', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105112702_0700', '180105112702_0700', 'UPMT/10', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105113006_0700', '180105113006_0700', '', '1', '', 0, 'Gejala12232', 0, 'Catatan Dokter 112131', 0, 'Obat diresepkan 131213', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105134447_0700', '180105134447_0700', '', '3', '', 0, '', 0, '', 0, '', 0, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, '', '', '', '', 0, ''),
('180105141238_0700', '180105141238_0700', 'UPMT/12', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105141431_0700', '180105141431_0700', 'UPMT/13', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105141613_0700', '180105141613_0700', 'UPMT/14', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105141726_0700', '180105141726_0700', 'UPMT/15', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105141911_0700', '180105141911_0700', 'UPMT/16', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105142009_0700', '180105142009_0700', 'UPMT/17', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105142137_0700', '180105142137_0700', 'UPMT/18', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105142426_0700', '180105142426_0700', 'UPMT/19', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105142534_0700', '180105142534_0700', 'UPMT/20', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('180105142626_0700', '180105142626_0700', 'UPMT/21', '1', 'femmyandri02@gmail.com', 0, '', 0, '', 0, '', 1, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('181106074930_0003', '180105101335_0700', '', '', '', 1, '', 1, '', 2, '', 1, '', 2, 0, 0, 0, 0, 0, 0, 'Lapangan Bola', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('181106074957_0001', '180105101335_0700', '', '', '', 2, '', 2, '', 1, '', 1, '', 2, 0, 0, 0, 0, 0, 0, 'Warung Bakmi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, '', '', '', '', 0, ''),
('181119022451_0009', '180105104211_0700', '', '', '', 0, 'test gejala12', 0, 'catatan dokter12', 0, 'obat lainnya21', 2, '', NULL, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey08_pembanding`
--

CREATE TABLE `survey08_pembanding` (
  `id_data_banding` varchar(50) NOT NULL,
  `id_data` varchar(50) DEFAULT NULL,
  `id_asset_internal` varchar(50) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `jarak_obyek` double NOT NULL,
  `foto_data` varchar(200) NOT NULL,
  `harga_penawaran` int(1) DEFAULT NULL,
  `harga_transaksi` double DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `sumber_data` varchar(50) DEFAULT NULL,
  `no_telepon` varchar(50) DEFAULT NULL,
  `peruntukan` int(1) DEFAULT NULL,
  `lebar_jalan_01` double DEFAULT NULL,
  `perkerasan` int(1) DEFAULT NULL,
  `kondisi_jalan` int(1) DEFAULT NULL,
  `angkutan_umum` int(1) DEFAULT NULL,
  `luas_tanah` double DEFAULT NULL,
  `sertifikat` varchar(50) DEFAULT NULL,
  `bentuk` varchar(50) DEFAULT NULL,
  `elevasi` double DEFAULT NULL,
  `lebar_jalan_02` double DEFAULT NULL,
  `sudut` int(1) DEFAULT NULL,
  `tusuk_sate` int(1) DEFAULT NULL,
  `harga_m2` double DEFAULT NULL,
  `luas_m2` double DEFAULT NULL,
  `dibangun_tahun` int(4) DEFAULT NULL,
  `penggunaan` int(1) DEFAULT NULL,
  `rangka` varchar(100) DEFAULT NULL,
  `jumlah_lantai` int(2) DEFAULT NULL,
  `lantai` varchar(100) DEFAULT NULL,
  `dinding` varchar(100) DEFAULT NULL,
  `atap` varchar(100) DEFAULT NULL,
  `langit_langit` varchar(100) DEFAULT NULL,
  `kondisi` text,
  `harga_m2_bangunan` double DEFAULT NULL,
  `sketsa` varchar(100) DEFAULT NULL,
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey08_pembanding`
--

INSERT INTO `survey08_pembanding` (`id_data_banding`, `id_data`, `id_asset_internal`, `user_id`, `group_id`, `latitude`, `longitude`, `jarak_obyek`, `foto_data`, `harga_penawaran`, `harga_transaksi`, `tanggal`, `sumber_data`, `no_telepon`, `peruntukan`, `lebar_jalan_01`, `perkerasan`, `kondisi_jalan`, `angkutan_umum`, `luas_tanah`, `sertifikat`, `bentuk`, `elevasi`, `lebar_jalan_02`, `sudut`, `tusuk_sate`, `harga_m2`, `luas_m2`, `dibangun_tahun`, `penggunaan`, `rangka`, `jumlah_lantai`, `lantai`, `dinding`, `atap`, `langit_langit`, `kondisi`, `harga_m2_bangunan`, `sketsa`, `approval`, `respond`) VALUES
('180105104211_0700', '180105104211_0700', '', '', '1', '', '', 0, '', 0, 0, '1997-12-31', '', '021-78138990', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Yayasan Tamariska', 0, 'Nandar Sunnandar', 'Vila Dago Blok CE 3/3', 'Ayudya Nuraini', 'Pelanita Pelangi', '', 0, '', 0, ''),
('180105104725_0700', '180105104725_0700', '', '', '3', '', '', 0, '', 0, 0, '1998-11-30', '', '021-7811730', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Yayasan Nurul Hikmah', 0, 'Eny Hidayati Setyaningsih', 'Pamulang Permai BLok DD/3', 'Ananda Sukarlan', 'Fifi Adelia', '', 0, '', 0, ''),
('180105105645_0700', '180105105645_0700', '', '', '2', '', '', 0, '', 0, 0, '2013-02-06', '', '021-7493434', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Guest', 0, 'Ibu Lilis Suryani', 'Jalan Pandawa Lima Raya No.2 Pamulang', 'Ibu Like Surahman', 'Ibu Nuny Nurulita', '', 0, '', 0, ''),
('190122103007_0003', '190122103007_0003', '', '', '4', '', '', 0, '', 0, 0, '2018-01-01', '', '021-78138996666', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Yayasan Sukma Mukti', 0, 'Bp. Mustakim Kurdi', 'Jalan Pandawa Lima X No 16', 'Ibu. Tating Suningsih', 'Bp. Onang Suhendar', '', 0, '', 0, ''),
('190122110927_0001', '190122110927_0001', '', '', '5', '', '', 0, '', 0, 0, '2017-07-04', '', '021-78138996666', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Yayasan Sukma Mukti', 0, 'Bp. Mustakim Kurdi', 'Jalan Pandawa Lima X No 16', 'Ibu. Tating Suningsih', 'Bp. Onang Suhendar', '', 0, '', 0, ''),
('190124094947_0008', '190124094947_0008', '', '', '6', '', '', 0, '', 0, 0, '2019-01-24', '', '021-9838388', 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 'Yayasan Noorman Kamaru', 0, 'Norman kamaru', 'Jl. Vila Deloma 90', 'Septi Setiyono', 'Agus Gustiana', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey09_bangunan`
--

CREATE TABLE `survey09_bangunan` (
  `id_bangunan` varchar(50) NOT NULL,
  `id_data` varchar(50) NOT NULL,
  `id_asset_internal` varchar(50) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `id_lokasi` varchar(30) DEFAULT NULL,
  `jenis_bangunan` int(1) DEFAULT NULL,
  `tipe_bangunan` int(1) DEFAULT NULL,
  `nama_bangunan` varchar(100) DEFAULT NULL,
  `nomor_asset` varchar(50) DEFAULT NULL,
  `tahun_bangun` int(4) DEFAULT NULL,
  `luas_bangunan_01` double DEFAULT NULL,
  `luas_bangunan_02` double NOT NULL,
  `jml_lantai` int(1) DEFAULT NULL,
  `jml_lantai_d` varchar(100) DEFAULT NULL,
  `pondasi` int(1) DEFAULT NULL,
  `pondasi_d` text,
  `rangka` int(1) DEFAULT NULL,
  `rangka_d1` varchar(200) DEFAULT NULL,
  `rangka_d2` varchar(200) NOT NULL,
  `dinding` int(1) DEFAULT NULL,
  `dinding_d` text,
  `atap` int(1) DEFAULT NULL,
  `atap_d` text,
  `rangka_atap` int(1) DEFAULT NULL,
  `rangka_atap_d` text,
  `langit_langit` int(1) DEFAULT NULL,
  `langit_langit_d` text,
  `lantai` int(1) DEFAULT NULL,
  `lantai_d` text,
  `partisi` int(1) DEFAULT NULL,
  `partisi_d` text,
  `pintu` int(1) DEFAULT NULL,
  `pintu_d` text,
  `rangka_pintu` int(1) DEFAULT NULL,
  `rangka_pintu_d` text,
  `jendela` int(1) DEFAULT NULL,
  `rangka_jendela` int(1) DEFAULT NULL,
  `rangka_jendela_d` varchar(200) NOT NULL,
  `listrik` int(1) DEFAULT NULL,
  `listrik_watt` int(6) DEFAULT NULL,
  `air` int(1) DEFAULT NULL,
  `air_dalam` double DEFAULT NULL,
  `plumbing` int(1) DEFAULT NULL,
  `telepon` int(2) DEFAULT NULL,
  `telepon_jenis` int(1) DEFAULT NULL,
  `ac_unit` int(3) NOT NULL,
  `ac_jenis` int(1) DEFAULT NULL,
  `ac_jenis_d` varchar(200) DEFAULT NULL,
  `ac_pk` double DEFAULT NULL,
  `pemadam` int(1) DEFAULT NULL,
  `penangkal_petir` int(1) DEFAULT NULL,
  `penangkal_petir_d` text,
  `lift_jml` int(2) DEFAULT NULL,
  `lift_jenis` int(1) DEFAULT NULL,
  `lift_kap_org` int(4) DEFAULT NULL,
  `lift_kap_brg` double DEFAULT NULL,
  `lift_merek_orang` varchar(50) DEFAULT NULL,
  `lift_merek_barang` varchar(50) NOT NULL,
  `elevator_unit` int(2) DEFAULT NULL,
  `elevator_lebar` double DEFAULT NULL,
  `elevator_panjang` double DEFAULT NULL,
  `elevator_kap_hari` int(6) DEFAULT NULL,
  `kondisi_bangunan` int(1) DEFAULT NULL,
  `status_pengelolaan` int(1) DEFAULT NULL,
  `pengguna` int(1) DEFAULT NULL,
  `pengguna_bidang` varchar(50) DEFAULT NULL,
  `pengguna_bagian` varchar(50) DEFAULT NULL,
  `status_asset` int(1) DEFAULT NULL,
  `status_d` text,
  `panjang_bangunan` double NOT NULL,
  `lebar_bangunan` double NOT NULL,
  `luas_bangunan` double NOT NULL,
  `imb_no` varchar(50) DEFAULT NULL,
  `imb_tgl` date DEFAULT NULL,
  `imb_keluar` varchar(50) DEFAULT NULL,
  `status_perolehan` int(1) DEFAULT NULL,
  `status_perolehan_d` text,
  `nilai_perolehan` double DEFAULT NULL,
  `status_penguasaan` int(1) DEFAULT NULL,
  `catatan` text,
  `sketsa_bangunan` varchar(200) DEFAULT NULL,
  `nilai_wajar` double NOT NULL COMMENT 'nilai wajar dari asset bangunan tersebut',
  `bukti_perhitungan` varchar(200) NOT NULL COMMENT 'lokasi file PDF bukti perhitungan nilai wajar tersebut',
  `approval` tinyint(1) NOT NULL,
  `respond` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey09_bangunan`
--

INSERT INTO `survey09_bangunan` (`id_bangunan`, `id_data`, `id_asset_internal`, `user_id`, `group_id`, `id_lokasi`, `jenis_bangunan`, `tipe_bangunan`, `nama_bangunan`, `nomor_asset`, `tahun_bangun`, `luas_bangunan_01`, `luas_bangunan_02`, `jml_lantai`, `jml_lantai_d`, `pondasi`, `pondasi_d`, `rangka`, `rangka_d1`, `rangka_d2`, `dinding`, `dinding_d`, `atap`, `atap_d`, `rangka_atap`, `rangka_atap_d`, `langit_langit`, `langit_langit_d`, `lantai`, `lantai_d`, `partisi`, `partisi_d`, `pintu`, `pintu_d`, `rangka_pintu`, `rangka_pintu_d`, `jendela`, `rangka_jendela`, `rangka_jendela_d`, `listrik`, `listrik_watt`, `air`, `air_dalam`, `plumbing`, `telepon`, `telepon_jenis`, `ac_unit`, `ac_jenis`, `ac_jenis_d`, `ac_pk`, `pemadam`, `penangkal_petir`, `penangkal_petir_d`, `lift_jml`, `lift_jenis`, `lift_kap_org`, `lift_kap_brg`, `lift_merek_orang`, `lift_merek_barang`, `elevator_unit`, `elevator_lebar`, `elevator_panjang`, `elevator_kap_hari`, `kondisi_bangunan`, `status_pengelolaan`, `pengguna`, `pengguna_bidang`, `pengguna_bagian`, `status_asset`, `status_d`, `panjang_bangunan`, `lebar_bangunan`, `luas_bangunan`, `imb_no`, `imb_tgl`, `imb_keluar`, `status_perolehan`, `status_perolehan_d`, `nilai_perolehan`, `status_penguasaan`, `catatan`, `sketsa_bangunan`, `nilai_wajar`, `bukti_perhitungan`, `approval`, `respond`) VALUES
('180105104211_0700', '180105104211_0700', '', 'femmyandri02@gmail.com', '1', '', 1, 2, '2019-01-23', '2019-02-06', 0, 0, 0, 0, '2019-03-06', 0, 'Kementerian Kesehatan', 0, '2019-04-11', '2019-05-08', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '2019-06-20', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-07-18', 0, 0, 0, '', 0, 1, 0, 0, '2019-08-22', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, ''),
('180105104725_0700', '180105104725_0700', '', '', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, ''),
('180105105645_0700', '180105105645_0700', '', 'femmyandri02@gmail.com', '1', '', 1, 2, '2019-01-01', '2019-11-26', 0, 0, 0, 0, '2019-01-30', 0, 'Kementerian Kesehatan', 0, '2019-01-31', '2019-01-24', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '2019-01-09', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-01-16', 0, 0, 0, '', 0, 1, 0, 0, '2019-01-10', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, ''),
('180105110422_0700', '180105110422_0700', 'UPMT/3/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 10', 'UPMT-180-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 83, '503/7911/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'DSCN0070.JPG', 0, '', 0, ''),
('180105110604_0700', '180105110604_0700', 'UPMT/4/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 11', 'UPMT-181-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7912/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105111631_0700', '180105111631_0700', 'UPMT/5/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 17', 'UPMT-193-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 82, '503/7914/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105111755_0700', '180105111755_0700', 'UPMT/6/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 18', 'UPMT-194-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 55, '503/7915/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105112204_0700', '180105112204_0700', 'UPMT/7/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 19', 'UPMT-182-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 98, '503/7916/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'IMG_4952.JPG', 0, '', 0, ''),
('180105112312_0700', '180105112312_0700', 'UPMT/8/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 20', 'UPMT-183-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 85, '503/7917/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'IMG_4965.JPG', 0, '', 0, ''),
('180105112439_0700', '180105112439_0700', 'UPMT/9/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 21', 'UPMT-184-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7918/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'IMG_4982.JPG', 0, '', 0, ''),
('180105112702_0700', '180105112702_0700', 'UPMT/10/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 22', 'UPMT-185-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7919/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'IMG_4994.JPG', 0, '', 0, ''),
('180105134447_0700', '180105134447_0700', '', '', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, ''),
('180105141238_0700', '180105141238_0700', 'UPMT/12/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 27', 'UPMT-187-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 2, '', 0, 0, 82, '503/7921/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'DSCN0274.JPG', 0, '', 0, ''),
('180105141431_0700', '180105141431_0700', 'UPMT/13/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 28', 'UPMT-188-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7922/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', 'IMG_5039.JPG', 0, '', 0, ''),
('180105141613_0700', '180105141613_0700', 'UPMT/14/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 29', 'UPMT-189-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7923/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105141726_0700', '180105141726_0700', 'UPMT/15/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 30', 'UPMT-190-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7924/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105141911_0700', '180105141911_0700', 'UPMT/16/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 31', 'UPMT-191-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 82, '503/7925/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105142009_0700', '180105142009_0700', 'UPMT/17/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 32', 'UPMT-192-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7926/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105142137_0700', '180105142137_0700', 'UPMT/18/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 6 No. 33', 'UPMT-209-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7927/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105142426_0700', '180105142426_0700', 'UPMT/19/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 7 No. 18', 'UPMT-196-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 90, '503/7933/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105142534_0700', '180105142534_0700', 'UPMT/20/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 7 No. 19', 'UPMT-197-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 1, '', 0, 0, 84, '503/7934/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180105142626_0700', '180105142626_0700', 'UPMT/21/2-1', 'femmyandri02@gmail.com', '1', '', 1, 2, 'Rumah Dinas HM 7 No. 20', 'UPMT-198-1', 2003, 0, 0, 1, '', 1, '', 1, '', '', 1, '', 1, '', 1, '', 2, '', 2, '', 1, '', 2, '', 2, '', 1, 2, '', 1, 1300, 1, 0, 1, 3, 0, 3, 0, '', 0, 0, 3, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 2, 1, 0, '', '', 2, '', 0, 0, 55, '503/7935/C/DPPB', '2006-03-23', 'Pemerintah Kabupaten Bekasi', 1, '', 0, 1, '', '', 0, '', 0, ''),
('180118105547_0004', '180105101335_0700', 'PJB2/2/2-1', 'prie2474@gmail.com', '5', '', 3, 2, 'GUDANG UTAMA', 'PJB2-161-1', 1978, 0, 0, 1, '', 3, '', 1, '', '', 1, '', 0, 'Dak Beton', 3, '', 0, '', 2, '', 0, '', 0, 'Flat Besi', 0, 'Baja', 0, 0, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 3, 1, 0, '', '', 1, '', 0, 0, 905, '', '0000-00-00', '', 0, '', 0, 1, '', '', 0, '', 0, ''),
('180118105726_0002', '180105101335_0700', 'PJB2/2/2-2', 'prie2474@gmail.com', '5', '', 3, 1, 'GUDANG TAMBAHAN', '', 1978, 0, 0, 1, '', 2, '', 1, '', '', 1, '', 0, 'Asbes', 1, '', 0, 'Triplek', 2, '', 0, '', 2, '', 2, '', 1, 2, '', 1, 0, 1, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 4, 1, 0, '', '', 2, '', 0, 0, 108, '', '0000-00-00', '', 0, '', 0, 1, '', '', 0, '', 0, ''),
('180118105839_0006', '180105101335_0700', 'PJB2/2/2-3', 'prie2474@gmail.com', '5', '', 3, 2, 'EX GUDANG', '', 1978, 0, 0, 1, '', 2, '', 2, '', '', 0, '', 0, '', 2, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 0, 0, 0, '', '', 0, 0, 0, 0, 4, 1, 0, '', '', 2, '', 0, 0, 666, '', '0000-00-00', '', 0, '', 0, 1, '', '', 0, '', 0, ''),
('190115103958_0003', '180105104211_0700', '', '', '', '', 0, 1, '2019-01-31', '2019-02-28', 0, 0, 0, 0, '2019-03-31', 0, 'Dinas Kesehatan Tangsel', 0, '2019-04-30', '2019-05-31', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '2019-06-30', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-07-31', 0, 0, 0, '', 0, 2, 0, 0, '2019-08-31', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, ''),
('190115104337_0001', '180105105645_0700', '', 'tsbudijanto', '1', '', 2, 1, '2019-01-16', '2019-02-06', 0, 0, 0, 0, '2019-03-06', 0, 'Dinas Kesehatan Tangsel2', 0, '2019-04-11', '2019-02-07', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '2019-02-07', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-01-31', 0, 0, 0, '', 0, 1, 0, 0, '2019-01-24', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, ''),
('190117080404_0000', '180105113006_0700', '', '', '1', '', 2, 0, '2019-01-01', '2019-02-01', 0, 0, 0, 0, '2019-03-01', 0, 'Kementerian Kesehatan', 0, '2019-04-01', '2019-05-01', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '2019-06-01', 0, 0, 0, 0, 0, 0, 0, 0, 0, '2019-07-01', 0, 0, 0, '', 0, 1, 0, 0, '2019-08-01', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, ''),
('190117081444_0007', '180105113006_0700', '', '', '1', '', 1, 0, '', '', 0, 0, 0, 0, '', 0, 'Kementerian Kesehatan', 0, '', '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, '', 0, 1, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, '', '', 0, '', 0, 0, 0, '', '0000-00-00', '', 0, '', 0, 0, '', NULL, 0, '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `survey11_ft_batas_tapak`
--

CREATE TABLE `survey11_ft_batas_tapak` (
  `id_foto_batas_tapak` int(10) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `id_data` varchar(50) NOT NULL COMMENT 'refer to survey01_lokasi',
  `batas_utara` text NOT NULL,
  `batas_selatan` text NOT NULL,
  `batas_timur` text NOT NULL,
  `batas_barat` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey11_ft_batas_tapak`
--

INSERT INTO `survey11_ft_batas_tapak` (`id_foto_batas_tapak`, `group_id`, `id_data`, `batas_utara`, `batas_selatan`, `batas_timur`, `batas_barat`) VALUES
(7, '', '180103154501_0700', '1514972879_u.jpg', '1514972879_s.jpg', '1514972879_t.jpg', '1514972879_b.jpg'),
(6, '', '180103025420_0005', '1514972791_u.jpg', '1514972791_s.jpg', '1514972791_t.jpg', '1514972791_b.jpg'),
(8, '', '180103011046_0001', '1515062954_u.jpg', '1515062954_s.jpg', '1515062954_t.jpg', '1515062954_b.jpg'),
(9, '', '180104095638_0700', '1515076962_u.jpg', '1515237855_s.jpg', '1515076962_t.jpg', '1515076962_b.jpg'),
(10, '', '180105101335_0700', '', '', '', ''),
(11, '', '180105104211_0700', '', '', '', ''),
(12, '', '180106094825_0700', '1515423369_u.jpg', '1515334390_s.jpg', '1515334390_t.jpg', '1515334390_b.jpg'),
(13, '', '180106104041_0700', '1515324568_u.jpg', '1515324568_s.jpg', '1515324568_t.jpg', '1515324568_b.jpg'),
(14, '', '180106111903_0700', '1515316082_u.jpg', '1515316082_s.jpg', '1515316082_t.jpg', '1515316082_b.jpg'),
(15, '', '180106122313_0700', '1515255625_u.jpg', '1515255625_s.jpg', '1515255625_t.jpg', '1515255625_b.jpg'),
(16, '', '180106131257_0700', '1515259745_u.jpg', '1515259745_s.jpg', '1515259745_t.jpg', '1515259745_b.jpg'),
(17, '', '180108152701_0700', '1515426259_u.jpg', '1515426259_s.jpg', '1515426259_t.jpg', '1515426259_b.jpg'),
(18, '', '180108163748_0700', '1515427589_u.jpg', '1515427589_s.jpg', '1515427589_t.jpg', '1515427589_b.jpg'),
(19, '', '180108164749_0700', '1515430381_u.jpg', '1515427736_s.jpg', '1515427736_t.jpg', '1515430381_b.jpg'),
(20, '', '180109101342_0009', '1515467371_u.jpg', '1515467371_s.jpg', '1515467371_t.jpg', '1515467371_b.jpg'),
(21, '', '180110074159_0700', '1515545807_u.jpg', '1515545807_s.jpg', '1515545807_t.jpg', '1515545807_b.jpg'),
(22, '', '180110075634_0700', '1515546060_u.jpg', '1515546060_s.jpg', '1515546060_t.jpg', '1515546060_b.jpg'),
(23, '', '180110081636_0006', '1515545419_u.jpg', '1515545419_s.jpg', '1515545419_t.jpg', '1515545419_b.jpg'),
(24, '', '180110082424_0006', '1515547382_u.jpg', '1515547382_s.jpg', '1515547382_t.jpg', '1515547382_b.jpg'),
(25, '', '180110081051_0700', '1515547581_u.jpg', '1515547581_s.jpg', '1515547581_t.jpg', '1515547581_b.jpg'),
(26, '', '180110141927_0002', '1515568738_u.jpg', '1515568738_s.jpg', '1515568738_t.jpg', '1515568738_b.jpg'),
(27, '', '180110145736_0700', '1515572306_u.jpg', '1515572306_s.jpg', '1515572306_t.jpg', '1515572306_b.jpg'),
(28, '', '180111034932_0700', '1515617547_u.jpg', '1515617547_s.jpg', '1515617547_t.jpg', '1515617547_b.jpg'),
(29, '', '180115085125_0005', '1516034688_u.jpg', '1516034688_s.jpg', '1516034688_t.jpg', '1516034688_b.jpg'),
(30, '', '180115101256_0700', '1515986070_u.jpg', '1515986070_s.jpg', '1515986070_t.jpg', '1515986070_b.jpg'),
(31, '', '180105150614_0700', '1516002810_u.jpg', '1516002810_s.jpg', '1516002810_t.jpg', '1516002810_b.jpg'),
(32, '', '180113143028_0700', '1516011829_u.jpg', '1516011829_s.jpg', '1516011829_t.jpg', '1516011829_b.jpg'),
(33, '', '180110132015_0700', '1516013019_u.jpg', '1516013019_s.jpg', '1516013019_t.jpg', '1516013019_b.jpg'),
(34, '', '180105095935_0700', '1516067244_u.jpg', '1516067244_s.jpg', '1516067244_t.jpg', '1516067244_b.jpg'),
(35, '', '180105142753_0700', '1516069186_u.jpg', '1516069186_s.jpg', '1516069186_t.jpg', '1516069186_b.jpg'),
(36, '', '180105083600_0700', '', '', '', ''),
(37, '', '180113144345_0700', '1516087236_u.jpg', '1516087236_s.jpg', '1516087236_t.jpg', '1516087236_b.jpg'),
(38, '', '180116150938_0004', '1516091325_u.jpg', '1516091325_s.jpg', '1516091325_t.jpg', '1516091903_b.jpg'),
(39, '', '180112090133_0700', '1516091950_u.jpg', '1516091950_s.jpg', '1516091950_t.jpg', '1516091950_b.jpg'),
(40, '', '180113155732_0700', '1516091295_u.jpg', '1516091295_s.jpg', '1516091295_t.jpg', '1516091295_b.jpg'),
(41, '', '180105160233_0700', '1516178397_u.jpg', '1516178397_s.jpg', '1516178397_t.jpg', '1516178397_b.jpg'),
(42, '', '180106102332_0700', '1516178609_u.jpg', '1516178609_s.jpg', '1516178609_t.jpg', '1516178609_b.jpg'),
(43, '', '180118113511_0008', '1516249956_u.jpg', '1516249956_s.jpg', '1516249956_t.jpg', '1516249956_b.jpg'),
(44, '', '180115111649_0700', '1516257204_u.jpg', '1516257674_s.jpg', '1516257674_t.jpg', '1516257674_b.jpg'),
(45, '', '180105105645_0700', '', '', '', ''),
(46, '', '180105110422_0700', '', '', '', ''),
(47, '', '180105110604_0700', '', '', '', ''),
(48, '', '180105111631_0700', '1516261419_u.jpg', '1516261419_s.jpg', '1516261419_t.jpg', '1516261419_b.jpg'),
(49, '', '180105111755_0700', '', '', '', ''),
(50, '', '180105112204_0700', '1516261502_u.jpg', '1516261502_s.jpg', '1516261502_t.jpg', '1516261502_b.jpg'),
(51, '', '180105112312_0700', '', '', '', ''),
(52, '', '180105112439_0700', '', '', '', ''),
(53, '', '180105112702_0700', '', '', '', ''),
(54, '', '180105113006_0700', '', '', '', ''),
(55, '', '180105141238_0700', '1516262076_u.jpg', '1516262076_s.jpg', '1516262076_t.jpg', '1516262076_b.jpg'),
(56, '', '180105141431_0700', '', '', '', ''),
(57, '', '180105141613_0700', '1516263488_u.jpg', '1516263488_s.jpg', '1516263488_t.jpg', '1516263488_b.jpg'),
(58, '', '180105141726_0700', '1516263585_u.jpg', '1516263585_s.jpg', '1516263585_t.jpg', '1516263585_b.jpg'),
(59, '', '180105141911_0700', '1516263658_u.jpg', '1516263658_s.jpg', '1516263658_t.jpg', '1516263658_b.jpg'),
(60, '', '180105142009_0700', '1516263717_u.jpg', '1516263717_s.jpg', '1516263717_t.jpg', '1516263717_b.jpg'),
(61, '', '180105142137_0700', '1516263797_u.jpg', '1516263797_s.jpg', '1516263797_t.jpg', '1516263797_b.jpg'),
(62, '', '180105142426_0700', '1516263895_u.jpg', '1516263895_s.jpg', '1516263895_t.jpg', '1516263895_b.jpg'),
(63, '', '180105142534_0700', '1516263964_u.jpg', '1516263964_s.jpg', '1516263964_t.jpg', '1516263964_b.jpg'),
(64, '', '180105142626_0700', '1516264018_u.jpg', '1516264018_s.jpg', '1516264018_t.jpg', '1516264018_b.jpg'),
(65, '', '180105142730_0700', '1516264073_u.jpg', '1516264073_s.jpg', '1516264073_t.jpg', '1516264073_b.jpg'),
(66, '', '180105142819_0700', '1516264124_u.jpg', '1516264124_s.jpg', '1516264124_t.jpg', '1516264124_b.jpg'),
(67, '', '180105145153_0700', '1516264359_u.jpg', '1516264359_s.jpg', '1516264359_t.jpg', '1516264359_b.jpg'),
(68, '', '180105151502_0700', '1516264856_u.jpg', '1516264856_s.jpg', '1516264856_t.jpg', '1516264856_b.jpg'),
(69, '', '180109113649_0700', '1516265017_u.jpg', '1516265017_s.jpg', '1516265017_t.jpg', '1516265017_b.jpg'),
(70, '', '180110112221_0700', '1516265202_u.jpg', '1516265202_s.jpg', '1516265202_t.jpg', '1516265202_b.jpg'),
(71, '', '180110102112_0700', '1516265494_u.jpg', '1516265494_s.jpg', '1516265494_t.jpg', '1516265494_b.jpg'),
(72, '', '180106102501_0700', '1516265624_u.jpg', '1516265624_s.jpg', '1516265624_t.jpg', '1516265624_b.jpg'),
(73, '', '180109104040_0700', '1516265646_u.jpg', '1516265646_s.jpg', '1516265646_t.jpg', '1516265646_b.jpg'),
(74, '', '180106102820_0700', '1516265700_u.jpg', '1516265700_s.jpg', '1516265700_t.jpg', '1516265700_b.jpg'),
(75, '', '180110104207_0700', '1516265706_u.jpg', '1516265706_s.jpg', '1516265706_t.jpg', '1516265706_b.jpg'),
(76, '', '180106144951_0700', '1516265774_u.jpg', '1516265774_s.jpg', '1516265774_t.jpg', '1516265774_b.jpg'),
(77, '', '180106102935_0700', '1516265770_u.jpg', '1516265770_s.jpg', '1516265770_t.jpg', '1516265770_b.jpg'),
(78, '', '180106163146_0700', '1516266042_u.jpg', '1516266042_s.jpg', '1516266042_t.jpg', '1516266042_b.jpg'),
(79, '', '180106140531_0700', '1516266067_u.jpg', '1516266067_s.jpg', '1516266067_t.jpg', '1516266067_b.jpg'),
(80, '', '180106122725_0700', '1516266122_u.jpg', '1516266122_s.jpg', '1516266122_t.jpg', '1516266122_b.jpg'),
(81, '', '180109094153_0700', '1516273445_u.jpg', '1516273445_s.jpg', '1516273445_t.jpg', '1516273445_b.jpg'),
(82, '', '180111114025_0700', '1516274019_u.jpg', '1516273920_s.jpg', '1516273920_t.jpg', '1516273920_b.jpg'),
(83, '', '180109152629_0700', '1516274247_u.jpg', '1516274247_s.jpg', '1516274247_t.jpg', '1516274247_b.jpg'),
(84, '', '180111162055_0700', '1516274212_u.jpg', '1516274212_s.jpg', '1516274212_t.jpg', '1516274212_b.jpg'),
(85, '', '180115110458_0700', '1516274479_u.jpg', '1516274479_s.jpg', '1516274479_t.jpg', '1516274479_b.jpg'),
(86, '', '180115110718_0700', '1516276353_u.jpg', '1516276353_s.jpg', '1516276353_t.jpg', '1516276353_b.jpg'),
(87, '', '180115114356_0700', '1516276672_u.jpg', '1516276672_s.jpg', '1516276672_t.jpg', '1516276672_b.jpg'),
(88, '', '180115114511_0700', '1516277078_u.jpg', '1516277078_s.jpg', '1516277078_t.jpg', '1516277078_b.jpg'),
(89, '', '180115114929_0700', '1516277251_u.jpg', '1516277251_s.jpg', '1516277251_t.jpg', '1516277251_b.jpg'),
(90, '', '180116151424_0700', '1516277396_u.jpg', '1516277396_s.jpg', '1516277396_t.jpg', '1516277396_b.jpg'),
(91, '', '180108112415_0700', '1516280994_u.jpg', '1516280994_s.jpg', '1516280994_t.jpg', '1516280994_b.jpg'),
(92, '', '180109134818_0700', '1516332111_u.jpg', '1516332111_s.jpg', '1516332111_t.jpg', '1516332111_b.jpg'),
(93, '', '180109123707_0700', '1516332237_u.jpg', '1516332237_s.jpg', '1516332237_t.jpg', '1516332237_b.jpg'),
(94, '', '180109142702_0700', '1516332310_u.jpg', '1516332310_s.jpg', '1516332310_t.jpg', '1516332310_b.jpg'),
(95, '', '180106102507_0700', '1516336030_u.jpg', '1516336030_s.jpg', '1516336030_t.jpg', '1516336030_b.jpg'),
(96, '', '180106123039_0700', '1516336324_u.jpg', '1516336324_s.jpg', '1516336324_t.jpg', '1516336324_b.jpg'),
(97, '', '180105134447_0700', '1516336754_u.jpg', '1516336754_s.jpg', '1516336754_t.jpg', '1516336754_b.jpg'),
(98, '', '180108153852_0700', '1516596508_u.jpg', '1516596508_s.jpg', '1516596508_t.jpg', '1516596508_b.jpg'),
(99, '', '180108164735_0700', '1516603511_u.jpg', '1516603511_s.jpg', '1516603511_t.jpg', '1516603511_b.jpg'),
(100, '', '180108120530_0700', '1516609683_u.jpg', '1516609683_s.jpg', '1516609683_t.jpg', '1516609683_b.jpg'),
(101, '', '180109093800_0700', '1516608830_u.jpg', '1516608830_s.jpg', '1516608830_t.jpg', '1516608830_b.jpg'),
(102, '', '180108133235_0700', '1516610834_u.jpg', '1516610834_s.jpg', '1516610834_t.jpg', '1516610834_b.jpg'),
(103, '', '180122160406_0000', '1516611544_u.jpg', '1516611544_s.jpg', '1516611544_t.jpg', '1516611544_b.jpg'),
(104, '', '180109104756_0700', '1516611734_u.jpg', '1516611734_s.jpg', '1516611734_t.jpg', '1516611734_b.jpg'),
(105, '', '180122171928_0008', '1516616274_u.jpg', '1516616274_s.jpg', '1516616274_t.jpg', '1516616274_b.jpg'),
(106, '', '180105145221_0700', '1516675141_u.jpg', '1516675141_s.jpg', '1516675141_t.jpg', '1516675141_b.jpg'),
(107, '', '180105104725_0700', '1516675381_u.jpg', '1516675381_s.jpg', '1516675381_t.jpg', '1516675381_b.jpg'),
(108, '', '180123102401_0002', '1516677652_u.jpg', '1516677652_s.jpg', '1516677652_t.jpg', '1516677652_b.jpg'),
(109, '', '180123105400_0002', '1516679572_u.jpg', '1516679572_s.jpg', '1516679572_t.jpg', '1516679572_b.jpg'),
(110, '', '180123111039_0000', '1516680614_u.jpg', '1516680614_s.jpg', '1516680614_t.jpg', '1516680614_b.jpg'),
(111, '', '180123112705_0008', '1516681596_u.jpg', '1516681596_s.jpg', '1516681596_t.jpg', '1516681596_b.jpg'),
(112, '', '181026045206_0003', '1516069397_u.jpg', '1516069397_s.jpg', '1516069397_t.jpg', '1516069397_b.jpg'),
(113, '', '181026045540_0002', '1516069397_u.jpg', '1516069397_s.jpg', '1516069397_t.jpg', '1516069397_b.jpg'),
(114, '', '181026045615_0009', '1516069397_u.jpg', '1516069397_s.jpg', '1516069397_t.jpg', '1516069397_b.jpg'),
(115, '', '181026045826_0000', '1516069397_u.jpg', '1516069397_s.jpg', '1516069397_t.jpg', '1516069397_b.jpg'),
(116, '', '181026051309_0003', '1516069397_u.jpg', '1516069397_s.jpg', '1516069397_t.jpg', '1516069397_b.jpg'),
(117, '', '181026053105_0000', '', '', '', ''),
(118, '', '181029041905_0004', '', '', '', ''),
(119, '', '181029042720_0001', '', '', '', ''),
(120, '', '181029045726_0000', '', '', '', ''),
(121, '', '181029050408_0004', '', '', '', ''),
(122, '', '181029050528_0009', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `survey12_ft_sketsa_tapak`
--

CREATE TABLE `survey12_ft_sketsa_tapak` (
  `id_foto_sketsa_tapak` int(10) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `id_data` varchar(50) NOT NULL COMMENT 'refer to survey01_lokasi',
  `lokasi_sketsa` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey12_ft_sketsa_tapak`
--

INSERT INTO `survey12_ft_sketsa_tapak` (`id_foto_sketsa_tapak`, `group_id`, `id_data`, `lokasi_sketsa`) VALUES
(1, '9', '180103011046_0001', '1515063105.jpg'),
(2, '5', '180104095638_0700', '1515637639.jpg'),
(23, '1', '180115101256_0700', '1515986070.jpg'),
(3, '', '180105101335_0700', '12.34'),
(4, '', '180105104211_0700', '37'),
(5, '5', '180106094825_0700', '1515639244.jpg'),
(6, '5', '180106104041_0700', '1515639531.jpg'),
(7, '5', '180106111903_0700', '1515639738.jpg'),
(8, '5', '180106122313_0700', '1515639916.jpg'),
(9, '5', '180106131257_0700', '1515640046.jpg'),
(22, '1', '180115085125_0005', '1516034688_b.jpg'),
(10, '5', '180108152701_0700', '1515640245.jpg'),
(11, '5', '180108163748_0700', '1515650079.jpg'),
(12, '5', '180108164749_0700', '1515651348.jpg'),
(13, '5', '180109101342_0009', '1515467371.jpg'),
(14, '1', '180110074159_0700', '1515545807.jpg'),
(15, '5', '180110075634_0700', '1515546060.jpg'),
(16, '9', '180110081636_0006', '1515545419.jpg'),
(17, '9', '180110082424_0006', '1515547382.jpg'),
(18, '5', '180110081051_0700', '1515547581.jpg'),
(19, '1', '180110141927_0002', 'cz1515568738.jpg'),
(20, '1', '180110145736_0700', '1515572306.jpg'),
(21, '1', '180111034932_0700', '1515617547.jpg'),
(24, '4', '180105150614_0700', '1516002810.jpg'),
(25, '7', '180113143028_0700', '1516011829_b.jpg'),
(26, '6', '180110132015_0700', '1516013019.jpg'),
(27, '3', '180105095935_0700', '1516067244.jpg'),
(28, '4', '180105142753_0700', '1516069186.jpg'),
(29, '', '180105083600_0700', ''),
(30, '7', '180113144345_0700', '1516087236.jpg'),
(31, '7', '180116150938_0004', '1516091903_b.jpg'),
(32, '7', '180112090133_0700', '1516091950_b.jpg'),
(33, '7', '180113155732_0700', '1516091295.jpg'),
(34, '1', '180105160233_0700', '1516178397.jpg'),
(35, '1', '180106102332_0700', '1516178609.jpg'),
(36, '1', '180118113511_0008', '1516249956.jpg'),
(37, '2', '180115111649_0700', '1516257674.jpg'),
(38, '', '180105105645_0700', '37'),
(39, '', '180105110422_0700', '37'),
(40, '', '180105110604_0700', '37'),
(41, '1', '180105111631_0700', '1516261419.jpg'),
(42, '', '180105111755_0700', '37'),
(43, '1', '180105112204_0700', '1516261502.jpg'),
(44, '', '180105112312_0700', '37'),
(45, '', '180105112439_0700', '37'),
(46, '1', '180105112702_0700', '37'),
(47, '1', '180105113006_0700', '37'),
(48, '1', '180105141238_0700', '1516262076.jpg'),
(49, '', '180105141431_0700', '37'),
(50, '1', '180105141613_0700', '1516263488.jpg'),
(51, '1', '180105141726_0700', '1516263585.jpg'),
(52, '1', '180105141911_0700', '1516263658.jpg'),
(53, '1', '180105142009_0700', '1516263717.jpg'),
(54, '1', '180105142137_0700', '1516263797.jpg'),
(55, '1', '180105142426_0700', '1516263895.jpg'),
(56, '1', '180105142534_0700', '1516263964.jpg'),
(57, '1', '180105142626_0700', '1516264018.jpg'),
(58, '1', '180105142730_0700', '1516264073.jpg'),
(59, '1', '180105142819_0700', '1516264124.jpg'),
(60, '1', '180105145153_0700', '1516264359.jpg'),
(61, '1', '180105151502_0700', '1516264856.jpg'),
(62, '3', '180109113649_0700', '1516265017.jpg'),
(63, '3', '180110112221_0700', '1516265202.jpg'),
(64, '3', '180110102112_0700', '1516265494.jpg'),
(65, '1', '180106102501_0700', '1516265624.jpg'),
(66, '3', '180109104040_0700', '1516265646.jpg'),
(67, '1', '180106102820_0700', '1516265700.jpg'),
(68, '3', '180110104207_0700', '1516265706.jpg'),
(69, '3', '180106144951_0700', '1516265774.jpg'),
(70, '1', '180106102935_0700', '1516265770.jpg'),
(71, '3', '180106163146_0700', '1516266042.jpg'),
(72, '3', '180106140531_0700', '1516266067.jpg'),
(73, '3', '180106122725_0700', '1516266122.jpg'),
(74, '2', '180109094153_0700', '1516273445.jpg'),
(75, '2', '180111114025_0700', '1516274019.jpg'),
(76, '3', '180109152629_0700', '1516274247.jpg'),
(77, '2', '180111162055_0700', '1516274212.jpg'),
(78, '2', '180115110458_0700', '1516274479.jpg'),
(79, '2', '180115110718_0700', '1516276353.jpg'),
(80, '2', '180115114356_0700', '1516276672.jpg'),
(81, '2', '180115114511_0700', '1516277078.jpg'),
(82, '2', '180115114929_0700', '1516277251.jpg'),
(83, '2', '180116151424_0700', '1516277396.jpg'),
(84, '1', '180108112415_0700', '1516280994.jpg'),
(85, '3', '180109134818_0700', '1516332111.jpg'),
(86, '3', '180109123707_0700', '1516332237.jpg'),
(87, '3', '180109142702_0700', '1516332310.jpg'),
(88, '3', '180106102507_0700', '1516336030.jpg'),
(89, '3', '180106123039_0700', '1516336324.jpg'),
(90, '', '180105134447_0700', '1516336754.jpg'),
(91, '4', '180108153852_0700', '1516596508.jpg'),
(92, '4', '180108164735_0700', '1516603511.jpg'),
(93, '8', '180108120530_0700', '1516609683.jpg'),
(94, '4', '180109093800_0700', '1516608830.jpg'),
(95, '8', '180108133235_0700', '1516610834.jpg'),
(96, '8', '180122160406_0000', '1516611544.jpg'),
(97, '4', '180109104756_0700', '1516611734.jpg'),
(98, '1', '180122171928_0008', '1516616274.jpg'),
(99, '3', '180105145221_0700', '1516675141.jpg'),
(100, '', '180105104725_0700', '1516675381.jpg'),
(101, '8', '180123102401_0002', '1516677652.jpg'),
(102, '8', '180123105400_0002', '1516679572.jpg'),
(103, '8', '180123111039_0000', '1516680614.jpg'),
(104, '8', '180123112705_0008', '1516681596.jpg'),
(105, '', '181026045206_0003', '1516069397.jpg'),
(106, '', '181026045540_0002', '1516069397.jpg'),
(107, '', '181026045615_0009', '1516069397.jpg'),
(108, '', '181026045826_0000', '1516069397.jpg'),
(109, '', '181026051309_0003', '1516069397.jpg'),
(110, '', '181026053105_0000', ''),
(111, '', '181029041905_0004', ''),
(112, '', '181029042720_0001', ''),
(113, '', '181029045726_0000', ''),
(114, '', '181029050408_0004', ''),
(115, '', '181029050528_0009', '');

-- --------------------------------------------------------

--
-- Table structure for table `survey13_ft_pembanding`
--

CREATE TABLE `survey13_ft_pembanding` (
  `id_foto_pembanding` int(10) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `id_data_banding` varchar(50) NOT NULL COMMENT 'refer to survey08_pembanding',
  `tampak_depan` text NOT NULL,
  `tampak_jalan_depan` text NOT NULL,
  `sketsa_lokasi` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey13_ft_pembanding`
--

INSERT INTO `survey13_ft_pembanding` (`id_foto_pembanding`, `group_id`, `id_data_banding`, `tampak_depan`, `tampak_jalan_depan`, `sketsa_lokasi`) VALUES
(1, '8', '180104045948_0008', 'pbd_1515063543_dpn.jpg', 'pbd_1515063543_jln_dpn.jpg', 'pbd_1515063543_sketsa.jpg'),
(2, '5', '180109102825_0005', 'pbd_1515468343_dpn.jpg', 'pbd_1515468524_jln_dpn.jpg', 'pbd_1515468524_jln_dpn.jpg'),
(3, '5', '180109102951_0006', 'pbd_1515468574_dpn.jpg', 'pbd_1515468574_jln_dpn.jpg', 'pbd_1515468574_sketsa.jpg'),
(4, '5', '180109103010_0009', 'pbd_1515468595_dpn.jpg', 'pbd_1515468595_jln_dpn.jpg', 'pbd_1515468595_sketsa.jpg'),
(5, '5', '180110081547_0001', 'pbd_1515546932_dpn.jpg', 'pbd_1515546932_jln_dpn.jpg', 'pbd_1515546932_sketsa.jpg'),
(6, '', '180110081621_0008', '', '', ''),
(7, '', '180110081709_0009', '', '', ''),
(8, '5', '180110082002_0006', 'pbd_1515547185_dpn.jpg', 'pbd_1515547185_jln_dpn.jpg', 'pbd_1515547185_sketsa.jpg'),
(9, '2', '180110143058_0001', 'pbd_1515569429_dpn.jpg', 'pbd_1515569429_jln_dpn.jpg', 'pbd_1515569429_sketsa.jpg'),
(10, '2', '180110143532_0000', 'pbd_1515569699_dpn.jpg', 'pbd_1515569699_jln_dpn.jpg', 'pbd_1515569699_sketsa.jpg'),
(11, '1', '180110145736_0700', 'pbd_1515571163_dpn.jpg', 'pbd_1515571163_jln_dpn.jpg', 'pbd_1515571163_sketsa.jpg'),
(12, '1', '180110150058_0000', 'pbd_1515571205_dpn.jpg', 'pbd_1515571205_jln_dpn.jpg', 'pbd_1515571205_sketsa.jpg'),
(13, '1', '180110150849_0000', 'pbd_1515571685_dpn.jpg', 'pbd_1515571685_jln_dpn.jpg', 'pbd_1515571685_sketsa.jpg'),
(14, '1', '180115090006_0006', 'pbd_1515981571_dpn.jpg', 'pbd_1515981571_jln_dpn.jpg', 'pbd_1515981571_sketsa.jpg'),
(15, '1', '180115222412_0005', 'pbd_1516029522_dpn.jpg', 'pbd_1516029522_jln_dpn.jpg', 'pbd_1516249577_sketsa.jpg'),
(16, '1', '180117160456_0700', 'pbd_1516180018_dpn.jpg', 'pbd_1516180018_jln_dpn.jpg', 'pbd_1516259571_sketsa.jpg'),
(17, '1', '180118044759_0000', 'pbd_1516225585_dpn.jpg', 'pbd_1516225585_jln_dpn.jpg', 'pbd_1516225585_sketsa.jpg'),
(18, '1', 'x', 'pbd_1516232141_dpn.jpg', 'pbd_1516232141_jln_dpn.jpg', 'pbd_1516232141_sketsa.jpg'),
(19, '1', '180118114549_0005', 'pbd_1516250665_dpn.jpg', 'pbd_1516250665_jln_dpn.jpg', 'pbd_1516250665_sketsa.jpg'),
(20, '1', '180105104211_0700', 'pbd_1541485138_dpn.jpg', 'pbd_1541485138_jln_dpn.jpg', 'pbd_1541485138_sketsa.jpg'),
(21, '2', '180115111649_0700', 'pbd_1516259619_dpn.jpg', 'pbd_1516259619_jln_dpn.jpg', 'pbd_1516259619_sketsa.jpg'),
(22, '1', '180118141811_0008', 'pbd_1516259741_dpn.jpg', 'pbd_1516259741_jln_dpn.jpg', 'pbd_1516259741_sketsa.jpg'),
(23, '1', '180122172142_0002', 'pbd_1516616384_dpn.jpg', 'pbd_1516616384_jln_dpn.jpg', 'pbd_1516616384_sketsa.jpg'),
(24, '5', '180123090303_0001', 'pbd_1516672705_dpn.jpg', 'pbd_1516672705_jln_dpn.jpg', 'pbd_1516672705_sketsa.jpg'),
(39, '3', '180105105645_0700', 'pbd_1546201887_dpn.jpg', 'pbd_1546201887_jln_dpn.jpg', 'pbd_1546201887_sketsa.jpg'),
(26, '5', '180123090714_0002', 'pbd_1516673180_dpn.jpg', 'pbd_1516673180_jln_dpn.jpg', 'pbd_1516673180_sketsa.jpg'),
(27, '5', '180123091403_0007', 'pbd_1516673246_dpn.jpg', 'pbd_1516673246_jln_dpn.jpg', 'pbd_1516673246_sketsa.jpg'),
(28, '5', '180123091639_0008', 'pbd_1516673653_dpn.jpg', 'pbd_1516673653_jln_dpn.jpg', 'pbd_1516673653_sketsa.jpg'),
(29, '5', '180123092654_0005', 'pbd_1516673839_dpn.jpg', 'pbd_1516673839_jln_dpn.jpg', 'pbd_1516673839_sketsa.jpg'),
(30, '5', '180123092848_0006', 'pbd_1516674452_dpn.jpg', 'pbd_1516674452_jln_dpn.jpg', 'pbd_1516674452_sketsa.jpg'),
(31, '5', '180123093008_0006', 'pbd_1516674545_dpn.jpg', 'pbd_1516674545_jln_dpn.jpg', 'pbd_1516674545_sketsa.jpg'),
(32, '5', '180123093556_0007', 'pbd_1516674708_dpn.jpg', 'pbd_1516674708_jln_dpn.jpg', 'pbd_1516674708_sketsa.jpg'),
(33, '5', '180123093744_0004', 'pbd_1516674967_dpn.jpg', 'pbd_1516674967_jln_dpn.jpg', 'pbd_1516674967_sketsa.jpg'),
(34, '5', '180123101930_0004', 'pbd_1516676753_dpn.jpg', 'pbd_1516676753_jln_dpn.jpg', 'pbd_1516676753_sketsa.jpg'),
(35, '5', '180123102146_0006', 'pbd_1516677581_dpn.jpg', 'pbd_1516677581_jln_dpn.jpg', 'pbd_1516677581_sketsa.jpg'),
(36, '3', '180105083600_0700', 'pbd_1540276545_dpn.jpg', 'pbd_1540276545_jln_dpn.jpg', 'pbd_1540276545_sketsa.jpg'),
(37, '3', '180105104725_0700', 'pbd_1546149944_dpn.jpg', 'pbd_1546149944_jln_dpn.jpg', 'pbd_1546154389_sketsa.jpg'),
(38, '3', '180105104725_0700', 'pbd_1546149944_dpn.jpg', 'pbd_1546149944_jln_dpn.jpg', 'pbd_1546163640_sketsa.jpg'),
(40, '', '181231044925_0002', 'pbd_1546228152_dpn.jpg', 'pbd_1546228152_jln_dpn.jpg', 'pbd_1546228152_sketsa.jpg'),
(41, '1', '181231052557_0009', 'pbd_1546230270_dpn.jpg', 'pbd_1546230270_jln_dpn.jpg', 'pbd_1546230270_sketsa.jpg'),
(42, '1', '181231052759_0006', 'pbd_1546230473_dpn.jpg', 'pbd_1546230473_jln_dpn.jpg', 'pbd_1546230473_sketsa.jpg'),
(43, '1', '181231053015_0006', 'pbd_1546230609_dpn.jpg', 'pbd_1546230609_jln_dpn.jpg', 'pbd_1546230609_sketsa.jpg'),
(44, '4', '181231080605_0005', 'pbd_1546239850_dpn.jpg', 'pbd_1546239850_jln_dpn.jpg', 'pbd_1546239850_sketsa.jpg'),
(45, '6', '190122090327_0007', 'pbd_1548145820_dpn.jpg', 'pbd_1548145820_jln_dpn.jpg', 'pbd_1548145820_sketsa.jpg'),
(46, '6', '190122100618_0002', 'pbd_1548148019_dpn.jpg', 'pbd_1548148019_jln_dpn.jpg', 'pbd_1548148019_sketsa.jpg'),
(47, '6', '190122101315_0000', 'pbd_1548148409_dpn.jpg', 'pbd_1548148409_jln_dpn.jpg', 'pbd_1548148409_sketsa.jpg'),
(48, '5', '190122103007_0003', 'pbd_1548149422_dpn.jpg', 'pbd_1548149422_jln_dpn.jpg', 'pbd_1548149422_sketsa.jpg'),
(49, '5', '190122105454_0000', 'pbd_1548150917_dpn.jpg', 'pbd_1548150917_jln_dpn.jpg', 'pbd_1548150917_sketsa.jpg'),
(50, '5', '190122110600_0002', 'pbd_1548151574_dpn.jpg', 'pbd_1548151574_jln_dpn.jpg', 'pbd_1548151574_sketsa.jpg'),
(51, '5', '190122110927_0001', 'pbd_1548151782_dpn.jpg', 'pbd_1548151782_jln_dpn.jpg', 'pbd_1548151782_sketsa.jpg'),
(52, '6', '190124094947_0008', 'pbd_1548319800_dpn.jpg', 'pbd_1548319800_jln_dpn.jpg', 'pbd_1548319800_sketsa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `survey14_ft_sketsa bangunan`
--

CREATE TABLE `survey14_ft_sketsa bangunan` (
  `id_sketsa_bangunan` int(10) NOT NULL,
  `group_id` varchar(8) NOT NULL,
  `id_bangunan` varchar(50) NOT NULL COMMENT 'refer to survey09_bangunan',
  `sketsa_bangunan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `survey14_ft_sketsa bangunan`
--

INSERT INTO `survey14_ft_sketsa bangunan` (`id_sketsa_bangunan`, `group_id`, `id_bangunan`, `sketsa_bangunan`) VALUES
(1, '6', '180104050230_0006', 'bng_1515063657_sketsa.jpg'),
(2, '5', '180104073649_0004', 'bng_1515067622_sketsa.jpg'),
(3, '5', '180104085536_0000', 'bng_1515077570_sketsa.jpg'),
(4, '5', '180106061815_0009', 'bng_1515240840_sketsa.jpg'),
(5, '5', '180106092505_0002', 'bng_1515249839_sketsa.jpg'),
(6, '5', '180106100420_0005', 'bng_1515254171_sketsa.jpg'),
(7, '5', '180106112120_0009', 'bng_1515259208_sketsa.jpg'),
(8, '5', '180106223650_0009', 'bng_1515299768_sketsa.jpg'),
(9, '5', '180106223835_0008', 'bng_1515299877_sketsa.jpg'),
(10, '5', '180107000530_0001', 'bng_1515304950_sketsa.jpg'),
(11, '5', '180107000843_0004', 'bng_1515305218_sketsa.jpg'),
(12, '5', '180107001211_0004', 'bng_1515305486_sketsa.jpg'),
(13, '5', '180107001900_0007', 'bng_1515305813_sketsa.jpg'),
(14, '5', '180107002142_0008', 'bng_1515306001_sketsa.jpg'),
(15, '5', '180107002433_0002', 'bng_1515306110_sketsa.jpg'),
(16, '5', '180107002655_0006', 'bng_1515306282_sketsa.jpg'),
(17, '5', '180107003046_0009', 'bng_1515306553_sketsa.jpg'),
(18, '5', '180107003400_0006', 'bng_1515306651_sketsa.jpg'),
(19, '5', '180107003640_0007', 'bng_1515306854_sketsa.jpg'),
(20, '5', '180107025201_0004', 'bng_1515314867_sketsa.jpg'),
(21, '5', '180107062048_0001', 'bng_1515326752_sketsa.jpg'),
(22, '5', '180108233917_0006', 'bng_1516261473_sketsa.jpg'),
(23, '5', '180109103449_0002', 'bng_1515468624_sketsa.jpg'),
(24, '5', '180109103623_0003', 'bng_1515468976_sketsa.jpg'),
(25, '5', '180109103738_0003', 'bng_1515469050_sketsa.jpg'),
(26, '1', '180105110422_0700', 'bng_1516262011_sketsa.jpg'),
(27, '', '180109115738_0007', 'bng_1515473843_sketsa.jpg'),
(28, '5', '180110073024_0007', 'bng_1515544210_sketsa.jpg'),
(29, '5', '180110073702_0009', 'bng_1515544594_sketsa.jpg'),
(30, '1', '180110074159_0700', 'bng_1515545289_sketsa.jpg'),
(31, '5', '180110081330_0004', 'bng_1515546797_sketsa.jpg'),
(32, '5', '180110081051_0700', 'bng_1515546837_sketsa.jpg'),
(33, '4', '180110143700_0004', 'bng_1515569770_sketsa.jpg'),
(34, '11', '180110143833_0007', 'bng_1515569833_sketsa.jpg'),
(35, '1', '180110145736_0700', 'bng_1515571402_sketsa.jpg'),
(36, '1', '180110151051_0005', 'bng_1515571828_sketsa.jpg'),
(37, '', '180111143110_0002', 'bng_1515655861_sketsa.jpg'),
(38, '2', '180111162055_0700', 'bng_1515709530_sketsa.jpg'),
(39, '8', '180109101344_0700', 'bng_1515750680_sketsa.jpg'),
(40, '1', '180115090032_0009', 'bng_1515981617_sketsa.jpg'),
(41, '3', '180105083600_0700', 'bng_1515990932_sketsa.jpg'),
(42, '3', '180115145729_0002', 'bng_1516002722_sketsa.jpg'),
(43, '3', '180115150254_0003', 'bng_1516002932_sketsa.jpg'),
(44, '3', '180115150627_0001', 'bng_1516003395_sketsa.jpg'),
(45, '3', '180115150711_0007', 'bng_1516003068_sketsa.jpg'),
(46, '3', '180115150840_0001', 'bng_1516003637_sketsa.jpg'),
(47, '3', '180115151209_0001', 'bng_1516003609_sketsa.jpg'),
(48, '3', '180115151410_0009', 'bng_1516003939_sketsa.jpg'),
(49, '3', '180115151750_0005', 'bng_1516004075_sketsa.jpg'),
(50, '3', '180115152218_0000', 'bng_1516004161_sketsa.jpg'),
(51, '3', '180115152333_0007', 'bng_1516004294_sketsa.jpg'),
(52, '3', '180115153818_0007', 'bng_1516004548_sketsa.jpg'),
(53, '3', '180115153902_0006', 'bng_1516005366_sketsa.jpg'),
(54, '3', '180115154318_0002', 'bng_1516005545_sketsa.jpg'),
(55, '7', '180113143028_0700', 'bng_1516012556_sketsa.jpg'),
(56, '7', '180115174241_0002', 'bng_1516012918_sketsa.jpg'),
(57, '1', '180115233838_0001', 'bng_1516073249_sketsa.jpg'),
(58, '7', '180116135234_0004', 'bng_1516085490_sketsa.jpg'),
(59, '7', '180116140013_0002', 'bng_1516085853_sketsa.jpg'),
(60, '7', '180116140145_0004', 'bng_1516085853_sketsa.jpg'),
(61, '7', '180116140852_0006', 'bng_1516086469_sketsa.jpg'),
(62, '7', '180116141818_0006', 'bng_1516086943_sketsa.jpg'),
(63, '7', '180113144345_0700', 'bng_1516087785_sketsa.jpg'),
(64, '7', '180116143425_0006', 'bng_1516088039_sketsa.jpg'),
(65, '1', '180117224547_0006', 'bng_1516203942_sketsa.jpg'),
(66, '5', '180104095638_0700', 'bng_1516244933_sketsa.jpg'),
(67, '5', '180118101332_0000', 'bng_1516245128_sketsa.jpg'),
(68, '5', '180118101454_0001', 'bng_1516245216_sketsa.jpg'),
(69, '5', '180118101613_0003', 'bng_1516245297_sketsa.jpg'),
(70, '5', '180118101806_0004', 'bng_1516245376_sketsa.jpg'),
(71, '5', '180118102058_0008', 'bng_1516245489_sketsa.jpg'),
(72, '5', '180118102318_0006', 'bng_1516245689_sketsa.jpg'),
(73, '5', '180118102643_0008', 'bng_1516245801_sketsa.jpg'),
(74, '5', '180118102936_0003', 'bng_1516246059_sketsa.jpg'),
(75, '5', '180118103510_0008', 'bng_1516246281_sketsa.jpg'),
(76, '5', '180118103802_0006', 'bng_1516246515_sketsa.jpg'),
(77, '5', '180118104120_0000', 'bng_1516246776_sketsa.jpg'),
(78, '5', '180118104420_0005', 'bng_1516246887_sketsa.jpg'),
(79, '5', '180118105547_0004', 'bng_1516247607_sketsa.jpg'),
(80, '5', '180118105726_0002', 'bng_1516247750_sketsa.jpg'),
(81, '5', '180118105839_0006', 'bng_1516247850_sketsa.jpg'),
(82, '5', '180118110935_0002', 'bng_1516248365_sketsa.jpg'),
(83, '5', '180118112917_0006', 'bng_1516261677_sketsa.jpg'),
(84, '1', '180118114857_0007', 'bng_1516250772_sketsa.jpg'),
(85, '1', '180105104211_0700', ''),
(86, '3', '180118121514_0006', 'bng_1516252105_sketsa.jpg'),
(87, '5', '180118133424_0003', 'bng_1516261583_sketsa.jpg'),
(88, '5', '180118134734_0001', 'bng_1516261546_sketsa.jpg'),
(89, '2', '180115111649_0700', 'bng_1516259687_sketsa.jpg'),
(90, '5', '180118143150_0006', 'bng_1516261407_sketsa.jpg'),
(91, '1', '180105105645_0700', ''),
(92, '5', '180118143850_0009', 'bng_1516261340_sketsa.jpg'),
(93, '1', '180117160456_0700', 'bng_1516262061_sketsa.jpg'),
(94, '1', '180105110604_0700', 'bng_1516262307_sketsa.jpg'),
(95, '1', '180105111631_0700', 'bng_1516262958_sketsa.jpg'),
(96, '1', '180105111755_0700', 'bng_1516263281_sketsa.jpg'),
(97, '1', '180105112204_0700', 'bng_1516263732_sketsa.jpg'),
(98, '1', '180105112312_0700', 'bng_1516264099_sketsa.jpg'),
(99, '1', '180105112439_0700', 'bng_1516264561_sketsa.jpg'),
(100, '1', '180105112702_0700', 'bng_1516264846_sketsa.jpg'),
(101, '', '180105113006_0700', ''),
(102, '1', '180105141238_0700', 'bng_1516265637_sketsa.jpg'),
(103, '1', '180105141431_0700', 'bng_1516265957_sketsa.jpg'),
(104, '1', '180105141613_0700', 'bng_1516268240_sketsa.jpg'),
(105, '1', '180105141726_0700', 'bng_1516268456_sketsa.jpg'),
(106, '1', '180105141911_0700', 'bng_1516268657_sketsa.jpg'),
(107, '1', '180105142009_0700', 'bng_1516268894_sketsa.jpg'),
(108, '1', '180105142137_0700', 'bng_1516269089_sketsa.jpg'),
(109, '1', '180105142426_0700', 'bng_1516269287_sketsa.jpg'),
(110, '1', '180105142534_0700', 'bng_1516269490_sketsa.jpg'),
(111, '1', '180105142626_0700', 'bng_1516269681_sketsa.jpg'),
(112, '1', '180105142730_0700', 'bng_1516269858_sketsa.jpg'),
(113, '1', '180105142819_0700', 'bng_1516270158_sketsa.jpg'),
(114, '1', '180105145153_0700', 'bng_1516270532_sketsa.jpg'),
(115, '1', '180105151502_0700', 'bng_1516270839_sketsa.jpg'),
(116, '1', '180105160233_0700', 'bng_1516271017_sketsa.jpg'),
(117, '1', '180106102332_0700', 'bng_1516271421_sketsa.jpg'),
(118, '1', '180106102501_0700', 'bng_1516271788_sketsa.jpg'),
(119, '1', '180106102820_0700', 'bng_1516272096_sketsa.jpg'),
(120, '1', '180106102935_0700', 'bng_1516272289_sketsa.jpg'),
(121, '1', '180118191545_0002', 'bng_1516277537_sketsa.jpg'),
(122, '1', '180118193442_0006', 'bng_1516278747_sketsa.jpg'),
(123, '1', '180118193817_0009', 'bng_1516278935_sketsa.jpg'),
(124, '1', '180118194127_0005', 'bng_1516279121_sketsa.jpg'),
(125, '1', '180118194417_0003', 'bng_1516279321_sketsa.jpg'),
(126, '1', '180118194702_0009', 'bng_1516279475_sketsa.jpg'),
(127, '1', '180108112415_0700', 'bng_1516279936_sketsa.jpg'),
(128, '1', '180118200137_0000', 'bng_1516280318_sketsa.jpg'),
(129, '1', '180118200908_0006', 'bng_1516280622_sketsa.jpg'),
(130, '1', '180118201230_0004', 'bng_1516281009_sketsa.jpg'),
(131, '1', '180118202254_0004', 'bng_1516281166_sketsa.jpg'),
(132, '1', '180118203304_0007', 'bng_1516281791_sketsa.jpg'),
(133, '1', '180118203924_0006', 'bng_1516282413_sketsa.jpg'),
(134, '1', '180118203931_0009', 'bng_1516282412_sketsa.jpg'),
(135, '1', '180118204751_0006', 'bng_1516283050_sketsa.jpg'),
(136, '1', '180118204848_0008', 'bng_1516282982_sketsa.jpg'),
(137, '1', '180118205137_0006', 'bng_1516283314_sketsa.jpg'),
(138, '1', '180118205722_0001', 'bng_1516283654_sketsa.jpg'),
(139, '1', '180118205737_0002', 'bng_1516283586_sketsa.jpg'),
(140, '1', '180118210125_0002', 'bng_1516283901_sketsa.jpg'),
(141, '1', '180118210403_0006', 'bng_1516284080_sketsa.jpg'),
(142, '1', '180118210442_0000', 'bng_1516284123_sketsa.jpg'),
(143, '1', '180119105040_0000', 'bng_1516333673_sketsa.jpg'),
(144, '1', '180119105608_0004', 'bng_1516334014_sketsa.jpg'),
(145, '1', '180119110306_0002', 'bng_1516334209_sketsa.jpg'),
(146, '1', '180119110547_0008', 'bng_1516334600_sketsa.jpg'),
(147, '1', '180119110721_0003', 'bng_1516334756_sketsa.jpg'),
(148, '1', '180119110937_0000', 'bng_1516334858_sketsa.jpg'),
(149, '1', '180119111834_0005', 'bng_1516335052_sketsa.jpg'),
(150, '1', '180119112208_0000', 'bng_1516335526_sketsa.jpg'),
(151, '1', '180119112454_0008', 'bng_1516335769_sketsa.jpg'),
(152, '1', '180119112704_0004', 'bng_1516335899_sketsa.jpg'),
(153, '1', '180119112933_0007', 'bng_1516336033_sketsa.jpg'),
(154, '1', '180119113129_0003', 'bng_1516336193_sketsa.jpg'),
(155, '1', '180119113600_0007', 'bng_1516336296_sketsa.jpg'),
(156, '1', '180119113906_0009', 'bng_1516336639_sketsa.jpg'),
(157, '1', '180119114719_0007', 'bng_1516336759_sketsa.jpg'),
(158, '1', '180119115339_0004', 'bng_1516337269_sketsa.jpg'),
(159, '1', '180119115905_0008', 'bng_1516337732_sketsa.jpg'),
(160, '1', '180119132627_0002', 'bng_1516337971_sketsa.jpg'),
(161, '1', '180119132916_0008', 'bng_1516343201_sketsa.jpg'),
(162, '1', '180119133218_0002', 'bng_1516343362_sketsa.jpg'),
(163, '1', '180119133446_0002', 'bng_1516343607_sketsa.jpg'),
(164, '1', '180119133955_0004', 'bng_1516343700_sketsa.jpg'),
(165, '1', '180119134223_0007', 'bng_1516344019_sketsa.jpg'),
(166, '1', '180119134508_0009', 'bng_1516344158_sketsa.jpg'),
(167, '1', '180119134654_0006', 'bng_1516344333_sketsa.jpg'),
(168, '3', '180109104040_0700', 'bng_1516344353_sketsa.jpg'),
(169, '3', '180106144951_0700', 'bng_1516345974_sketsa.jpg'),
(170, '3', '180109123707_0700', 'bng_1516347528_sketsa.jpg'),
(171, '3', '180109134818_0700', 'bng_1516348947_sketsa.jpg'),
(172, '3', '180109142702_0700', 'bng_1516349470_sketsa.jpg'),
(173, '3', '180109152629_0700', 'bng_1516349871_sketsa.jpg'),
(174, '3', '180119153616_0002', 'bng_1516350701_sketsa.jpg'),
(175, '3', '180119163823_0008', 'bng_1516594295_sketsa.jpg'),
(176, '3', '180119164455_0001', 'bng_1516354820_sketsa.jpg'),
(177, '2', '180111114025_0700', 'bng_1516354729_sketsa.jpg'),
(178, '3', '180119170409_0004', 'bng_1516355413_sketsa.jpg'),
(179, '3', '180119171350_0002', 'bng_1516356545_sketsa.jpg'),
(180, '3', '180119171557_0009', 'bng_1516356545_sketsa.jpg'),
(181, '3', '180119175229_0003', 'bng_1516358621_sketsa.jpg'),
(182, '3', '180119175817_0000', 'bng_1516359177_sketsa.jpg'),
(183, '3', '180119180314_0007', 'bng_1516359513_sketsa.jpg'),
(184, '3', '180119181109_0002', 'bng_1516359993_sketsa.jpg'),
(185, '3', '180119181449_0006', 'bng_1516360277_sketsa.jpg'),
(186, '3', '180119182139_0009', 'bng_1516360508_sketsa.jpg'),
(187, '3', '180120060932_0001', 'bng_1516402965_sketsa.jpg'),
(188, '3', '180120061450_0005', 'bng_1516403478_sketsa.jpg'),
(189, '3', '180120062732_0002', 'bng_1516404199_sketsa.jpg'),
(190, '3', '180120065103_0003', 'bng_1516405694_sketsa.jpg'),
(191, '3', '180120065624_0007', 'bng_1516406038_sketsa.jpg'),
(192, '3', '180120070122_0008', 'bng_1516406266_sketsa.jpg'),
(193, '2', '180109094153_0700', 'bng_1516541510_sketsa.jpg'),
(194, '2', '180121204820_0000', 'bng_1516542186_sketsa.jpg'),
(195, '2', '180121205613_0005', 'bng_1516542633_sketsa.jpg'),
(196, '2', '180121210349_0003', 'bng_1516542986_sketsa.jpg'),
(197, '2', '180121210920_0008', 'bng_1516543439_sketsa.jpg'),
(198, '2', '180121211840_0007', 'bng_1516543775_sketsa.jpg'),
(199, '2', '180121212806_0007', 'bng_1516544608_sketsa.jpg'),
(200, '2', '180121213208_0001', 'bng_1516544897_sketsa.jpg'),
(201, '4', '180105142753_0700', 'bng_1516595568_sketsa.jpg'),
(202, '4', '180122114741_0006', 'bng_1516596372_sketsa.jpg'),
(203, '3', '180122131417_0004', 'bng_1516601326_sketsa.jpg'),
(204, '3', '180122131924_0003', 'bng_1516601683_sketsa.jpg'),
(205, '3', '180122132442_0002', 'bng_1516602017_sketsa.jpg'),
(206, '3', '180122133714_0004', 'bng_1516602322_sketsa.jpg'),
(207, '3', '180122133722_0004', 'bng_1516602322_sketsa.jpg'),
(208, '3', '180122134226_0008', 'bng_1516603225_sketsa.jpg'),
(209, '3', '180122134440_0006', 'bng_1516603388_sketsa.jpg'),
(210, '3', '180122134629_0006', 'bng_1516603502_sketsa.jpg'),
(211, '3', '180122135436_0009', 'bng_1516603797_sketsa.jpg'),
(212, '3', '180122135817_0003', 'bng_1516604099_sketsa.jpg'),
(213, '3', '180122140018_0008', 'bng_1516604313_sketsa.jpg'),
(214, '3', '180122140749_0009', 'bng_1516604431_sketsa.jpg'),
(215, '3', '180122141228_0001', 'bng_1516604885_sketsa.jpg'),
(216, '3', '180122141804_0005', 'bng_1516605176_sketsa.jpg'),
(217, '3', '180122142046_0009', 'bng_1516605507_sketsa.jpg'),
(218, '3', '180122142343_0003', 'bng_1516605671_sketsa.jpg'),
(219, '2', '180122144244_0007', 'bng_1516606971_sketsa.jpg'),
(220, '2', '180122145033_0003', 'bng_1516607132_sketsa.jpg'),
(221, '2', '180122150000_0007', 'bng_1516607439_sketsa.jpg'),
(222, '2', '180122151601_0001', 'bng_1516608661_sketsa.jpg'),
(223, '2', '180122152051_0000', 'bng_1516608982_sketsa.jpg'),
(224, '2', '180122152723_0009', 'bng_1516609268_sketsa.jpg'),
(225, '2', '180122153358_0008', 'bng_1516609657_sketsa.jpg'),
(226, '2', '180122160855_0007', 'bng_1516611818_sketsa.jpg'),
(227, '2', '180122161236_0005', 'bng_1516612169_sketsa.jpg'),
(228, '2', '180122161636_0009', 'bng_1516612368_sketsa.jpg'),
(229, '2', '180122161946_0008', 'bng_1516612606_sketsa.jpg'),
(230, '1', '180122172911_0003', 'bng_1516616788_sketsa.jpg'),
(231, '1', '180122172914_0008', 'bng_1516616788_sketsa.jpg'),
(232, '2', '180122203303_0000', 'bng_1516627680_sketsa.jpg'),
(233, '2', '180122203847_0003', 'bng_1516628093_sketsa.jpg'),
(234, '2', '180122204215_0007', 'bng_1516628557_sketsa.jpg'),
(235, '2', '180116151424_0700', 'bng_1516629653_sketsa.jpg'),
(236, '4', '180105150614_0700', 'bng_1516678596_sketsa.jpg'),
(237, '4', '180123105339_0002', 'bng_1516679273_sketsa.jpg'),
(238, '', '190115103958_0003', ''),
(239, '1', '190115104337_0001', ''),
(240, '', '190117075445_0004', ''),
(241, '', '190117080345_0003', ''),
(242, '1', '190117080404_0000', ''),
(243, '1', '190117081444_0007', ''),
(244, '1', '190117090838_0002', '');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_kegiatan`
--

CREATE TABLE `tabel_kegiatan` (
  `kdkeg` varchar(5) NOT NULL,
  `nmkeg` varchar(50) NOT NULL,
  `mtr` varchar(1) NOT NULL,
  `unit` varchar(1) NOT NULL,
  `org` varchar(1) NOT NULL,
  `paket` varchar(1) NOT NULL,
  `sklh` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tabel_kegiatan`
--

INSERT INTO `tabel_kegiatan` (`kdkeg`, `nmkeg`, `mtr`, `unit`, `org`, `paket`, `sklh`) VALUES
('11000', 'Jalan', 'Y', 'N', 'N', 'N', 'N'),
('11010', 'Pembuatan Jalan Baru', 'Y', 'N', 'N', 'N', 'N'),
('11020', 'Pembuatan Badan Jalan', 'Y', 'N', 'N', 'N', 'N'),
('11030', 'Perkerasan Sirtu', 'Y', 'N', 'N', 'N', 'N'),
('11040', 'Perkerasan Telford/ onderlag', 'Y', 'N', 'N', 'N', 'N'),
('11050', 'Perkerasan Telasah', 'Y', 'N', 'N', 'N', 'N'),
('11060', 'Perkerasan Makadam', 'Y', 'N', 'N', 'N', 'N'),
('11070', 'Perkerasan Lapen (Lapis Penetrasi)', 'Y', 'N', 'N', 'N', 'N'),
('11080', 'Perkerasan Hotmix', 'Y', 'N', 'N', 'N', 'N'),
('11090', 'Perkerasan Beton / Beton Tumbuk/ Rabat Beton', 'Y', 'N', 'N', 'N', 'N'),
('11100', 'Perkerasan Beton Lapis (Buras/Asburtu/Aspal Labur ', 'Y', 'N', 'N', 'N', 'N'),
('11110', 'Perkerasan Conblock', 'Y', 'N', 'N', 'N', 'N'),
('11120', 'Jalan Jerambah / Jalan Kayu', 'Y', 'N', 'N', 'N', 'N'),
('12000', 'Jembatan', 'Y', 'N', 'N', 'N', 'N'),
('12010', 'Jembatan Bambu', 'Y', 'N', 'N', 'N', 'N'),
('12020', 'Jembatan Kayu', 'Y', 'N', 'N', 'N', 'N'),
('12030', 'Jembatan Beton', 'Y', 'N', 'N', 'N', 'N'),
('12040', 'Jembatan Gantung Bambu', 'Y', 'N', 'N', 'N', 'N'),
('12050', 'Jembatan Gantung Kayu', 'Y', 'N', 'N', 'N', 'N'),
('12060', 'Jembatan Gantung Konstruksi Baja ', 'Y', 'N', 'N', 'N', 'N'),
('12070', 'Jembatan Konstruksi Baja (Stross)', 'Y', 'N', 'N', 'N', 'N'),
('12080', 'Jembatan Gelagar Besi Lantai Kayu', 'Y', 'N', 'N', 'N', 'N'),
('12090', 'Jembatan Gelagar Besi Lantai Beton', 'Y', 'N', 'N', 'N', 'N'),
('12100', 'Box Culvert (Gorong2 Kotak)', 'Y', 'N', 'N', 'N', 'N'),
('12110', 'Gorong-gorong Buis Beton', 'Y', 'N', 'N', 'N', 'N'),
('12120', 'Jembatan Limpas Banjir', 'Y', 'N', 'N', 'N', 'N'),
('13000', 'Dermaga / Tambatan Perahu', 'Y', 'N', 'N', 'N', 'N'),
('13010', 'Tambatan Dermaga berlantai 1', 'Y', 'N', 'N', 'N', 'N'),
('13020', 'Tambatan Dermaga berlantai 2', 'Y', 'N', 'N', 'N', 'N'),
('13030', 'Tambatan Tepi berlantai 1', 'Y', 'N', 'N', 'N', 'N'),
('13040', 'Tambatan Tepi berlantai 2', 'Y', 'N', 'N', 'N', 'N'),
('13050', 'Rakit / Perahu Penyeberangan', 'N', 'Y', 'N', 'N', 'N'),
('14000', 'Air Bersih', 'N', 'Y', 'N', 'N', 'N'),
('14010', 'Sumur Gali/Sumur Bor', 'N', 'Y', 'N', 'N', 'N'),
('14020', 'Sumur Pompa Tangan (SPT)', 'N', 'Y', 'N', 'N', 'N'),
('14030', 'Sumur Pompa Mesin', 'N', 'Y', 'N', 'N', 'N'),
('14040', 'Penampung Air Hujan (PAH)', 'N', 'Y', 'N', 'N', 'N'),
('14050', 'Penangkap Mata Air', 'N', 'Y', 'N', 'N', 'N'),
('14060', 'Pipanisasi Air Bersih (dari intake s/d outlet)', 'N', 'Y', 'N', 'N', 'N'),
('14070', 'Rehabilitasi Sarana Air Bersih', 'N', 'Y', 'N', 'N', 'N'),
('14080', 'Saringan Pasir Lambat (SPL)', 'N', 'Y', 'N', 'N', 'N'),
('14090', 'Instalasi Pengolah Air Sederhana (IPAS)', 'N', 'Y', 'N', 'N', 'N'),
('14100', 'Bak Penampung / Reservoir', 'N', 'Y', 'N', 'N', 'N'),
('14110', 'Bak Pembagi / Hidran Umum (HU)', 'N', 'Y', 'N', 'N', 'N'),
('15000', 'Sanitasi', 'N', 'Y', 'N', 'N', 'N'),
('15010', 'MCK', 'N', 'Y', 'N', 'N', 'N'),
('15020', 'Saluran Pelimpah Air Hujan / Drainase', 'N', 'Y', 'N', 'N', 'N'),
('15030', 'Saluran Pembuangan Air Limbah (SPAL)', 'N', 'Y', 'N', 'N', 'N'),
('15040', 'Jamban', 'N', 'Y', 'N', 'N', 'N'),
('15050', 'Septic Tank', 'N', 'Y', 'N', 'N', 'N'),
('15060', 'Bak Sampah', 'N', 'Y', 'N', 'N', 'N'),
('15070', 'Gerobak Sampah', 'N', 'Y', 'N', 'N', 'N'),
('15080', 'Tempat Pembuangan Sampah Sementara/Akhir', 'N', 'Y', 'N', 'N', 'N'),
('15090', 'Pengolahan Sampah Organik / Non Organik', 'N', 'Y', 'N', 'N', 'N'),
('16000', 'Irigasi', 'N', 'Y', 'N', 'N', 'N'),
('16010', 'Bendungan / Embung / Waduk', 'N', 'Y', 'N', 'N', 'N'),
('16020', 'Bangunan Pengambilan Irigasi', 'N', 'Y', 'N', 'N', 'N'),
('16030', 'Bangunan Saluran Irigasi', 'N', 'Y', 'N', 'N', 'N'),
('16040', 'Bangunan Pembuang Irigasi', 'N', 'Y', 'N', 'N', 'N'),
('16050', 'Bangunan Pembagi / Pintu Air', 'N', 'Y', 'N', 'N', 'N'),
('16060', 'Bangunan Pelengkap Irigasi (Talang/Gorong2/Sipon/R', 'N', 'Y', 'N', 'N', 'N'),
('17000', 'Bangunan Pendukung', 'N', 'Y', 'N', 'N', 'N'),
('17010', 'Talud / Siring Pasang utk Penahan Tanah Jalan', 'Y', 'N', 'N', 'N', 'N'),
('17020', 'Talud / Siring Pasang utk Saluran Air/Irigasi', 'Y', 'N', 'N', 'N', 'N'),
('17030', 'Talud Cerucuk Kayu/Bambu', 'Y', 'N', 'N', 'N', 'N'),
('17040', 'Tanggul Penahan / Pemecah Ombak', 'Y', 'N', 'N', 'N', 'N'),
('17050', 'Tanggul Irigasi', 'Y', 'N', 'N', 'N', 'N'),
('17060', 'Bronjong', 'Y', 'N', 'N', 'N', 'N'),
('18000', 'Listrik', 'N', 'Y', 'N', 'N', 'N'),
('18010', 'Pembangkit Listrik Tenaga Surya', 'N', 'Y', 'N', 'N', 'N'),
('18020', 'Pembangkit Listrik Tenaga Air / Mikrohidro', 'N', 'Y', 'N', 'N', 'N'),
('18030', 'Pembangkit Listrik Tenaga Angin', 'N', 'Y', 'N', 'N', 'N'),
('18040', 'Pembangkit Listrik Tenaga Biogas', 'N', 'Y', 'N', 'N', 'N'),
('18050', 'Generator / Genset', 'N', 'Y', 'N', 'N', 'N'),
('18060', 'Jaringan Kabel Listrik Luar Rumah', 'N', 'Y', 'N', 'N', 'N'),
('18070', 'Penerangan Jalan Umum (PJU)', 'N', 'Y', 'N', 'N', 'N'),
('18080', 'Transformator / Trafo', 'N', 'Y', 'N', 'N', 'N'),
('19000', 'Gedung / Bangunan', 'N', 'Y', 'N', 'N', 'N'),
('19010', 'Gedung Serbaguna', 'N', 'Y', 'N', 'N', 'N'),
('19020', 'Pasar / Kios / Lapak', 'N', 'Y', 'N', 'N', 'N'),
('19030', 'Lapangan Olah Raga', 'N', 'Y', 'N', 'N', 'N'),
('19040', 'Pagar (makam / desa)', 'N', 'Y', 'N', 'N', 'N'),
('19050', 'Lantai Jemur', 'N', 'Y', 'N', 'N', 'N'),
('19060', 'Tempat Pelelangan Ikan (TPI)', 'N', 'Y', 'N', 'N', 'N'),
('21000', 'Fasilitas Fisik / Gedung Sekolah', 'N', 'Y', 'N', 'N', 'N'),
('21010', 'Pengadaan Ruang Kelas', 'N', 'Y', 'N', 'N', 'N'),
('21020', 'Rehabilitasi Ruang Kelas', 'N', 'Y', 'N', 'N', 'N'),
('21030', 'Pengadaan Ruang Perpustakaan', 'N', 'Y', 'N', 'N', 'N'),
('21040', 'Rehabilitasi Ruang Perpustakaan', 'N', 'Y', 'N', 'N', 'N'),
('21050', 'Pengadaan Ruang Administrasi Pendidikan', 'N', 'Y', 'N', 'N', 'N'),
('21060', 'Rehabilitasi Ruang Administrasi Pendidikan', 'N', 'Y', 'N', 'N', 'N'),
('21070', 'Lapangan Upacara/Olah Raga', 'N', 'Y', 'N', 'N', 'N'),
('21080', 'Pagar Sekolah / Halaman', 'N', 'Y', 'N', 'N', 'N'),
('21090', 'Meubelair (Meja-Kursi Belajar)', 'N', 'Y', 'N', 'N', 'N'),
('22000', 'Tenaga Kependidikan', 'N', 'N', 'Y', 'N', 'N'),
('22010', 'Pengadaan Tenaga Kependidikan Guru Honorer', 'N', 'N', 'Y', 'N', 'N'),
('22020', 'Pengadaan Tenaga Kependidikan Guru Kunjung', 'N', 'N', 'Y', 'N', 'N'),
('23000', 'Peserta Didik', 'N', 'N', 'Y', 'N', 'N'),
('23010', 'Beasiswa / Subsidi untuk Biaya Sekolah', 'N', 'N', 'Y', 'N', 'N'),
('23020', 'Subsidi / Layanan Transportasi ke/dari Sekolah', 'N', 'N', 'Y', 'Y', 'N'),
('23030', 'Penyelenggaraan / Layanan Rumah Singgah ', 'N', 'N', 'N', 'Y', 'N'),
('23040', 'Perlengkapan Sekolah bagi Murid (Seragam, alat tul', 'N', 'N', 'Y', 'Y', 'N'),
('23050', 'Kegiatan / Layanan Pencegahan DO', 'N', 'N', 'Y', 'Y', 'N'),
('24000', 'Peningkatan Mutu Pendidikan', 'N', 'N', 'Y', 'N', 'N'),
('24010', 'Pelatihan Guru  mengenai Metoda Pengajaran (a.l. P', 'N', 'N', 'Y', 'N', 'N'),
('24020', 'Pelatihan Guru  mengenai Mata Pelajaran', 'N', 'N', 'Y', 'N', 'N'),
('24030', 'Pelatihan Guru  mengenai Pembuatan Produk', 'N', 'N', 'Y', 'N', 'N'),
('24040', 'Pelatihan Guru  mengenai Olah Raga dan Kesenian', 'N', 'N', 'Y', 'N', 'N'),
('24050', 'Pelatihan Guru  mengenai Pemulihan dari Krisis / B', 'N', 'N', 'Y', 'N', 'N'),
('24060', 'Pelatihan Guru  mengenai Pengembangan / Pemberdaya', 'N', 'N', 'Y', 'N', 'N'),
('24070', 'Pelatihan Guru  mengenai Pergaulan Anak (a.l. keke', 'N', 'N', 'Y', 'N', 'N'),
('24080', 'Pelatihan Guru  mengenai Kesehatan', 'N', 'N', 'Y', 'N', 'N'),
('24090', 'Pelatihan untuk Guru', 'N', 'N', 'Y', 'N', 'N'),
('24100', 'Pelatihan Komite Sekolah', 'N', 'N', 'Y', 'N', 'N'),
('24110', 'Studi Banding / Magang', 'N', 'N', 'Y', 'N', 'N'),
('24120', 'Kelompok Kerja Guru (KKG)/Musyawarah Guru Mata Pel', 'N', 'N', 'Y', 'N', 'N'),
('24130', 'Inovasi Layanan Pendidikan Dasar seperti SD Satu G', 'N', 'N', 'N', 'Y', 'N'),
('24140', 'Buku Paket', 'N', 'N', 'N', 'Y', 'N'),
('24150', 'Perangkat Laboratorium / Alat Peraga', 'N', 'N', 'N', 'Y', 'N'),
('25000', 'Pemantapan Manajemen Pendidikan', 'N', 'N', 'N', 'N', 'Y'),
('25010', 'Pelatihan mengenai Manajemen Sekolah (a.l. MBS)', 'N', 'N', 'N', 'N', 'Y'),
('25020', 'Kelompok Kerja Kepala Sekolah (K3S)', 'N', 'N', 'N', 'N', 'Y'),
('25030', 'Pelatihan Monitoring bagi Sekolah, Masyarakat & Pe', 'N', 'N', 'N', 'N', 'Y'),
('25040', 'Kegiatan Advokasi Pendidikan', 'N', 'N', 'N', 'N', 'Y'),
('25050', 'Pendataan Potensi Pendidikan', 'N', 'N', 'N', 'N', 'Y'),
('31000', 'Warga Siaga', 'N', 'N', 'N', 'Y', 'N'),
('31100', 'Pengobatan Sederhana', 'N', 'Y', 'N', 'N', 'N'),
('31110', 'Pengadaan Obat-Obatan', 'N', 'Y', 'N', 'N', 'N'),
('31200', 'Kesehatan Gigi dan Mulut', 'N', 'Y', 'N', 'N', 'N'),
('31300', 'Kesehatan Lingkungan', 'N', 'Y', 'N', 'N', 'N'),
('31400', 'Tenaga Kesehatan', 'N', 'N', 'Y', 'N', 'N'),
('31410', 'Honor Tenaga Kesehatan (Bukan PNS)', 'N', 'N', 'Y', 'N', 'N'),
('31420', 'Transport Tenaga Kesehatan (Biaya Operasional, Buk', 'N', 'N', 'Y', 'N', 'N'),
('32000', 'Sistem Kupon', 'N', 'N', 'N', 'Y', 'N'),
('33000', 'Total Sanitasi Masyarakat (TSM)', 'N', 'N', 'N', 'Y', 'N'),
('34000', 'Promosi Kesehatan (Penguatan Kesehatan Masyarakat)', 'N', 'N', 'Y', 'N', 'N'),
('34010', 'Pelatihan Tenaga Kesehatan (Kader, Bidan)', 'N', 'N', 'Y', 'N', 'N'),
('34020', 'Pelatihan Kesehatan (Masyarakat)', 'N', 'N', 'Y', 'N', 'N'),
('34030', 'Penyuluhan', 'N', 'N', 'Y', 'N', 'N'),
('34040', 'Usaha Kesehatan Sekolah (UKS)', 'N', 'Y', 'N', 'N', 'N'),
('35000', 'Pelayanan Kesehatan', 'N', 'N', 'Y', 'N', 'N'),
('35010', 'Pelayanan Kesehatan Dasar (Umum)', 'N', 'N', 'Y', 'N', 'N'),
('35020', 'Pelayanan Kesehatan Ibu dan Anak (KIA) dan KB', 'N', 'N', 'Y', 'N', 'N'),
('35021', 'Pelayanan Kehamilan', 'N', 'N', 'Y', 'N', 'N'),
('35022', 'Pelayanan Persalinan', 'N', 'N', 'Y', 'N', 'N'),
('35023', 'Pelayanan KB', 'N', 'N', 'Y', 'N', 'N'),
('35024', 'Imunisasi', 'N', 'N', 'Y', 'N', 'N'),
('35025', 'Deteksi Dini Tumbuh Kembang Anak', 'N', 'N', 'Y', 'N', 'N'),
('35026', 'Pengadaan Sarana dan Obat Kontrasepsi KB', 'N', 'N', 'N', 'Y', 'N'),
('35027', 'Pengadaan Media KIA', 'N', 'N', 'N', 'Y', 'N'),
('35030', 'Pelayanan Kesehatan Usila', 'N', 'N', 'Y', 'N', 'N'),
('36000', 'Pemberantasan Penyakit Menular (P2M)', 'N', 'N', 'N', 'Y', 'N'),
('36010', 'Pemberantasan Penyakit Menular', 'N', 'N', 'N', 'Y', 'N'),
('36020', 'Penyemprotan', 'N', 'N', 'N', 'Y', 'N'),
('37000', 'Perbaikan Gizi Masyarakat', 'N', 'N', 'Y', 'N', 'N'),
('37010', 'Pemberian Makanan Tambahan (PMT)', 'N', 'N', 'Y', 'N', 'N'),
('37020', 'Pemberian Multivitamin', 'N', 'N', 'Y', 'N', 'N'),
('37030', 'Penanggulangan Kasus Gizi', 'N', 'N', 'Y', 'N', 'N'),
('37040', 'Sweeping Pelacakan Gizi Buruk', 'N', 'N', 'N', 'Y', 'N'),
('38000', 'Puskesmas', 'N', 'Y', 'N', 'N', 'N'),
('38010', 'Rehabilitasi Puskesmas', 'N', 'Y', 'N', 'N', 'N'),
('38020', 'Rehabilitasi Puskesmas Pembantu', 'N', 'Y', 'N', 'N', 'N'),
('38030', 'Rehabilitasi Puskesmas Keliling', 'N', 'Y', 'N', 'N', 'N'),
('39000', 'Posyandu / Polindes', 'N', 'Y', 'N', 'N', 'N'),
('39010', 'Meubelair (meja, kursi, lemari)', 'N', 'Y', 'N', 'N', 'N'),
('39020', 'Pengadaan Peralatan kesehatan (timbangan, dll)', 'N', 'Y', 'N', 'N', 'N'),
('39030', 'Pengadaan Obat-obatan', 'N', 'Y', 'N', 'N', 'N'),
('39040', 'Rehabilitasi Posyandu /Polindes', 'N', 'Y', 'N', 'N', 'N'),
('39050', 'Pembangunan Posyandu / Polindes', 'N', 'Y', 'N', 'N', 'N'),
('41000', 'Peningkatan Kapasitas', 'N', 'N', 'N', 'Y', 'N'),
('41010', 'Peningkatan Kapasitas Pemerintah Daerah', 'N', 'N', 'N', 'Y', 'N'),
('41020', 'Peningkatan Kapasitas Masyarakat', 'N', 'N', 'N', 'Y', 'N'),
('41030', 'Peningkatan Kapasitas Kelembagaan Masyarakat', 'N', 'N', 'N', 'Y', 'N'),
('41040', 'Peningkatan Kapasitas Keterampilan Fasilitasi Pere', 'N', 'N', 'N', 'Y', 'N'),
('41050', 'Identifikasi Masalah dan Pihak Lain', 'N', 'N', 'N', 'Y', 'N'),
('41060', 'Pengintegrasian Program Pembangunan Yang Dilaksana', 'N', 'N', 'N', 'Y', 'N'),
('51000', 'Pengembangan Sektor Swasta', 'N', 'N', 'N', 'Y', 'N'),
('51010', 'Membangun Pusat Informasi Usaha', 'N', 'N', 'N', 'Y', 'N'),
('51020', 'Advokasi Kebijakan', 'N', 'N', 'N', 'Y', 'N'),
('51030', 'Membangun Forum Dialog Antara Sektor Swasta &  Pem', 'N', 'N', 'N', 'Y', 'N'),
('51040', 'Aktivitas Peningkatan Kapasitas Sektor Swasta &  P', 'N', 'N', 'N', 'Y', 'N'),
('61000', 'Peningkatan Kapasitas Pemuda', 'N', 'N', 'N', 'Y', 'N'),
('61010', 'Kampanye Perdamaian', 'N', 'N', 'N', 'Y', 'N'),
('61020', 'Kampanye Anti Narkoba/Minuman Keras', 'N', 'N', 'N', 'Y', 'N'),
('61030', 'Lomba dan Festival Olah Raga, Seni dan Budaya', 'N', 'N', 'N', 'Y', 'N'),
('61040', 'Diskusi Komunitas & Kerja Sosial/ Seminar', 'N', 'N', 'N', 'Y', 'N'),
('61050', 'Workshop Budaya', 'N', 'N', 'N', 'Y', 'N'),
('61060', 'Pelatihan Early Warning System', 'N', 'N', 'Y', 'N', 'N'),
('61070', 'Pelatihan mengenai Pemulihan dari Krisis / Bencana', 'N', 'N', 'Y', 'N', 'N'),
('61080', 'Pelatihan mengenai Pembuatan Produk/ Pelatihan Kew', 'N', 'N', 'Y', 'N', 'N'),
('61090', 'Pelatihan mengenai Olah Raga dan Kesenian', 'N', 'N', 'Y', 'N', 'N'),
('61100', 'Pelatihan mengenai Pengembangan / Pemberdayaan Pot', 'N', 'N', 'Y', 'N', 'N'),
('61110', 'Bakti Sosial', 'N', 'N', 'N', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tb_galeri`
--

CREATE TABLE `tb_galeri` (
  `galeri_id` smallint(6) NOT NULL,
  `category_id` smallint(6) NOT NULL DEFAULT '0',
  `galeri_name` varchar(100) NOT NULL DEFAULT '',
  `content` text,
  `image_galeri` varchar(100) DEFAULT NULL,
  `display_id` smallint(6) NOT NULL DEFAULT '0',
  `dateposting` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_galeri`
--

INSERT INTO `tb_galeri` (`galeri_id`, `category_id`, `galeri_name`, `content`, `image_galeri`, `display_id`, `dateposting`) VALUES
(1, 2, 'Direktorat Jenderal Pengembangan Daerah Tertentu (Dirjen PDTu)', '<p>Direktorat Jenderal Pengembangan Daerah Tertentu (Dirjen PDTu) mempunyai tugas menyelenggarakan perumusan dan pelaksanaan kebijakan di bidang pengembangan daerah rawan pangan, daerah perbatasan, daerah rawan bencana dan pasca konflik, serta daerah pulau kecil dan terluar sesuai ketentuan peraturan perundang-undangan. .</p>\r\n<p>Dalam melaksanakan tugasnya, Direktorat Jenderal Pengembangan Daerah Tertentu menyelenggarakan fungsi: \r\n<p>1. perumusan kebijakan di bidang pengembangan daerah rawan pangan, daerah perbatasan, daerah rawan bencana dan pasca konflik, serta daerah pulau kecil dan terluar; \r\n<p>2. pelaksanaan kebijakan di bidang pengembangan daerah rawan pangan, daerah perbatasan, daerah rawan bencana dan pasca konflik, serta daerah pulau kecil dan terluar; \r\n<p>3. pemberian bimbingan teknis dan supervisi di bidang pengembangan daerah rawan pangan, daerah perbatasan, daerah rawan bencana dan pasca konflik, serta daerah pulau kecil dan terluar; \r\n<p>4. pelaksanaan evaluasi dan pelaporan di bidang pengembangan daerah rawan pangan, daerah perbatasan, daerah rawan bencana dan pasca konflik, serta daerah pulau kecil dan terluar; \r\n<p>5. pelaksanaan administrasi Direktorat Jenderal Pengembangan Daerah Tertentu; dan \r\n<p>6. pelaksanaan fungsi lain yang diberikan oleh Menteri.  ', 'deputi.jpg', 2, '2014-12-09 07:27:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_project`
--

CREATE TABLE `tb_project` (
  `seqNo` int(11) NOT NULL,
  `idproject_profile` int(11) NOT NULL,
  `pin` varchar(10) DEFAULT NULL,
  `projectName` varchar(120) NOT NULL,
  `ppp_book_code` varchar(45) NOT NULL,
  `projectOwner` text NOT NULL,
  `projectLocation` varchar(45) DEFAULT NULL,
  `projectScope` text NOT NULL,
  `sectorCode` varchar(3) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipe_proyek` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `projectInvestment` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `projectStatus` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_project`
--

INSERT INTO `tb_project` (`seqNo`, `idproject_profile`, `pin`, `projectName`, `ppp_book_code`, `projectOwner`, `projectLocation`, `projectScope`, `sectorCode`, `tipe_proyek`, `projectInvestment`, `projectStatus`, `display_id`) VALUES
(4, 5, 'A2-WS-13', 'Peta Potensi Investasi Kota Sabang', '', 'Maros Regency', 'Maros', 'Intake, water management installation, main transmission pipe, reservoir for services and distribution system', 'WS', '', 'USD 13 Millions', 'Under Proses to Procure Transaction Advisory Consultant (CQS)', '2'),
(11, 7, 'A2-WS-99', 'Lamongan Water Supply', '', 'Lamongan Regency', 'East Java', 'Intake, water management installation, main transmission pipe, reservoir for services and distribution system.', 'WS', '', 'USD 13 million', 'Under Proses to Procure PPC Consultant (QCBS)', '2'),
(9, 9, 'A2-WS-131', 'Serang Water Supply', '', 'Serang City', 'Serang, West Java', 'The project will add an extra 250 l/sec capacity to the urban water supply system in Serang, population 500,000 persons in Banten.  Water will be drawn from a dam and passed through a conventional water treatment facility, including both clarification and filtration processes.  Service storage and transmission mains will be included in the Project.  Considerable extension and development of the existing distribution system will be required.', 'WS', '1', 'USD 17 Millions', 'Under Proses to Procure PPC Consultant (QCBS)', '2'),
(5, 205, 'A2-WS-159', 'Pondok Gede Water Supply', 'P-033-15-0', 'Bekasi City', 'Bekasi, West Java', '', 'WS', '', 'USD 22 Millions', 'Prepare to Procure Transaction Advisory Consultant (QCBS)', '2'),
(15, 251, 'A2-WS-209', 'Cimahi Water Supply', '', 'Cimahi City', 'Cimahi City', '', 'WS', '1', 'USD 18 Millions', 'Under Proses to Procure PPC Consultant (CQS)', '2'),
(13, 252, 'A2-WS-201', 'Krabayakan Spring Water Supply Malang', '', 'Malang Regency', 'Malang City', '', 'WS', '', 'USD 22 Millions', 'Under Proses to Procure PPC Consultant (CQS)', '2'),
(20, 253, 'A2-WS-214', 'Pontianak Raw Water Supply', '', 'West Kalimantan Prov', 'Pontianak City', '', 'WS', '1', 'USD 86 Millions', 'TOR for PPC is under preparation', '2'),
(24, 254, 'A2-WS-199', 'Padang Water Supply', '', 'West Sumatra', 'Padang City', '', 'WS', '1', 'USD 22 Millions', 'Unsolicited Project', '2'),
(16, 258, 'A2-WM-194', 'South Cimahi Water Pollution Control', '', 'West Java Province', 'Cimahi', 'The proposed project would provide a system of sewers to collect wastewater, from both industrial and domestic sources in the area of South Cimahi, West Java, and deliver it to a centralized wastewater treatment plant.  The collection system would comprise of around 11 km of gravity sewers.  The flow to the wastewater treatment plant is estimated at around 500 l/sec.  Both biological and chemical treatment of the waste is envisaged.', 'WW', '', 'USD 52 Millions', 'Under Proses to Procure PPC Consultant (CQS)', '2'),
(10, 270, 'A2-WS-216', 'Southern Bali Water Supply Project', '', 'Bali  Province', 'Bali', 'The Project will add 1,800 l/sec to the urban systems in SE Bali. Water will be from the Unda River (1,500 l/sec) & Penet River (300 l/sec), treated and sold to a Provincial Government body, which will in turn on-sell the water to local PDAMs - Denpasar (750 l/sec), Badung (950 l/sec), Gianyar (50 l/sec) and Klungkung (50 l/sec).  Project proposed by K-Water Consortium including Korea Water Resources Association, Lotte Engineering and Construction Co. Ltd, Samsung C&T Corporation and PT Bumi Hijau Abadi. ', 'WS', '1', 'USD 260 Millions', '<p>Transaction Consultant reviewing unsolicited FS submitted by K-Water.  Consultants Milestones set by the Contract include: </p>\r\n<p>1. Final Business Case: 12 Oct 2010</p>\r\n<p>2. Bidding Commenced: 21 Dec 2010</p>\r\n<p>3. Contract Award: 9 May 2011</p>\r\n', '2'),
(3, 13, 'A2-SP-14', 'Tanah Ampo Cruise Ship Terminal', '', 'MOT', 'Tanah Ampo', 'Development of a cruise terminal facility at Karang Asem, Bali with a proposed capacity of 600 ships per annum.', 'SP', '', 'USD 25 Millions', 'IRSDP has appointed Transaction Consultant to procure investor.   ', '2'),
(14, 14, 'A2-SP-21', 'Pekanbaru Cargo Terminal', '', 'Pekanbaru City', 'Pekan Baru', 'Dedicated cargo terminal to reduce congestion in the city of Pekanbaru.', 'SP', '', 'USD 148 Millions', 'Under Proses to Procure PPC Consultant (QCBS)', '2'),
(8, 15, 'A2-SP-29', 'Karya Jaya Multimoda Terminal', '', 'Palembang City', 'Palembang', 'Development of a multimodal transport terminal for the city of Palembang in South Sumatra, encompassing (i) a passenger terminal at Karya Jaya, (ii) a cargo terminal, (iii) railway station, (iv) a river port, (v) storage facility, and (vi) other supporting infrastructure.', 'BT', '1', 'USD 139 Millions', 'Under Proses to Procure PPC Consultant (QCBS)', '2'),
(17, 25, 'A2-MK-12', 'Revitalization of Yogyakarta Rail Station and Pedestrianization of Malioboro', '', 'DI Yogyakarta', 'Jogyakarta', 'Four packages proposed but Yogjakarta prefers Package A involving a revitalization of the rail station and pedestrianization of Malioboro.', 'MK', '1', 'USD 142 Millions', 'Under Proses to Procure PPC Consultant (QCBS)', '2'),
(7, 12, 'A2-BT-03', 'Gede Bage Integrated Terminal', '', 'Bandung City', 'Gedebage, West Java', 'Development of a multipurpose transport terminal for the city of Bandung (i) to improve the existing railway container terminal to be a centre of activities during implementation of long term development plan for Gedebage and (ii) a combination of land transportation terminal such as inter provincial bus, city mini bus station or other transportation modes (multipurpose terminal development).', 'BT', '1', 'USD 278 Millions', 'Project Preparation Consultant is preparing Pre-FS report.', '2'),
(18, 266, 'A2-BT-195', 'Padang Bus Rapid Transit System', '', 'Padang City', 'Padang', '', 'BT', '', 'USD 22 Millions', 'Under process to procure PPC ', '2'),
(28, 27, 'A2-WM-176', 'Bandung Waste to Energy', '', 'West Java Province', 'Bandung City', 'Development of a 500 tonne/day integrated waste treatment facility for Bandung', 'WM', '', 'USD 68 Millions', 'Unsolicited Project', '2'),
(33, 16, 'A2-AP-04', 'Kertajati International Airport', '', 'West Java Province', 'Kertajati, West Java', 'The project proposes implementation of a West Java International Gateway for passenger and cargo air traffic, reducing the strain on the Soekarno-Hatta airport. The Kertajati International Airport (KIA) is to be located on a road link between Bandung and Cirebon and Bodeka areas. The KIA will have a capacity of 6 million passengers per annum.', 'AP', '1', 'USD 2,698 Millions', 'Land accusition is under process by West Java Province.', '2'),
(36, 269, 'A2-AP-208', 'Tjilik Riwut Airport Expansion, Palangkaraya', '', 'MOT', 'Palangkaraya, Central Kalimantan', '', 'AP', '1', 'USD 11 Millions', 'Under Proses to Procure PPC Consultant (QCBS)', '2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_proyek_category`
--

CREATE TABLE `tb_proyek_category` (
  `category_id` smallint(6) NOT NULL,
  `category_name` varchar(100) NOT NULL DEFAULT '',
  `division_id` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_proyek_category`
--

INSERT INTO `tb_proyek_category` (`category_id`, `category_name`, `division_id`) VALUES
(1, 'Pengairan dan Irigasi ', 1),
(2, 'Transportasi ', 1),
(3, 'Permukiman dan Perumahan ', 0),
(4, 'Energi, Telekomunikasi dan Informatika ', 0),
(5, 'Pengembangan Kerjasama Pemerintah dan Swasta ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_section`
--

CREATE TABLE `tb_section` (
  `section_id` smallint(6) NOT NULL,
  `section_name` varchar(100) NOT NULL DEFAULT '',
  `section_description` text NOT NULL,
  `content` text NOT NULL,
  `section_image` varchar(100) NOT NULL DEFAULT '',
  `category_id` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_section`
--

INSERT INTO `tb_section` (`section_id`, `section_name`, `section_description`, `content`, `section_image`, `category_id`) VALUES
(1, 'Direktorat Jenderal Bina Marga', 'Direktorat Jenderal Bina Marga mempunyai tugas menyelenggarakan perumusan dan pelaksanaan kebijakan di bidang penyelenggaraan jalan sesuai dengan ketentuan peraturan perundang-undangan. <br/>Direktorat Jenderal Bina Marga menyelenggarakan fungsi:\r\n<table style=\"width:100%\">\r\n  <tr>\r\n    <td valign=\"top\">1. </td>\r\n    <td>perumusan kebijakan di bidang penyelenggaraan jalan sesuai dengan ketentuan peraturan perundangundangan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>2. </td>\r\n    <td>pelaksanaan kebijakan di bidang penyelenggaraan jalan nasional;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>3. </td>\r\n    <td>pelaksanaan kebijakan di bidang penguatan konektivitas yang menjadi prioritas nasional;</td>\r\n  </tr>\r\n    <td>4. </td>\r\n    <td>penyusunan norma, standar, prosedur, dan kriteria di bidang jalan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>5. </td>\r\n    <td>pemberian bimbingan teknis dan supervisi di bidang penyelenggaraan jalan;</td>\r\n  </tr>\r\n  <tr>\r\n    <td>6. </td>\r\n    <td>pelaksanaan evaluasi dan pelaporan di bidang penyelenggaraan jalan;</td>\r\n  </tr>\r\n    <td>7. </td>\r\n    <td>pelaksanaan administrasi Direktorat Jenderal Bina Marga; dan</td>\r\n  </tr>\r\n  <tr>\r\n    <td>8. </td>\r\n    <td>pelaksanaan fungsi lain yang diberikan oleh Menteri.</td>\r\n  </tr>\r\n</table>', '<table class=\"unitsectiontable\" style=\"width: 557px;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td width=\"265\"><img src=\"http://localhost:8082/kemendesa/images/pengairan.jpg\" alt=\"d23.jpg\" height=\"192\" width=\"191\"></td>\r\n<td width=\"346\">\r\n<p>Data yang dicakup meliputi:\r\n<br>a. Jenis konflik di daerah; \r\n<br>b. Jumlah kejadian pada setiap jenis konflik;\r\n<br>c. Upaya penanganan konflik;\r\n<br>d. Jumlah daerah pasca konflik.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<h4 style=\"text-align: left;\" align=\"center\"><br /> <br /> Program yang dijalankan</h4>\r\n\r\n<table border=0 cellpadding=0 cellspacing=0 width=699 style=\'border-collapse:\r\n collapse;table-layout:fixed;width:525pt\'>\r\n <col width=18 style=\'mso-width-source:userset;mso-width-alt:658;width:14pt\'>\r\n <col width=34 style=\'mso-width-source:userset;mso-width-alt:1243;width:26pt\'>\r\n <col width=583 style=\'mso-width-source:userset;mso-width-alt:21321;width:437pt\'>\r\n <col width=64 style=\'width:48pt\'>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6631650 align=right width=18 style=\'height:15.0pt;\r\n  width:14pt\'>1.</td>\r\n  <td class=xl6731650 colspan=2 width=617 style=\'width:463pt\'>Fasilitasi\r\n  Pemulihan Sosial dan Ekonomi Daerah Pasca Konflik</td>\r\n  <td class=xl6531650 width=64 style=\'width:48pt\'></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7031650>Fasilitasi Pemulihan Sosial Dengan Promosi Perdamaian\r\n  Melalui Media</td>\r\n  <td class=xl7131650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>1. Kabupaten Pidie</td>\r\n  <td class=xl7331650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>2. Kabupaten Solok</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>3. Kabupaten Pandeglang</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>4. Kabupaten Lombok Tengah</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>5. Kabupaten Nunukan</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>6. Kabupaten Seruyan</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>7. Kabupaten Morowali</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>8. Kabupaten Pohuwato</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>9. Kabupaten Sorong</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>10. Kabupaten Nabire</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7031650>Fasilitasi Pemulihan Ekonomi Penanganan Daerah Pasca\r\n  Konflik</td>\r\n  <td class=xl7031650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6931650></td>\r\n  <td class=xl7231650>1. Kabupaten Pidie</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>2. Kabupaten Mamuju Tengah</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>3. Kabupaten Mamuju</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>4. Kabupaten Buton</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>5. Kabupaten Buton Utara</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>6. Kabupaten Morowali</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>7. Kabupaten Bone Bolango</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>8. Kabupaten Muna</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>9. Kabupaten Poso</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>10. Kabupaten Bombana</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7431650 style=\'height:15.0pt\'></td>\r\n  <td class=xl7431650></td>\r\n  <td class=xl7231650>11. Kabupaten Morowali</td>\r\n  <td class=xl6831650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6631650 align=right style=\'height:15.0pt\'>2.</td>\r\n  <td class=xl7531650 colspan=2>Fasilitasi Rekonstruksi Daerah Pasca Konflik</td>\r\n  <td class=xl6531650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>1. Kabupaten Aceh Selatan</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>2. Kabupaten Sigi</td>\r\n  <td class=xl7331650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>3. Kabupaten Solok</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>4. Kabupaten Pidie Jaya</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>5. Kabupaten Sumba Tengah</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>6. Kabupaten Sukabumi</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>7. Kabupaten Lombok Utara</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>8. Kabupaten Sigi</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>9. Kabupaten Bombana</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>10. Kabupaten Bima</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>11. Kabupaten Sambas</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>12. Kabupaten Pangkajene Kepulauan</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>13. Kabupaten Muna</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>14. Kabupaten Toli - Toli</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>15. Kabupaten Parigi Moutong</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>16. Kabupaten Poso</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>17. Kabupaten Nabire</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>18. Kabupaten Tolikara</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>19. Kabupaten Sorong</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>20. Kabupaten Deiyai</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=21 style=\'mso-height-source:userset;height:15.75pt\'>\r\n  <td height=21 class=xl6631650 align=right style=\'height:15.75pt\'>3.</td>\r\n  <td colspan=3 class=xl7731650 width=681 style=\'width:511pt\'>Fasilitasi Pembangunan Pondok Singgah di rute-rute\r\n  jalan pejalan kaki di daerah pegunungan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>1. Kabupaten Jayawijaya</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>2. Kabupaten Tolikara</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>3. Kabupaten Deiyai</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>4. Kabupaten Nduga</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>5. Kabupaten Sorong Selatan</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>6. Kabupaten Sorong</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl6831650 style=\'height:15.0pt\'></td>\r\n  <td class=xl6831650></td>\r\n  <td class=xl7231650>7. Kabupaten Tambrauw</td>\r\n  <td class=xl7631650></td>\r\n </tr>\r\n <![if supportMisalignedColumns]>\r\n <tr height=0 style=\'display:none\'>\r\n  <td width=18 style=\'width:14pt\'></td>\r\n  <td width=34 style=\'width:26pt\'></td>\r\n  <td width=583 style=\'width:437pt\'></td>\r\n  <td width=64 style=\'width:48pt\'></td>\r\n </tr>\r\n <![endif]>\r\n</table>\r\n', '', 1);
INSERT INTO `tb_section` (`section_id`, `section_name`, `section_description`, `content`, `section_image`, `category_id`) VALUES
(3, 'Daerah Perbatasan', '<p>Direktorat Permukiman dan Perumahan mempunyai tugas melaksanakan  penyiapan perumusan kebijakan, koordinasi, sinkronisasi pelaksanaan  penyusunan dan evaluasi perencanaan pembangunan nasional di bidang  permukiman dan perumahan, serta pemantauan dan penilaian atas  pelaksanaannya.</p>', '<table class=\"unitsectiontable\" style=\"width: 557px;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td width=\"265\"><img src=\"http://www.irsdp.org/deputi/images/perumahan.jpg\" alt=\"d25.jpg\" width=\"191\" height=\"133\" /></td>\r\n<td width=\"346\">\r\n<p>Data yang dicakup:<br />a. Data aksesibilitas atau kesampaian lokasi di daerah perbatasan<br />b. Data titik reference pokok perbatasan (koordinat)<br />c. Potensi sumber daya alam di daerah perbatasan</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<h4 style=\"text-align: left;\" align=\"center\"><br /> <br />Program yang Dijalankan</h4>\r\n\r\n<table border=0 cellpadding=0 cellspacing=0 width=858 style=\'border-collapse:\r\n collapse;table-layout:fixed;width:645pt\'>\r\n <col width=22 style=\'mso-width-source:userset;mso-width-alt:804;width:17pt\'>\r\n <col width=30 style=\'mso-width-source:userset;mso-width-alt:1097;width:23pt\'>\r\n <col width=28 style=\'mso-width-source:userset;mso-width-alt:1024;width:21pt\'>\r\n <col width=778 style=\'mso-width-source:userset;mso-width-alt:28452;width:584pt\'>\r\n <tr height=21 style=\'mso-height-source:userset;height:15.75pt\'>\r\n  <td height=21 class=xl9616001 width=22 style=\'height:15.75pt;width:17pt\'>1.</td>\r\n  <td colspan=3 class=xl9716001 width=836 style=\'width:628pt\'>Fasilitasi\r\n  Pelaksanaan Kebijakan Pengembangan Daerah Perbatasan (Reguler)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9816001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.1. Pengadaan PLTS 5 Kwp</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>1</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Anambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>2</td>\r\n  <td class=xl10116001>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>3</td>\r\n  <td class=xl10116001>Kabupaten Mahakam Ulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>4</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>5</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl10016001>6</td>\r\n  <td class=xl10116001>Kabupaten Pegunungan Bintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.2. Pembangunan Fasilitas Air Bersih</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Anambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Kapuas Hulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.3. Pembangunan Jembatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Kapuas Hulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Malinau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Maluku Barat\r\n  Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.4. Pembangunan Jalan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Belu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Malaka</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Kapuas Hulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.5. Pembangunan Embung</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Belu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>1.6. Pengembangan Potensi Sumber Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Anambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10116001>Kabupaten Belu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl10116001>Kabupaten Timor Tengah Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl10116001>Kabupaten Malaka</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10116001>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>11</td>\r\n  <td class=xl10116001>Kabupaten Sambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>12</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>13</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>14</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>15</td>\r\n  <td class=xl10116001>Kabupaten Maluku Tenggara Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>16</td>\r\n  <td class=xl10116001>Kabupaten Pulau Morotai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>17</td>\r\n  <td class=xl10116001>Kabupaten Maluku Barat Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>18</td>\r\n  <td class=xl10116001>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>19</td>\r\n  <td class=xl10116001>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>20</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>21</td>\r\n  <td class=xl10116001>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>22</td>\r\n  <td class=xl10116001>Kabupaten Keerom</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>23</td>\r\n  <td class=xl9816001>Kabupaten Pegunungan Bintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001></td>\r\n </tr>\r\n <tr height=21 style=\'mso-height-source:userset;height:15.75pt\'>\r\n  <td height=21 class=xl9616001 style=\'height:15.75pt\'>2.</td>\r\n  <td colspan=3 class=xl10316001 width=836 style=\'width:628pt\'>Fasilitasi\r\n  Pelaksanaan Kebijakan Pengembangan Daerah Perbatasan (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.1. Pengadaan PLTS 5 Kwp (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl10116001>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl10116001>Kabupaten Malinau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>11</td>\r\n  <td class=xl10116001>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>12</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.2. Pengadaan PLTS 10 Kwp (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.3. Pembangunan Fasilitas Air Bersih (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Mahakam Ulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10116001>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl10116001>Kabupaten Sambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>11</td>\r\n  <td class=xl10116001>Kabupaten Pulau Morotai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>12</td>\r\n  <td class=xl10116001>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>13</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Keerom</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>14</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Pegunungan\r\n  Bintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>15</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.4. Pembangunan Jembatan (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.5. Pembangunan Jalan (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Meranti</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Sambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10116001>Kabupaten Kepulauan Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl10116001>Kabupaten Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl10116001>Kabupaten Maluku Tenggara Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10116001>Kabupaten Pulau Morotai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>11</td>\r\n  <td class=xl10116001>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>12</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>13</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Keerom</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>14</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Pegunungan\r\n  Bintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.6. Pembangunan Embung (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Timor Tengah Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.7. MIT (Media Informasi Televisi) (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl9616001>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl9616001>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl9616001>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Sambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl9616001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl9616001>Kabupaten Kapuas Hulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Malinau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>11</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>12</td>\r\n  <td class=xl10216001 width=778 style=\'width:584pt\'>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001 colspan=3>2.8. Alat Peraga (Pendidikan) (APBNP)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>1</td>\r\n  <td class=xl10116001>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>2</td>\r\n  <td class=xl10116001>Kabupaten Timor Tengah Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>3</td>\r\n  <td class=xl10116001>Kabupaten Belu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>4</td>\r\n  <td class=xl10116001>Kabupaten Sanggau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>5</td>\r\n  <td class=xl10116001>Kabupaten Sintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>6</td>\r\n  <td class=xl10116001>Kabupaten Sambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>7</td>\r\n  <td class=xl10116001>Kabupaten Kapuas Hulu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>8</td>\r\n  <td class=xl10116001>Kabupaten Malinau</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>9</td>\r\n  <td class=xl10116001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001>10</td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'>Kabupaten Keerom</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9816001></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl10316001 width=778 style=\'width:584pt\'></td>\r\n </tr>\r\n <tr height=21 style=\'mso-height-source:userset;height:15.75pt\'>\r\n  <td height=21 class=xl9616001 style=\'height:15.75pt\'>3.</td>\r\n  <td colspan=3 class=xl10316001 width=836 style=\'width:628pt\'>Fasilitasi\r\n  Pembangunan Pondok Singgah Yang di Bangun di Papua dan Papua Barat\r\n  (APBNP-Quick Wins)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001>1</td>\r\n  <td class=xl9816001>Kabupaten Keerom</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001>2</td>\r\n  <td class=xl9816001>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001>3</td>\r\n  <td class=xl9816001>Kabupaten Boven Digoel</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001>4</td>\r\n  <td class=xl9816001>Kabupaten Pegunungan Bintang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl9516001 style=\'height:15.0pt\'></td>\r\n  <td class=xl9916001></td>\r\n  <td class=xl9816001>5</td>\r\n  <td class=xl9816001>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <![if supportMisalignedColumns]>\r\n <tr height=0 style=\'display:none\'>\r\n  <td width=22 style=\'width:17pt\'></td>\r\n  <td width=30 style=\'width:23pt\'></td>\r\n  <td width=28 style=\'width:21pt\'></td>\r\n  <td width=778 style=\'width:584pt\'></td>\r\n </tr>\r\n <![endif]>\r\n</table>\r\n', '', 1);
INSERT INTO `tb_section` (`section_id`, `section_name`, `section_description`, `content`, `section_image`, `category_id`) VALUES
(4, 'Daerah Pulau Kecil dan Terluar', '<p>Direktorat Energi, Telekomunikasi dan Informatika mempunyai tugas  melaksanakan penyiapan perumusan kebijakan, koordinasi, sinkronisasi  pelaksanaan penyusunan dan evaluasi perencanaan pembangunan nasional di  bidang energi, telekomunikasi dan informatika, serta pemantauan dan  penilaian atas pelaksanaannya.</p>', '<table class=\"unitsectiontable\" style=\"width: 557px;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td width=\"265\"><img src=\"http://localhost:8082/kemendesa/images/energi.jpg\" alt=\"d26.jpg\" width=\"191\" height=\"127\" /></td>\r\n<td width=\"346\">\r\n<p>a. Data geospasial koordinat lokasi, titik reference (TR) dan titik dasar (TD)<br/>b. Data luas pulau kecil terluar<br/>c. Data administratif 92 pulau kecil terluar<br/>d. Data aksesibilitas atau kesampaian lokasi<br/>e. Kependudukan (jumlah penduduk, pekerjaan, dll)<br/></p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n\r\n<h4 style=\"text-align: left;\" align=\"center\"><br /> <br /> Program yang Dijalankan</h4>\r\n\r\n\r\n<table border=0 cellpadding=0 cellspacing=0 width=660 style=\'border-collapse:\r\n collapse;table-layout:fixed;width:495pt\'>\r\n <col width=31 style=\'mso-width-source:userset;mso-width-alt:1133;width:23pt\'>\r\n <col width=38 style=\'mso-width-source:userset;mso-width-alt:1389;width:29pt\'>\r\n <col width=591 style=\'mso-width-source:userset;mso-width-alt:21613;width:443pt\'>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 width=31 style=\'height:15.0pt;width:23pt\'>1.</td>\r\n  <td colspan=2 class=xl1102255 width=629 style=\'width:472pt\'>Pelaksanaan\r\n  Kebijakan Pengembangan Daerah Pulau Kecil dan Terluar (Reguler)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.1.</td>\r\n  <td class=xl1102255 colspan=2>Pembangunan Tambatan Perahu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl982255>Kabupaten Aceh Singkil</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>2</td>\r\n  <td class=xl982255>Kabupaten Donggala</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>3</td>\r\n  <td class=xl982255>Kabupaten Gorontalo Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>4</td>\r\n  <td class=xl982255>Kabupaten Kep. Aru</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>5</td>\r\n  <td class=xl982255>Kabupaten Manggarai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>6</td>\r\n  <td class=xl982255>Kabupaten Maluku Barat Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>7</td>\r\n  <td class=xl982255>Kabupaten Nias Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>8</td>\r\n  <td class=xl982255>Kabupaten Sarmi</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>9</td>\r\n  <td class=xl982255>Kabupaten Sumbawa</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>10</td>\r\n  <td class=xl982255>Kabupaten Yapen</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.2.</td>\r\n  <td class=xl1102255 colspan=2>Pengadaan Kapal 20 Penumpang (5 GT)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl982255>Kabupaten Ketapang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>2</td>\r\n  <td class=xl982255>Kabupaten Kolaka Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>3</td>\r\n  <td class=xl982255>Kabupaten Mamuju</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>4</td>\r\n  <td class=xl982255>Kabupaten Halmahera Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>5</td>\r\n  <td class=xl982255>Kabupaten Tojo Una-Una</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>6</td>\r\n  <td class=xl982255>Kabupaten Muna Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>7</td>\r\n  <td class=xl982255>Kabupaten Teluk Wondama</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>8</td>\r\n  <td class=xl982255>Kabupaten Nabire</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.3.</td>\r\n  <td class=xl1102255 colspan=2>Pengadaan Kapal 50 Penumpang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl1002255>Kabupaten Buru Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>2</td>\r\n  <td class=xl1002255>Kabupaten Kep. Sula</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.4.</td>\r\n  <td class=xl1122255 colspan=2>Pangadaan Kapal Barang dan Penumpang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl1002255>Kabupaten Sabu Raijua</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.5.</td>\r\n  <td class=xl1122255 colspan=2>Pembangunan Dermaga</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>1</td>\r\n  <td class=xl982255>Kabupaten Lombok Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>2</td>\r\n  <td class=xl982255>Kabupaten Sorong</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>3</td>\r\n  <td class=xl982255>Kabupaten Tojo Una-Una</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>4</td>\r\n  <td class=xl982255>Kabupaten Banggai Kepulauan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>5</td>\r\n  <td class=xl982255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl982255></td>\r\n  <td class=xl982255></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 style=\'height:15.0pt\'>2.</td>\r\n  <td colspan=2 class=xl1132255 width=629 style=\'width:472pt\'>Pelaksanaan\r\n  Kebijakan Pengembangan Daerah Pulau Kecil dan Terluar (APBN-P)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>2.I.</td>\r\n  <td class=xl1142255 colspan=2>Pembangunan Dermaga</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>1</td>\r\n  <td class=xl982255>Kabupaten Buru Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>2</td>\r\n  <td class=xl982255>Kabupaten Ende</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>3</td>\r\n  <td class=xl982255>Kabupaten Konawe Kep.</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>4</td>\r\n  <td class=xl982255>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>5</td>\r\n  <td class=xl982255>Kabupaten Maluku Tengah</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>6</td>\r\n  <td class=xl982255>Kabupaten Manggarai Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>7</td>\r\n  <td class=xl982255>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>8</td>\r\n  <td class=xl982255>Kabupaten Banggai Laut</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>2.2.</td>\r\n  <td class=xl1142255 colspan=2>Pengadaan Kapal 50 Penumpang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>1</td>\r\n  <td class=xl982255>Kabupaten Alor</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>2</td>\r\n  <td class=xl982255>Kabupaten Kep. Sangihe</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>3</td>\r\n  <td class=xl982255>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>4</td>\r\n  <td class=xl982255>Kepulauan Anambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>5</td>\r\n  <td class=xl982255>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>6</td>\r\n  <td class=xl982255>Kabupaten Kep. Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>7</td>\r\n  <td class=xl982255>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>8</td>\r\n  <td class=xl982255>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>9</td>\r\n  <td class=xl982255>Kabupaten Maluku Barat Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>10</td>\r\n  <td class=xl982255>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>11</td>\r\n  <td class=xl982255>Kabupaten Bengkulu Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>12</td>\r\n  <td class=xl982255>Kabupaten Maluku Tenggara Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>13</td>\r\n  <td class=xl982255>Kabupaten Nias Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>14</td>\r\n  <td class=xl982255>Kabupaten Sarmi</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>15</td>\r\n  <td class=xl982255>Kabupaten Siau Tagulandang Biaro</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>16</td>\r\n  <td class=xl982255>Kabupaten Kep. Sula</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>2.3.</td>\r\n  <td class=xl982255 colspan=2>Pengadaan Kapal 20 Penumpang (5 GT)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>1</td>\r\n  <td class=xl952255>Kabupaten Banggai Kepulauan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>2</td>\r\n  <td class=xl952255>Kabupaten Bangka Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>3</td>\r\n  <td class=xl952255>Kabupaten Manggarai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>4</td>\r\n  <td class=xl952255>Kabupaten Teluk Bintuni</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>5</td>\r\n  <td class=xl952255>Kabupaten Gorontalo Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>6</td>\r\n  <td class=xl952255>Kabupaten Nias Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>7</td>\r\n  <td class=xl952255>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>8</td>\r\n  <td class=xl952255>Kabupaten Sorong Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>9</td>\r\n  <td class=xl952255>Kabupaten Banggai Laut</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>10</td>\r\n  <td class=xl952255>Kabupaten Mentawai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>11</td>\r\n  <td class=xl952255>Kabupaten Sikka</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>12</td>\r\n  <td class=xl952255>Kabupaten Buton</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>13</td>\r\n  <td class=xl1052255>Kabupaten Kolaka Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>14</td>\r\n  <td class=xl952255>Kabupaten Konawe Kepulauan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1042255>15</td>\r\n  <td class=xl952255>Kabupaten Bombana</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>2.4.</td>\r\n  <td class=xl982255 colspan=2>Jaringan Komunikasi dan Informasi Desa</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>1</td>\r\n  <td class=xl952255>Kabupaten Donggala</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>2</td>\r\n  <td class=xl952255>Kabupaten Kaimana</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>3</td>\r\n  <td class=xl952255>Kabupaten Kepulauan Yapen</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>4</td>\r\n  <td class=xl952255>Kabupaten Konawe</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>5</td>\r\n  <td class=xl952255>Kabupaten Halmahera Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>6</td>\r\n  <td class=xl952255>Kabupaten Lembata</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>7</td>\r\n  <td class=xl952255>Kabupaten Mamuju Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>8</td>\r\n  <td class=xl952255>Kabupaten Mentawai</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>9</td>\r\n  <td class=xl952255>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>10</td>\r\n  <td class=xl952255>Kabupaten Morowali</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>11</td>\r\n  <td class=xl952255>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>12</td>\r\n  <td class=xl952255>Kabupaten Pulau Taliabu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>13</td>\r\n  <td class=xl952255>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>14</td>\r\n  <td class=xl952255>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>15</td>\r\n  <td class=xl952255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>16</td>\r\n  <td class=xl952255>Kabupaten Sorong</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>17</td>\r\n  <td class=xl952255>Kabupaten Sorong Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>18</td>\r\n  <td class=xl952255>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>19</td>\r\n  <td class=xl952255>Kabupaten Teluk Wondama</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>20</td>\r\n  <td class=xl982255>Kabupaten Tojo Una-Una</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 style=\'height:15.0pt\'>2.5</td>\r\n  <td class=xl1072255 colspan=2>FASILITASI BANTUAN PENINGKATAN INFRASTRUKTUR\r\n  PENDIDIKAN</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td colspan=2 class=xl1132255 width=629 style=\'width:472pt\'>A. Bantuan\r\n  Stimulan Peningkatan Pembelajaran Berbasis Alat Peraga (SD, SMP, SMA)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl952255>Kabupaten Aceh Singkil</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>2</td>\r\n  <td class=xl952255>Kabupaten Kep. Anambas</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>3</td>\r\n  <td class=xl952255>Kabupaten Natuna</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>4</td>\r\n  <td class=xl952255>Kabupaten Nias Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>5</td>\r\n  <td class=xl952255>Kabupaten Nias Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>6</td>\r\n  <td class=xl952255>Kabupaten Sabang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>7</td>\r\n  <td class=xl952255>Kabupaten Bangka Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>8</td>\r\n  <td class=xl952255>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>9</td>\r\n  <td class=xl952255>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>10</td>\r\n  <td class=xl952255>Kabupaten Kupang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>11</td>\r\n  <td class=xl952255>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>12</td>\r\n  <td class=xl952255>Kabupaten Banggai Laut</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>13</td>\r\n  <td class=xl952255>Kabupaten Kep. Sangihe</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>14</td>\r\n  <td class=xl952255>Kabupaten Kep. Talaud</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>15</td>\r\n  <td class=xl952255>Kabupaten Maluku Barat Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>16</td>\r\n  <td class=xl952255>Kabupaten Maluku Tenggara Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>17</td>\r\n  <td class=xl952255>Kabupaten Morowali</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>18</td>\r\n  <td class=xl952255>Kabupaten Halmahera Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>19</td>\r\n  <td class=xl952255>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1102255 colspan=2>B. Bantuan Peningkatan Infrastruktur Sarana\r\n  Komputer Pendidikan(SD, SMP, SMA, SMK)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>1</td>\r\n  <td class=xl1062255> Kabupaten Aceh\r\n  Singkil </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>2</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Alor </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>3</td>\r\n  <td class=xl1062255> Kabupaten Kep.\r\n  Anambas </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>4</td>\r\n  <td class=xl1062255> Kabupaten Bengkulu\r\n  Utara </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>5</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Natuna </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>6</td>\r\n  <td class=xl1062255> Kabupaten Nias\r\n  Barat </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>7</td>\r\n  <td class=xl1062255> Kabupaten Nias\r\n  Selatan </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>8</td>\r\n  <td class=xl1062255> Kabupaten Nias\r\n  Utara </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>9</td>\r\n  <td class=xl1062255> Kabupaten Bangka\r\n  Selatan </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>10</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Sabang </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>11</td>\r\n  <td class=xl1062255> Kabupaten Sabu\r\n  Raijua </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>12</td>\r\n  <td class=xl1062255> Kabupaten Rote\r\n  Ndao </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>13</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Bengkayang </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>14</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Nunukan </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>15</td>\r\n  <td class=xl1062255> Kabupaten Banggai\r\n  Laut </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>16</td>\r\n  <td class=xl1062255> Kabupaten Kep.\r\n  Sangihe </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>17</td>\r\n  <td class=xl1062255> Kabupaten Kep.\r\n  Talaud </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>18</td>\r\n  <td class=xl1062255> Kabupaten Maluku\r\n  Barat Daya </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>19</td>\r\n  <td class=xl1062255> Kabupaten Maluku\r\n  Tenggara Barat </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>20</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Morowali </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>21</td>\r\n  <td class=xl1062255> Kabupaten Kep.\r\n  Aru </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>22</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Merauke </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>23</td>\r\n  <td class=xl1062255> Kabupaten Raja\r\n  Ampat </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>24</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Sarmi </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl992255>25</td>\r\n  <td class=xl1062255> Kabupaten\r\n  Supiori </td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 style=\'height:15.0pt\'>3.</td>\r\n  <td class=xl1102255 colspan=2>Pelaksanaan Pengembangan Potensi dan Sumber\r\n  Daya di Daerah Pesisir</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 style=\'height:15.0pt\'>3.1</td>\r\n  <td class=xl1102255 colspan=2>Pengembangan Potensi dan Sumber Daya di Daerah\r\n  Pesisir (Reguler)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1092255 colspan=2>A. Pengembangan Potensi Sumber Daya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>1</td>\r\n  <td class=xl1092255>Kabupaten Pasaman Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>2</td>\r\n  <td class=xl1092255>Kabupaten Sikka</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>3</td>\r\n  <td class=xl1092255>Kabupaten Nunukan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>4</td>\r\n  <td class=xl1092255>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1092255 colspan=2>B. Pengembangan Pulau Kecil Berdaya</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl962255></td>\r\n  <td class=xl972255>Keramba Jaring Apung</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>1</td>\r\n  <td class=xl1092255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>2</td>\r\n  <td class=xl1092255>Kabupaten Pulau Taliabu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl962255></td>\r\n  <td class=xl1092255>Pengadaan Air Bersih</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>1</td>\r\n  <td class=xl1092255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>2</td>\r\n  <td class=xl1092255>Kabupaten Pulau Taliabu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl962255></td>\r\n  <td class=xl972255>Tambatan Perahu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>1</td>\r\n  <td class=xl1092255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>2</td>\r\n  <td class=xl1092255>Kabupaten Pulau Taliabu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl962255></td>\r\n  <td class=xl972255>Pengadaan Budidaya Rumput Laut</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>1</td>\r\n  <td class=xl1092255>Kabupaten Seram Bagian Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1082255>2</td>\r\n  <td class=xl1092255>Kabupaten Pulau Taliabu</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1102255 style=\'height:15.0pt\'>3.2</td>\r\n  <td class=xl1102255 colspan=2>Pengembangan Potensi dan Sumber Daya di Daerah\r\n  Pesisir (Reguler)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>1.</td>\r\n  <td class=xl982255 colspan=2>Pengadaan Keramba Jaring Apung (KJA)</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>1</td>\r\n  <td class=xl952255>Kabupaten Rote Ndao</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>2</td>\r\n  <td class=xl952255>Kabupaten Sumbawa</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>3</td>\r\n  <td class=xl952255>Kabupaten Ketapang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>4</td>\r\n  <td class=xl952255>Kabupaten Gorontalo Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>5</td>\r\n  <td class=xl952255>Kabupaten Halmahera Barat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>6</td>\r\n  <td class=xl952255>Kabupaten Kepulauan Sula</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>7</td>\r\n  <td class=xl952255>Kabupaten Mamuju</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>8</td>\r\n  <td class=xl952255>Kabupaten Morowali</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1022255>9</td>\r\n  <td class=xl952255>Kabupaten Buton</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'>2.</td>\r\n  <td class=xl982255 colspan=2>Pengadaan Air Bersih</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>1</td>\r\n  <td class=xl952255>Kabupaten Bangka Selatan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>2</td>\r\n  <td class=xl952255>Kabupaten Bengkayang</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>3</td>\r\n  <td class=xl952255>Kabupaten Banggai Kepulauan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>4</td>\r\n  <td class=xl952255>Kabupaten Mamuju Utara</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>5</td>\r\n  <td class=xl952255>Kabupaten Bombana</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>6</td>\r\n  <td class=xl952255>Kabupaten Konawe</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl972255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>7</td>\r\n  <td class=xl952255>Kabupaten Donggala</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>8</td>\r\n  <td class=xl952255>Kabupaten Nabire</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>9</td>\r\n  <td class=xl952255>Kabupaten Merauke</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>10</td>\r\n  <td class=xl952255>Kabupaten Supiori</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>11</td>\r\n  <td class=xl952255>Kabupaten Raja Ampat</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>12</td>\r\n  <td class=xl952255>Kabupaten Kep. Yapen</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>13</td>\r\n  <td class=xl952255>Kabupaten Teluk Bintuni</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>14</td>\r\n  <td class=xl952255>Kabupaten Teluk Wondama</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl1092255 style=\'height:15.0pt\'></td>\r\n  <td class=xl1032255>15</td>\r\n  <td class=xl952255>Kabupaten Kaimana</td>\r\n </tr>\r\n <![if supportMisalignedColumns]>\r\n <tr height=0 style=\'display:none\'>\r\n  <td width=31 style=\'width:23pt\'></td>\r\n  <td width=38 style=\'width:29pt\'></td>\r\n  <td width=591 style=\'width:443pt\'></td>\r\n </tr>\r\n <![endif]>\r\n</table>\r\n', '', 1);
INSERT INTO `tb_section` (`section_id`, `section_name`, `section_description`, `content`, `section_image`, `category_id`) VALUES
(5, 'Daerah Rawan Pangan', '<p>Direktorat Pengembangan Kerjasama Pemerintah dan Swasta mempunyai tugas  melaksanakan penyiapan perumusan kebijakan, koordinasi, sinkronisasi  pelaksanaan penyusunan dan evaluasi perencanaan pembangunan nasional di  bidang pengembangan kerjasama pemerintah dan swasta, serta pemantauan  dan penilaian atas pelaksanaannya.</p>', '<table class=\"unitsectiontable\" style=\"width: 557px;\" align=\"left\">\r\n<tbody>\r\n<tr>\r\n<td width=\"265\"><img src=\"http://localhost:8082/kemendesa/images/pkps.jpg\" alt=\"pkps.jpg\" width=\"191\" height=\"143\" /></td>\r\n<td width=\"346\">\r\n<p>Data yang dicakup meliputi:\r\n<br>a. Jumlah produksi tanaman pangan; \r\n<br>b. Data jumlah penduduk rawan pangan dan sebarannya;\r\n<br>c. Data konsumsi penduduk terhadap tanaman pangan;\r\n<br>d. Data upaya penanggulangan rawan pangan.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n<br>\r\n\r\n<h4 style=\"text-align: left;\">Program yang Dijalankan</h4>\r\n\r\n<table border=0 cellpadding=0 cellspacing=0 width=731 style=\'border-collapse:\r\n collapse;table-layout:fixed;width:548pt\'>\r\n <col width=667 style=\'mso-width-source:userset;mso-width-alt:24393;width:500pt\'>\r\n <col width=64 style=\'width:48pt\'>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7226753 width=667 style=\'height:15.0pt;width:500pt\'>1.\r\n  Pengembangan Sumber Daya Pertanian, Peternakan dan Perikanan</td>\r\n  <td class=xl7026753 width=64 style=\'width:48pt\'></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'>Bantuan Penyediaan Bibit,\r\n  Benih, Pupuk, Pakan dan Pestisida</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>1.&nbsp;&nbsp; \r\n   Kabupaten Nagan Raya</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>2.&nbsp; \r\n   &nbsp;Kabupaten Kepulauan Mentawai</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>3.&nbsp;&nbsp; \r\n   Kabupaten Seluma</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>4.&nbsp; \r\n   &nbsp;Kabupaten Lebak</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>5.&nbsp; \r\n   &nbsp;Kabupaten Sampang</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>6.&nbsp; \r\n   &nbsp;Kabupaten Lombok Timur</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>7.&nbsp; \r\n   &nbsp;Kabupaten Bima</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>8.&nbsp; \r\n   &nbsp;Kabupaten Sanggau</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>9.&nbsp;&nbsp;Kabupaten Sambas</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>10.&nbsp; \r\n   &nbsp;Kabupaten Hulu Sungai Utara</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>11.&nbsp;&nbsp; \r\n   Kabupaten Tojo Una-Una</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>12.&nbsp; Kabupaten Seram\r\n  Bagian Barat</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>13. \r\n   Kabupaten Halmahera Selatan</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>14.&nbsp;&nbsp;Kabupaten\r\n  Manokwari</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>15.&nbsp;&nbsp;Kabupaten\r\n  Merauke</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=42 style=\'mso-height-source:userset;height:31.5pt\'>\r\n  <td colspan=2 height=42 class=xl7126753 width=731 style=\'height:31.5pt;\r\n  width:548pt\'>2. Pembangunan/Peningkatan Sarana Prasarana Penunjang Utama\r\n  Penyelenggaraan Pangan Bidang Pertanian, Peternakan dan Perikanan</td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'>Irigasi, Embung, Jalan Usaha Tani,\r\n  Lumbung/Gudang, Kandang dan Jalan Penghubung</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>1.&nbsp;&nbsp; \r\n   Kabupaten Nagan Raya</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>2.&nbsp; \r\n   &nbsp;Kabupaten Kepulauan Mentawai</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>3.&nbsp;&nbsp; \r\n   Kabupaten Seluma</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>4.&nbsp; \r\n   &nbsp;Kabupaten Lebak</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>5.&nbsp; \r\n   &nbsp;Kabupaten Sampang</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>6.&nbsp; \r\n   &nbsp;Kabupaten Lombok Timur</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>7.&nbsp; \r\n   &nbsp;Kabupaten Bima</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>8.&nbsp; \r\n   &nbsp;Kabupaten Sanggau</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>9.&nbsp;&nbsp;Kabupaten Sambas</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>10.&nbsp; \r\n   &nbsp;Kabupaten Hulu Sungai Utara</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>11.&nbsp;&nbsp; \r\n   Kabupaten Tojo Una-Una</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>12.&nbsp; Kabupaten Seram\r\n  Bagian Barat</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>13. \r\n   Kabupaten Halmahera Selatan</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>14.&nbsp;&nbsp;Kabupaten\r\n  Manokwari</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>15.&nbsp;&nbsp;Kabupaten\r\n  Merauke</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7226753 style=\'height:15.0pt\'>3.\r\n  Pembangunan/Peningkatan Sarana Prasarana Produksi Pasca Panen</td>\r\n  <td class=xl7026753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'>Bantuan Sarana Prasarana Produksi Hasil\r\n  Budidaya Pertanian, Peternakan dan Perikanan</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>1.&nbsp;&nbsp; \r\n   Kabupaten Nagan Raya</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>2.&nbsp; \r\n   &nbsp;Kabupaten Kepulauan Mentawai</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>3.&nbsp;&nbsp; \r\n   Kabupaten Seluma</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>4.&nbsp; \r\n   &nbsp;Kabupaten Lebak</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>5.&nbsp; \r\n   &nbsp;Kabupaten Sampang</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>6.&nbsp; \r\n   &nbsp;Kabupaten Lombok Timur</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>7.&nbsp; \r\n   &nbsp;Kabupaten Bima</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>8.&nbsp; \r\n   &nbsp;Kabupaten Sanggau</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>9.&nbsp;&nbsp;Kabupaten Sambas</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>10.&nbsp; \r\n   &nbsp;Kabupaten Hulu Sungai Utara</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>11.&nbsp;&nbsp; \r\n   Kabupaten Tojo Una-Una</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>12.&nbsp; Kabupaten Seram\r\n  Bagian Barat</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>13. \r\n   Kabupaten Halmahera Selatan</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>14.&nbsp;&nbsp;Kabupaten\r\n  Manokwari</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>15.&nbsp;&nbsp;Kabupaten\r\n  Merauke</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7226753 style=\'height:15.0pt\'>4. Bantuan Sarana\r\n  Distribusi Pangan Hasil Pertanian, Peternakan dan Perikanan</td>\r\n  <td class=xl6826753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'>Pengadaan Angkutan Distribusi Darat / Laut</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7326753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>1.&nbsp;&nbsp; \r\n   Kabupaten Nagan Raya</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>2.&nbsp; \r\n   &nbsp;Kabupaten Kepulauan Mentawai</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>3.&nbsp;&nbsp; \r\n   Kabupaten Seluma</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>4.&nbsp; \r\n   &nbsp;Kabupaten Lebak</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>5.&nbsp; \r\n   &nbsp;Kabupaten Sampang</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>6.&nbsp; \r\n   &nbsp;Kabupaten Lombok Timur</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>7.&nbsp; \r\n   &nbsp;Kabupaten Bima</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>8.&nbsp; \r\n   &nbsp;Kabupaten Sanggau</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>9.&nbsp;&nbsp;Kabupaten Sambas</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>10.&nbsp; \r\n   &nbsp;Kabupaten Hulu Sungai Utara</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>11.&nbsp;&nbsp; \r\n   Kabupaten Tojo Una-Una</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>12.&nbsp; Kabupaten Seram\r\n  Bagian Barat</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>13. \r\n   Kabupaten Halmahera Selatan</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>14.&nbsp;&nbsp;Kabupaten\r\n  Manokwari</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>15.&nbsp;&nbsp;Kabupaten\r\n  Merauke</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7226753 style=\'height:15.0pt\'>5. Pembangunan Rumah\r\n  Produksi Pangan</td><td class=xl6826753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7226753 style=\'height:15.0pt\'></td>\r\n  <td class=xl6826753></td>\r\n </tr>\r\n <tr height=20 style=\'height:15.0pt\'>\r\n  <td height=20 class=xl7426753 style=\'height:15.0pt\'>1.&nbsp;&nbsp;Kabupaten\r\n  Sanggau</td>\r\n  <td class=xl6926753></td>\r\n </tr>\r\n <![if supportMisalignedColumns]>\r\n <tr height=0 style=\'display:none\'>\r\n  <td width=667 style=\'width:500pt\'></td>\r\n  <td width=64 style=\'width:48pt\'></td>\r\n </tr>\r\n <![endif]>\r\n</table>\r\n', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sector`
--

CREATE TABLE `tb_sector` (
  `seqNo` int(11) NOT NULL,
  `sectorCode` varchar(4) DEFAULT NULL,
  `sectorName` varchar(30) DEFAULT NULL,
  `subsectorNameId` varchar(30) DEFAULT NULL,
  `subsectorNameEn` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sector`
--

INSERT INTO `tb_sector` (`seqNo`, `sectorCode`, `sectorName`, `subsectorNameId`, `subsectorNameEn`) VALUES
(1, 'SP', 'Transportation', 'Sea Port', 'Pelabuhan Laut'),
(2, 'BT', 'Transportation', 'Land Transport/Bus Terminal', 'Terminal Bus'),
(3, 'AP', 'Transportation', 'Air Transport ', 'Transportasi Udara'),
(4, 'RW', 'Transportation', 'Rail Transport ', 'Transportasi Kereta Api'),
(5, 'TR', 'Transportation', 'Toll Road', 'Jalan Tol'),
(6, 'WM', 'Environmental / Sanitation', 'Solid Waste Treatment', 'Limbah Padat'),
(7, 'OT', 'Other Infrastructure', 'Urban Infrastructure', 'Infrastruktur Urban'),
(8, 'MK', 'Other Infrastructure', 'Market', 'Pasar'),
(9, 'EN', 'Energy', 'Power Plant', 'Pembangkit Listrik'),
(10, 'WS', 'Water', 'Water Supply', 'Air Minum'),
(11, 'WW', 'Water', 'Wastewater ', 'Limbah Air'),
(12, 'IC', 'Telco & Information', 'Telecommunication', 'Telekomunikasi'),
(13, 'EG', 'Telco & Information', 'e-Government', 'e-Government');

-- --------------------------------------------------------

--
-- Table structure for table `tb_subsection`
--

CREATE TABLE `tb_subsection` (
  `subsection_id` int(11) NOT NULL,
  `subsection_name` varchar(255) DEFAULT NULL,
  `subsection_description` text NOT NULL,
  `subsection_thumbnail` varchar(255) DEFAULT NULL,
  `subsection_image` varchar(255) DEFAULT NULL,
  `subsection_cad` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `category_id` double DEFAULT NULL,
  `section_id` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_subsection`
--

INSERT INTO `tb_subsection` (`subsection_id`, `subsection_name`, `subsection_description`, `subsection_thumbnail`, `subsection_image`, `subsection_cad`, `content`, `category_id`, `section_id`) VALUES
(188, 'Juz 1', '', NULL, NULL, NULL, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `about` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `about`) VALUES
(1, '', 'tsbudijanto', 'ADE8423ceen', NULL, 'tsbudijanto@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Trisetyo', 'Budiyanto', NULL, NULL, NULL),
(2, '', 'harry', 'p0nselpay', NULL, 'harry@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Harry', 'Darmawan', NULL, NULL, NULL),
(4, '127.0.0.1', 'guest', 'p0nselpay', NULL, 'guest', NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(8, '', 'doni', 'p0nselpay', NULL, 'donnyhades@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Doni', 'Firmansyah', NULL, NULL, NULL),
(9, '', 'rahman', 'p0nselpay', NULL, 'armansyam.kjppsah@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Abdul', 'Rahman', NULL, NULL, NULL),
(10, '', 'femmy', 'p0nselpay', NULL, 'femmyandri02@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Yul Femmy', 'Andri', NULL, NULL, NULL),
(11, '', 'ganda', 'p0nselpay', NULL, 'only_ganda@yahoo.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Ganda Elang', 'Permana', NULL, NULL, NULL),
(12, '', 'rafli', 'p0nselpay', NULL, 'rafliakbarrafsanjani@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Rafli Akbar', 'Rafsanjani', NULL, NULL, NULL),
(13, '', 'gentur', 'p0nselpay', NULL, 'ekogenturmursito@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Eko Gentur', 'Mursito', NULL, NULL, NULL),
(14, '', 'adhi', 'p0nselpay', NULL, 'pamungkas_adhi@yahoo.co.id', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Adhi', 'Pamungkas', NULL, NULL, NULL),
(15, '', 'rurry', 'p0nselpay', NULL, 'nanosarenge@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Rurry', 'Prastiyanto', NULL, NULL, NULL),
(16, '', 'prie', 'p0nselpay', NULL, 'prie2474@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Bambang', 'Priambodo', NULL, NULL, NULL),
(17, '', 'parid', 'p0nselpay', NULL, 'paridridwan.pr@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Parid', 'Ridwan', NULL, NULL, NULL),
(18, '', 'agungmulyana', 'p0nselpay', NULL, 'agungmulyana905@yahoo.co.id', NULL, NULL, NULL, NULL, 0, NULL, 1, 'Agung', 'Mulyana', NULL, NULL, NULL),
(19, '', 'gun', 'p0nselpay', NULL, 'gunendra@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, 'Gun', 'Hendra', NULL, NULL, NULL),
(20, '', 'bsetyawan194', 'p0nselpay', NULL, 'bsetyawan194@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, 'B', 'Setyawan', NULL, NULL, NULL),
(21, '', 'Adi Soendoko', 'p0nselpay', NULL, 'adisoendoko.wad@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, 'Adi', 'Sundoko', NULL, NULL, NULL),
(22, '', 'Agus Yudianto', 'p0nselpay', NULL, 'agusyudianto015@gmail.com', NULL, NULL, NULL, NULL, 0, NULL, 1, 'Agus', 'Yudianto', NULL, NULL, NULL),
(38, '', 'jaka', 'sumanta', NULL, 'jakasumanta@yahoo.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Jaka', 'Sumanta', NULL, NULL, NULL),
(43, '', 'noorman', 'noorman', NULL, 'noorman@yahoo.com', NULL, NULL, NULL, NULL, 0, NULL, NULL, 'Noorman Kamaru', 'kamaru', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 1, '1'),
(4, 2, '2'),
(5, 6, '2'),
(6, 7, '1'),
(7, 7, '2'),
(8, 7, '3'),
(9, 8, '3'),
(10, 11, '3'),
(11, 12, '4'),
(16, 9, '2'),
(17, 10, '1'),
(19, 18, '1'),
(20, 19, '1'),
(21, 20, '1'),
(22, 20, '1'),
(23, 21, '1'),
(24, 22, '1'),
(25, 17, '1'),
(26, 23, '1'),
(27, 25, '4'),
(41, 38, '5'),
(46, 43, '6');

-- --------------------------------------------------------

--
-- Table structure for table `volley_upload`
--

CREATE TABLE `volley_upload` (
  `id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `photo` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volley_upload`
--

INSERT INTO `volley_upload` (`id`, `name`, `photo`) VALUES
(1, 'tesr', 'http://www.xsoftco.com/assets/posscripts/images/hej2v073fcf2a24cdejv.png'),
(2, 'tes', 'http://www.xsoftco.com/assets/posscripts/images/xrgnhz9ny843qtrv5937.png'),
(3, 'testing', 'http://www.xsoftco.com/assets/posscripts/images/0mga9ra3660c77hmfyxf.png');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_maks_group`
-- (See below for the actual view)
--
CREATE TABLE `v_maks_group` (
`max_group` varchar(8)
);

-- --------------------------------------------------------

--
-- Structure for view `v_maks_group`
--
DROP TABLE IF EXISTS `v_maks_group`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_maks_group`  AS  select max(`survey08_pembanding`.`group_id`) AS `max_group` from `survey08_pembanding` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_limits`
--
ALTER TABLE `api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts_tags`
--
ALTER TABLE `blog_posts_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bm_photos_categories`
--
ALTER TABLE `bm_photos_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cover_photos`
--
ALTER TABLE `cover_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foto_td`
--
ALTER TABLE `foto_td`
  ADD PRIMARY KEY (`id_ftd`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `org_structure`
--
ALTER TABLE `org_structure`
  ADD PRIMARY KEY (`node_id`);

--
-- Indexes for table `pos_master_menu`
--
ALTER TABLE `pos_master_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_order_detail`
--
ALTER TABLE `pos_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_order_payment`
--
ALTER TABLE `pos_order_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_order_trans0`
--
ALTER TABLE `pos_order_trans0`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pos_table_status`
--
ALTER TABLE `pos_table_status`
  ADD PRIMARY KEY (`table_no`);

--
-- Indexes for table `pos_users`
--
ALTER TABLE `pos_users`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `regulasi`
--
ALTER TABLE `regulasi`
  ADD PRIMARY KEY (`info_id`);

--
-- Indexes for table `regulasi_categories`
--
ALTER TABLE `regulasi_categories`
  ADD PRIMARY KEY (`catinfo_id`);

--
-- Indexes for table `survey01_imgbatas`
--
ALTER TABLE `survey01_imgbatas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey01_lokasi`
--
ALTER TABLE `survey01_lokasi`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `survey02_jalan`
--
ALTER TABLE `survey02_jalan`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `survey03_pasar`
--
ALTER TABLE `survey03_pasar`
  ADD PRIMARY KEY (`id_data`);

--
-- Indexes for table `survey04_status`
--
ALTER TABLE `survey04_status`
  ADD PRIMARY KEY (`id_data_status`),
  ADD KEY `id_data` (`id_data`);

--
-- Indexes for table `survey06_kelola`
--
ALTER TABLE `survey06_kelola`
  ADD PRIMARY KEY (`id_kelola`),
  ADD KEY `id_data` (`id_data`);

--
-- Indexes for table `survey07_hbu`
--
ALTER TABLE `survey07_hbu`
  ADD PRIMARY KEY (`id_data_hbu`),
  ADD KEY `id_data` (`id_data`);

--
-- Indexes for table `survey08_pembanding`
--
ALTER TABLE `survey08_pembanding`
  ADD PRIMARY KEY (`id_data_banding`),
  ADD KEY `id_data` (`id_data`);

--
-- Indexes for table `survey09_bangunan`
--
ALTER TABLE `survey09_bangunan`
  ADD PRIMARY KEY (`id_bangunan`),
  ADD KEY `lokasi` (`id_data`);

--
-- Indexes for table `survey11_ft_batas_tapak`
--
ALTER TABLE `survey11_ft_batas_tapak`
  ADD PRIMARY KEY (`id_foto_batas_tapak`);

--
-- Indexes for table `survey12_ft_sketsa_tapak`
--
ALTER TABLE `survey12_ft_sketsa_tapak`
  ADD PRIMARY KEY (`id_foto_sketsa_tapak`);

--
-- Indexes for table `survey13_ft_pembanding`
--
ALTER TABLE `survey13_ft_pembanding`
  ADD PRIMARY KEY (`id_foto_pembanding`);

--
-- Indexes for table `survey14_ft_sketsa bangunan`
--
ALTER TABLE `survey14_ft_sketsa bangunan`
  ADD PRIMARY KEY (`id_sketsa_bangunan`);

--
-- Indexes for table `tb_section`
--
ALTER TABLE `tb_section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volley_upload`
--
ALTER TABLE `volley_upload`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `api_limits`
--
ALTER TABLE `api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_posts_tags`
--
ALTER TABLE `blog_posts_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bm_photos_categories`
--
ALTER TABLE `bm_photos_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cover_photos`
--
ALTER TABLE `cover_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `foto_td`
--
ALTER TABLE `foto_td`
  MODIFY `id_ftd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=583;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pos_master_menu`
--
ALTER TABLE `pos_master_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `pos_order_detail`
--
ALTER TABLE `pos_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;

--
-- AUTO_INCREMENT for table `pos_order_payment`
--
ALTER TABLE `pos_order_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regulasi`
--
ALTER TABLE `regulasi`
  MODIFY `info_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;

--
-- AUTO_INCREMENT for table `regulasi_categories`
--
ALTER TABLE `regulasi_categories`
  MODIFY `catinfo_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `survey01_imgbatas`
--
ALTER TABLE `survey01_imgbatas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey11_ft_batas_tapak`
--
ALTER TABLE `survey11_ft_batas_tapak`
  MODIFY `id_foto_batas_tapak` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `survey12_ft_sketsa_tapak`
--
ALTER TABLE `survey12_ft_sketsa_tapak`
  MODIFY `id_foto_sketsa_tapak` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `survey13_ft_pembanding`
--
ALTER TABLE `survey13_ft_pembanding`
  MODIFY `id_foto_pembanding` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `survey14_ft_sketsa bangunan`
--
ALTER TABLE `survey14_ft_sketsa bangunan`
  MODIFY `id_sketsa_bangunan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `tb_section`
--
ALTER TABLE `tb_section`
  MODIFY `section_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `volley_upload`
--
ALTER TABLE `volley_upload`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `survey02_jalan`
--
ALTER TABLE `survey02_jalan`
  ADD CONSTRAINT `survey02_jalan_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey03_pasar`
--
ALTER TABLE `survey03_pasar`
  ADD CONSTRAINT `survey03_pasar_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey04_status`
--
ALTER TABLE `survey04_status`
  ADD CONSTRAINT `survey04_status_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey06_kelola`
--
ALTER TABLE `survey06_kelola`
  ADD CONSTRAINT `survey06_kelola_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey07_hbu`
--
ALTER TABLE `survey07_hbu`
  ADD CONSTRAINT `survey07_hbu_ibfk_1` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `survey09_bangunan`
--
ALTER TABLE `survey09_bangunan`
  ADD CONSTRAINT `lokasi` FOREIGN KEY (`id_data`) REFERENCES `survey01_lokasi` (`id_data`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
