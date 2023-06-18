-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 17 Jun 2023 pada 23.24
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kepulangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat`
--

CREATE TABLE `alamat` (
  `id` bigint UNSIGNED NOT NULL,
  `judul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lokasi` text COLLATE utf8mb4_unicode_ci,
  `utama` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `alamat`
--

INSERT INTO `alamat` (`id`, `judul`, `lokasi`, `utama`) VALUES
(1, 'Rumah Ramah PMI', 'Aeroland Residence Blok R3 No. 5 dan 6 Kel. Jurumundi, Kec. Benda, Kota Tangerang, Banten', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `antar_area`
--

CREATE TABLE `antar_area` (
  `from_area` bigint UNSIGNED DEFAULT NULL,
  `to_area` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `antar_area`
--

INSERT INTO `antar_area` (`from_area`, `to_area`) VALUES
(1, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `area`
--

CREATE TABLE `area` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `area`
--

INSERT INTO `area` (`id`, `nama`) VALUES
(1, 'Helpdesk'),
(2, 'Lounge'),
(3, 'Shelter'),
(4, 'Cargo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `area_kepulangan`
--

CREATE TABLE `area_kepulangan` (
  `id_area` bigint UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `area_kepulangan`
--

INSERT INTO `area_kepulangan` (`id_area`, `id_kepulangan`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `area_layanan`
--

CREATE TABLE `area_layanan` (
  `id_area` bigint UNSIGNED DEFAULT NULL,
  `id_layanan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `area_layanan`
--

INSERT INTO `area_layanan` (`id_area`, `id_layanan`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(2, 5),
(3, 1),
(3, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_darat`
--

CREATE TABLE `bast_darat` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_penyedia_jasa` bigint UNSIGNED DEFAULT NULL,
  `id_alamat` bigint UNSIGNED DEFAULT NULL COMMENT 'Lokasi Jemput',
  `durasi_pengerjaan` int DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Jemput',
  `foto_penyedia_jasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_makan`
--

CREATE TABLE `bast_makan` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_penyedia_jasa` bigint UNSIGNED DEFAULT NULL,
  `id_alamat` bigint UNSIGNED DEFAULT NULL COMMENT 'Lokasi Antar',
  `durasi_pengerjaan` int DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Antar',
  `waktu_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Waktu Antar',
  `foto_penyedia_jasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_invoice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_pihak_lain`
--

CREATE TABLE `bast_pihak_lain` (
  `id` bigint UNSIGNED NOT NULL,
  `id_pihak_kedua` bigint UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_pihak_kedua` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_udara`
--

CREATE TABLE `bast_udara` (
  `id` bigint UNSIGNED NOT NULL,
  `purchase_order` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_penyedia_jasa` bigint UNSIGNED DEFAULT NULL,
  `id_alamat` bigint UNSIGNED DEFAULT NULL COMMENT 'Lokasi Jemput',
  `durasi_pengerjaan` int DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Jemput',
  `foto_penyedia_jasa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cargo`
--

CREATE TABLE `cargo` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cargo`
--

INSERT INTO `cargo` (`id`, `nama`) VALUES
(1, 'BP3MI Banten'),
(2, 'PT/Majikan/Agensi'),
(3, 'Kementrian/Pemerintah Daerah'),
(4, 'Keluarga/Relawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `darat`
--

CREATE TABLE `darat` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_bast_darat` bigint UNSIGNED DEFAULT NULL,
  `foto_bast` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `group`
--

CREATE TABLE `group` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `group`
--

INSERT INTO `group` (`id`, `nama`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `imigran`
--

CREATE TABLE `imigran` (
  `id` bigint UNSIGNED NOT NULL,
  `brafaks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paspor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jenis_kelamin` bigint UNSIGNED DEFAULT NULL,
  `id_negara` bigint UNSIGNED DEFAULT NULL,
  `id_sub_kawasan` bigint UNSIGNED DEFAULT NULL,
  `id_kawasan` bigint UNSIGNED DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `id_kab_kota` bigint UNSIGNED DEFAULT NULL,
  `id_provinsi` bigint UNSIGNED DEFAULT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_jabatan` bigint UNSIGNED DEFAULT NULL,
  `tanggal_kedatangan` date DEFAULT NULL,
  `id_area` bigint UNSIGNED DEFAULT NULL,
  `id_layanan` bigint UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT '0',
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama`) VALUES
(1, 'ABK'),
(2, 'BABY SITTER'),
(3, 'BANGUNAN'),
(4, 'CARE TAKER'),
(5, 'CASHIER'),
(6, 'CLEANER'),
(7, 'CLEANING SERVICE'),
(8, 'CPMI'),
(9, 'JASA UMUM'),
(10, 'KEBERSIHAN'),
(11, 'KEDAI'),
(12, 'OPERATOR SCAMMING'),
(13, 'PABRIK'),
(14, 'PERAWAT'),
(15, 'PERKEBUNAN'),
(16, 'PLRT'),
(17, 'SCAMMER ONLINE'),
(18, 'SECURITY'),
(19, 'STAFF'),
(20, 'STAFF HOTEL'),
(21, 'SUPIR PRIBADI'),
(22, 'TEKNISI'),
(23, 'THERAPIST'),
(99, 'LAINNYA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jemput_keluarga`
--

CREATE TABLE `jemput_keluarga` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `nama_penjemput` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hubungan_dengan_pmi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp_penjemput` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_penjemput` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jemput_pihak_lain`
--

CREATE TABLE `jemput_pihak_lain` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_bast_pihak_lain` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenazah`
--

CREATE TABLE `jenazah` (
  `id` bigint UNSIGNED NOT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_cargo` bigint UNSIGNED DEFAULT NULL,
  `foto_jenazah` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_paspor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_brafaks` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_kelamin`
--

INSERT INTO `jenis_kelamin` (`id`, `nama`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kab_kota`
--

CREATE TABLE `kab_kota` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_provinsi` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kab_kota`
--

INSERT INTO `kab_kota` (`id`, `nama`, `id_provinsi`) VALUES
(1101, 'KAB. ACEH SELATAN', 11),
(1102, 'KAB. ACEH TENGGARA', 11),
(1103, 'KAB. ACEH TIMUR', 11),
(1104, 'KAB. ACEH TENGAH', 11),
(1105, 'KAB. ACEH BARAT', 11),
(1106, 'KAB. ACEH BESAR', 11),
(1107, 'KAB. PIDIE', 11),
(1108, 'KAB. ACEH UTARA', 11),
(1109, 'KAB. SIMEULUE', 11),
(1110, 'KAB. ACEH SINGKIL', 11),
(1111, 'KAB. BIREUEN', 11),
(1112, 'KAB. ACEH BARAT DAYA', 11),
(1113, 'KAB. GAYO LUES', 11),
(1114, 'KAB. ACEH JAYA', 11),
(1115, 'KAB. NAGAN RAYA', 11),
(1116, 'KAB. ACEH TAMIANG', 11),
(1117, 'KAB. BENER MERIAH', 11),
(1118, 'KAB. PIDIE JAYA', 11),
(1171, 'KOTA BANDA ACEH', 11),
(1172, 'KOTA SABANG', 11),
(1173, 'KOTA LHOKSEUMAWE', 11),
(1174, 'KOTA LANGSA', 11),
(1175, 'KOTA SUBULUSSALAM', 11),
(1201, 'KAB. TAPANULI TENGAH', 12),
(1202, 'KAB. TAPANULI UTARA', 12),
(1203, 'KAB. TAPANULI SELATAN', 12),
(1204, 'KAB. NIAS', 12),
(1205, 'KAB. LANGKAT', 12),
(1206, 'KAB. KARO', 12),
(1207, 'KAB. DELI SERDANG', 12),
(1208, 'KAB. SIMALUNGUN', 12),
(1209, 'KAB. ASAHAN', 12),
(1210, 'KAB. LABUHANBATU', 12),
(1211, 'KAB. DAIRI', 12),
(1212, 'KAB. TOBA', 12),
(1213, 'KAB. MANDAILING NATAL', 12),
(1214, 'KAB. NIAS SELATAN', 12),
(1215, 'KAB. PAKPAK BHARAT', 12),
(1216, 'KAB. HUMBANG HASUNDUTAN', 12),
(1217, 'KAB. SAMOSIR', 12),
(1218, 'KAB. SERDANG BEDAGAI', 12),
(1219, 'KAB. BATU BARA', 12),
(1220, 'KAB. PADANG LAWAS UTARA', 12),
(1221, 'KAB. PADANG LAWAS', 12),
(1222, 'KAB. LABUHANBATU SELATAN', 12),
(1223, 'KAB. LABUHANBATU UTARA', 12),
(1224, 'KAB. NIAS UTARA', 12),
(1225, 'KAB. NIAS BARAT', 12),
(1271, 'KOTA MEDAN', 12),
(1272, 'KOTA PEMATANGSIANTAR', 12),
(1273, 'KOTA SIBOLGA', 12),
(1274, 'KOTA TANJUNG BALAI', 12),
(1275, 'KOTA BINJAI', 12),
(1276, 'KOTA TEBING TINGGI', 12),
(1277, 'KOTA PADANGSIDIMPUAN', 12),
(1278, 'KOTA GUNUNGSITOLI', 12),
(1301, 'KAB. PESISIR SELATAN', 13),
(1302, 'KAB. SOLOK', 13),
(1303, 'KAB. SIJUNJUNG', 13),
(1304, 'KAB. TANAH DATAR', 13),
(1305, 'KAB. PADANG PARIAMAN', 13),
(1306, 'KAB. AGAM', 13),
(1307, 'KAB. LIMA PULUH KOTA', 13),
(1308, 'KAB. PASAMAN', 13),
(1309, 'KAB. KEPULAUAN MENTAWAI', 13),
(1310, 'KAB. DHARMASRAYA', 13),
(1311, 'KAB. SOLOK SELATAN', 13),
(1312, 'KAB. PASAMAN BARAT', 13),
(1371, 'KOTA PADANG', 13),
(1372, 'KOTA SOLOK', 13),
(1373, 'KOTA SAWAHLUNTO', 13),
(1374, 'KOTA PADANG PANJANG', 13),
(1375, 'KOTA BUKITTINGGI', 13),
(1376, 'KOTA PAYAKUMBUH', 13),
(1377, 'KOTA PARIAMAN', 13),
(1401, 'KAB. KAMPAR', 14),
(1402, 'KAB. INDRAGIRI HULU', 14),
(1403, 'KAB. BENGKALIS', 14),
(1404, 'KAB. INDRAGIRI HILIR', 14),
(1405, 'KAB. PELALAWAN', 14),
(1406, 'KAB. ROKAN HULU', 14),
(1407, 'KAB. ROKAN HILIR', 14),
(1408, 'KAB. SIAK', 14),
(1409, 'KAB. KUANTAN SINGINGI', 14),
(1410, 'KAB. KEPULAUAN MERANTI', 14),
(1471, 'KOTA PEKANBARU', 14),
(1472, 'KOTA DUMAI', 14),
(1501, 'KAB. KERINCI', 15),
(1502, 'KAB. MERANGIN', 15),
(1503, 'KAB. SAROLANGUN', 15),
(1504, 'KAB. BATANGHARI', 15),
(1505, 'KAB. MUARO JAMBI', 15),
(1506, 'KAB. TANJUNG JABUNG BARAT', 15),
(1507, 'KAB. TANJUNG JABUNG TIMUR', 15),
(1508, 'KAB. BUNGO', 15),
(1509, 'KAB. TEBO', 15),
(1571, 'KOTA JAMBI', 15),
(1572, 'KOTA SUNGAI PENUH', 15),
(1601, 'KAB. OGAN KOMERING ULU', 16),
(1602, 'KAB. OGAN KOMERING ILIR', 16),
(1603, 'KAB. MUARA ENIM', 16),
(1604, 'KAB. LAHAT', 16),
(1605, 'KAB. MUSI RAWAS', 16),
(1606, 'KAB. MUSI BANYUASIN', 16),
(1607, 'KAB. BANYUASIN', 16),
(1608, 'KAB. OGAN KOMERING ULU TIMUR', 16),
(1609, 'KAB. OGAN KOMERING ULU SELATAN', 16),
(1610, 'KAB. OGAN ILIR', 16),
(1611, 'KAB. EMPAT LAWANG', 16),
(1612, 'KAB. PENUKAL ABAB LEMATANG ILIR', 16),
(1613, 'KAB. MUSI RAWAS UTARA', 16),
(1671, 'KOTA PALEMBANG', 16),
(1672, 'KOTA PAGAR ALAM', 16),
(1673, 'KOTA LUBUK LINGGAU', 16),
(1674, 'KOTA PRABUMULIH', 16),
(1701, 'KAB. BENGKULU SELATAN', 17),
(1702, 'KAB. REJANG LEBONG', 17),
(1703, 'KAB. BENGKULU UTARA', 17),
(1704, 'KAB. KAUR', 17),
(1705, 'KAB. SELUMA', 17),
(1706, 'KAB. MUKO MUKO', 17),
(1707, 'KAB. LEBONG', 17),
(1708, 'KAB. KEPAHIANG', 17),
(1709, 'KAB. BENGKULU TENGAH', 17),
(1771, 'KOTA BENGKULU', 17),
(1801, 'KAB. LAMPUNG SELATAN', 18),
(1802, 'KAB. LAMPUNG TENGAH', 18),
(1803, 'KAB. LAMPUNG UTARA', 18),
(1804, 'KAB. LAMPUNG BARAT', 18),
(1805, 'KAB. TULANG BAWANG', 18),
(1806, 'KAB. TANGGAMUS', 18),
(1807, 'KAB. LAMPUNG TIMUR', 18),
(1808, 'KAB. WAY KANAN', 18),
(1809, 'KAB. PESAWARAN', 18),
(1810, 'KAB. PRINGSEWU', 18),
(1811, 'KAB. MESUJI', 18),
(1812, 'KAB. TULANG BAWANG BARAT', 18),
(1813, 'KAB. PESISIR BARAT', 18),
(1871, 'KOTA BANDAR LAMPUNG', 18),
(1872, 'KOTA METRO', 18),
(1901, 'KAB. BANGKA', 19),
(1902, 'KAB. BELITUNG', 19),
(1903, 'KAB. BANGKA SELATAN', 19),
(1904, 'KAB. BANGKA TENGAH', 19),
(1905, 'KAB. BANGKA BARAT', 19),
(1906, 'KAB. BELITUNG TIMUR', 19),
(1971, 'KOTA PANGKAL PINANG', 19),
(2101, 'KAB. BINTAN', 21),
(2102, 'KAB. KARIMUN', 21),
(2103, 'KAB. NATUNA', 21),
(2104, 'KAB. LINGGA', 21),
(2105, 'KAB. KEPULAUAN ANAMBAS', 21),
(2171, 'KOTA BATAM', 21),
(2172, 'KOTA TANJUNG PINANG', 21),
(3101, 'KAB. ADM. KEP. SERIBU', 31),
(3171, 'KOTA ADM. JAKARTA PUSAT', 31),
(3172, 'KOTA ADM. JAKARTA UTARA', 31),
(3173, 'KOTA ADM. JAKARTA BARAT', 31),
(3174, 'KOTA ADM. JAKARTA SELATAN', 31),
(3175, 'KOTA ADM. JAKARTA TIMUR', 31),
(3201, 'KAB. BOGOR', 32),
(3202, 'KAB. SUKABUMI', 32),
(3203, 'KAB. CIANJUR', 32),
(3204, 'KAB. BANDUNG', 32),
(3205, 'KAB. GARUT', 32),
(3206, 'KAB. TASIKMALAYA', 32),
(3207, 'KAB. CIAMIS', 32),
(3208, 'KAB. KUNINGAN', 32),
(3209, 'KAB. CIREBON', 32),
(3210, 'KAB. MAJALENGKA', 32),
(3211, 'KAB. SUMEDANG', 32),
(3212, 'KAB. INDRAMAYU', 32),
(3213, 'KAB. SUBANG', 32),
(3214, 'KAB. PURWAKARTA', 32),
(3215, 'KAB. KARAWANG', 32),
(3216, 'KAB. BEKASI', 32),
(3217, 'KAB. BANDUNG BARAT', 32),
(3218, 'KAB. PANGANDARAN', 32),
(3271, 'KOTA BOGOR', 32),
(3272, 'KOTA SUKABUMI', 32),
(3273, 'KOTA BANDUNG', 32),
(3274, 'KOTA CIREBON', 32),
(3275, 'KOTA BEKASI', 32),
(3276, 'KOTA DEPOK', 32),
(3277, 'KOTA CIMAHI', 32),
(3278, 'KOTA TASIKMALAYA', 32),
(3279, 'KOTA BANJAR', 32),
(3301, 'KAB. CILACAP', 33),
(3302, 'KAB. BANYUMAS', 33),
(3303, 'KAB. PURBALINGGA', 33),
(3304, 'KAB. BANJARNEGARA', 33),
(3305, 'KAB. KEBUMEN', 33),
(3306, 'KAB. PURWOREJO', 33),
(3307, 'KAB. WONOSOBO', 33),
(3308, 'KAB. MAGELANG', 33),
(3309, 'KAB. BOYOLALI', 33),
(3310, 'KAB. KLATEN', 33),
(3311, 'KAB. SUKOHARJO', 33),
(3312, 'KAB. WONOGIRI', 33),
(3313, 'KAB. KARANGANYAR', 33),
(3314, 'KAB. SRAGEN', 33),
(3315, 'KAB. GROBOGAN', 33),
(3316, 'KAB. BLORA', 33),
(3317, 'KAB. REMBANG', 33),
(3318, 'KAB. PATI', 33),
(3319, 'KAB. KUDUS', 33),
(3320, 'KAB. JEPARA', 33),
(3321, 'KAB. DEMAK', 33),
(3322, 'KAB. SEMARANG', 33),
(3323, 'KAB. TEMANGGUNG', 33),
(3324, 'KAB. KENDAL', 33),
(3325, 'KAB. BATANG', 33),
(3326, 'KAB. PEKALONGAN', 33),
(3327, 'KAB. PEMALANG', 33),
(3328, 'KAB. TEGAL', 33),
(3329, 'KAB. BREBES', 33),
(3371, 'KOTA MAGELANG', 33),
(3372, 'KOTA SURAKARTA', 33),
(3373, 'KOTA SALATIGA', 33),
(3374, 'KOTA SEMARANG', 33),
(3375, 'KOTA PEKALONGAN', 33),
(3376, 'KOTA TEGAL', 33),
(3401, 'KAB. KULON PROGO', 34),
(3402, 'KAB. BANTUL', 34),
(3403, 'KAB. GUNUNGKIDUL', 34),
(3404, 'KAB. SLEMAN', 34),
(3471, 'KOTA YOGYAKARTA', 34),
(3501, 'KAB. PACITAN', 35),
(3502, 'KAB. PONOROGO', 35),
(3503, 'KAB. TRENGGALEK', 35),
(3504, 'KAB. TULUNGAGUNG', 35),
(3505, 'KAB. BLITAR', 35),
(3506, 'KAB. KEDIRI', 35),
(3507, 'KAB. MALANG', 35),
(3508, 'KAB. LUMAJANG', 35),
(3509, 'KAB. JEMBER', 35),
(3510, 'KAB. BANYUWANGI', 35),
(3511, 'KAB. BONDOWOSO', 35),
(3512, 'KAB. SITUBONDO', 35),
(3513, 'KAB. PROBOLINGGO', 35),
(3514, 'KAB. PASURUAN', 35),
(3515, 'KAB. SIDOARJO', 35),
(3516, 'KAB. MOJOKERTO', 35),
(3517, 'KAB. JOMBANG', 35),
(3518, 'KAB. NGANJUK', 35),
(3519, 'KAB. MADIUN', 35),
(3520, 'KAB. MAGETAN', 35),
(3521, 'KAB. NGAWI', 35),
(3522, 'KAB. BOJONEGORO', 35),
(3523, 'KAB. TUBAN', 35),
(3524, 'KAB. LAMONGAN', 35),
(3525, 'KAB. GRESIK', 35),
(3526, 'KAB. BANGKALAN', 35),
(3527, 'KAB. SAMPANG', 35),
(3528, 'KAB. PAMEKASAN', 35),
(3529, 'KAB. SUMENEP', 35),
(3571, 'KOTA KEDIRI', 35),
(3572, 'KOTA BLITAR', 35),
(3573, 'KOTA MALANG', 35),
(3574, 'KOTA PROBOLINGGO', 35),
(3575, 'KOTA PASURUAN', 35),
(3576, 'KOTA MOJOKERTO', 35),
(3577, 'KOTA MADIUN', 35),
(3578, 'KOTA SURABAYA', 35),
(3579, 'KOTA BATU', 35),
(3601, 'KAB. PANDEGLANG', 36),
(3602, 'KAB. LEBAK', 36),
(3603, 'KAB. TANGERANG', 36),
(3604, 'KAB. SERANG', 36),
(3671, 'KOTA TANGERANG', 36),
(3672, 'KOTA CILEGON', 36),
(3673, 'KOTA SERANG', 36),
(3674, 'KOTA TANGERANG SELATAN', 36),
(5101, 'KAB. JEMBRANA', 51),
(5102, 'KAB. TABANAN', 51),
(5103, 'KAB. BADUNG', 51),
(5104, 'KAB. GIANYAR', 51),
(5105, 'KAB. KLUNGKUNG', 51),
(5106, 'KAB. BANGLI', 51),
(5107, 'KAB. KARANGASEM', 51),
(5108, 'KAB. BULELENG', 51),
(5171, 'KOTA DENPASAR', 51),
(5201, 'KAB. LOMBOK BARAT', 52),
(5202, 'KAB. LOMBOK TENGAH', 52),
(5203, 'KAB. LOMBOK TIMUR', 52),
(5204, 'KAB. SUMBAWA', 52),
(5205, 'KAB. DOMPU', 52),
(5206, 'KAB. BIMA', 52),
(5207, 'KAB. SUMBAWA BARAT', 52),
(5208, 'KAB. LOMBOK UTARA', 52),
(5271, 'KOTA MATARAM', 52),
(5272, 'KOTA BIMA', 52),
(5301, 'KAB. KUPANG', 53),
(5302, 'KAB TIMOR TENGAH SELATAN', 53),
(5303, 'KAB. TIMOR TENGAH UTARA', 53),
(5304, 'KAB. BELU', 53),
(5305, 'KAB. ALOR', 53),
(5306, 'KAB. FLORES TIMUR', 53),
(5307, 'KAB. SIKKA', 53),
(5308, 'KAB. ENDE', 53),
(5309, 'KAB. NGADA', 53),
(5310, 'KAB. MANGGARAI', 53),
(5311, 'KAB. SUMBA TIMUR', 53),
(5312, 'KAB. SUMBA BARAT', 53),
(5313, 'KAB. LEMBATA', 53),
(5314, 'KAB. ROTE NDAO', 53),
(5315, 'KAB. MANGGARAI BARAT', 53),
(5316, 'KAB. NAGEKEO', 53),
(5317, 'KAB. SUMBA TENGAH', 53),
(5318, 'KAB. SUMBA BARAT DAYA', 53),
(5319, 'KAB. MANGGARAI TIMUR', 53),
(5320, 'KAB. SABU RAIJUA', 53),
(5321, 'KAB. MALAKA', 53),
(5371, 'KOTA KUPANG', 53),
(6101, 'KAB. SAMBAS', 61),
(6102, 'KAB. MEMPAWAH', 61),
(6103, 'KAB. SANGGAU', 61),
(6104, 'KAB. KETAPANG', 61),
(6105, 'KAB. SINTANG', 61),
(6106, 'KAB. KAPUAS HULU', 61),
(6107, 'KAB. BENGKAYANG', 61),
(6108, 'KAB. LANDAK', 61),
(6109, 'KAB. SEKADAU', 61),
(6110, 'KAB. MELAWI', 61),
(6111, 'KAB. KAYONG UTARA', 61),
(6112, 'KAB. KUBU RAYA', 61),
(6171, 'KOTA PONTIANAK', 61),
(6172, 'KOTA SINGKAWANG', 61),
(6201, 'KAB. KOTAWARINGIN BARAT', 62),
(6202, 'KAB. KOTAWARINGIN TIMUR', 62),
(6203, 'KAB. KAPUAS', 62),
(6204, 'KAB. BARITO SELATAN', 62),
(6205, 'KAB. BARITO UTARA', 62),
(6206, 'KAB. KATINGAN', 62),
(6207, 'KAB. SERUYAN', 62),
(6208, 'KAB. SUKAMARA', 62),
(6209, 'KAB. LAMANDAU', 62),
(6210, 'KAB. GUNUNG MAS', 62),
(6211, 'KAB. PULANG PISAU', 62),
(6212, 'KAB. MURUNG RAYA', 62),
(6213, 'KAB. BARITO TIMUR', 62),
(6271, 'KOTA PALANGKARAYA', 62),
(6301, 'KAB. TANAH LAUT', 63),
(6302, 'KAB. KOTABARU', 63),
(6303, 'KAB. BANJAR', 63),
(6304, 'KAB. BARITO KUALA', 63),
(6305, 'KAB. TAPIN', 63),
(6306, 'KAB. HULU SUNGAI SELATAN', 63),
(6307, 'KAB. HULU SUNGAI TENGAH', 63),
(6308, 'KAB. HULU SUNGAI UTARA', 63),
(6309, 'KAB. TABALONG', 63),
(6310, 'KAB. TANAH BUMBU', 63),
(6311, 'KAB. BALANGAN', 63),
(6371, 'KOTA BANJARMASIN', 63),
(6372, 'KOTA BANJARBARU', 63),
(6401, 'KAB. PASER', 64),
(6402, 'KAB. KUTAI KARTANEGARA', 64),
(6403, 'KAB. BERAU', 64),
(6407, 'KAB. KUTAI BARAT', 64),
(6408, 'KAB. KUTAI TIMUR', 64),
(6409, 'KAB. PENAJAM PASER UTARA', 64),
(6411, 'KAB. MAHAKAM ULU', 64),
(6471, 'KOTA BALIKPAPAN', 64),
(6472, 'KOTA SAMARINDA', 64),
(6474, 'KOTA BONTANG', 64),
(6501, 'KAB. BULUNGAN', 65),
(6502, 'KAB. MALINAU', 65),
(6503, 'KAB. NUNUKAN', 65),
(6504, 'KAB. TANA TIDUNG', 65),
(6571, 'KOTA TARAKAN', 65),
(7101, 'KAB. BOLAANG MONGONDOW', 71),
(7102, 'KAB. MINAHASA', 71),
(7103, 'KAB. KEPULAUAN SANGIHE', 71),
(7104, 'KAB. KEPULAUAN TALAUD', 71),
(7105, 'KAB. MINAHASA SELATAN', 71),
(7106, 'KAB. MINAHASA UTARA', 71),
(7107, 'KAB. MINAHASA TENGGARA', 71),
(7108, 'KAB. BOLAANG MONGONDOW UTARA', 71),
(7109, 'KAB. KEP. SIAU TAGULANDANG BIARO', 71),
(7110, 'KAB. BOLAANG MONGONDOW TIMUR', 71),
(7111, 'KAB. BOLAANG MONGONDOW SELATAN', 71),
(7171, 'KOTA MANADO', 71),
(7172, 'KOTA BITUNG', 71),
(7173, 'KOTA TOMOHON', 71),
(7174, 'KOTA KOTAMOBAGU', 71),
(7201, 'KAB. BANGGAI', 72),
(7202, 'KAB. POSO', 72),
(7203, 'KAB. DONGGALA', 72),
(7204, 'KAB. TOLI TOLI', 72),
(7205, 'KAB. BUOL', 72),
(7206, 'KAB. MOROWALI', 72),
(7207, 'KAB. BANGGAI KEPULAUAN', 72),
(7208, 'KAB. PARIGI MOUTONG', 72),
(7209, 'KAB. TOJO UNA UNA', 72),
(7210, 'KAB. SIGI', 72),
(7211, 'KAB. BANGGAI LAUT', 72),
(7212, 'KAB. MOROWALI UTARA', 72),
(7271, 'KOTA PALU', 72),
(7301, 'KAB. KEPULAUAN SELAYAR', 73),
(7302, 'KAB. BULUKUMBA', 73),
(7303, 'KAB. BANTAENG', 73),
(7304, 'KAB. JENEPONTO', 73),
(7305, 'KAB. TAKALAR', 73),
(7306, 'KAB. GOWA', 73),
(7307, 'KAB. SINJAI', 73),
(7308, 'KAB. BONE', 73),
(7309, 'KAB. MAROS', 73),
(7310, 'KAB. PANGKAJENE KEPULAUAN', 73),
(7311, 'KAB. BARRU', 73),
(7312, 'KAB. SOPPENG', 73),
(7313, 'KAB. WAJO', 73),
(7314, 'KAB. SIDENRENG RAPPANG', 73),
(7315, 'KAB. PINRANG', 73),
(7316, 'KAB. ENREKANG', 73),
(7317, 'KAB. LUWU', 73),
(7318, 'KAB. TANA TORAJA', 73),
(7322, 'KAB. LUWU UTARA', 73),
(7324, 'KAB. LUWU TIMUR', 73),
(7326, 'KAB. TORAJA UTARA', 73),
(7371, 'KOTA MAKASSAR', 73),
(7372, 'KOTA PARE PARE', 73),
(7373, 'KOTA PALOPO', 73),
(7401, 'KAB. KOLAKA', 74),
(7402, 'KAB. KONAWE', 74),
(7403, 'KAB. MUNA', 74),
(7404, 'KAB. BUTON', 74),
(7405, 'KAB. KONAWE SELATAN', 74),
(7406, 'KAB. BOMBANA', 74),
(7407, 'KAB. WAKATOBI', 74),
(7408, 'KAB. KOLAKA UTARA', 74),
(7409, 'KAB. KONAWE UTARA', 74),
(7410, 'KAB. BUTON UTARA', 74),
(7411, 'KAB. KOLAKA TIMUR', 74),
(7412, 'KAB. KONAWE KEPULAUAN', 74),
(7413, 'KAB. MUNA BARAT', 74),
(7414, 'KAB. BUTON TENGAH', 74),
(7415, 'KAB. BUTON SELATAN', 74),
(7471, 'KOTA KENDARI', 74),
(7472, 'KOTA BAU BAU', 74),
(7501, 'KAB. GORONTALO', 75),
(7502, 'KAB. BOALEMO', 75),
(7503, 'KAB. BONE BOLANGO', 75),
(7504, 'KAB. PAHUWATO', 75),
(7505, 'KAB. GORONTALO UTARA', 75),
(7571, 'KOTA GORONTALO', 75),
(7601, 'KAB. PASANGKAYU', 76),
(7602, 'KAB. MAMUJU', 76),
(7603, 'KAB. MAMASA', 76),
(7604, 'KAB. POLEWALI MANDAR', 76),
(7605, 'KAB. MAJENE', 76),
(7606, 'KAB. MAMUJU TENGAH', 76),
(8101, 'KAB. MALUKU TENGAH', 81),
(8102, 'KAB. MALUKU TENGGARA', 81),
(8103, 'KAB. KEPULAUAN TANIMBAR', 81),
(8104, 'KAB. BURU', 81),
(8105, 'KAB. SERAM BAGIAN TIMUR', 81),
(8106, 'KAB. SERAM BAGIAN BARAT', 81),
(8107, 'KAB. KEPULAUAN ARU', 81),
(8108, 'KAB. MALUKU BARAT DAYA', 81),
(8109, 'KAB. BURU SELATAN', 81),
(8171, 'KOTA AMBON', 81),
(8172, 'KOTA TUAL', 81),
(8201, 'KAB. HALMAHERA BARAT', 82),
(8202, 'KAB. HALMAHERA TENGAH', 82),
(8203, 'KAB. HALMAHERA UTARA', 82),
(8204, 'KAB. HALMAHERA SELATAN', 82),
(8205, 'KAB. KEPULAUAN SULA', 82),
(8206, 'KAB. HALMAHERA TIMUR', 82),
(8207, 'KAB. PULAU MOROTAI', 82),
(8208, 'KAB. PULAU TALIABU', 82),
(8271, 'KOTA TERNATE', 82),
(8272, 'KOTA TIDORE KEPULAUAN', 82),
(9101, 'KAB. MERAUKE', 91),
(9102, 'KAB. JAYAWIJAYA', 91),
(9103, 'KAB. JAYAPURA', 91),
(9104, 'KAB. NABIRE', 91),
(9105, 'KAB. KEPULAUAN YAPEN', 91),
(9106, 'KAB. BIAK NUMFOR', 91),
(9107, 'KAB. PUNCAK JAYA', 91),
(9108, 'KAB. PANIAI', 91),
(9109, 'KAB. MIMIKA', 91),
(9110, 'KAB. SARMI', 91),
(9111, 'KAB. KEEROM', 91),
(9112, 'KAB. PEGUNUNGAN BINTANG', 91),
(9113, 'KAB. YAHUKIMO', 91),
(9114, 'KAB. TOLIKARA', 91),
(9115, 'KAB. WAROPEN', 91),
(9116, 'KAB. BOVEN DIGOEL', 91),
(9117, 'KAB. MAPPI', 91),
(9118, 'KAB. ASMAT', 91),
(9119, 'KAB. SUPIORI', 91),
(9120, 'KAB. MAMBERAMO RAYA', 91),
(9121, 'KAB. MAMBERAMO TENGAH', 91),
(9122, 'KAB. YALIMO', 91),
(9123, 'KAB. LANNY JAYA', 91),
(9124, 'KAB. NDUGA', 91),
(9125, 'KAB. PUNCAK', 91),
(9126, 'KAB. DOGIYAI', 91),
(9127, 'KAB. INTAN JAYA', 91),
(9128, 'KAB. DEIYAI', 91),
(9171, 'KOTA JAYAPURA', 91),
(9201, 'KAB. SORONG', 92),
(9202, 'KAB. MANOKWARI', 92),
(9203, 'KAB. FAK FAK', 92),
(9204, 'KAB. SORONG SELATAN', 92),
(9205, 'KAB. RAJA AMPAT', 92),
(9206, 'KAB. TELUK BINTUNI', 92),
(9207, 'KAB. TELUK WONDAMA', 92),
(9208, 'KAB. KAIMANA', 92),
(9209, 'KAB. TAMBRAUW', 92),
(9210, 'KAB. MAYBRAT', 92),
(9211, 'KAB. MANOKWARI SELATAN', 92),
(9212, 'KAB. PEGUNUNGAN ARFAK', 92),
(9271, 'KOTA SORONG', 92);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kawasan`
--

CREATE TABLE `kawasan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kawasan`
--

INSERT INTO `kawasan` (`id`, `nama`) VALUES
(1, 'Asia dan Afrika'),
(2, 'Amerika dan Pasifik'),
(3, 'Eropa dan Timur Tengah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepulangan`
--

CREATE TABLE `kepulangan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kepulangan`
--

INSERT INTO `kepulangan` (`id`, `nama`) VALUES
(1, 'Darat'),
(2, 'Udara'),
(3, 'Dirujuk RS Polri'),
(4, 'Pulang Mandiri'),
(5, 'Jemput Keluarga'),
(6, 'Jemput Pihak Lain'),
(7, 'BP3MI Banten Darat'),
(8, 'BP3MI Banten Udara'),
(9, 'PT/Majikan/Agensi'),
(10, 'Kementrian/Pemerintah Daerah'),
(11, 'Keluarga/Relawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan`
--

CREATE TABLE `layanan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan`
--

INSERT INTO `layanan` (`id`, `nama`) VALUES
(1, 'PMI'),
(2, 'ABK'),
(3, 'Sakit'),
(4, 'Anak'),
(5, 'CPMI'),
(6, 'Jenazah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_cargo`
--

CREATE TABLE `layanan_cargo` (
  `id_layanan` bigint UNSIGNED DEFAULT NULL,
  `id_cargo` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_cargo`
--

INSERT INTO `layanan_cargo` (`id_layanan`, `id_cargo`) VALUES
(6, 1),
(6, 2),
(6, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_group`
--

CREATE TABLE `layanan_group` (
  `id_layanan` bigint UNSIGNED DEFAULT NULL,
  `id_group` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_group`
--

INSERT INTO `layanan_group` (`id_layanan`, `id_group`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(5, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_kepulangan`
--

CREATE TABLE `layanan_kepulangan` (
  `id_layanan` bigint UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_kepulangan`
--

INSERT INTO `layanan_kepulangan` (`id_layanan`, `id_kepulangan`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11);

-- --------------------------------------------------------

--
-- Struktur dari tabel `layanan_masalah`
--

CREATE TABLE `layanan_masalah` (
  `id_layanan` bigint UNSIGNED DEFAULT NULL,
  `id_masalah` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `layanan_masalah`
--

INSERT INTO `layanan_masalah` (`id_layanan`, `id_masalah`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 17),
(3, 20),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(5, 8),
(5, 16),
(5, 20);

-- --------------------------------------------------------

--
-- Struktur dari tabel `makan`
--

CREATE TABLE `makan` (
  `id` bigint UNSIGNED NOT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_bast_makan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `masalah`
--

CREATE TABLE `masalah` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `masalah`
--

INSERT INTO `masalah` (`id`, `nama`) VALUES
(1, 'Kecelakaan Kerja'),
(2, 'Sakit Akibat Kerja'),
(3, 'Sakit Bawaan'),
(4, 'Penganiayaan'),
(5, 'Pekerjaan Tidak Sesuai PK'),
(6, 'Tidak Mampu Bekerja'),
(7, 'Gaji Tidak Dibayar'),
(8, 'Dokumen Tidak Lengkap'),
(9, 'Majikan Bermasalah'),
(10, 'Komunikasi Tidak Lancar'),
(11, 'Majikan Meninggal'),
(12, 'PHK Sepihak'),
(13, 'Pelecehan Seksual'),
(14, 'Hamil'),
(15, 'Membawa Anak'),
(16, 'Bermasalah lainnya'),
(17, 'Deportasi/WNIO/AMNESTI'),
(18, 'TPPO'),
(19, 'Meninggal'),
(20, 'Pelayanan Informasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_10_12_000000_create_group_table', 1),
(2, '2013_10_12_000001_create_area_table', 1),
(3, '2013_10_12_000002_create_layanan_table', 1),
(4, '2013_10_12_000004_create_jenis_kelamin_table', 1),
(5, '2013_10_12_000005_create_kawasan_table', 1),
(6, '2013_10_12_000006_create_sub_kawasan_table', 1),
(7, '2013_10_12_000007_create_negara_table', 1),
(8, '2013_10_12_000008_create_provinsi_table', 1),
(9, '2013_10_12_000009_create_kab_kota_table', 1),
(10, '2013_10_12_000010_create_jabatan_table', 1),
(11, '2013_10_12_000011_create_masalah_table', 1),
(12, '2013_10_12_000012_create_kepulangan_table', 1),
(13, '2013_10_12_000013_create_cargo_table', 1),
(14, '2013_10_12_000014_create_antar_area_table', 1),
(15, '2013_10_12_000015_create_area_layanan_table', 1),
(16, '2013_10_12_000016_create_area_kepulangan_table', 1),
(17, '2013_10_12_000017_create_layanan_group_table', 1),
(18, '2013_10_12_000018_create_layanan_kepulangan_table', 1),
(19, '2013_10_12_000019_create_layanan_masalah_table', 1),
(20, '2013_10_12_000020_create_layanan_cargo_table', 1),
(21, '2014_10_12_000000_create_user_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2022_01_10_155720_create_permission_tables', 1),
(26, '2023_05_01_000000_create_alamat_table', 1),
(27, '2023_05_01_000001_create_pihak_kedua_table', 1),
(28, '2023_05_01_000002_create_penyedia_jasa_table', 1),
(29, '2023_05_01_000003_create_imigran_table', 1),
(30, '2023_05_01_000004_create_pmi_table', 1),
(31, '2023_05_01_000005_create_jenazah_table', 1),
(32, '2023_05_01_100000_create_bast_darat_table', 1),
(33, '2023_05_01_100001_create_darat_table', 1),
(34, '2023_05_01_200000_create_bast_udara_table', 1),
(35, '2023_05_01_200001_create_udara_table', 1),
(36, '2023_05_01_200003_create_spu_table', 1),
(37, '2023_05_01_200004_create_spu_tiket_table', 1),
(38, '2023_05_01_300000_create_rujuk_rs_polri_table', 1),
(39, '2023_05_01_400000_create_pulang_mandiri_table', 1),
(40, '2023_05_01_500000_create_jemput_keluarga_table', 1),
(41, '2023_05_01_600000_create_bast_pihak_lain_table', 1),
(42, '2023_05_01_600001_create_jemput_pihak_lain_table', 1),
(43, '2023_05_01_700000_create_bast_makan_table', 1),
(44, '2023_05_01_700001_create_makan_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `negara`
--

CREATE TABLE `negara` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_lengkap` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sub_kawasan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `negara`
--

INSERT INTO `negara` (`id`, `nama`, `nama_lengkap`, `id_sub_kawasan`) VALUES
(1, 'Malaysia', 'Malaysia', 1),
(2, 'Singapura', 'Republik Singapura', 1),
(3, 'Brunei Darussalam', 'Brunei Darussalam', 1),
(4, 'Filipina', 'Republik Filipina', 1),
(5, 'Thailand', 'Kerajaan Thailand', 1),
(6, 'Timor Leste', 'Republik Demokratik Timor Leste', 1),
(7, 'Vietnam', 'Republik Sosialis Vietnam', 1),
(8, 'Laos', 'Republik Demokratik Rakyat Laos', 1),
(9, 'Myanmar', 'Republik Persatuan Myanmar', 1),
(10, 'Kamboja', 'Kerajaan Kamboja', 1),
(11, 'Afrika Selatan', 'Republik Afrika Selatan', 1),
(12, 'Aljazair', 'Republik Demokratis Rakyat Aljazair', 1),
(13, 'Angola', 'Republik Angola', 1),
(14, 'Benin', 'Republik Benin', 1),
(15, 'Botswana', 'Republik Botswana', 1),
(16, 'Burkina Faso', 'Burkina Faso', 1),
(17, 'Burundi', 'Republik Burundi', 1),
(18, 'Chad', 'Republik Chad', 1),
(19, 'Eritrea', 'Eritrea', 1),
(20, 'Eswantini', 'Kerajaan Eswantini', 1),
(21, 'Etiopia', 'Republik Demokratis Federal Etiopia', 1),
(22, 'Gabon', 'Republik Gabon', 1),
(23, 'Gambia', 'Republik Gambia', 1),
(24, 'Ghana', 'Republik Ghana', 1),
(25, 'Guinea', 'Republik Guinea', 1),
(26, 'Guinea - Bissau', 'Republik Guinea - Bissau', 1),
(27, 'Guinea Katulistiwa', 'Republik Guinea Katulistiwa', 1),
(28, 'Jibouti', 'Republik Jibouti', 1),
(29, 'Kamerun', 'Republik Kamerun', 1),
(30, 'kenya', 'Republik kenya', 1),
(31, 'Lesotho', 'Kerajaan Lesotho', 1),
(32, 'Liberia', 'Republik Liberia', 1),
(33, 'Libia', 'Libia', 1),
(34, 'Madagaskar', 'Republik Madagaskar', 1),
(35, 'Malawi', 'Republik Malawi', 1),
(36, 'Mali', 'Republik Mali', 1),
(37, 'Maroko', 'Kerajaan Maroko', 1),
(38, 'Mauritania', 'Republik Islam Mauritania', 1),
(39, 'Mauritius', 'Republik Mauritius', 1),
(40, 'Arab Mesir', 'Republik Arab Mesir', 1),
(41, 'Mozambik', 'Republik Mozambik', 1),
(42, 'Namibia', 'Republik Namibia', 1),
(43, 'Niger', 'Republik Niger', 1),
(44, 'Nigeria', 'Republik Federasi Nigeria', 1),
(45, 'Pantai Gading', 'Republik Pantai Gading', 1),
(46, 'Afrika Tengah', 'Republik Afrika Tengah', 1),
(47, 'Kongo', 'Republik Demokratis Kongo', 1),
(48, 'Kongo', 'Republik Kongo', 1),
(49, 'Rwanda', 'Republik Rwanda', 1),
(50, 'Sao Tome dan Principe', 'Republik Demokratik Sao Tome dan Principe', 1),
(51, 'Senegal', 'Republik Senegal', 1),
(52, 'Seychelles', 'Republik Seychelles', 1),
(53, 'Sierra Leone', 'Republik Sierra Leone', 1),
(54, 'Somalia', 'Republik Somalia', 1),
(55, 'Sudan', 'Republik Sudan', 1),
(56, 'Sudan Selatan', 'Republik Sudan Selatan', 1),
(57, 'Tanjung Verde', 'Republik Tanjung Verde', 1),
(58, 'Tanzania', 'Republik Kesatuan Tanzania', 1),
(59, 'Togo', 'Republik Togo', 1),
(60, 'Tunisia', 'Republik Tunisia', 1),
(61, 'Uganda', 'Republik Uganda', 1),
(62, 'Zambia', 'Republik Zambia', 1),
(63, 'Zimbabwe', 'Republik Zimbabwe', 1),
(64, 'Jepang', 'Jepang', 2),
(65, 'Taiwan', 'Taiwan', 2),
(66, 'Mongolia', 'Mongolia', 2),
(67, 'Tiongkok', 'Republik Rakyat Tiongkok', 2),
(68, 'Kazakhstan', 'Kazakhstan', 2),
(69, 'Kirgiztan', 'Republik Kirgiztan', 2),
(70, 'Tajikistan', 'Republik Tajikistan', 2),
(71, 'Turkmenistan', 'Turkmenistan', 2),
(72, 'Uzbeskistan', 'Republik Uzbeskistan', 2),
(73, 'Korea (Korea Selatan)', 'Republik Korea (Korea Selatan)', 3),
(74, 'Hongkong', 'Hongkong', 3),
(75, 'Makau', 'Makau', 3),
(76, 'Korea (Korea Utara)', 'Republik Rakyat Demokratik Korea (Korea Utara)', 3),
(77, 'India', 'Republik India', 3),
(78, 'Maladewa', 'Republik Maladewa', 3),
(79, 'Srilanka', 'Republik Sosialis Demokratik Srilanka', 3),
(80, 'Pakistan', 'Republik Islam Pakistan', 3),
(81, 'Afganistan', 'Republik Islam Afganistan', 3),
(82, 'Bangladesh', 'Republik Rakyat Bangladesh', 3),
(83, 'Bhutan', 'Bhutan', 3),
(84, 'Nepal', 'Republik Demokratik Nepal', 3),
(85, 'Amerika Serikat', 'Amerika Serikat', 4),
(86, 'Antigua dan Barbuda', 'Antigua dan Barbuda', 4),
(87, 'Bahamas', 'Persemakmuran Bahamas', 4),
(88, 'Barbados', 'Barbados', 4),
(89, 'Belize', 'Belize', 4),
(90, 'Dominika', 'Persemakmuran Dominika', 4),
(91, 'Dominika', 'Republik Dominika', 4),
(92, 'El Salvador', 'Republik El Salvador', 4),
(93, 'Grenada', 'Grenada', 4),
(94, 'Guatemala', 'Republik Guatemala', 4),
(95, 'Haiti', 'Republik Haiti', 4),
(96, 'Honduras', 'Republik Honduras', 4),
(97, 'Jamaika', 'Jamaika', 4),
(98, 'Kanada', 'Kanada', 4),
(99, 'Kosta Rika', 'Republik Kosta Rika', 4),
(100, 'Kuba', 'Republik Kuba', 4),
(101, 'Meksiko Serikat', 'Meksiko Serikat', 4),
(102, 'Nikaragua', 'Republik Nikaragua', 4),
(103, 'Panama', 'Republik Panama', 4),
(104, 'Panama', 'Republik Panama', 4),
(105, 'Saint Lucia', 'Saint Lucia', 4),
(106, 'Saint Vincent dan Grenadines', 'Saint Vincent dan Grenadines', 4),
(107, 'Trinidad dan Tobago', 'Republik Trinidad dan Tobago', 4),
(108, 'Argentina', 'Republik Argentina', 4),
(109, 'Bolivia', 'Republik Bolivia', 4),
(110, 'Brasil', 'Republik Federasi Brasil', 4),
(111, 'Chili', 'Republik Chili', 4),
(112, 'Ekuador', 'Republik Ekuador', 4),
(113, 'Britania Rayaa', 'Teritori Britania Raya', 4),
(114, 'Guyana', 'Republik Koperasif Guyana', 4),
(115, 'Guyana Prancis', 'Republik Guyana Prancis', 4),
(116, 'Kolombia', 'Republik Kolombia', 4),
(117, 'Paraguay', 'Republik Paraguay', 4),
(118, 'Peru', 'Republik Peru', 4),
(119, 'Suriname', 'Republik Suriname', 4),
(120, 'Uruguay', 'Republik Uruguay', 4),
(121, 'Bolivaria Venezuela', 'Republik Bolivaria Venezuela', 4),
(122, 'Negara Australia', 'Negara Persemakmuran Australia', 5),
(123, 'Fiji', 'Republik Kepulauan Fiji', 5),
(124, 'Kiribati', 'Republik Kiribati', 5),
(125, 'Marshall', 'Republik Kepulauan Marshall', 5),
(126, 'Mikronesia', 'Federasi Mikronesia', 5),
(127, 'Nauru', 'Republik Nauru', 5),
(128, 'Selandia Baru', 'Selandia Baru', 5),
(129, 'Palau', 'Republik Palau', 5),
(130, 'Papua Guinea Baru', 'Negara Bebas Papua Guinea Baru', 5),
(131, 'Samoa', 'Negara Bebas Samoa', 5),
(132, 'Solomon', 'Kepulauan Solomon', 5),
(133, 'Tonga', 'Kerajaan Tonga', 5),
(134, 'Tuvalu', 'Tuvalu', 5),
(135, 'Vanuatu', 'Republik Vanuatu', 5),
(136, 'Albania', 'Republik Albania', 6),
(137, 'Andorra', 'Andorra', 6),
(138, 'Armenia', 'Republik Armenia', 6),
(139, 'Azerbaijan', 'Republik Azerbaijan', 6),
(140, 'Austria', 'Republik Austria', 6),
(141, 'Belanda', 'Kerajaan Belanda', 6),
(142, 'Belarus', 'Republik Belarus', 6),
(143, 'Belgia', 'Kerajaan Belgia', 6),
(144, 'Bosnia dan Herzegovina', 'Bosnia dan Herzegovina', 6),
(145, 'Bulgaria', 'Republik Bulgaria', 6),
(146, 'Kroasia', 'Republik Kroasia', 6),
(147, 'Siprus', 'Republik Siprus', 6),
(148, 'Ceko', 'Republik Ceko', 6),
(149, 'Denmark', 'Kerajaan Denmark', 6),
(150, 'Estonia', 'Republik Estonia', 6),
(151, 'Finlandia', 'Republik Finlandia', 6),
(152, 'Prancis', 'Republik Prancis', 6),
(153, 'Georgia', 'Republik Georgia', 6),
(154, 'Jerman', 'Republik Federal Jerman', 6),
(155, 'Hellenik (Yunani)', 'Republik Hellenik (Yunani)', 6),
(156, 'Hongaria', 'Republik Hongaria', 6),
(157, 'Islandia', 'Republik Islandia', 6),
(158, 'Irlandia', 'Republik Irlandia', 6),
(159, 'Italia', 'Republik Italia', 6),
(160, 'Kazakhstan', 'Republik Kazakhstan', 6),
(161, 'Latvia', 'Republik Latvia', 6),
(162, 'Liechtenstein', 'Liechtenstein', 6),
(163, 'Lituania', 'Republik Lituania', 6),
(164, 'Luksemburg', 'Luksemburg', 6),
(165, 'Makedonia Utara', 'Republik Makedonia Utara', 6),
(166, 'Malta', 'Republik Malta', 6),
(167, 'Moldova', 'Republik Moldova', 6),
(168, 'Monako', 'Monako', 6),
(169, 'Montenregro', 'Republik Montenregro', 6),
(170, 'Belanda', 'Kerajaan Belanda', 6),
(171, 'Norwegia', 'Kerajaan Norwegia', 6),
(172, 'Polandia', 'Republik Polandia', 6),
(173, 'Portugal', 'Republik Portugal', 6),
(174, 'Rumania', 'Rumania', 6),
(175, 'Rusia', 'Federasi Rusia', 6),
(176, 'San Marino', 'Republik San Marino', 6),
(177, 'Serbia', 'Republik Serbia', 6),
(178, 'Slowakia', 'Republik Slowakia', 6),
(179, 'Slovenia', 'Republik Slovenia', 6),
(180, 'Spanyol', 'Kerajaan Spanyol', 6),
(181, 'Swedia', 'Kerajaan Swedia', 6),
(182, 'KonSwiss', 'Konfederasi Swiss', 6),
(183, 'Turki', 'Republik Turki', 6),
(184, 'Ukraina', 'Ukraina', 6),
(185, 'Britania Raya', 'Britania Raya', 6),
(186, 'Vatika', 'Vatika', 6),
(187, 'Aland', 'Aland', 6),
(188, 'Svalbard', 'Svalbard', 6),
(189, 'Arab Saudi', 'Kerajaan Arab Saudi', 7),
(190, 'Yaman', 'Republik Yaman', 7),
(191, 'Irak', 'Republik Irak', 7),
(192, 'Lebanon', 'Republik Lebanon', 7),
(193, 'Iran', 'Republik Islam Iran', 7),
(194, 'Arab Mesir', 'Republik Arab Mesir', 7),
(195, 'Bahrain', 'Kerajaan Bahrain', 7),
(196, 'Kuwait', 'Kuwait', 7),
(197, 'Palestina', 'Palestina', 7),
(198, 'Oman', 'Kesultanan Oman', 8),
(199, 'Qatar', 'Qatar', 8),
(200, 'Uni Emirat Arab', 'Uni Emirat Arab', 8),
(201, 'Turki', 'Republik Turki', 8),
(202, 'Armenia', 'Republik Armenia', 8),
(203, 'Azerbaijan', 'Republik Azerbaijan', 8),
(204, 'Georgia', 'Georgia', 8),
(205, 'Yordania Hasyimia', 'Kerajaan Yordania Hasyimia', 8),
(206, 'Siprus', 'Republik Siprus', 8),
(207, 'Arab Suriah', 'Republik Arab Suriah', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyedia_jasa`
--

CREATE TABLE `penyedia_jasa` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `up` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penyedia_jasa`
--

INSERT INTO `penyedia_jasa` (`id`, `nama_perusahaan`, `alamat`, `email`, `no_telp`, `up`) VALUES
(1, 'CV. RIZKI SURYA MANDIRI', 'Jl. Darussalam Selatan No. 144, Kota Tangerang', NULL, '81218128653', 'Tn. Suryadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pihak_kedua`
--

CREATE TABLE `pihak_kedua` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_identitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pmi`
--

CREATE TABLE `pmi` (
  `id` bigint UNSIGNED NOT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_group` bigint UNSIGNED DEFAULT NULL,
  `id_masalah` bigint UNSIGNED DEFAULT NULL,
  `foto_pmi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_paspor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `provinsi`
--

INSERT INTO `provinsi` (`id`, `nama`) VALUES
(11, 'ACEH'),
(12, 'SUMATERA UTARA'),
(13, 'SUMATERA BARAT'),
(14, 'RIAU'),
(15, 'JAMBI'),
(16, 'SUMATERA SELATAN'),
(17, 'BENGKULU'),
(18, 'LAMPUNG'),
(19, 'KEPULAUAN BANGKA BELITUNG'),
(21, 'KEPULAUAN RIAU'),
(31, 'DKI JAKARTA'),
(32, 'JAWA BARAT'),
(33, 'JAWA TENGAH'),
(34, 'DAERAH ISTIMEWA YOGYAKARTA'),
(35, 'JAWA TIMUR'),
(36, 'BANTEN'),
(51, 'BALI'),
(52, 'NUSA TENGGARA BARAT'),
(53, 'NUSA TENGGARA TIMUR'),
(61, 'KALIMANTAN BARAT'),
(62, 'KALIMANTAN TENGAH'),
(63, 'KALIMANTAN SELATAN'),
(64, 'KALIMANTAN TIMUR'),
(65, 'KALIMANTAN UTARA'),
(71, 'SULAWESI UTARA'),
(72, 'SULAWESI TENGAH'),
(73, 'SULAWESI SELATAN'),
(74, 'SULAWESI TENGGARA'),
(75, 'GORONTALO'),
(76, 'SULAWESI BARAT'),
(81, 'MALUKU'),
(82, 'MALUKU UTARA'),
(91, 'PAPUA'),
(92, 'PAPUA BARAT');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pulang_mandiri`
--

CREATE TABLE `pulang_mandiri` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2023-06-17 23:24:16', '2023-06-17 23:24:16'),
(2, 'Petugas', 'web', '2023-06-17 23:24:16', '2023-06-17 23:24:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rujuk_rs_polri`
--

CREATE TABLE `rujuk_rs_polri` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_pihak_kedua` bigint UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_pihak_kedua` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_serah_terima` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_user` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spu`
--

CREATE TABLE `spu` (
  `id` bigint UNSIGNED NOT NULL,
  `id_bast_udara` bigint UNSIGNED DEFAULT NULL,
  `no_surat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_surat` date DEFAULT NULL,
  `id_provinsi` bigint UNSIGNED DEFAULT NULL,
  `no_pesawat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jam_pesawat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_pesawat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `spu_tiket`
--

CREATE TABLE `spu_tiket` (
  `id` bigint UNSIGNED NOT NULL,
  `id_spu` bigint UNSIGNED DEFAULT NULL,
  `foto_tiket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kawasan`
--

CREATE TABLE `sub_kawasan` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kawasan` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_kawasan`
--

INSERT INTO `sub_kawasan` (`id`, `nama`, `id_kawasan`) VALUES
(1, 'Kawasan Asia Tenggara dan Afrika', 1),
(2, 'Kawasan Asia Timur I dan Asia Tengah', 1),
(3, 'Kawasan Asia Timur II dan Asia Selatan', 1),
(4, 'Amerika', 2),
(5, 'Australia dan Pasifik', 2),
(6, 'Eropa', 3),
(7, 'Timur Tengah I', 3),
(8, 'Timur Tengah II', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `udara`
--

CREATE TABLE `udara` (
  `id` bigint UNSIGNED NOT NULL,
  `id_kepulangan` bigint UNSIGNED DEFAULT NULL,
  `id_imigran` bigint UNSIGNED DEFAULT NULL,
  `id_bast_udara` bigint UNSIGNED DEFAULT NULL,
  `foto_boarding_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_identitas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_group` bigint UNSIGNED DEFAULT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `no_identitas`, `jabatan`, `id_group`, `telepon`, `avatar`, `qr_code`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '0000000000000000', 'Administrator', 1, '081111111111', 'https://ui-avatars.com/api/?name=a-dmin', 'http://localhost/kepulangan/public/petugas/1', 'admin@email.com', NULL, '$2y$10$wwLhI2..XKqOFRPb6A01UOw4JeLrzOIEqioZeaJhOMY4hPNa1R0EO', NULL, '2023-06-17 23:24:16', '2023-06-17 23:24:16'),
(2, 'Petugas', '1111111111111111', 'Petugas', 2, '082222222222', 'https://ui-avatars.com/api/?name=petugas', 'http://localhost/kepulangan/public/petugas/2', 'petugas@email.com', NULL, '$2y$10$U0jlULaZ3SB/7H8a0ovRnOweP8UJTp7B4Ibhk22oQdZXTO8.mm0Pm', NULL, '2023-06-17 23:24:16', '2023-06-17 23:24:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alamat`
--
ALTER TABLE `alamat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `antar_area`
--
ALTER TABLE `antar_area`
  ADD KEY `antar_area_from_area_index` (`from_area`),
  ADD KEY `antar_area_to_area_index` (`to_area`);

--
-- Indeks untuk tabel `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `area_kepulangan`
--
ALTER TABLE `area_kepulangan`
  ADD KEY `area_kepulangan_id_area_index` (`id_area`),
  ADD KEY `area_kepulangan_id_kepulangan_index` (`id_kepulangan`);

--
-- Indeks untuk tabel `area_layanan`
--
ALTER TABLE `area_layanan`
  ADD KEY `area_layanan_id_area_index` (`id_area`),
  ADD KEY `area_layanan_id_layanan_index` (`id_layanan`);

--
-- Indeks untuk tabel `bast_darat`
--
ALTER TABLE `bast_darat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bast_darat_purchase_order_unique` (`purchase_order`),
  ADD KEY `bast_darat_id_penyedia_jasa_index` (`id_penyedia_jasa`),
  ADD KEY `bast_darat_id_alamat_index` (`id_alamat`),
  ADD KEY `bast_darat_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `bast_makan`
--
ALTER TABLE `bast_makan`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bast_makan_purchase_order_unique` (`purchase_order`),
  ADD KEY `bast_makan_id_penyedia_jasa_index` (`id_penyedia_jasa`),
  ADD KEY `bast_makan_id_alamat_index` (`id_alamat`),
  ADD KEY `bast_makan_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `bast_pihak_lain`
--
ALTER TABLE `bast_pihak_lain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bast_pihak_lain_id_pihak_kedua_index` (`id_pihak_kedua`),
  ADD KEY `bast_pihak_lain_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `bast_udara`
--
ALTER TABLE `bast_udara`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bast_udara_purchase_order_unique` (`purchase_order`),
  ADD KEY `bast_udara_id_penyedia_jasa_index` (`id_penyedia_jasa`),
  ADD KEY `bast_udara_id_alamat_index` (`id_alamat`),
  ADD KEY `bast_udara_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `darat`
--
ALTER TABLE `darat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `darat_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `darat_id_imigran_index` (`id_imigran`),
  ADD KEY `darat_id_bast_darat_index` (`id_bast_darat`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `imigran`
--
ALTER TABLE `imigran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imigran_id_jenis_kelamin_index` (`id_jenis_kelamin`),
  ADD KEY `imigran_id_negara_index` (`id_negara`),
  ADD KEY `imigran_id_sub_kawasan_index` (`id_sub_kawasan`),
  ADD KEY `imigran_id_kawasan_index` (`id_kawasan`),
  ADD KEY `imigran_id_kab_kota_index` (`id_kab_kota`),
  ADD KEY `imigran_id_provinsi_index` (`id_provinsi`),
  ADD KEY `imigran_id_jabatan_index` (`id_jabatan`),
  ADD KEY `imigran_id_area_index` (`id_area`),
  ADD KEY `imigran_id_layanan_index` (`id_layanan`),
  ADD KEY `imigran_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `imigran_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jemput_keluarga`
--
ALTER TABLE `jemput_keluarga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jemput_keluarga_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `jemput_keluarga_id_imigran_index` (`id_imigran`),
  ADD KEY `jemput_keluarga_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `jemput_pihak_lain`
--
ALTER TABLE `jemput_pihak_lain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jemput_pihak_lain_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `jemput_pihak_lain_id_imigran_index` (`id_imigran`),
  ADD KEY `jemput_pihak_lain_id_bast_pihak_lain_index` (`id_bast_pihak_lain`);

--
-- Indeks untuk tabel `jenazah`
--
ALTER TABLE `jenazah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jenazah_id_imigran_index` (`id_imigran`),
  ADD KEY `jenazah_id_cargo_index` (`id_cargo`);

--
-- Indeks untuk tabel `jenis_kelamin`
--
ALTER TABLE `jenis_kelamin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kab_kota`
--
ALTER TABLE `kab_kota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kab_kota_id_provinsi_index` (`id_provinsi`);

--
-- Indeks untuk tabel `kawasan`
--
ALTER TABLE `kawasan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kepulangan`
--
ALTER TABLE `kepulangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `layanan_cargo`
--
ALTER TABLE `layanan_cargo`
  ADD KEY `layanan_cargo_id_layanan_index` (`id_layanan`),
  ADD KEY `layanan_cargo_id_cargo_index` (`id_cargo`);

--
-- Indeks untuk tabel `layanan_group`
--
ALTER TABLE `layanan_group`
  ADD KEY `layanan_group_id_layanan_index` (`id_layanan`),
  ADD KEY `layanan_group_id_group_index` (`id_group`);

--
-- Indeks untuk tabel `layanan_kepulangan`
--
ALTER TABLE `layanan_kepulangan`
  ADD KEY `layanan_kepulangan_id_layanan_index` (`id_layanan`),
  ADD KEY `layanan_kepulangan_id_kepulangan_index` (`id_kepulangan`);

--
-- Indeks untuk tabel `layanan_masalah`
--
ALTER TABLE `layanan_masalah`
  ADD KEY `layanan_masalah_id_layanan_index` (`id_layanan`),
  ADD KEY `layanan_masalah_id_masalah_index` (`id_masalah`);

--
-- Indeks untuk tabel `makan`
--
ALTER TABLE `makan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `makan_id_imigran_index` (`id_imigran`),
  ADD KEY `makan_id_bast_makan_index` (`id_bast_makan`);

--
-- Indeks untuk tabel `masalah`
--
ALTER TABLE `masalah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `negara`
--
ALTER TABLE `negara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `negara_id_sub_kawasan_index` (`id_sub_kawasan`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `penyedia_jasa`
--
ALTER TABLE `penyedia_jasa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `pihak_kedua`
--
ALTER TABLE `pihak_kedua`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pmi`
--
ALTER TABLE `pmi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pmi_id_imigran_index` (`id_imigran`),
  ADD KEY `pmi_id_group_index` (`id_group`),
  ADD KEY `pmi_id_masalah_index` (`id_masalah`);

--
-- Indeks untuk tabel `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pulang_mandiri`
--
ALTER TABLE `pulang_mandiri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pulang_mandiri_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `pulang_mandiri_id_imigran_index` (`id_imigran`),
  ADD KEY `pulang_mandiri_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `rujuk_rs_polri`
--
ALTER TABLE `rujuk_rs_polri`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rujuk_rs_polri_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `rujuk_rs_polri_id_imigran_index` (`id_imigran`),
  ADD KEY `rujuk_rs_polri_id_pihak_kedua_index` (`id_pihak_kedua`),
  ADD KEY `rujuk_rs_polri_id_user_index` (`id_user`);

--
-- Indeks untuk tabel `spu`
--
ALTER TABLE `spu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spu_id_bast_udara_index` (`id_bast_udara`),
  ADD KEY `spu_id_provinsi_index` (`id_provinsi`);

--
-- Indeks untuk tabel `spu_tiket`
--
ALTER TABLE `spu_tiket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spu_tiket_id_spu_index` (`id_spu`);

--
-- Indeks untuk tabel `sub_kawasan`
--
ALTER TABLE `sub_kawasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_kawasan_id_kawasan_index` (`id_kawasan`);

--
-- Indeks untuk tabel `udara`
--
ALTER TABLE `udara`
  ADD PRIMARY KEY (`id`),
  ADD KEY `udara_id_kepulangan_index` (`id_kepulangan`),
  ADD KEY `udara_id_imigran_index` (`id_imigran`),
  ADD KEY `udara_id_bast_udara_index` (`id_bast_udara`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_unique` (`email`),
  ADD KEY `user_id_group_index` (`id_group`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alamat`
--
ALTER TABLE `alamat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `bast_darat`
--
ALTER TABLE `bast_darat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bast_makan`
--
ALTER TABLE `bast_makan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bast_pihak_lain`
--
ALTER TABLE `bast_pihak_lain`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bast_udara`
--
ALTER TABLE `bast_udara`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `darat`
--
ALTER TABLE `darat`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `imigran`
--
ALTER TABLE `imigran`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jemput_keluarga`
--
ALTER TABLE `jemput_keluarga`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jemput_pihak_lain`
--
ALTER TABLE `jemput_pihak_lain`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenazah`
--
ALTER TABLE `jenazah`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `makan`
--
ALTER TABLE `makan`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `penyedia_jasa`
--
ALTER TABLE `penyedia_jasa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pihak_kedua`
--
ALTER TABLE `pihak_kedua`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pmi`
--
ALTER TABLE `pmi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pulang_mandiri`
--
ALTER TABLE `pulang_mandiri`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rujuk_rs_polri`
--
ALTER TABLE `rujuk_rs_polri`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `spu`
--
ALTER TABLE `spu`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `spu_tiket`
--
ALTER TABLE `spu_tiket`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `udara`
--
ALTER TABLE `udara`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `antar_area`
--
ALTER TABLE `antar_area`
  ADD CONSTRAINT `antar_area_from_area_foreign` FOREIGN KEY (`from_area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antar_area_to_area_foreign` FOREIGN KEY (`to_area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `area_kepulangan`
--
ALTER TABLE `area_kepulangan`
  ADD CONSTRAINT `area_kepulangan_id_area_foreign` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_kepulangan_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `area_layanan`
--
ALTER TABLE `area_layanan`
  ADD CONSTRAINT `area_layanan_id_area_foreign` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `area_layanan_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `bast_darat`
--
ALTER TABLE `bast_darat`
  ADD CONSTRAINT `bast_darat_id_alamat_foreign` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_darat_id_penyedia_jasa_foreign` FOREIGN KEY (`id_penyedia_jasa`) REFERENCES `penyedia_jasa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_darat_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `bast_makan`
--
ALTER TABLE `bast_makan`
  ADD CONSTRAINT `bast_makan_id_alamat_foreign` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_makan_id_penyedia_jasa_foreign` FOREIGN KEY (`id_penyedia_jasa`) REFERENCES `penyedia_jasa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_makan_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `bast_pihak_lain`
--
ALTER TABLE `bast_pihak_lain`
  ADD CONSTRAINT `bast_pihak_lain_id_pihak_kedua_foreign` FOREIGN KEY (`id_pihak_kedua`) REFERENCES `pihak_kedua` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bast_pihak_lain_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `bast_udara`
--
ALTER TABLE `bast_udara`
  ADD CONSTRAINT `bast_udara_id_alamat_foreign` FOREIGN KEY (`id_alamat`) REFERENCES `alamat` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_udara_id_penyedia_jasa_foreign` FOREIGN KEY (`id_penyedia_jasa`) REFERENCES `penyedia_jasa` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bast_udara_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `darat`
--
ALTER TABLE `darat`
  ADD CONSTRAINT `darat_id_bast_darat_foreign` FOREIGN KEY (`id_bast_darat`) REFERENCES `bast_darat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `darat_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `darat_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `imigran`
--
ALTER TABLE `imigran`
  ADD CONSTRAINT `imigran_id_area_foreign` FOREIGN KEY (`id_area`) REFERENCES `area` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_jabatan_foreign` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_jenis_kelamin_foreign` FOREIGN KEY (`id_jenis_kelamin`) REFERENCES `jenis_kelamin` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_kab_kota_foreign` FOREIGN KEY (`id_kab_kota`) REFERENCES `kab_kota` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_kawasan_foreign` FOREIGN KEY (`id_kawasan`) REFERENCES `kawasan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_negara_foreign` FOREIGN KEY (`id_negara`) REFERENCES `negara` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_sub_kawasan_foreign` FOREIGN KEY (`id_sub_kawasan`) REFERENCES `sub_kawasan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `imigran_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `jemput_keluarga`
--
ALTER TABLE `jemput_keluarga`
  ADD CONSTRAINT `jemput_keluarga_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jemput_keluarga_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `jemput_keluarga_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `jemput_pihak_lain`
--
ALTER TABLE `jemput_pihak_lain`
  ADD CONSTRAINT `jemput_pihak_lain_id_bast_pihak_lain_foreign` FOREIGN KEY (`id_bast_pihak_lain`) REFERENCES `bast_pihak_lain` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jemput_pihak_lain_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jemput_pihak_lain_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `jenazah`
--
ALTER TABLE `jenazah`
  ADD CONSTRAINT `jenazah_id_cargo_foreign` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `jenazah_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kab_kota`
--
ALTER TABLE `kab_kota`
  ADD CONSTRAINT `kab_kota_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `layanan_cargo`
--
ALTER TABLE `layanan_cargo`
  ADD CONSTRAINT `layanan_cargo_id_cargo_foreign` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `layanan_cargo_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `layanan_group`
--
ALTER TABLE `layanan_group`
  ADD CONSTRAINT `layanan_group_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `layanan_group_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `layanan_kepulangan`
--
ALTER TABLE `layanan_kepulangan`
  ADD CONSTRAINT `layanan_kepulangan_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `layanan_kepulangan_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `layanan_masalah`
--
ALTER TABLE `layanan_masalah`
  ADD CONSTRAINT `layanan_masalah_id_layanan_foreign` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `layanan_masalah_id_masalah_foreign` FOREIGN KEY (`id_masalah`) REFERENCES `masalah` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `makan`
--
ALTER TABLE `makan`
  ADD CONSTRAINT `makan_id_bast_makan_foreign` FOREIGN KEY (`id_bast_makan`) REFERENCES `bast_makan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `makan_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `negara`
--
ALTER TABLE `negara`
  ADD CONSTRAINT `negara_id_sub_kawasan_foreign` FOREIGN KEY (`id_sub_kawasan`) REFERENCES `sub_kawasan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pmi`
--
ALTER TABLE `pmi`
  ADD CONSTRAINT `pmi_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pmi_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pmi_id_masalah_foreign` FOREIGN KEY (`id_masalah`) REFERENCES `masalah` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `pulang_mandiri`
--
ALTER TABLE `pulang_mandiri`
  ADD CONSTRAINT `pulang_mandiri_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pulang_mandiri_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pulang_mandiri_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rujuk_rs_polri`
--
ALTER TABLE `rujuk_rs_polri`
  ADD CONSTRAINT `rujuk_rs_polri_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rujuk_rs_polri_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `rujuk_rs_polri_id_pihak_kedua_foreign` FOREIGN KEY (`id_pihak_kedua`) REFERENCES `pihak_kedua` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `rujuk_rs_polri_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `spu`
--
ALTER TABLE `spu`
  ADD CONSTRAINT `spu_id_bast_udara_foreign` FOREIGN KEY (`id_bast_udara`) REFERENCES `bast_udara` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `spu_id_provinsi_foreign` FOREIGN KEY (`id_provinsi`) REFERENCES `provinsi` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `spu_tiket`
--
ALTER TABLE `spu_tiket`
  ADD CONSTRAINT `spu_tiket_id_spu_foreign` FOREIGN KEY (`id_spu`) REFERENCES `spu` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_kawasan`
--
ALTER TABLE `sub_kawasan`
  ADD CONSTRAINT `sub_kawasan_id_kawasan_foreign` FOREIGN KEY (`id_kawasan`) REFERENCES `kawasan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `udara`
--
ALTER TABLE `udara`
  ADD CONSTRAINT `udara_id_bast_udara_foreign` FOREIGN KEY (`id_bast_udara`) REFERENCES `bast_udara` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `udara_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `udara_id_kepulangan_foreign` FOREIGN KEY (`id_kepulangan`) REFERENCES `kepulangan` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
