-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Jul 2023 pada 07.13
-- Versi server: 10.3.39-MariaDB-cll-lve
-- Versi PHP: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kepb5154_kepulangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alamat`
--

CREATE TABLE `alamat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `lokasi` text DEFAULT NULL,
  `utama` tinyint(1) NOT NULL DEFAULT 0
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
  `from_area` bigint(20) UNSIGNED DEFAULT NULL,
  `to_area` bigint(20) UNSIGNED DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id_area` bigint(20) UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL
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
  `id_area` bigint(20) UNSIGNED DEFAULT NULL,
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order` varchar(255) DEFAULT NULL,
  `id_penyedia_jasa` bigint(20) UNSIGNED DEFAULT NULL,
  `id_alamat` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Lokasi Jemput',
  `durasi_pengerjaan` int(11) DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Jemput',
  `foto_penyedia_jasa` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bast_darat`
--

INSERT INTO `bast_darat` (`id`, `purchase_order`, `id_penyedia_jasa`, `id_alamat`, `durasi_pengerjaan`, `tanggal_serah_terima`, `foto_penyedia_jasa`, `foto_serah_terima`, `terlaksana`, `id_user`) VALUES
(1, 'test. po. darat', 2, 1, 3, '2023-06-19', 'https://kepulanganbp3mibanten.site/public/uploads/c61016ca-3ba9-49c9-8368-9dec864a86d6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d497ac06-ce38-4fe0-8721-6ceb8520311f.jpg', 1, 1),
(2, 'PO. 120/P4MI Bandara Soetta/VI/2023', 2, 1, 3, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/ba93324a-39dc-4a51-b181-e383244fba68.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/79aaf524-5707-4fe0-b344-c8a2d30b1db7.jpg', 1, 1),
(3, 'PO. 121/P4MI Bandara Soetta/VI/2023', 3, 1, 3, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/e34b2543-c5c7-40cc-bd83-051e97ab8c9e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/91463c9d-6010-403a-abae-c36cd2a02493.jpg', 1, 1),
(5, 'PO.065/P4MI Bandara Soetta/VII/2023', 3, 1, 6, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/9c8d02b6-4f2e-45a9-8253-0365eeba9ef7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5fe3f1ac-99bc-4d44-b58b-afbff7e74381.jpg', 1, 3),
(6, 'Po. test', 3, 1, 3, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/57e77055-45cf-44f5-8296-65a0edc02abe.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/af287e5a-07b4-4b9d-bd38-0f645c3a6393.jpg', 0, 1),
(7, 'PO. 066/P4MI-BANDARA SOETTA/VII/2023', 3, 1, 3, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/c118cf77-0987-445a-9346-508e66f3a6e0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3e998408-bbbb-4128-b279-67946165ccad.jpg', 1, 1),
(8, 'PO.071/P4MI Bandara Soetta/VII/2023', 3, 1, 7, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/abdf2e6b-5e8b-4050-be48-1edd5e0859b9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/913b89c1-8460-4db7-b050-4bae4cd6f363.jpg', 0, 9),
(9, 'PO. 072/P4MI Bandara Soetta/VII/2023', 3, 1, 3, '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/d5465e0e-f377-46fe-8d28-fc2cfdc1bdd1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/146b6e1c-eb6d-4087-a474-85c74043daee.jpg', 0, 1),
(10, 'PO.074/P4MI BANDARA SOETTA/VII/2023', 3, 1, 7, '2023-07-23', 'https://kepulanganbp3mibanten.site/public/uploads/09561dce-fbed-4eaa-8f2d-fe8637076f87.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/84105986-fa85-46f7-933c-0f92065a348f.jpg', 0, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_makan`
--

CREATE TABLE `bast_makan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order` varchar(255) DEFAULT NULL,
  `id_penyedia_jasa` bigint(20) UNSIGNED DEFAULT NULL,
  `id_alamat` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Lokasi Antar',
  `durasi_pengerjaan` int(11) DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Antar',
  `waktu_serah_terima` varchar(255) DEFAULT NULL COMMENT 'Waktu Antar',
  `foto_penyedia_jasa` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `foto_invoice` varchar(255) DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bast_makan`
--

INSERT INTO `bast_makan` (`id`, `purchase_order`, `id_penyedia_jasa`, `id_alamat`, `durasi_pengerjaan`, `tanggal_serah_terima`, `waktu_serah_terima`, `foto_penyedia_jasa`, `foto_serah_terima`, `foto_invoice`, `terlaksana`, `id_user`) VALUES
(1, 'PO.530/P4MI Bandara Soetta/VI/2033', 1, 1, 1, '2023-06-19', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/f4405457-c182-41da-aba3-052014f2c9ba.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f0fcc79b-fe58-443c-a795-4aac26d69f57.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/144a05f1-3cc1-4fcc-bda7-8936332b303e.jpg', 1, 3),
(2, 'PO.531/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-19', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/0a78a9e7-f0e8-4c86-af07-74e1788d8fa2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/405c9ef9-7839-48f3-a16f-e1485ac6e69e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5c3fa0df-54c5-4492-a009-cfa027cc182d.jpg', 1, 3),
(3, 'PO.532/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-20', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/77336bf8-f27a-4dfc-b89f-97657794abe3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4ccfbcc3-1608-4b6e-8b62-f53d566c0c4d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/271def3f-f03f-4ffa-9ca4-1ac6859a424e.jpg', 1, 3),
(4, 'PO. 533/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-20', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/2233116e-f31c-4791-9df9-4d3112cf3363.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5ee6a10c-df6e-4824-848d-de0b1cf61b05.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/25abc9d7-b7b9-42a3-8cff-8c88395135f0.jpg', 1, 1),
(5, 'PO. 534/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-20', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/65cdd313-927f-44e2-9b07-6c10b1246c5a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/08c48c4c-6499-4a73-86b6-767a6129f890.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cad7daab-0c11-48ac-92e2-9f9a2d44a2a8.jpg', 1, 1),
(6, 'PO. 535/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-21', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/232177de-f22d-4c22-9d60-005543d3d598.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4235cba5-846d-4b31-b320-c2f03942398e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/60cb47e2-92c1-4371-b0a7-295bc37834da.jpg', 1, 1),
(7, 'PO. 536/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-21', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/74db9379-7b55-44a9-86d0-e8a454113fb2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/97b88148-66ba-4eca-a7f9-3452f7536b96.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/13870826-a51f-438b-bf79-4cb2f997dac3.jpg', 1, 16),
(8, 'PO. 537/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-21', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/56f5363a-1af1-4955-b988-3adef9938b6d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c88c1eb7-9e23-4704-b012-ab27f4f28fe2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e1a6383c-86d4-4ab6-99d4-90914f6a4fd7.jpg', 1, 16),
(9, 'PO.539/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-22', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/26e93583-d7fe-4030-af17-c5e0f92cc013.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aae9aab8-9ac1-46ec-81ad-c6b5dcf5cc4e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6242951a-596b-4717-9094-d83cd1f47183.jpg', 1, 3),
(10, 'PO.540/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-22', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/f7b9b86f-7c03-4367-b881-a41bd2f68e9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8f7cc4c1-5d54-490b-99cc-db82929a69ee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/de90c127-4084-410a-a611-e944a3991439.jpg', 1, 3),
(11, 'PO.541/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-22', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/c0df341c-be08-437d-9f56-6713e22b9e73.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/29925efe-a8a5-43c8-a983-3d6530ae5f35.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/75763ea4-1573-4377-b485-06e5a1dab9c0.jpg', 1, 3),
(12, 'PO.542/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-23', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/c98e8bca-110c-4bb1-9e61-bf277814db76.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/97e25ee6-8469-476f-82c2-dee9b84b0373.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b97c0453-cc33-4542-891e-8a04a76e6fc3.jpg', 1, 3),
(13, 'PO. 543/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-23', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/60387c97-67a1-4c08-9520-c32c79d49163.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/282a58ba-08b1-41fe-8b81-a71eeb30eb77.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ba1e3083-dbdd-49e2-a33b-83e95bb13ae0.jpg', 1, 1),
(14, 'PO. 544/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-23', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/57266186-80b2-4b89-9ca0-364799b22a1f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/327a3408-34ef-4230-835f-a525b1e155a8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d0b57e44-43a5-457c-873b-1cbb46bf82e8.jpg', 1, 9),
(15, 'PO.549/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-25', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/bad9f7f3-5ca0-41fc-b7ce-723fe95c723c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/772728fb-ec60-4e31-8fed-10a7db1dca15.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1c564c5f-bdbf-452e-8127-2b169569caab.jpg', 1, 3),
(16, 'PO.550/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-25', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/0e8cecbd-8a86-4288-81c8-6ab3c7284dc5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d4508480-99dc-4987-81a1-d9196184a2ca.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/66493c5a-05b0-4173-96eb-07e1374cbe36.jpg', 1, 3),
(17, 'PO.551/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-26', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/369716dd-1492-4175-bb93-8fbd7c449e60.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/12b034eb-dafb-4c41-8962-3de265742f50.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c52dfc28-a508-487f-b65e-3f030cea5be1.jpg', 1, 3),
(18, 'PO. 545/Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-24', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/ccea227b-cde7-4e42-9c0f-955759830675.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/56fea09e-cad1-4b3b-8ab9-a98eefe66502.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a04b753-038d-47f3-8b2c-760e702752fb.jpg', 1, 1),
(19, 'PO. 552/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-26', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/5d272df7-696e-447c-b1c9-e8bbeb92e815.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6342c400-8378-4543-8950-54c80ef7b66e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ae1442d4-16ba-4e14-af8c-f1056d4c2bf2.jpg', 1, 1),
(20, 'PO. 553/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-26', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/249bc63e-0393-4620-82f8-3e4ed5f44570.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f106e8d3-da7e-4794-9927-5ad2f6850170.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0edd8f6a-476d-4037-80a3-413888a4fad6.jpg', 1, 1),
(21, 'PO. 554/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-27', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/d6ede96d-da2a-47ff-ba2f-ac7ca79a9b55.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/02fbdcf6-8adb-4d96-aebc-dbcdcc5328fd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e2136cac-60b1-4774-b637-0e937743d6de.jpg', 1, 1),
(22, 'PO. 555/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-27', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/8dd0ad3a-a098-478e-9d32-015ccfcdcade.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cdf4887d-d1ef-435f-a786-8b12f403b3fb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/024159a1-c0fa-43f1-88af-c84fc47d7c51.jpg', 1, 16),
(23, 'PO.556/P4MI Bandara Soetta/V/2023', 1, 1, 1, '2023-06-27', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/4c5c0a55-b777-4bd0-8a3b-a90aacaeb511.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/632e92be-c253-408f-93c6-149bdaea84d2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/710c5bfa-f72d-4074-b776-7047dbf7ae40.jpg', 1, 16),
(24, 'PO.557/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-28', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/73c9c99b-37ce-483e-921a-67185a1aa852.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9c3e7dd2-b474-4364-a5c8-72ce81d58663.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/db9f42c7-6918-46ed-9846-0f38e4978833.jpg', 1, 16),
(25, 'PO.558/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-28', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/9d80a9ca-cf33-473d-87f5-26e7e3285e29.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/51eece38-fc80-4a7d-bcd0-e44becf7e18f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8243d7bf-6a77-4d5f-a638-34926f66d9a4.jpg', 1, 3),
(26, 'PO.559/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-28', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/7e3a9116-0823-4aa7-bc3e-acf71f3cdd4a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/64625908-42e0-4dba-b306-f7ecfc3a856e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2602232-196f-472b-a9ca-16ba823fe930.jpg', 1, 3),
(27, 'PO.560/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-29', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/52aa9702-4098-475f-abfd-17c49ff4042e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6a21df12-a719-459a-9b70-bff6943dee1e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/40ecc546-7746-47db-b4e1-7beed0f3fae7.jpg', 1, 3),
(28, 'PO. 561/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-29', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/68cc05ea-0f31-4514-a505-40135c62cabb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/336a21e5-e2f1-447f-bd1a-1ea50f31be3c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/44b63b4c-4379-4c8b-8236-1ed0be5e3874.jpg', 1, 1),
(29, 'PO. 562/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-29', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/3e898b4a-7e36-484a-8c3f-ba80647ee56b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d8c1c1fc-2dda-4fb1-bec8-b70071a772ab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/db164f2b-4cf0-48a6-a138-1b5cc69ec8a2.jpg', 1, 1),
(30, 'PO. 563/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-30', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/9364cb94-b856-4ac4-8226-4f8e2665761e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e172e88e-6928-4865-b5b2-9b0d0bea1720.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b747238d-444a-4261-933f-00e404690453.jpg', 1, 1),
(31, 'PO.564/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-30', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/642d83c5-fd6c-43c3-8108-bf89c3573349.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3803404d-148e-4651-99ed-04c2b98e5dad.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e35ea962-94c9-4d40-93f2-877ff648d9f3.jpg', 1, 16),
(32, 'PO.565/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-30', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/04168e79-3a5e-4307-bf38-cfc02075d52c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e59e74e1-0cb1-4fb2-9416-7513b253d138.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0a945568-9015-4e61-9ff6-7b39df0fd59c.jpg', 1, 16),
(33, 'PO.566/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-07-01', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/62f52c17-8dbc-4612-9d4b-4cfd93dc4872.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/607a13b6-96eb-409c-aaa4-940df27562e9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8994ea04-4d2b-494c-9d74-12c545ceba07.jpg', 1, 16),
(34, 'PO.567/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-01', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/b4da3499-c42a-4f96-b247-5cdc5a148767.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c009c425-3f75-43a2-a929-b03ee6408c14.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9249de36-62ee-428d-819d-0b0af812c90d.jpg', 1, 3),
(35, 'PO.568/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-01', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/d8b25367-87a9-401c-844d-225ce016583c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/71331795-ca91-42f5-b79d-6b5d90f65737.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9c16c624-901e-4bf9-9d52-8d2a5c7b33f7.jpg', 1, 3),
(36, 'PO.069/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-02', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/3124ecbb-10e0-4a32-ab42-38d6c0fd66c1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/10d8a6b2-7602-4d64-b3ed-0909c98770a6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/55ffd0e1-c1cc-4c71-8dac-ebea612a8176.jpg', 1, 3),
(37, 'PO. 570/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-02', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/6f7980d1-786c-4045-b45a-b987de308eb8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c65fda2d-cc5b-4849-af68-305b59e0a403.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fe031628-5ee3-4260-8438-854a257276d6.jpg', 1, 1),
(38, 'PO. 571/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-02', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/0e8555f8-e520-415a-b7c0-5a4005107b04.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0d3e1762-95fd-435a-89b2-2970a5252825.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/46b54cfb-2436-43e0-bdb0-79000f143dd6.jpg', 1, 1),
(39, 'PO. 572/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-03', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/8c30fdfc-be4e-4f90-9c8a-2273cfdde21a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/41c5f741-3876-4c83-8097-f9deba171e4a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c1bf5ddd-3b05-46ba-a812-846608d42087.jpg', 1, 1),
(40, 'PO.573/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-03', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/e112b2a4-3311-49d2-b67d-c2b446146f80.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/414b57e9-2ad8-43e3-9166-c69a1ce0784f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ae943e7f-9404-448b-bdd4-a45f42c2ca2f.jpg', 1, 16),
(41, 'PO.574/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-03', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/796bb5ad-4435-47a1-a23f-14eebc2921b9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7486f36f-db2b-4b01-8b33-7a4147901c5d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/de7b27b8-7b19-4a29-8d8a-30a56d58ead8.jpg', 1, 16),
(42, 'PO.575/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-04', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/ea483b79-5fcc-4c6a-8cce-26e1c98a802c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f2372166-335a-44f4-ab8c-197f5c44ad27.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/09b62002-5aa9-48da-b3ae-7d69ffbab54e.jpg', 1, 16),
(43, 'PO.576/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-04', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/cbd431db-460b-4583-8fc5-b9a3220561cd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b2e068b8-6a35-4a57-8f3d-d880d052fc87.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2a049c29-5583-4571-9ad3-8af1623dbba9.jpg', 1, 3),
(44, 'PO.577/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-04', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/8069beeb-0b07-4aa3-84d4-d7df4fd5c3a4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/94c2450c-534a-422b-a974-ac6037e2e50e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a53e7f80-b9bf-4784-9115-cb8b99c2c13c.jpg', 1, 3),
(45, 'PO.578/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-05', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/4c8555ec-ed0e-459f-9370-304607881938.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e31a713e-f243-4f9a-84dc-d1ce2710bbd0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/659d717b-d88b-4a66-b9d4-f993c42d71e8.jpg', 1, 3),
(46, 'PO.579/P4MI Bandara Soekarno Hatta/VII/2023', 1, 1, 1, '2023-07-05', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/18713d5c-f0d5-4e5c-a6da-0e3cd339d74d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/150bdc5d-14f9-4b45-8b2e-d5cf24d43136.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/52f0f153-9295-4841-8dcc-ca5fc48bb72c.jpg', 1, 9),
(47, 'PO.580/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-05', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/464ff89b-da80-4ea3-8dc3-6f014350306a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/725a2326-e2f0-4bd3-84e7-31ef66741bf4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/75bca66c-786b-465a-8c1a-789938b28cb8.jpg', 1, 9),
(48, 'PO. 582/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-06', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/d3768020-7ffc-4cb1-9cdd-c76bb9c2b385.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a8252f61-09d5-4a18-b998-a6cb871496b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/95359f8e-499b-45ab-929d-1f225f57363e.jpg', 1, 1),
(49, 'PO. 586/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-06', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/6a05f134-433f-4ccc-b6d5-6f720e9f77e1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/32c8fad7-75de-4c80-b98b-7045be40bfdc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f8d8665b-2dd9-4296-b394-9b871b5393e6.jpg', 1, 1),
(50, 'PO. 0588/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-06', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/a96218ea-e34c-48fb-9add-9d8ad242f6c8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4157cf87-9d7a-4b0c-8acb-9b5cbbebe682.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/60e34578-1c09-400d-bb7f-bcd908b39536.jpg', 1, 1),
(51, 'PO. 590/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-07', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/ff83e988-8b5f-424a-8e36-ba45b82826e8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1e10a202-5b18-46b3-97f5-0996d2e686fb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/90c80b26-5fba-4aff-b90e-b8c482841d4a.jpg', 1, 1),
(52, 'PO.572/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-07', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/f8eb4d1b-a137-4998-8380-0cddece95954.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f9543576-a376-4722-bcf1-c6503b6cb8fc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fead94c2-9afc-428c-bad1-eae5637f2efe.jpg', 1, 16),
(53, 'PO.594/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-07', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/ee20878f-33a5-4236-95cb-59a8bbc2b1c1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/480d1891-cb74-4a5f-a74a-4015692c5047.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6a214410-5847-48ed-87a9-1b020953214c.jpg', 1, 16),
(54, 'PO.597/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-08', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/2fd38199-1050-4d66-9bf7-9e0a720aa3ea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7b00f075-3c4c-42a9-953c-01332e936a11.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4cb7318c-9e36-4a96-94b4-cc19d2d109b9.jpg', 1, 9),
(55, 'PO.599/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-08', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/a2ab2663-e573-4587-86d1-94040e75bec2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b6e1241b-9a63-4482-aab0-ec91ec5ef9a4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/da66cd7a-ade8-4a21-b549-8011306cbe72.jpg', 1, 9),
(56, 'PO.600/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-08', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/eaaeec29-801e-4773-aaf1-451265d5d31a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4b74ad1a-f5e6-4356-a25c-ba7ceb0cb821.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/31c7c1cb-f989-40c5-95a3-90dd69511109.jpg', 1, 9),
(57, 'PO.601/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-09', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/f46a1d4b-1884-48af-8f1e-2c432f33d789.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3606db71-5ee4-41f8-af6e-73fd71f24b02.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fabadf0c-0adf-4cc3-906b-2ecbad47f4d7.jpg', 1, 9),
(58, 'PO. 605/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-09', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/5a7d5157-d39c-431b-ba90-ad94ab18b6be.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8e1d8e9b-06ef-427c-a7d0-622c938ba090.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1c685366-01e6-4b8b-bb18-4f4198a01df1.jpg', 1, 1),
(59, 'PO. 607/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-09', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/b4346e4b-9b34-49ca-bd4e-6b09ac99e75e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/50501a33-a517-40e9-98de-4b771da97a69.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ec987581-7cfb-400d-b141-ccf6e5e733e4.jpg', 1, 1),
(60, 'PO. 610/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-10', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/3ee97a0b-7e27-4e8f-85fb-bdd515fb8a97.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fb3a8b5f-b96a-4f99-b5f8-f9c7a4f47f5d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5aa6ad6b-6e62-445f-9800-c6580e8adf8f.jpg', 1, 1),
(61, 'PO.611/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-10', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/95c8a996-2a2e-4364-977c-34b4e9b80d61.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4a1e738f-0645-4ed9-9c15-298f8eedd8f9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ee60761d-cf4f-4974-b7fb-4209d31adcb3.jpg', 1, 16),
(62, 'PO. 614/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-10', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/8ac4c454-9561-4076-8981-93dacc1340c3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f88160c-6a92-4bb1-8fab-9a6f6fdb5969.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7e67d0bc-1ca6-40b2-99d9-e4e29c90f56e.jpg', 1, 16),
(63, 'PO. 615/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-11', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/852aa430-51e5-40a1-aebb-3349e795cb6c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2221a897-c5d2-4a48-9351-b3f925ead5b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/13090ab4-75e3-499d-90d7-baaa0387ceee.jpg', 1, 16),
(64, 'PO.617/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-11', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/478b340a-ef9d-4985-94d6-2c39af38bbea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/63075943-f106-4f75-9cbc-ee33e643b9b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a5158db9-6d06-4fb8-8fe8-511e7e8f61f0.jpg', 1, 1),
(66, 'PO. 619/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-11', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/115b38fa-164a-49fc-9c3b-66e91aff428c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/495b9436-fcdb-4705-b7c9-344000be448c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/16adda6e-7ce1-4fcc-80a7-c8fb57546a5f.jpg', 1, 1),
(67, 'PO. 621/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-12', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/2b62fa5c-863b-456f-9c65-83c4fd872ba3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b182bba6-2179-48a1-8b64-721aaadf20c0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b3fa7a53-14e9-4747-98af-b2a5bdf7fcb7.jpg', 1, 1),
(68, 'PO. 623/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-12', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/cf9af59a-6ec9-4e67-b9c4-412edfa213de.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/71670a6b-c242-4879-a3d1-6cf335f9a4cb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9d083d28-365c-44fc-8252-67096512b2c5.jpg', 1, 1),
(69, 'PO. 625/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-12', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/6a8f1790-11a6-4de7-8d69-8a6f433369ff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/43eb3a3b-2e4d-4789-87a1-405e3dfa66b8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48a142d1-df7d-40de-9083-b29ed76763dc.jpg', 1, 1),
(70, 'PO. 627/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-13', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/bc03988c-21cb-4b1c-90cb-68324a3a70b4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f4d456fc-556a-487f-93ef-435d021f52ef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c51d46a2-ff23-4a34-a041-59d8e9bec79f.jpg', 1, 16),
(71, 'PO. 629/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-13', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/e36b09e8-dcec-469d-8c8d-546f58a21a09.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/be508901-1ebf-4f5e-ac3c-64d7b93ea377.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a07159a8-6837-42e7-929d-f5820c5db92f.jpg', 1, 16),
(72, 'PO. 631/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-13', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/de4d517f-57bf-48c8-9e95-cea18b72e0b0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a3b84dc9-ac43-425a-853e-91457b168b3f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e1b65f9a-da22-4cbc-bc63-6be78c6020be.jpg', 1, 16),
(73, 'PO.634/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-14', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/27b6f126-f5ab-4648-a234-1418f2c0a58c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1dda8a8-8387-424a-afda-1dd08572caa3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/20399a65-f4fa-4426-8bfb-63496333a8b5.jpg', 1, 9),
(74, 'PO.636/P4MI Bandara Soekarno Hatta/VII/2023', 1, 1, 1, '2023-07-14', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/d95114a9-1aed-4004-b901-c3caadb1bd9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ab198958-6c80-4658-969e-bffa8b80ca4c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/09a17bbd-4048-4890-9b62-dd4fa57410de.jpg', 1, 9),
(75, 'PO. 641/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-15', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/8854d0ed-a31d-4456-8c1e-5972f5ca0969.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e7e41984-b399-4d59-9fed-3c1c9b718db4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/21727870-aca0-4833-b2b3-ddd2c3af142d.jpg', 1, 1),
(76, 'PO. 643/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-15', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/0a0b8518-d13a-4838-86e4-498439392fda.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b7c5df4f-9d96-48ae-8e13-106d4b8c7735.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/50272fcc-7fd2-40d3-a3aa-3ca0dbf87a7d.jpg', 1, 1),
(77, 'PO. 639/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-15', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/cdc85247-3047-4733-b108-083c30adbfe7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e4f688ee-f77c-444a-8a1a-21e0d3e3323b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/543d9e80-6cf7-4a5c-b9cc-b584b06849f6.jpg', 1, 9),
(78, 'PO. 645/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-16', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/1657f447-dc89-49f3-8f4f-be3ee5468c63.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e5111607-26da-417b-9ee8-3d1808490bb1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/84bb286d-553d-445c-b0eb-b7428bbcb1fd.jpg', 1, 1),
(79, 'PO.653/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-17', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/b080b303-5811-4282-ad35-132b9b5bbc28.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d5b95f70-490e-4065-82e7-ab3e365d60ab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/93934c61-3337-480c-830b-ecf8e61b064a.jpg', 1, 9),
(80, 'PO.655/P4MI Bandara Soekarno Hatta/VII/2023', 1, 1, 1, '2023-07-17', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/d048081e-9bcb-46f6-9681-bb5541fdfdc7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1ac8713e-1aa7-4d5b-b754-7f755a781f72.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a03489f-206d-428d-94ce-4d856c6bd377.jpg', 1, 9),
(81, 'PO.657/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-18', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/c17a942a-a61e-4043-a8dd-08d8e5bd0943.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/be4d7a77-c2b8-4eef-b258-d2f0965b96bc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aef8312f-5269-4bf6-9827-707b2e4de7e9.jpg', 1, 9),
(82, 'PO. 659/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-18', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/20d85561-a399-46f8-94bc-d550d6b2693a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a6725764-ef3b-4da4-ba34-e628ab848d12.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9f73d395-5dc5-4d2b-9f4f-8ba81a466924.jpg', 1, 1),
(83, 'PO. 661/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-18', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/23f5512a-71af-44ec-97bc-feb1f8ad33ba.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c469ab9b-44eb-4b56-af0c-5c254f9187c6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a79b6d60-3294-431e-a476-2c2c0eafcbf0.jpg', 1, 1),
(84, 'PO. 663/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-19', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/074b7907-76a3-494b-a59b-f452ee14282a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/337d9ae8-864c-4625-a120-b14d60516b19.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0ea1fd0f-c82a-423b-a4ec-7f157d3d6e35.jpg', 1, 1),
(85, 'PO. 666/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-19', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/16bd4f7f-a841-4679-8d4a-4fbf5a59d116.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/59d8002a-35fb-4ae6-9cc8-0fa00881543c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/db30e577-cad4-4556-b215-14a5042598b8.jpg', 1, 16),
(86, 'PO. 668/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-19', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/2f884c9f-2506-495c-9a2f-20d5021b1fa4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4953b818-0a16-46ee-a952-7b872f85ca6e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d3e90992-4e99-4aa6-8828-990197ba82a9.jpg', 1, 16),
(87, 'PO. 670/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-20', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/b60d29eb-dc19-493e-81de-04aa58bb9e17.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5ce63bbe-4502-4f56-b825-889fabecf801.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45010caa-cf82-4b8a-b639-2ee47dcd9347.jpg', 1, 16),
(88, 'PO.671/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-20', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/275c290d-a3dd-408c-a7fa-aeb73d6b858b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/17505de9-2cda-4ec1-91de-11db5d630d92.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/116101ed-3be5-4f4b-8741-fea8876dcda4.jpg', 1, 9),
(89, 'PO.673/BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-20', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/489e6200-be03-4b45-bf58-d51d2c4ae107.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/85814816-a31d-48b8-a494-afb40c7f0375.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/de29509d-20bc-4e2d-b843-dd54e478b8a7.jpg', 1, 9),
(90, 'PO.675/Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-21', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/6c25f503-6695-417d-826e-83dd1ab347b3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8d9a0134-42df-434b-a5b6-ae4654a607fa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8aad0906-c86a-4769-bcef-d6b11b35abd9.jpg', 1, 9),
(91, 'PO. 677/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-21', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/9cd8ec27-ae7e-4d94-93c3-8e0f0a5b69a2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a070dd55-bad3-4558-875b-e569e99bea71.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/904111ac-6c0e-4d4c-bdde-ae6bd00f635c.jpg', 1, 1),
(92, 'PO. 679/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-21', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/9f21bc35-8b1d-4c68-b4c1-5ae27733c8a5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dd196152-fe50-4428-807b-a9a25e65700c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/72b0d0ec-6a79-4f77-b057-0a564184125e.jpg', 1, 1),
(93, 'PO. 681/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-22', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/aa9b2bfc-4dd3-42d7-a31f-339fe7933f52.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f725ac11-5505-4c63-b3d3-5a41df32a3ce.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3c7af5e0-0c2c-4778-b13a-1102d6a6b0a9.jpg', 1, 1),
(94, 'PO.689/BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-23', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/035db791-6959-48d2-88c3-f85377942405.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/696fa9b3-b6f8-4618-82b0-13aa973159ef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/943f9764-6b27-4f90-a127-0debbe1c16f9.jpg', 1, 9),
(95, 'PO.691/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-23', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/bdb0dcab-3a26-4b0b-8b3a-f8b910c7ebd9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a908867d-fb1f-4ad6-8ad7-98b858f819d9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/265d3c79-ec52-4529-a9c9-f9cf356a472c.jpg', 1, 9),
(96, 'PO.695/P4MI BANDARA SOETTA/VII/2023', 1, 1, 1, '2023-07-24', '07:00', 'https://kepulanganbp3mibanten.site/public/uploads/1fcaa448-80e0-4adb-b534-db084cb012c4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/96867e5b-2806-48c3-aa82-51bfdb58fe9b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8e5761f2-2478-41de-a282-328f1bfb8a47.jpg', 1, 1),
(97, 'P0. 697/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-24', '13:00', 'https://kepulanganbp3mibanten.site/public/uploads/4675cfdd-8851-4459-9391-ad9271145519.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1d55a563-9d9b-49d9-8d06-f7825395cc43.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/12b570c4-3e24-4b8f-8525-5ef5e3e16e8f.jpg', 1, 1),
(98, 'PO. 699/P4MI Bandara Soetta/VII/2023', 1, 1, 1, '2023-07-24', '19:00', 'https://kepulanganbp3mibanten.site/public/uploads/ed5465a0-84a2-4462-ae50-6313b5846b5e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/190b4242-e124-49c5-9f0d-c38b78fbc053.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dce72aaf-70ee-430f-99fa-975b0398723c.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_pihak_lain`
--

CREATE TABLE `bast_pihak_lain` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_pihak_kedua` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_pihak_kedua` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bast_pihak_lain`
--

INSERT INTO `bast_pihak_lain` (`id`, `id_pihak_kedua`, `tanggal_serah_terima`, `foto_pihak_kedua`, `foto_serah_terima`, `terlaksana`, `id_user`) VALUES
(1, 1, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/d713c6ea-96ec-4bb7-94da-a7917f64a280.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7711e0f2-ac09-4744-9cbb-dcae95c8bf8e.jpg', 1, 1),
(2, 4, '2023-07-02', 'https://kepulanganbp3mibanten.site/public/uploads/a55e0567-a606-474f-9f63-760176e3490c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8866a1ad-7df4-4e4b-a95c-33ace4ab69b5.jpg', 0, 1),
(3, 6, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/284813f0-a2cf-40ba-ab98-d7b01033bf31.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3014d397-39c4-4f08-8153-48ac709315be.jpg', 1, 9),
(4, 7, '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/cdecdc9b-a766-463c-92a1-def02604b3ab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/31dbcfeb-7203-49a4-8b2a-64362f49cd82.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `bast_udara`
--

CREATE TABLE `bast_udara` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order` varchar(255) DEFAULT NULL,
  `id_penyedia_jasa` bigint(20) UNSIGNED DEFAULT NULL,
  `id_alamat` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'Lokasi Jemput',
  `durasi_pengerjaan` int(11) DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL COMMENT 'Tanggal Jemput',
  `foto_penyedia_jasa` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bast_udara`
--

INSERT INTO `bast_udara` (`id`, `purchase_order`, `id_penyedia_jasa`, `id_alamat`, `durasi_pengerjaan`, `tanggal_serah_terima`, `foto_penyedia_jasa`, `foto_serah_terima`, `terlaksana`, `id_user`) VALUES
(1, 'PO. test001', 2, 1, 1, '2023-06-19', 'https://kepulanganbp3mibanten.site/public/uploads/864b99f7-380d-461e-82ac-71277712147a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ce17f939-37f2-47a6-931d-2868d966efe8.jpg', 1, 1),
(2, 'POTest2', 2, 1, 1, '2023-06-19', 'https://kepulanganbp3mibanten.site/public/uploads/e21417bf-1710-4340-bb97-7abd5175da5a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6f18a4e9-eb7d-49ff-811f-c682332a8360.jpg', 0, 1),
(3, 'PO. 114/P4MI Bandara Soetta/Udara/VI/2023', 2, 1, 1, '2023-06-21', 'https://kepulanganbp3mibanten.site/public/uploads/f2541f27-0329-4771-8585-b650d040180f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6751aa1f-5524-4188-99f2-c96bac0d11c3.jpg', 1, 16),
(4, 'PO. 116/P4MI Bandara Soetta/VI/2023', 1, 1, 1, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/0eed627e-b5c3-43d3-9532-edc30f4b3a4e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/70e66576-0945-42bc-8e07-d08c1fed2560.jpg', 1, 16),
(5, 'PO. 117/P4MI Bandara SoekarnoHatta/PB.05.03/VI/2023', 2, 1, 1, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/17ae58e9-b81f-46ce-bda1-2dd8948f0d5c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/00b3f79c-1145-4a4b-88d3-7c221c5d9adf.jpg', 1, 16),
(6, 'PO.118/P4MI Bandara Soekarno Hatta/PB.05.03/VII/2023', 2, 1, 1, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/f1c92553-d8e3-488c-afd9-7b29b27b95ac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f382d93-316d-4c23-aecd-e2e2aedf764d.jpg', 1, 3),
(7, 'PO. 0124 /P4MI-BANDARASOETTA/VII/2023', 2, 1, 7, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/6d338620-bd9a-4c15-a5dd-1bcce83ed02a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e46ddd63-c113-4476-9882-72b28e67d49c.jpg', 1, 16),
(8, 'PO.0123/P4MI Soekarno Hatta/PB.05.03/VII/2023', 2, 1, 3, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/1e2e6d73-dd62-440c-9611-1c47412b4473.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48a56c95-c7ec-420c-80c0-375538f0ce59.jpg', 1, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cargo`
--

CREATE TABLE `cargo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_bast_darat` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_bast` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `darat`
--

INSERT INTO `darat` (`id`, `id_kepulangan`, `id_imigran`, `id_bast_darat`, `foto_bast`) VALUES
(1, 1, 18, 1, 'https://kepulanganbp3mibanten.site/public/uploads/c50e4e91-8801-47a1-ac2c-4a05b352358c.jpg'),
(2, 1, 43, 2, 'https://kepulanganbp3mibanten.site/public/uploads/bd0f0c51-a76d-4450-98a1-872e689a6d43.jpg'),
(3, 1, 9, 2, 'https://kepulanganbp3mibanten.site/public/uploads/e87a2d03-56bb-4a49-a501-589466376781.jpg'),
(4, 1, 11, 2, 'https://kepulanganbp3mibanten.site/public/uploads/a6e03ef9-803c-4987-9888-48dd92a8b5ed.jpg'),
(5, 1, 12, 2, 'https://kepulanganbp3mibanten.site/public/uploads/b30f9bea-1519-4b99-a41e-d15f91acf914.jpg'),
(6, 1, 110, 3, 'https://kepulanganbp3mibanten.site/public/uploads/b9db1c76-bc39-483e-9d75-8bff74f4e0c2.jpg'),
(7, 1, 63, 3, 'https://kepulanganbp3mibanten.site/public/uploads/b3525cb4-8aa0-4fe6-8083-bf319c3f8c11.jpg'),
(8, 1, 64, 3, 'https://kepulanganbp3mibanten.site/public/uploads/8cfe409d-c1a2-495a-91dc-70fd0a9a47fa.jpg'),
(9, 1, 106, 3, 'https://kepulanganbp3mibanten.site/public/uploads/6fc186b1-3bd4-4c7b-af48-f85c41ec5fbf.jpg'),
(10, 1, 109, 3, 'https://kepulanganbp3mibanten.site/public/uploads/8c339d31-2ccb-4cac-940a-e0004308427b.jpg'),
(15, 1, 283, 5, 'https://kepulanganbp3mibanten.site/public/uploads/c6e8d613-21a6-4679-89ac-8c4aa0b9efea.jpg'),
(16, 1, 284, 5, 'https://kepulanganbp3mibanten.site/public/uploads/9554df08-c6a3-4b21-8902-21968ee9fa7a.jpg'),
(17, 1, 285, 5, 'https://kepulanganbp3mibanten.site/public/uploads/6b6f4ec7-7a81-474d-917e-84ede5baec43.jpg'),
(18, 1, 286, 5, 'https://kepulanganbp3mibanten.site/public/uploads/0d6799af-063f-4ede-a4c0-b49f12f80b62.jpg'),
(20, 1, 308, 7, 'https://kepulanganbp3mibanten.site/public/uploads/b1ff91bf-2f79-4f43-9ebf-7bd9b3fc4521.jpg'),
(21, 1, 342, 7, 'https://kepulanganbp3mibanten.site/public/uploads/1a94860c-353e-440f-ba0c-f00df9cdefb8.jpg'),
(22, 1, 373, 7, 'https://kepulanganbp3mibanten.site/public/uploads/8ffe175e-0914-4db1-b9b1-a37ab141fb6f.jpg'),
(23, 1, 372, 7, 'https://kepulanganbp3mibanten.site/public/uploads/b4fa736a-55af-45a1-813c-944fe62f6a22.jpg'),
(24, 1, 629, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f28d3036-7a15-4ebb-97a4-1fc252634c80.jpg'),
(25, 1, 631, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0cb9bd87-406a-40a3-90ad-684f20c88d80.jpg'),
(26, 1, 627, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e2f4282c-35ec-4cbd-9604-772607f07b3f.jpg'),
(27, 1, 670, 9, NULL),
(28, 1, 671, 9, NULL),
(29, 1, 667, 9, NULL),
(30, 1, 665, 9, NULL),
(31, 1, 668, 9, NULL),
(32, 1, 664, 9, NULL),
(33, 1, 704, 10, NULL),
(34, 1, 703, 10, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `group`
--

CREATE TABLE `group` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `brafaks` varchar(255) DEFAULT NULL,
  `paspor` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_jenis_kelamin` bigint(20) UNSIGNED DEFAULT NULL,
  `id_negara` bigint(20) UNSIGNED DEFAULT NULL,
  `id_sub_kawasan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_kawasan` bigint(20) UNSIGNED DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_kab_kota` bigint(20) UNSIGNED DEFAULT NULL,
  `id_provinsi` bigint(20) UNSIGNED DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `id_jabatan` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_kedatangan` date DEFAULT NULL,
  `id_area` bigint(20) UNSIGNED DEFAULT NULL,
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `terlaksana` tinyint(1) NOT NULL DEFAULT 0,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `imigran`
--

INSERT INTO `imigran` (`id`, `brafaks`, `paspor`, `nama`, `id_jenis_kelamin`, `id_negara`, `id_sub_kawasan`, `id_kawasan`, `alamat`, `id_kab_kota`, `id_provinsi`, `no_telp`, `id_jabatan`, `tanggal_kedatangan`, `id_area`, `id_layanan`, `id_kepulangan`, `terlaksana`, `id_user`) VALUES
(3, '782713', 'D3726154', 'Darman', 1, 11, 1, 1, NULL, 3602, 36, NULL, 1, '2023-06-18', 1, 1, 4, 1, 1),
(4, 'testbrafaks', '1234567', 'Testnama', 1, 200, 8, 3, 'Rt. 02/03 ds. test kec. test kab. test', 5207, 52, '0852963741123', 16, '2023-06-19', 3, 1, 2, 1, 1),
(5, 'Non Brafak', 'C9821117', 'Ropiah', 2, 199, 8, 3, 'Lendang Gendis RT 10/04 Kel. Gerunung Kec. Praya', 5202, 52, '+601141062444', 16, '2023-06-17', 3, 1, 2, 1, 3),
(6, 'Non Brafak', 'C9453861', 'Seniman BT Tinah Setirah', 2, 189, 7, 3, 'Lingkungan Pondok Prasi RT 04/49 Bintaro Kec. Ampenan', 5271, 52, '087858940917', 16, '2023-06-17', 3, 1, 2, 1, 3),
(7, 'Non Brafak', 'E3127482', 'Lisdawati', 2, 189, 7, 3, 'Kp. Turingan RT 02/03 Ds. Turingan Kec. Pringga Baya', 5203, 52, NULL, 16, '2023-06-17', 3, 1, 2, 1, 3),
(8, 'Non Brafak', 'C9653319', 'Siti Aisah', 2, 189, 7, 3, 'Ds. Ubong Bilakere RT 01/02 Kec. Ubong', 5202, 52, '087714751798', 16, '2023-06-17', 3, 1, 2, 1, 3),
(9, 'Non Brafak', 'XE456088', 'Sriyanti Wakiyan Takrib', 2, 200, 8, 3, 'Sidamulya, Kec. Warureja', 3328, 33, NULL, 16, '2023-06-18', 3, 1, 1, 1, 3),
(10, 'Non Brafak', 'E2430080', 'Anisa', 2, 189, 7, 3, 'Ruse Gonjong, Ds. Lendang Nangka Kec. Masbagik', 5203, 52, '081917088890', 16, '2023-06-18', 3, 1, 2, 1, 3),
(11, 'Non Brafak', 'XE455865', 'Imas Nurjayanto BT Abas Nurjay', 2, 200, 8, 3, 'Dsn. Neglasari RT 17/09 Kel. Lemah Dulur Kec. Tempuran', 3215, 32, NULL, 16, '2023-06-18', 3, 1, 1, 1, 3),
(12, 'Non Brafak', 'XE455866', 'Alma', 2, 200, 8, 3, 'Dsn. Neglasari RT 17/09 Kel. Lemah Dulur Kec. Tempuran', 3215, 32, NULL, 99, '2023-06-18', 3, 4, 1, 1, 3),
(13, 'brafaks', 'XE463653', 'SUDINO', 1, 1, 1, 1, 'DS.selojan', 5202, 52, '082170883782', 21, '2023-06-19', 3, 1, 4, 1, 3),
(14, 'Beafaks', 'XE463657', 'OBOH', 1, 1, 1, 1, 'DS.muntung Ajan rt1/1', 5202, 52, '082359517257', 15, '2023-06-19', 3, 1, 4, 1, 3),
(15, 'beafaks', 'XE463656', 'JONI', 1, 1, 1, 1, 'DS.montong ojan', 5202, 52, '085239020192', 15, '2023-06-19', 3, 1, 4, 1, 3),
(16, 'brafaks', 'AU495711', 'MURTIANI', 2, 1, 1, 1, 'DS.aikdewa', 5203, 52, '081932390003', 7, '2023-06-19', 3, 1, 4, 1, 3),
(17, 'brafakstest2', 'TEST12', 'Testnama2', 2, 1, 1, 1, 'Testalamat2', 5206, 52, '0852123789456', 16, '2023-06-19', 3, 1, 2, 0, 1),
(18, 'brafakstest3', 'B274Y291O2', 'Testnama3', 1, 73, 3, 1, 'Jl. senopati', 3204, 32, '0978546132456', 2, '2023-06-19', 3, 1, 1, 1, 1),
(19, 'B.01/KJRI Penang', 'XE444715', 'Tri Setyowati', 2, 1, 1, 1, 'Dsn. Selokerto Kec. Sempor', 3305, 33, '081327231315', 16, '2023-01-04', 3, 1, NULL, 0, NULL),
(20, 'B. 001/KBRIKuwait', 'C7359496', 'Budiono Supriyadi Wijaya', 1, 191, 7, 3, 'Dsn. Brenggolo Ds. Brenggolo Kec. Ploso Klaten', 3506, 35, '089516180203', 3, '2023-01-04', 3, 1, NULL, 0, NULL),
(21, 'NonBrafaks/Qatar', 'E0164825', 'Rumisi', 2, 199, 8, 3, 'Kp. Sarakan Pisangan jaya Kec. Sepatan', 3603, 36, '082111645254', 16, '2023-01-04', 3, 1, NULL, 0, NULL),
(22, 'KBRI Kuala lumpur/II/202', 'XE414034', 'Munerah', 2, 1, 1, 1, 'Dsn.montong kanggo kec. Montong gading', 5203, 52, '0', 16, '2023-02-03', 3, 3, NULL, 0, 11),
(23, 'NonBrafaks/I/2023', 'C8381793', 'Warih Narilah', 2, 199, 8, 3, 'Ds. Juntinyuat Kec. juntinyuat', 3212, 32, '089633917880', 16, '2023-01-05', 1, 3, NULL, 0, NULL),
(24, 'NonBrafaks/I/2023', 'E0725230', 'Ngamini Siti Rukhaiyah', 2, 189, 7, 3, 'Ds. Kedongdong, Tulakan Kec. Donoharjo', 3320, 33, '082134246178', 16, '2023-01-06', 1, 3, NULL, 0, 1),
(25, 'NonBrafaks/I/2023', 'XE418305', 'Siti Nurhasanah', 2, 1, 1, 1, 'Jl. Tembakau Wringin Telu Kec. Puger', 3509, 35, '081299284723', 16, '2023-01-06', 1, 3, NULL, 0, 1),
(26, 'NonBrafaks/I/2023', 'C7808530', 'Angga Hardianto Tri Utomo', 1, 65, 2, 1, 'Angarengan Ds. Jenggrik Kec. Kedunggalar', 3521, 35, '08585286814', 99, '2023-01-06', 1, 3, NULL, 0, 1),
(27, 'KBRI Yangon/I/2023', 'E0890427', 'Aero Nir Kapisano', 1, 5, 1, 1, 'Jl. Duren No. 11 Kec. Semper', 3172, 31, '081779583906', 99, '2023-01-07', 3, 1, NULL, 0, 1),
(28, 'NonBrafaks/I/2023', 'XE480142', 'Mirawati Bubun Ahmad', 2, 200, 8, 3, 'Cempaka Warna Kec. Cempaka Warna', 3203, 32, '0', 16, '2023-01-07', 3, 1, NULL, 0, NULL),
(29, 'NonBrafaks/I/2023', 'XE480130', 'Ningrum Bt Dimyati', 2, 200, 8, 3, 'Jl. A. YaniKebon Jati Kec. Cikole', 3202, 32, '087712138679', 16, '2023-01-07', 3, 1, NULL, 0, NULL),
(30, 'NonBrafaks/I/2023', 'XE480124', 'Marsiah Emi Yudi', 2, 200, 8, 3, 'Jl. Lio Santa, Cikondang Kec. Citamiang', 3202, 32, '0', 16, '2023-01-07', 3, 1, NULL, 0, NULL),
(31, 'NonBrafaks/I/2023', 'XE480134', 'Ranih Bt Sedur', 2, 200, 8, 3, 'Lemah Duwur Kec. Citamiang', 3215, 32, '0', 16, '2023-01-07', 3, 1, NULL, 0, NULL),
(32, 'NonBrafaks/I/2023', 'XE480111', 'Ersinih Kanijan Rasiya', 2, 200, 8, 3, 'Ds. Saptuan Tegal Sembada Kec. Balongan', 3212, 32, '0', 16, '2023-01-07', 3, 1, NULL, 0, NULL),
(33, 'NonBrafaks/I/2023', 'E0547974', 'Haryati Bt Sarbini Ihong', 2, 189, 7, 3, 'Ds. Ciwale Kec. Warung Kondang', 3203, 32, '0', 99, '2023-01-08', 3, 1, NULL, 0, NULL),
(34, 'NonBrafaks/I/2023', 'C6992393', 'Rukoyah BT Wandi Wahmad', 2, 40, 1, 1, 'Kp. Kebasian Kec. Kasemen', 3604, 36, '087777100714', 16, '2023-01-10', 3, 1, NULL, 0, 1),
(35, 'CPMI', 'E3668521', 'Widodo', 1, 1, 1, 1, 'Dusun Sembatu Rt/Rw. 03/01 Kel. Hilir Kec. Balai, Kab. Sanggau, Kalimantan Barat', 6103, 61, '085885153093', 8, '2023-06-20', 2, 5, 4, 0, 10),
(36, 'CPMI', 'E2975910', 'Ami Bt Aman Sarji', 2, 1, 1, 1, 'Blok Kondang, Rt/Rw. 04/05 Kel. Banjaran, Kec. Sumberjaya, Kab.Majalengka, Jawa Barat', 3210, 32, '082320866453', 8, '2023-06-20', 2, 5, 4, 0, 10),
(37, 'CPMI', 'E3491764', 'Agus Setiawan', 1, 1, 1, 1, 'Dusun Air Duren Rt/Rw. 07/00 Lubuk Lingkuk, Lubuk Besar, Kab. Bangka Tengah, Bangka Belitung', 1904, 19, '082179650103', 8, '2023-06-20', 2, 5, 4, 0, 10),
(38, 'CPMI', 'E1915968', 'Niva Risya Rinzani', 2, 1, 1, 1, 'Dsn. Ancol II Rt/Rw. 016/05 Sindangkasih, Sindangkasih, Kab. Ciamis, Jawa Barat', 3207, 32, '089657293325', 8, '2023-06-20', 2, 5, 4, 0, 10),
(39, 'CPMI', 'C5586481', 'Iis Siti Nurjanah Samsu Muk', 2, 189, 7, 3, 'Jl. Gandamanah Rt/Rw. 01/12 Kel. Tugu Selatan, Kec. Cisarua, Kab. Bogor, Jawa Barat', 3201, 32, '087873127469', 8, '2023-06-20', 2, 5, 4, 0, 10),
(40, 'CPMI', 'E3793907', 'Serli Islamiah Putri', 2, 1, 1, 1, 'Dusun Kertasari Rt/Rw. 011/05 Kel. Mekarjaya, Kec. Cimalaya Wetan, Kab. Karawang, Jawa Barat', 3215, 32, '-', 8, '2023-06-20', 2, 5, 4, 0, 10),
(41, 'CPMI', 'E3793782', 'Santi Ayu Nengsih', 2, 1, 1, 1, 'Trosobo Rt/Rw. 08/02 Kel. Trosobo, Kec.Sambi, Kab. Wonosobo, Jawa Tengah', 3309, 33, '-', 8, '2023-06-20', 2, 5, 4, 0, 10),
(42, 'CPMI', 'E3793781', 'Prihatini', 2, 1, 1, 1, 'Cikarang, Rt/Rw. 01/01 Kel. Cikarang, Kec.Cimalaya Wetan, Kab. Karawang, Jawa Barat', 3215, 32, '-', 8, '2023-06-20', 2, 5, 4, 0, 10),
(43, 'KJRI DUBAI (B-00159/Dubai/230619)', 'E0264746', 'Titim Patimah Bt Jaenudin', 2, 189, 7, 3, 'Kp. Cibaluh Rt/Rw. 08/06 Wanasari, Kel. Surade, Kab. Sukabumi, Jawa Barat', 3202, 32, '081346411068', 16, '2023-06-20', 3, 1, 1, 1, 10),
(44, 'CPMI', 'E3582071', 'Rifqi Musthafa', 1, 200, 8, 3, 'Jl. Malafa III no. 80 Rt/Rw. 04/06 Malaka Sari, Kec. Duren Sawit, Kota Jakarta Timur, DKI Jakarta', 3175, 31, '081380264998', 8, '2023-06-20', 2, 5, 4, 0, 10),
(45, 'NonBrafaks/I/2023', 'C5893616', 'Siti Samsiah', 2, 189, 7, 3, 'Ds. Pangpong Kec. Labang', 3526, 35, '0', 16, '2023-01-10', 3, 1, NULL, 0, NULL),
(46, 'KBRIKualaLumpur/I/2023', 'XE440196', 'Nurul Huda', 2, 1, 1, 1, 'Ds. Sedayu Lawas Kec. Brondong', 3524, 35, '0', 7, '2023-01-10', 3, 1, NULL, 0, NULL),
(47, 'KJRIIstanbul/l/2023', 'X1336123', 'Soniah Bt Samsuri Suirja', 2, 183, 6, 3, 'Ds. Tambi Blok Buyut Kec. Sliyeg', 3212, 32, '0895806710109', 99, '2023-01-11', 3, 1, NULL, 0, NULL),
(48, 'B-00159/DUBAI/230619', 'C5589959', 'MELI RAHMAWATI BT RADEN IYUS', 2, 200, 8, 3, NULL, 3203, 32, NULL, 16, '2023-06-20', 2, 1, 5, 1, 9),
(49, 'KBRIAbudhabi/l/2023', 'B4928944', 'Sunartin Bt Masikin', 2, 200, 8, 3, 'Ds. Klani Kec. Tana Totea', 7271, 72, '0', 16, '2023-01-11', 3, 1, NULL, 0, NULL),
(50, 'B-00159/DUBAI/230619', 'XE456202', 'Senap Prikung Kansah', 2, 200, 8, 3, NULL, 5202, 52, NULL, 16, '2023-06-20', 2, 1, 5, 1, 9),
(51, 'KBRI Abudhabi/l/2023', 'XE480275', 'Mohamed Nizam', 1, 200, 8, 3, 'Ds. Klani Kec. Tana Totea', 7271, 72, '0', 99, '2023-01-11', 3, 4, NULL, 0, 1),
(52, 'B-00159/DUBAI/230619', 'XE456205', 'Imas Masrifah', 2, 200, 8, 3, 'Cianjur, jawa barat', 3203, 32, NULL, 16, '2023-06-20', 2, 1, 4, 1, 9),
(53, 'KDEITaipei/l/2023', 'C7243138', 'Prastiyan', 1, 65, 2, 1, 'Blok Balai Ds. Luwung Kec. Krangkeng', 3212, 32, '0', 99, '2023-01-11', 3, 3, NULL, 0, 1),
(54, 'KBRIManama/I/2023', 'XD807698', 'Rikmah Sakim Saridin', 2, 195, 7, 3, 'Kp. Pacet Ds. Kepandean Kec. Ciruas', 3604, 36, '087837946947', 16, '2023-01-11', 3, 1, NULL, 0, NULL),
(55, 'KBRIMexicoCity/l/2023', 'C8099779', 'Rony Hermanto', 1, 101, 4, 2, 'Perumahan Bumi Waringin Kec. Anyer', 3672, 36, '0', 1, '2023-01-11', 1, 2, NULL, 0, NULL),
(56, 'KBRIKualaLumpur/l/2023', 'C6379593', 'Mauldhy Rauf Julyastian', 1, 1, 1, 1, 'Ds. Sukahaji Kec. Babakan Ciparay', 3204, 32, '0', 99, '2023-01-11', 1, 3, NULL, 0, NULL),
(57, 'NonBrafaks/l/2023', 'C8464948', 'Sanah', 2, 189, 7, 3, 'Hulu Sungai Selatan Kec. Hulu Sungai Selatan', 6371, 63, '0', 16, '2023-01-12', 3, 1, NULL, 0, 1),
(58, 'NonBrafaks/VI/2023', 'C5584209', 'Danisah Bt Damun Erti', 2, 189, 7, 3, 'Dsn. 01 RT. 03/02 Kudumulya Kec. Babakan', 3209, 32, '0', 16, '2023-06-21', 3, 1, 5, 0, 16),
(59, 'KBRI Malaysia', 'C5879326', 'Sumilah', 2, 1, 1, 1, 'Pare, kec. Bumirejo, kab. kediri, jawa Timur', 3506, 35, '-', 16, '2023-06-21', 3, 1, 4, 0, 1),
(60, 'SD.2183/WN/06/2023/04', 'XE424326', 'Iis Sepmawati', 1, 1, 1, 1, 'Tanjung Buntung RT 01/1, Kec. babu Ampal, Kota Batam', 2171, 21, '085836067335', 16, '2023-06-21', 3, 1, 2, 1, 16),
(61, 'SD. 2183/WN/06/2023/04', 'E0693274', 'Dewi Purwanti', 2, 1, 1, 1, 'Dsn. Tanjung Rejo RT 03/03, Kec. cluring, Banyuwangi', 3510, 35, '083117501032', 16, '2023-06-21', 3, 1, 4, 0, 1),
(62, 'B-00373/JEDDAH/230620', 'XD767870', 'Noor Hidayah Sulaiman', 1, 189, 7, 3, 'Jalan Irigasi desa, Tanjung Rema darat, Martapura, Banjar, Kalimantan Selatan', 6303, 63, '0813 8066 6737', 16, '2023-06-21', 3, 1, 6, 1, 16),
(63, 'B-00373/JEDDAH/230620', 'XD767677', 'Lisnawati', 2, 189, 7, 3, 'Kampung Gunung Bulak RT 07 RW 05, Kecamatan Banyuwangi, Kabupaten Serang,Provinsi Banten', 3604, 36, '081324605440', 16, '2023-06-21', 3, 1, 1, 1, 16),
(64, 'B-00373/JEDDAH/230620', 'C2328584', 'Ira Rahayu', 1, 189, 7, 3, 'Kampung Tipar Kelurahan penyusuhan RT 1 RW 1 Kecamatan Sukaluyu Kabupaten Cianjur Provinsi Jawa Barat', 3203, 32, '081563204149', 16, '2023-06-21', 3, 1, 1, 1, 16),
(65, 'Imigrasi kelas 1 khusus Soetta', 'E 4033145', 'Sri Piatin', 2, 74, 3, 1, 'Ds, penangkan rt,06/03', 3325, 33, '082328287836', 8, '2023-06-22', 2, 5, 4, 1, 6),
(66, 'Imigrasi kelas 1khusus Soetta', 'E 3101768', 'Naip Ramdan', 1, 200, 8, 3, 'Ds, buni kasih rt,01/04', 3203, 32, '082123323254', 8, '2023-06-22', 2, 5, 4, 1, 6),
(67, 'Imigragi kelas 1 khusus Soetta', 'E 3000979', 'Cecillia Angelline Marcus', 2, 1, 1, 1, 'Jln, nurul huda 99 Taruna', 6112, 61, '0895388200007', 8, '2023-06-22', 2, 5, 4, 1, 6),
(68, 'Imigrasi kelas 1 khusus Soetta', 'E 1869308', 'Yeni Yuliani', 2, 1, 1, 1, 'Ds, ciparay rt, 11/06', 3215, 32, '08159881411', 8, '2023-06-22', 2, 5, 4, 1, 6),
(69, 'Imigrasi kelas 1 khusus Soetta', 'E 3449460', 'Sadiah', 2, 1, 1, 1, 'Kp, pasir maja renget rt, 10/03', 3603, 36, '082123329725', 8, '2023-06-22', 2, 5, 4, 1, 6),
(70, 'Imigrasi kelas 1 khusus Soetta', 'E 0705374', 'Sumarji Jayadi', 1, 2, 1, 1, 'Ds, sepuk tanjung rt, 07/02', 6101, 61, '081345498816', 8, '2023-06-22', 2, 5, 4, 1, 6),
(71, 'Imigrasi kelas 1 khusus Soetta', 'E 2616786', 'Yudi Aspani', 1, 2, 1, 1, 'Ds, tebas sungai rt, 11/06', 6101, 61, '60176749572', 8, '2023-06-22', 2, 5, 4, 1, 6),
(72, 'Imigrasi kelas 1 khusus Soetta', 'E 3634408', 'Yatim', 1, 2, 1, 1, 'Ds,sarang burung rt,13/07', 6101, 61, '085822942253', 8, '2023-06-22', 2, 5, 4, 1, 6),
(73, 'Imigrasi kelas 1 khusus Soetta', 'E 3312447', 'Jeri Suratman Ambri Soni', 1, 2, 1, 1, 'Ds,setembang utara rt,05/02', 6101, 61, '081255527072', 8, '2023-06-22', 2, 5, 4, 1, 6),
(74, 'Imigrasi kelas 1 khusus Soetta', 'C 5161035', 'Elias Gama', 1, 2, 1, 1, 'Ds, pulau manak rt,01/00', 6106, 61, '081351511168', 8, '2023-06-22', 2, 5, 4, 1, 6),
(75, 'Imigrasi kelas 1 khusus Soetta', 'E 3634459', 'Wahab', 1, 2, 1, 1, 'Ds, kuala baru rt,15/07', 6101, 61, '081256304441', 8, '2023-06-22', 2, 5, 4, 1, 6),
(76, 'Imigrasi kelas 1 khusus Soetta', 'C 6796495', 'Ibnu Jarni', 1, 2, 1, 1, 'Ds,penjajap rt05/08', 6101, 61, '083847874744', 8, '2023-06-22', 2, 5, 4, 1, 6),
(77, 'Imigrasi kelas 1 khusus Soetta', 'E 3460922', 'Kartono Yusuf', 1, 2, 1, 1, 'Dsn,sepuk sungai rt, 12/03', 6101, 61, '08235217071', 8, '2023-06-22', 2, 5, 4, 1, 6),
(78, 'Imigrasi kelas 1 khusus Soetta', 'E 3347914', 'Dede Evan Maulana', 1, 200, 8, 3, 'Ds, buni asih rt,04/01', 3202, 32, '085624742471', 8, '2023-06-22', 2, 5, 4, 1, 6),
(79, 'Imigrasi kelas 1 khusus Soetta', 'E 3347916', 'Hengky Purnama', 1, 200, 8, 3, 'Ds,buni asih rt,04/01', 3202, 32, '0816773525', 8, '2023-06-22', 2, 5, 4, 1, 6),
(80, 'Imigrasi kelas 1 khusus Soetta', 'E 3347915', 'Muhammad Hamid Jabbar', 1, 200, 8, 3, 'Ds, buni asih rt,04/01', 3202, 32, '081365518052', 8, '2023-06-22', 2, 5, 4, 1, 6),
(81, 'Non Brafak', 'E0875873', 'Ismawati BT Iskandar Yojodolo', 2, 189, 7, 3, 'Ds. Jono Oge RT 02/05 Kec. Sigi Biromaru', 7210, 72, NULL, 16, '2023-06-22', 3, 1, 4, 1, 3),
(83, 'SD.2240/WN/06/2023/04', 'C9773300', 'Zuliana Farida', 2, 1, 1, 1, 'Ds. Rondeng RT 03/03 Kec. Kota Kudus', 3319, 33, '088983309154', 16, '2023-06-22', 3, 1, 5, 1, 3),
(84, 'Imigrasi kelas 1 khusus Soetta', 'E 0322413', 'Naiman', 1, 200, 8, 3, 'Dsn, karang langko rt,02/00', 5201, 52, '082133443218', 8, '2023-06-23', 2, 5, 4, 1, 6),
(85, 'Imigrasi kelas 1 khusus Soetta', 'E 0322534', 'Aripudin', 1, 200, 8, 3, 'Ds, babusalam', 5201, 52, '087841121607', 8, '2023-06-22', 2, 5, 4, 1, 6),
(86, 'Imigrasi kelas 1 khusus Soetta', 'E 0237900', 'Sabastian Josua', 1, 1, 1, 1, 'Jl, tanah tinggi rt09/06', 3171, 31, '081293074214', 8, '2023-06-23', 2, 5, 4, 1, 6),
(87, 'Imigrasi kelas 1 khusus Soetta', 'C 3669784', 'Eva Wulandari', 2, 1, 1, 1, 'Kp, asem rt,07/06', 3173, 31, '082213111919', 8, '2023-06-23', 2, 5, 4, 1, 6),
(88, 'CPMI', 'E3652620', 'Putri Pertiwi', 2, 2, 1, 1, 'Jl. Jelambar Timur RT/RW. 12/09 Jelambar Baru, Grogol Petamburan, Jakarta Barat, DKI Jakarta', 3173, 31, '-', 8, '2023-06-23', 2, 5, 4, 1, 10),
(89, 'CPMI', 'E2551830', 'Herri Sanputra', 1, 2, 1, 1, 'Benteng, Pangkalan Baru, Bangka Tengah, Kep. Bangka Belitung', 1904, 19, '087895196670', 8, '2023-06-23', 2, 5, 4, 1, 10),
(90, 'CPMI', 'E2551826', 'Aryo Binalzhary', 1, 2, 1, 1, 'Jl. Air Mawar RT/RW. 01/01 Air Mawar, Bukit Intan, Pangkal Pinang, Kep. Bangka Belitung', 1971, 19, '083179137545', 8, '2023-06-23', 2, 5, 4, 1, 10),
(91, 'CPMI', 'E3652628', 'Eko Projo Sunjaya', 1, 2, 1, 1, 'Jl. Jelambar Timur Rt/Rw. 012/09, Jelambar Baru, Grogol Petamburan, Jakarta Barat, DKI Jakarta Barat', 3173, 31, '-', 8, '2023-06-23', 2, 5, 4, 1, 10),
(92, 'CPMI', 'E3520398', 'Miftahul Jannah', 2, 200, 8, 3, 'Dusun Ujung Rt/Rw. 01/01 Pattiro Deceng, Camba, Maros, Sulawesi Selatan', 7309, 73, '08999230299', 8, '2023-06-23', 2, 5, 4, 1, 10),
(93, 'CPMI', 'E2469721', 'Anggoro Budi Santoso', 1, 200, 8, 3, 'Kp. Sumur Bandung Rt/Rw. 01/09 Citepus, Pelabuhan Ratu, Sukabumi, Jawa Barat', 3202, 32, '081386981351', 8, '2023-06-23', 2, 5, 4, 1, 10),
(94, 'KBRI Damascus/II/2023', 'B3521028', 'Ecin Muhamad', 2, 207, 8, 3, 'Kp. Bojong Sari , Sukasari Kec.Puspahiang Kab.Tasikmalaya', 3206, 32, '085294477479', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(95, 'KBRI Damascus/II/2023', 'C3195738', 'Murtiah Bt Markum', 2, 207, 8, 3, 'Kp. Bulu Agung Kec. Silir Agung', 3510, 35, '085890509891', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(96, 'KBRI Manama/II/2023', 'C8529991', 'Wawan Ramdan', 1, 195, 7, 3, 'Ds.Karang Sidemen Kec. Batu Kliang', 5202, 52, '082145428071', 13, '2023-02-01', 3, 1, NULL, 0, 11),
(97, 'KBRI Damascus/II/2023', 'B84033108', 'Kobro Giarti Munjari', 2, 207, 8, 3, 'DS. Sedayu Kec. Gemuh', 3324, 33, '087725117896', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(98, 'KBRI Damascus/II/2023', 'AB966921', 'Wiwi Rohayati', 2, 207, 8, 3, 'DS. Bojong Kec. Rongga', 3204, 32, '08320572436', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(99, 'KBRI Damascus/II/2023', 'C2351761', 'Susani Taryono Dasijan', 2, 207, 8, 3, 'DS. Sambi Maya Kec. Juntinyuat', 3212, 32, '081904026973', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(100, 'KBRI Damascus/II/2023', 'C4477900', 'Astuti Bt Payuk Rohim', 2, 207, 8, 3, 'DS. mama', 5204, 52, '082236380368', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(101, 'CPMI', 'E3817411', 'Wahyu Pranata', 1, 1, 1, 1, 'Tanjung Harapan Rt/Rw. 02/02 Cabang Empat, Abung Selatan, Lampung Utara, Lampung', 1803, 18, '085789410288', 8, '2023-06-23', 2, 5, 4, 1, 10),
(102, 'Non-Brafak', 'XE455868', 'Atun Bt Sahri Radiah', 2, 200, 8, 3, 'Belunsuk RT.01 Kuripan Timur, Kuripan, Lombok Barat, Nusa Tenggara Barat', 5201, 52, '081915693673', 16, '2023-06-23', 3, 1, 2, 1, 1),
(103, 'NonBrafaks/VI/2023', 'XE428733', 'Mohd Sodik', 1, 1, 1, 1, 'Ds. Sumber Nangka Kec. Arjasa', 3529, 35, '0', 3, '2023-06-23', 3, 1, 4, 1, 1),
(104, 'NonBrafaks/VI/2023', 'B998329', 'Satuni', 2, 1, 1, 1, 'Kp. Baru Maselima Masalembu Kec. Masalembu', 3529, 35, '0', 5, '2023-06-23', 3, 1, 4, 1, 1),
(105, 'SD.2270/WN/06/2023/04', 'XE430640', 'Butia', 2, 1, 1, 1, 'Pamekasan', 3578, 35, NULL, 16, '2023-06-23', 3, 1, 4, 0, 1),
(106, 'SD.2270/WN/06/2023/04', 'E2298869', 'Uun Kurniasih', 2, 1, 1, 1, 'Pangandaran', 3218, 32, NULL, 16, '2023-06-23', 3, 1, 1, 1, 9),
(107, 'SD.2270/WN/06/2023/04', 'E1692468', 'Yeni Apriyani', 2, 1, 1, 1, 'Palembang', 1671, 16, NULL, 16, '2023-06-23', 3, 1, 4, 1, 1),
(109, 'B-00208/khartoum/230620', 'C7659507', 'Wati Bt Sadiwirya', 2, 1, 1, 1, NULL, 3301, 33, NULL, 16, '2023-06-23', 3, 1, 1, 1, 9),
(110, 'B-00208/khartoum/230620', 'XE227939', 'Yeti Bt Jameh Hasan', 2, 55, 1, 1, NULL, 3603, 36, NULL, 16, '2023-06-23', 3, 1, 1, 1, 9),
(111, 'B-00208/khartoum/230620', 'C7659611', 'Rasiti Bt Taswirja Bin Salip', 2, 55, 1, 1, NULL, 3301, 33, NULL, 16, '2023-06-23', 2, 1, 5, 1, 9),
(112, 'sd.2270/wn/2023/04', 'XE430792', 'Sulimah', 2, 55, 1, 1, 'Dsn. tasikmadu rt. 3/4 talang jawa, merbau mataram', 1801, 18, NULL, 16, '2023-06-23', 1, 1, 3, 1, 9),
(113, 'SD.2270/WN/06/2023/04', 'XE425624', 'Andriyani', 2, 1, 1, 1, NULL, 3215, 32, NULL, 16, '2023-06-23', 2, 1, 5, 1, 9),
(114, 'CPMI', 'E3449733', 'Murti', 2, 200, 8, 3, 'Kp. Bendung Pintu Rt/Rw. 013/03 Carenang, Carenang, Kab. Serang, Banten', 3604, 36, '085716627417', 8, '2023-06-23', 2, 5, 4, 1, 10),
(115, 'CPMI', 'E3449734', 'Salkamah Saleh Syiaki', 2, 200, 8, 3, 'Kp. Bendung Pintu Rt/Rw. 07/02 Carenang, Carenang, Kab. Serang, Banten', 3604, 36, '085716627417', 8, '2023-06-23', 2, 5, 4, 1, 10),
(116, 'CPMI', 'E2768721', 'Sofia Wihanda', 2, 195, 7, 3, 'Ds. Cikijing Rt/Rw. 27/06 Sindangsari, Cimerak, Pangandaran, Jawa Barat', 3218, 32, '085797566763', 8, '2023-06-23', 2, 5, 4, 1, 10),
(117, 'CPMI', 'C8368211', 'Ating Bt Tohari Idip', 2, 198, 8, 3, 'Kp. Cintaasih Rt/Rw. 05/02 Ciroyom, Bojong Gambir, Tasikmalaya, Jawa Barat', 3206, 32, '082130067797', 8, '2023-06-23', 2, 5, 4, 1, 10),
(118, 'CPMI', 'C8103750', 'Wahyudin', 1, 1, 1, 1, 'Jl. Warakas I GG 5 B No. 6 Rt/Rw. 02/01 Warakas, Tanjung Priok, Jakarta Utara, DKI Jakarta', 3172, 31, '085219484857', 8, '2023-06-23', 2, 5, 4, 1, 10),
(119, 'CPMI', 'E1406475', 'Nanta Hari Prayitno', 1, 200, 8, 3, 'Jl. Progo No. 58 Rt/Rw. 02/09 Kel. Donan, Cilacap Tengah, Cilacap, Jawa Tengah', 3301, 33, '089666714935', 8, '2023-06-23', 2, 5, 4, 1, 10),
(120, 'CPMI', 'E2331726', 'Irgi Maulana', 1, 200, 8, 3, 'Blok Jum\'at, Rt/Rw. 03/09 Panjalin Kidul, Sumber Jaya, Majalengka, Jawa Barat', 3210, 32, '085224213363', 8, '2023-06-23', 2, 5, 4, 1, 10),
(121, 'CPMI', 'C9467773', 'Aldin Sageri', 1, 200, 8, 3, 'Jl. Ciraden GG H Rojak Rt/RW. 08/03 Cisaat, Cisaat, Sukabumi, Jawa Barat', 3202, 32, '0895622022675', 8, '2023-06-23', 2, 5, 4, 1, 10),
(122, 'CPMI', 'E0163261', 'Rosdiana Bt Rozak Arnan', 2, 200, 8, 3, 'Jl. Kali Baru Timur Rt/Rw. 17/03 Kalibaru, Cilincing, Jakarta Utara, DKI Jakarta', 3172, 31, '081212848978', 8, '2023-06-23', 2, 5, 4, 1, 10),
(123, 'Non Brafak', 'C9464551', 'Sumiati', 2, 33, 1, 1, 'Desa Berare RT 012/004 Kel. Berare Kec. Moyohilir', 5204, 52, NULL, 16, '2023-06-24', 3, 1, 2, 1, 3),
(124, 'Imigrasi kelas 1 khusus soetta', 'C9644884', 'Listin Setiani', 2, 1, 1, 1, 'Kupang', 5301, 53, '081237462180', 8, '2023-06-25', 2, 5, 4, 1, 8),
(125, 'Kantor Imigrasi Kelas 1 Soetta', 'C9644877', 'Yustisia Ibnu Saud', 2, 1, 1, 1, 'Alak kupang', 5301, 53, '085792375683', 8, '2023-06-25', 2, 5, 4, 1, 8),
(126, 'kantor imigrasi kelas 1 khusus soetta', 'E1979024', 'Tri Wahyuni Lestari', 2, 1, 1, 1, 'Banyumas', 3302, 33, '083844664367', 8, '2023-06-25', 2, 5, 4, 1, 8),
(127, 'draf', 'C8417354', 'Khoiruyah', 2, 65, 2, 1, 'Dsn, Kauman kec,kalipare', 3578, 35, '088126266108', 16, '2023-06-25', 2, 3, 4, 1, 8),
(128, 'CPMI', 'E3495398', 'Salsa Amanda Putri', 2, 67, 2, 1, 'Pabuaran Tumpeng Rt/Rw. 04/01 Pabuaran Tumpeng, Karawaci, Kota Tangerang, Banten', 3671, 36, '089626042234', 8, '2023-06-26', 2, 5, 4, 1, 10),
(129, 'CPMI', 'E3494871', 'Selvi Setiowati', 2, 67, 2, 1, 'Laban Bulan Rt/Rw. 03/08 Margasari, Karawaci, Kota Tangerang, Banten', 3603, 36, '085772889504', 8, '2023-06-26', 2, 5, 4, 1, 10),
(130, 'CPMI', 'E3494880', 'Sakilah Azahra', 2, 67, 2, 1, 'Buaran Kandang Besar Rt/Rw. 01/06 Babakan, Tangerang, Kota Tangerang, Banten', 3671, 36, '089603021435', 8, '2023-06-26', 2, 5, 4, 1, 10),
(131, 'BP3MI Riau', 'XE464688', 'Dani', 1, 1, 1, 1, 'Dusun Pembuwun, Buwun Sejati, Narmada, Kab. Lombok Barat, Nusa Tenggara Barat', 5201, 52, '087816671897', 99, '2023-06-26', 3, 1, 4, 0, 1),
(132, 'BP3MI RIAU', 'XE464675', 'Syamsul Rijal Rahin', 1, 1, 1, 1, 'Nangke Leot Rt/Rw.01 Barabali, Batuki Liang, Lombok Tengah, NTB', 5202, 52, '087858562374', 99, '2023-06-26', 3, 1, 4, 0, 1),
(133, 'BP3MI Riau', 'XE464895', 'Sarimah', 1, 1, 1, 1, 'Pembuwun, Buwun Sejati, Narmada, Lombok Barat, NTB', 5201, 52, '-', 99, '2023-06-26', 3, 1, 4, 0, 1),
(134, 'BP3MI Riau', 'XE464574', 'Azis', 1, 1, 1, 1, 'Kp. Bahagia, Desa Nendang Nangka, Masbage, Lombok Timur, NTB', 5203, 52, '087775022888', 99, '2023-06-26', 3, 1, 4, 0, 1),
(135, 'NonBrafaks/I/2023', 'C9754947', 'Suhaeni', 2, 189, 7, 3, 'Jl. Muara Baru Penjaringan Kec. Penjaringan', 3172, 31, '087879338123', 16, '2023-01-12', 3, 1, NULL, 0, 1),
(136, 'NonBrafaks/I/2023', 'XE023170', 'Siti Hawa Bt Muhamad Nur', 2, 189, 7, 3, 'Ds. Nahram Kec. Mande', 5206, 52, '0', 16, '2023-01-12', 3, 1, NULL, 0, 1),
(137, 'KBRI Riyadh/I/2023', 'C3479952', 'Madroji Bin Dahlan', 1, 189, 7, 3, 'Ds. Rawa Gempo Kec. Cimalaya Wetan', 3215, 32, '085719398326', 99, '2023-01-12', 1, 3, NULL, 0, 1),
(138, 'KDEI Taipei/I/2023', 'C8295123', 'Sunarsih', 2, 65, 2, 1, 'Gebal Kulon Ds. Canan Kec. Wedi', 3310, 33, '0', 4, '2023-01-13', 1, 3, NULL, 0, NULL),
(139, 'NonBrafaks/I/2023', 'C4045233', 'Nurul', 2, 189, 7, 3, 'Selak Aik Bawak Kec. Batu Kliang', 5202, 52, '087757337447', 16, '2023-01-14', 3, 1, NULL, 0, NULL),
(140, 'KBRI Abuja/I/2023', 'B7635446', 'Djadi Utomo', 1, 32, 1, 1, 'Ds. Sugi Waras Kec. Saradan', 3519, 35, '081234958352', 99, '2023-01-14', 3, 1, NULL, 0, NULL),
(141, 'KBRI Abuja/I/2023', 'C7874438', 'Heri Puryanto', 1, 32, 1, 1, 'Dsn. Karang Tengah Pulosari Kec. Ngunut', 3504, 35, '081288534753', 99, '2023-01-14', 3, 1, NULL, 0, NULL),
(142, 'KBRI Abuja/I/2023', 'C7093486', 'Indayati', 2, 32, 1, 1, 'Dsn. Karang Tengah Pulosari Kec. Ngunut', 3504, 35, '081288534753', 99, '2023-01-14', 3, 1, NULL, 0, NULL),
(143, 'KBRI Suriah/II/2023', 'C0464169', 'Zulfiani Bt Ibrahim', 2, 207, 8, 3, 'Dsn. Bater Kec. Luar Alas', 5204, 52, '087863782995', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(144, 'KBRI Maputo/I/2023', 'C8100439', 'Muhamad Furqon', 1, 41, 1, 1, 'Ds. Setia Budi Kec. Palimanan', 3209, 32, '0853500001117', 1, '2023-01-15', 1, 2, NULL, 0, 1),
(145, 'KBRI Maputo/I/2023', 'C5789257', 'Putut Edi Listianto', 1, 41, 1, 1, 'Ds. Karang Mangu Kec. Batu Raden', 3302, 33, '089519998505', 1, '2023-01-15', 1, 2, NULL, 0, 1),
(146, 'NonBrafaks/I/2023', 'C8468302', 'Inah', 2, 200, 8, 3, 'Ds. Barejulat Kec. Jonggat', 5202, 52, '0', 16, '2023-01-16', 3, 1, NULL, 0, NULL),
(147, 'KBRI Manama/I/2023', 'C7447587', 'Resti Nomayanti Bt Muslim', 2, 195, 7, 3, 'Kp. Pakalongan Ds. Padaluyu Kec. Cugenang', 3203, 32, '085647599224', 16, '2023-01-16', 3, 1, NULL, 0, NULL),
(148, 'KBRI Riyadh/I/2023', 'C6067451', 'Rahma Iksan Darahi', 2, 189, 7, 3, 'Ds. Risa Kec. Woha', 5206, 52, '082342228521', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(149, 'NonBrafaks/I/2023', 'XE481885', 'Ohan Jaharia', 2, 199, 8, 3, 'Dsn. Lemar Uyen Moteng Kec. Brang Rea', 5207, 52, '085338529940', 16, '2023-01-17', 3, 1, NULL, 0, 1),
(150, 'NonBrafaks/I/2023', 'XE480194', 'Fatimah Binti Sari', 2, 200, 8, 3, 'Lubuk Begalung Kec. Lubuk Begalung', 1371, 13, '08384463571', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(151, 'KBRI Riyadh/I/2023', 'C9064655', 'Ani Bt Ending Idris', 2, 189, 7, 3, 'Ds. Kertarahayu Kec. Cibuaya', 3215, 32, '085771058110', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(152, 'KBRI Riyadh/I/2023', 'C7413130', 'Siti Hodijah Hasan', 2, 189, 7, 3, 'Ds. Kutamaneuh Kec. Tegal Waru', 3215, 32, '085773233643', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(153, 'KBRI Suriah/II/2023', 'S922134', 'Jubaedah Bt Ibrahim', 2, 207, 8, 3, 'Padalarang, Serang', 3604, 36, NULL, 16, '2023-02-01', 3, 1, NULL, 0, 11),
(154, 'CPMI', 'E3380325', 'Panji Ichsanul Amal', 1, 1, 1, 1, 'Jl. Selat Halmahera 3 Blok A2 no. 3 Rt/Rw. 04/01 Mekarsari, Bekasi, Jawa Barat', 3216, 32, '-', 8, '2023-06-26', 2, 5, 4, 1, 10),
(155, 'KBRI Suriah/II/2023', 'C0668786', 'Nurhasanah Bt Supaah', 2, 207, 8, 3, 'DS. Karang Baru, kec. Montang', 5203, 52, '082340181022', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(156, 'KBRI Suriah/II/2023', 'C8395245', 'Ros Hasanah Bt M Nasir', 2, 207, 8, 3, 'Jl. Pertanian Link, Selagalas Kec. Sandubaya', 5271, 52, '087857378272', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(157, 'KBRI Suriah/II/2023', 'C9754734', 'Maemunah Mansur Saleh', 2, 207, 8, 3, 'Kp.Klebet kec. Kemiri', 3671, 36, '0851717879671', 16, '2023-02-01', 3, 1, NULL, 0, 11),
(158, 'KBRI Baghdad/II/2023', 'C7897701', 'Maria', 2, 191, 7, 3, 'DS. Pemenang Timur Kec. Pemenang', 5208, 52, '081803165473', 16, '2023-02-03', 3, 1, NULL, 0, 11),
(159, 'SBMI Pontianak/II/2023', 'XE481357', 'Febby Reyviendo', 1, 10, 1, 1, 'Jl. aji Melayu ds. Kapuas kec. sintang', 6105, 61, '081257528882', 17, '2023-02-03', 3, 1, NULL, 0, 11),
(160, 'KBRI Kuala Lumpur/II/2023', 'XE402761', 'Hengki Fernando', 1, 1, 1, 1, 'Jl. sagatani', 6172, 61, '088245411459', 99, '2023-02-03', 3, 1, NULL, 0, 11),
(161, 'KBRI Kuala Lumpur/II/2023', 'C8939098', 'Wartini', 2, 1, 1, 1, 'Jl. Kapten Samadika Kec. Kejaksaan', 3209, 32, '0', 16, '2023-02-03', 3, 1, NULL, 0, 11),
(162, 'KBRI Riyadh/I/2023', 'C5068455', 'Imas Ayub Marya', 2, 189, 7, 3, 'Ds. Sindang Jaya Kec. Gunung Halu', 3204, 32, '0881011951140', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(163, 'KBRI Bandar Seribegawan/II/2023', 'C0835310', 'Suhartini', 2, 3, 1, 1, 'Dsn. langkot laut kec. Lingsar', 5201, 52, '08738816771', 16, '2023-02-04', 3, 1, NULL, 0, 11),
(164, 'KBRI Riyadh/I/2023', 'AS979554', 'Rita Rosita Bt Rosid', 2, 189, 7, 3, 'Ds. Cibalado Kec. Klari', 3215, 32, '085716360486', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(165, 'KBRI Riyadh/II/2023', 'XE022781', 'Suriani Bt Ramdan', 2, 189, 7, 3, 'DS.Loang Maka Kec. Janapria', 5202, 52, '08190301131', 16, '2023-02-08', 3, 1, NULL, 0, 11),
(166, 'KBRI Riyadh/II/2023', 'XE022810', 'Dita Yuliana Bt Safardi', 2, 189, 7, 3, 'DS. Poh Gading Kec.Pringgabaya', 5203, 52, '085967153401', 16, '2023-02-08', 3, 1, NULL, 0, 11),
(167, 'KBRI Riyadh/I/2023', 'XE023046', 'Susan Widiyanti', 2, 189, 7, 3, 'Jl. Masjid Al Akbar Kec. Cipayung', 3175, 31, '089512429098', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(168, 'CPMI', 'E3407230', 'Casmi', 2, 2, 1, 1, 'Perum PDP Blok 3/8 Rt/Rw. 04/09 Rengas Dengkok Utara, Rengas Dengklok, Karawang, Jawa Barat', 3215, 32, '083829971389', 8, '2023-06-26', 2, 5, 4, 1, 10),
(169, 'CPMI', 'E2391741', 'Erik Erlangga', 1, 1, 1, 1, 'Jl. Serdam Ceria 8 No. B.10 Rt/Rw. 05/01 Sungai Raya Dalam, Sungai Raya, Kubu Raya, Kalimantan Barat', 6112, 61, '085941389527', 8, '2023-06-26', 2, 5, 4, 1, 10),
(170, 'CPMI', 'C4552080', 'Veronika Lyanarta', 2, 1, 1, 1, 'Jl. Trans Kalimantan Desa Ampera Raya Rt/Rw. 02/06 Sungai Ambawang Kuala, Kubu Raya, Kalimantan Barat', 6112, 61, '089524655208', 8, '2023-06-26', 2, 5, 4, 1, 10),
(171, 'CPMI', 'E3504323', 'Yuswanto', 1, 1, 1, 1, 'Dusun Langkat Rt/Rw. 02/03 Melati II, Perbaungan, Serdang Berdagai, Sumatera Utara', 1218, 12, '081283013123', 8, '2023-06-26', 2, 5, 4, 1, 10),
(172, 'CPMI', 'E3606458', 'Rokayah Bt Idris Tompo', 2, 5, 1, 1, 'Sawah Baru Rt/Rw. 02/07 Jati Baru, Jati Sari, Kab. Karawang, Jawa Barat', 3215, 32, '083894919497', 8, '2023-06-26', 2, 5, 4, 1, 10),
(173, 'BP3MI JAWA BARAT (B.1947/BP3MI12/PB.05.03/VI/2023', '-', 'Riedel Daniel Rumampok', 1, 65, 2, 1, 'Sawangan, Kombi, Kab. Minahasan, Sulawesi Utara', 7106, 71, '085882585437', 1, '2023-06-26', 2, 1, NULL, 0, 10),
(174, 'BP3MI RIAU (B.1947/BP3MI12/PB.05.03/VI/2023)', '\'-', 'Rofli Delfi Siregar', 1, 73, 3, 1, 'Jaga II Rt/Rw. 00 Desa Palaes, Likupang Barat, Minahasan Utara, Sulawesi Utara', 7106, 71, '085210381535', 1, '2023-06-26', 2, 1, NULL, 0, 10),
(175, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0576997', 'Jailani Ahmad', 1, 9, 1, 1, 'Jl. Jamin Ginting LK II, Rambung Dalam,Binjai Selatan, Binjai, Sumatera Utara', 1275, 12, '083145880327', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(176, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0576996', 'Andika Pratama', 1, 9, 1, 1, 'Jl. Bengkalis No. 19 LK II, Rambung Dalam, Binjai Selatan, Binjai, Sumatera Utara', 1275, 12, '082367709242', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(177, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0576998', 'Maulana Pinem', 1, 9, 1, 1, 'Jl. Kemuning LK II, Jati Makmur, Binjai Utara, Binjai, Sumatera Utara', 1275, 12, '081397167770', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(178, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0295513', 'Aji Reda Saputra', 1, 9, 1, 1, 'Dusun Tempurejo Rt/Rw. 02/03 Sidorejo, Purwoharjo, Banyuwangi, Jawa Timur', 3510, 35, '88123065706', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(179, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0297782', 'Bagus Purnomo', 1, 9, 1, 1, 'Dusun Kotta Blates Rt/Rw. 04/17 Curahnongko, Tempurejo, Jember, Jawa Timur', 3509, 35, '081252758296', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(180, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'C9988389', 'Zulfa Ramdanhi', 2, 9, 1, 1, 'Dusun Krajan Rt/Rw. 03/16 Ambulu, Ambulu, Jember, Jawa Timur', 3509, 35, '082336796785', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(181, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0905317', 'Ahmad Sugiantoro', 1, 9, 1, 1, 'Dusun Krajan Kulon Rt/Rw. 04/12 Wonosobo, Sroni, Banyuwangi, Jawa Timur', 3510, 35, '087756780627', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(182, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0295735', 'Muhammad Tegar Adi Saputra', 1, 9, 1, 1, 'Dusun Cempokosari Rt/Rw. 04/02 Sarimulyo, Cluring, Banyuwangi, Jawa Timur', 3510, 35, '088991276312', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(183, 'MYANMAR (BRAFAK DARI KEMENTERIAN LUAR NEGERI : 11394/PK/06/2023/66)', 'E0905315', 'Muhammad Nur Ilyas', 1, 9, 1, 1, 'Dusun Krajan Kulon Rt/Rw. 04/12 Wonosobo, Srono, Banyuwangi, Jawa Timur', 3510, 35, '0859392724747', 99, '2023-06-26', 2, 1, NULL, 0, 10),
(184, 'CPMI', 'E1413837', 'Maswati Bt Eman Atang', 2, 183, 6, 3, 'Kp. Anjarsari Rt/Rw. 03/06 Anjarsari, Anjarsari, Kab. Bandung, Jawa Barat', 3204, 32, '082120412606', 8, '2023-06-26', 2, 5, 4, 1, 10),
(185, 'CPMI', 'C5044095', 'Lilik Malikha Bt Satori', 2, 183, 6, 3, 'Blok I Pesantren Rt/Rw. 03/02 Gintingranjeng, Ciwaningin, Kab. Cirebon, Jawa Barat', 3209, 32, '081312401581', 8, '2023-06-26', 2, 5, 4, 1, 10),
(186, 'CPMI', 'E0390500', 'Dede Krisdiana', 2, 10, 1, 1, 'Ds. Cisarua, Cikole, Sukabumi, Jawa Barat', 3272, 32, '085872093576', 8, '2023-06-26', 2, 5, 4, 1, 10),
(187, 'CPMI', 'E3404115', 'Andryan Oktavianus', 1, 10, 1, 1, 'Jl. Pondok Tuas Rt/Rw. 07/02 Ds. Pinang Sia, Taman Sari, Jakarta Barat, DKI Jakarta', 3173, 31, '081213174965', 8, '2023-06-26', 2, 5, 4, 1, 10),
(188, 'CPMI', 'E3354730', 'Aditya Subagja', 1, 10, 1, 1, 'Jl. Kapuk Muara, Rt/Rw. 01/05 Kapuk Muara, Penjaringan, Jakarta Utara, DKI Jakarta', 3172, 31, '0816871635', 8, '2023-06-26', 2, 5, 4, 1, 10),
(189, 'CPMI', 'E3504284', 'Ramadanu Seto', 1, 1, 1, 1, 'Dusun II, Pematanki Pelintahan, Sei Rampah, Kab. Serdang Berdagai, Sumatera Utara', 1218, 12, '082374016943', 8, '2023-06-26', 2, 5, 4, 1, 10),
(190, 'CPMI', 'E2866349', 'Andolin Sibuea', 1, 1, 1, 1, 'Ds. Sei Putih Timur I, Medan Petisah, Medan, Sumatera Utara', 1271, 12, '081269360190', 8, '2023-06-26', 2, 5, 4, 1, 10),
(191, 'CPMI', 'E3579061', 'Wantinah Sari', 2, 2, 1, 1, 'Dusun Bojong Sangkem, Rt/Rw. 05/02 Bojong Tengah, Pusaka Jaya, Kab. Subang, Jawa Barat', 3213, 32, '081389206637', 8, '2023-06-26', 2, 5, 4, 1, 10),
(192, 'CPMI', 'E4063064', 'Rohali', 1, 1, 1, 1, 'Kp. Klitok Rt/Rw. 04/01 Ds. Klutuk, Melear Para, Tangerang, Banten', 3603, 36, '08561441884', 8, '2023-06-26', 2, 5, 4, 1, 10),
(193, 'CPMI', 'E3408296', 'Pandu Tri Bagus', 1, 1, 1, 1, 'Pondok Alam Permai Blok K3 no. 10 Rt/Rw. 06/04 Gembor, Periuk, Kota Tangerang, Banten', 3671, 36, '085602789814', 8, '2023-06-26', 2, 5, 4, 1, 10),
(194, 'CPMI', 'E3877347', 'Muhammad Ali', 1, 1, 1, 1, 'Kp. Pamoyanan, Rt/Rw. 014/05 Padajaya, Jampang Kulon, Kab. Sukabumi, Jawa Barat', 3202, 32, '085217981706', 8, '2023-06-27', 2, 5, 4, 1, 10),
(195, 'KBRI Kuala Lumpur/II/2023', 'XE421286', 'Liya', 2, 1, 1, 1, 'DS. Telaga sari kec. Sindang barat', 3203, 32, NULL, 99, '2023-02-10', 3, 1, NULL, 0, 11),
(196, 'KBRI Kuala lumpur/II/2023', 'XE421535', 'Yosita Anggrina Tupu', 2, 1, 1, 1, 'DS. watumbaka kec. pendawai', 5311, 53, '081231118206', 6, '2023-02-10', 3, 1, NULL, 0, 11),
(197, 'KBRI Kuala lumpur/II/2023', 'XE421295', 'Astutik', 2, 1, 1, 1, 'DS.payaman kec. solokuro', 3524, 35, '085641006827', 99, '2023-02-10', 3, 1, NULL, 0, 11),
(198, 'KBRI Riyadh/II/2023', 'XE023018', 'Yasmi Bt Nakiran', 2, 189, 7, 3, 'DS.Jipang Kec. Penawangan', 3315, 33, '085328064662', 16, '2023-02-10', 3, 1, NULL, 0, 11),
(199, 'KBRI Kuala lumpur/II/2023', 'C8382710', 'Nelis Pristina', 2, 1, 1, 1, 'Dsn. Cihideung kec. padaherang', 3218, 32, '082216571975', 16, '2023-02-10', 3, 1, NULL, 0, 11),
(200, 'KBRI Kuala Lumpur/II/2023', 'E0083766', 'Merry Verra', 2, 1, 1, 1, 'Jalan Jes blok V , Tangerang', 3603, 36, '081295343489', 16, '2023-02-10', 3, 1, NULL, 0, 11),
(201, 'KBRI Kuala Lumpur/II/2023', 'XE409463', 'Ruminah', 2, 1, 1, 1, 'DS. Sedayu Gondang Kec. Narmada', 5201, 52, '081807387670', 16, '2023-02-10', 3, 1, NULL, 0, 11),
(202, 'R-00096/ANTANANARIVO/230626', 'B8746964', 'Toripin', 1, 52, 1, 1, 'Jatibarang Lor RT 05 RW 04,Jatibarang, Brebes, Jawa Tengah', 3329, 33, '085849344524', 1, '2023-06-27', 3, 1, NULL, 0, 16),
(203, 'R-00096/ANTANANARIVO/230626', 'C1973684', 'Awal', 1, 52, 1, 1, 'Kelurahan boneoge, kecamatan lakudo, kabupaten Buton tengah, kota bau-bau, Provinsi Sulawesi Tenggara', 7472, 74, '082223759578', 1, '2023-06-27', 3, 1, 2, 1, 16),
(204, 'R-00096/ANTANANARIVO/230626', 'C6789311', 'Muhammad Hamja', 1, 52, 1, 1, 'Jalan Tanjung Ria Dok 9 Jayapura, Papua', 9103, 91, '0821 9890 9803', 1, '2023-06-27', 3, 1, NULL, 0, 16),
(205, 'R-00096/ANTANANARIVO/230626', 'C7307522', 'Oman Zul Fahmy', 1, 52, 1, 1, 'Tanjung Priok, Jakarta Utara, DKI Jakarta', 3172, 31, '-', 1, '2023-06-27', 1, 2, NULL, 0, 16),
(206, 'NonBrafaks', 'C8310318', 'Elma Hurmiatun', 2, 189, 7, 3, 'Montong Waru setengkep Cingsar, Kecamatan geruak, Kabupaten Lombok Timur, provinsi Nusa Tenggara Barat', 5203, 52, '-', 16, '2023-06-27', 3, 1, NULL, 0, 16),
(207, '01358/WN/B/06/2023/07', 'C1493464', 'Misoh Bt Jamsari Kasad', 2, 1, 1, 1, 'Kampung cinangsi RT 1 RW 7, Desa Wanasari, Kecamatan Surade, Kabupaten Sukabumi', 3202, 32, '081 7795 452 45', 16, '2023-06-27', 3, 1, 5, 0, 16),
(208, 'BP3MI Riau', 'XE464706', 'Nikolas Klau Kasa', 1, 1, 1, 1, NULL, 5321, 53, NULL, 99, '2023-06-28', 3, 1, 4, 1, 3),
(209, 'KBRIAbudhabi/VI/17012023', 'C7292976', 'Sumiyati Bt Kosih', 2, 200, 8, 3, 'Ds. Tegal Lega Kec. Warung Kondang', 3203, 32, '0', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(210, 'KBRI Abudhabi/VI/17012023', 'XE480276', 'Aisha Hussain', 2, 200, 8, 3, 'Ds. Tegal Lega Kec. Warung Kondang', 3203, 32, '0', 99, '2023-01-17', 1, 4, NULL, 0, 1),
(211, 'KBRI Johor Bahru/I/17012023', 'C9710246', 'Widayati', 2, 1, 1, 1, 'Kp. Karang Pawitan Ds. Gelar Pawitan Kec. Cidaun', 3203, 32, '0', 16, '2023-01-17', 1, 3, NULL, 0, NULL),
(212, 'KJRI Penang/I/17012023', 'C9765478', 'Siti Winengsih', 2, 1, 1, 1, NULL, 3204, 32, '0', 16, '2023-01-17', 3, 1, NULL, 0, NULL),
(213, 'KJRI Penang/I/18012023', 'E1005537', 'Julianti', 2, 1, 1, 1, 'Dsn. tololai, mawu kec. ambalawi', 5206, 52, '081327640900', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(214, 'KJRI Penang/I/18012023', 'XE293663', 'Nopita Arini', 2, 1, 1, 1, 'Jl. kertayu, ds. tebingbulang kec. sui keruh', 1671, 16, '08217558927', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(215, 'KBRI Kuala Lumpur/I/18012023', 'C9756687', 'Nuryanah', 2, 1, 1, 1, 'Jl. sri gading perum citra gading kec. talang kelapan', 1607, 16, '085609475080', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(216, 'KBRI Kuala Lumpur/I/18012023', 'XE439806', 'Istiqomah', 2, 1, 1, 1, 'Ds. kemuko ds. temborejo kec. gumuk mas', 3509, 35, '082233050653', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(217, 'KJRI Penang/I/18012023', 'XE393661', 'Widia Ningsih', 2, 1, 1, 1, 'Jl. rodakamp ds. babakan pasar kec. bogor tengah', 3201, 32, '083801936181', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(218, 'KBRI Manama/I/18012023', 'C8523994', 'Nurhayati', 2, 195, 7, 3, 'Perum puri anggrek ds. wangi mekar kec. kotabaru', 3215, 32, '083160687896', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(219, 'KBRI Kuala Lumpur/I/18012023', 'XE414395', 'Ani Rohani', 2, 1, 1, 1, 'Krajan barat kec. aman sari', 3215, 32, '087804315568', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(220, 'KBRI Kuala Lumpur/I/18012023', 'E0008960', 'Naesari', 2, 1, 1, 1, 'Ds. sukamaju kec. puduh pidada', 1809, 18, '0', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(221, 'KBRI Kuala Lumpur/I/18012023', 'XE414026', 'Deva Zuhaeriyah', 2, 1, 1, 1, 'Kec. suranenggala', 3209, 32, '089660708864', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(222, 'KBRI Kuala Lumpur/I/17012023', 'XE415785', 'Jibrina Rizki Nurizha', 2, 1, 1, 1, 'Gang samboja, sayang kec. cianjur', 3203, 32, '087882686378', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(223, 'B-00214/ABU DHABI/230623', 'XE486687', 'Elah Bt Enad Saripudin', 2, 200, 8, 3, NULL, 3202, 32, NULL, 16, '2023-06-29', 2, 1, 5, 1, 1),
(224, 'B-00214/ABU DHABI/230623', 'XE486694', 'Siti Muayatun', 2, 200, 8, 3, NULL, 3324, 33, NULL, 16, '2023-06-29', 3, 1, 4, 1, 1),
(225, 'B-00214/ABU DHABI/230623', 'XE486951', 'Mahra Muhammad', 2, 200, 8, 3, NULL, 3202, 32, NULL, 99, '2023-06-29', 2, 4, 5, 1, 1),
(226, 'B-00214/ABU DHABI/230623', 'XE486950', 'Ibrahim Muhammad', 1, 200, 8, 3, NULL, 3202, 32, NULL, 99, '2023-06-29', 2, 4, 5, 1, 1),
(227, 'B-00214/ABU DHABI/230623', 'XE486952', 'Zimal Aarzo', 2, 200, 8, 3, NULL, 3324, 33, NULL, 99, '2023-06-29', 3, 4, 4, 1, 1),
(228, 'CPMI', 'C9132716', 'Rudi', 1, 1, 1, 1, 'Puri Agung Residence A6 No. 12 Rt/Rw. 05/05 Sungai Langkat, Sagulung, Kota Batam, Kepulauan Riau', 2171, 21, '081268188502', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(229, 'CPMI', 'E2255997', 'Edoverlyn Sihombing', 1, 1, 1, 1, 'Pansurbatu Mula-mula, Pansur Batu, Adiankoting, Kab. Tapanuli Utara, Sumatera Utara', 1202, 12, '082277514149', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(230, 'KBRI Kuala Lumpur/VI/18012023', 'XE398286', 'Serlis Kasim', 2, 1, 1, 1, 'Jl. dwi jaya gandaria utara kec. kebayoran baru', 3174, 31, '085641557803', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(231, 'KBRI Kuala Lumpur/I/18012023', 'XE414181', 'Mesra Tfuakan', 2, 1, 1, 1, 'Nonbaun kec. fatuleutengah', 5301, 53, '081285785208', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(232, 'KBRI Kuala Lumpur/I/18012023', 'C6352245', 'Saveria Wini Sare', 2, 1, 1, 1, 'Ds. kolembu tillu kec. mejewa barat', 5312, 53, '082136339183', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(233, 'KBRI Abudhabi/I/18012023', 'XE480123', 'Nurul Hidayah', 2, 200, 8, 3, 'Kebun dele kec. batu keliang', 5202, 52, '085974850571', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(234, 'KBRI Abudhabi/I/18012023', 'XE480121', 'Sunarsum Bt Katar', 2, 200, 8, 3, 'Barejulat kec. jonggat', 5202, 52, '087877791223', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(235, 'KBRI Abudhabi/I/18012023', 'XE480158', 'Paramba Bt Gadong', 2, 200, 8, 3, 'Dsn. penyaringan kec. moyo utara', 5204, 52, '085338431229', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(236, 'KBRI Abudhabi/I/18012023', 'XE480143', 'Ratna Sumirah', 2, 200, 8, 3, 'Blok bojong lea gunung sari kec. sukagumiwang', 3212, 32, '082218100959', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(237, 'KBRI Abudhabi/I/18012023', 'XE48016', 'Euis Kurniawati Emben', 2, 200, 8, 3, NULL, 3215, 32, '0', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(238, 'KBRI Abudhabi/I/18012023', 'XE480145', 'Faroh Bt Arwani Sarji', 2, 200, 8, 3, 'Badamusalam sawah luhur kec. kasemen', 3604, 36, '087771356321', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(239, '00564a/wb/06/2923/10/04', 'C7735748', 'Aibi Hilal Asyati', 1, 1, 1, 1, 'Jalan Cihampelas no 25/35b/rt001/004 Des Cipaganti kec Coblong kota Bandung Jawa barat', 3204, 32, '08112169333/082116923425', 3, '2023-06-29', 4, 6, 9, 1, 21),
(240, 'CPMI', 'E3352827', 'Astuti', 2, 200, 8, 3, 'Jl. Tn Tinggi Barat Rt/Rw. 04/05 Johar Baru, Jakarta Pusat, DKI Jakarta', 3171, 31, '087889276073', 8, '2023-06-29', 2, 5, 4, 1, 10),
(241, 'KBRI Abudhabi/I/18012023', 'XE480185', 'Siti Nurjanah Bt Apud', 2, 200, 8, 3, 'Kp. bendul kec. sukatani', 3214, 32, '083824983617', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(242, 'KBRI Abudhabi/I/18012023', 'XE480150', 'Saeti Bt Saci Miskad', 2, 200, 8, 3, 'Ds. kertasura kec. kapetakan', 3209, 32, '085864735863', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(243, 'KBRI Abudhabi/I/18012023', 'XE480157', 'Maryani Rusdi Karsa', 2, 200, 8, 3, 'Dsn. jujuruk citamrga kec. jayakerta', 3215, 32, '085774418542', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(244, 'KBRI Abudhabi/I/18012023', 'XE480159', 'Dewi Susanti Bt Ikar', 2, 200, 8, 3, 'Ds. nanggleng kec. citamiang', 3202, 32, '085863660857', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(245, 'KBRI Abudhabi/I/18012023', 'XE480146', 'Siti Fatimah', 2, 200, 8, 3, 'Villa makota indah ds. pahlawan kec. tamura jaya', 3216, 32, '08998228664', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(246, 'KBRI Abudhabi/I/18012023', 'XE480274', 'Ida Bt Emang Martu', 2, 200, 8, 3, 'Kp. ciseupan galumpit kec. tegal waru', 3214, 32, '087766596636', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(247, 'KBRI Abudhabi/I/18012023', 'XE480156', 'Ela Nurlela Bt Sofyan', 2, 200, 8, 3, 'Kp. buni ayu kertamukti kec. haurwangi', 3203, 32, '082111754184', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(248, 'KBRI Abudhabi/I/18012023', 'XE480144', 'Ai Nurkomala Sari Bt Supiyandi', 2, 200, 8, 3, 'Kp. ciheulang kec. cianjur', 3203, 32, '0877704614777', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(249, 'KBRI Abudhabi/I/18012023', 'XE480080', 'Juju Bt Dahroji', 2, 200, 8, 3, 'Kp. cirateun kertasari kec. bojong', 3214, 32, '0838845487239', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(250, 'KBRI Abudhabi/I/18012023', 'B8570407', 'Rukiah Bt Mada', 2, 200, 8, 3, 'Kp. paketingan bojongsari kec. kedung waringin', 3216, 32, '08888463492', 16, '2023-01-18', 3, 1, NULL, 0, 1),
(251, 'CPMI', 'E3775104', 'Muhammad Rifai Simbolon', 1, 5, 1, 1, 'Jl. Pelajar Timur GG Famili 05, Binjai, Medan Denai, Medan, Sumater Utara', 1271, 12, '081264400673', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(252, 'CPMI', 'E3774743', 'Heri Yanto', 1, 5, 1, 1, 'Dusun I, Ramunia 2, Pantai Labu, Deli Serdang, Sumatera Utara', 1207, 12, '083898406100', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(253, 'CPMI', 'E3774971', 'Satria Anggara', 1, 5, 1, 1, 'Dusun Rahayu, Pasar V Kebun Kelapa, Beringin, Deli Serdang, Sumatera Utara', 1207, 12, '082144880378', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(254, 'CPMI', 'E0400352', 'Rendi Marhadi', 1, 5, 1, 1, 'Jl. H. Muhamad Rahum Rt/Rw. 02/01, Cengkareng, Jakarta Barat, DKI Jakarta', 3173, 31, '081311397466', 8, '2023-06-29', 2, 5, NULL, 0, 10),
(255, 'CPMI', 'E3428354', 'Wahyu Faisyal', 1, 1, 1, 1, 'Jl. Badak LKJ Bandar Utama, Tebing Tinggi Kota, Tebing Tinggi, Sumatera Utara', 1276, 12, '085296453543', 8, '2023-06-29', 2, 5, 4, 1, 10),
(256, 'CPMI', 'E3878027', 'Fauzy Faturohman', 1, 1, 1, 1, 'Kp. Benteng Rt/Rw. 09/05, Cicurug, Sukabumi, Jawa Barat', 3202, 32, '085510999677', 8, '2023-06-29', 2, 5, 4, 1, 10),
(257, 'CPMI', 'C8993938', 'Ayu Putri Pratama Wati', 2, 1, 1, 1, 'Dusun VI Jl. Makmur, Percut Seituan, Deli Serdang, Sumatera Utara', 1207, 12, '085853497071', 8, '2023-06-29', 2, 5, 4, 1, 10),
(258, 'CPMI', 'C8992055', 'Elwin Harefa', 1, 1, 1, 1, 'Dusun III Sosial Batu Malenggang, Hinai, Langkat, Sumatera Utara', 1205, 12, '081269515316', 8, '2023-06-29', 2, 5, 4, 1, 10),
(259, 'NonBrafaks', 'XE024136', 'Baiq Laela Zohara', 2, 189, 7, 3, 'Berandak Desa tuna Awu, Kecamatan Pujut, kabupaten Lombok Tengah', 5202, 52, '087860219700', 16, '2023-06-30', 3, 1, NULL, 0, 16),
(260, 'NonBrafaks', 'E196134', 'Widiawati', 2, 189, 7, 3, 'Jalan Gotong Royong RT 03 RW 15 desa pajeruk, amperan, Mataram NTB', 5271, 52, '-', 16, '2023-06-30', 3, 1, NULL, 0, 16),
(261, 'cpmi 01', 'E0807450', 'Simeon', 1, 4, 1, 1, 'Jl kapuk raya no. 46 pengasinan Rawa lumbu', 3216, 32, '087775959587', 8, '2023-07-01', 2, 5, 4, 1, 12),
(262, 'CPMI 02', 'E2631822', 'Ni Luh Nisa Andani', 2, 198, 8, 3, 'BR. Dlodtangluk Sukawati Gianyar Bali', 5104, 51, '082146084415', 8, '2023-07-01', 2, 5, 4, 1, 12),
(263, 'b 00172/sequl/230701', 'C2719188', 'Agus Nanang Riyadi', 1, 73, 3, 1, 'Jalanrinjani gh non97 RT 007/022 sidanegara kec Cilacap kab Cilacap Jawa tengah ,', 3301, 33, '089533809938', 1, '2023-07-01', 4, 6, 7, 1, 21),
(264, 'CPMI 03', 'C5207681', 'Sulastri', 2, 2, 1, 1, 'Bengkel Rt 003/005 Pucung Bancak', 3322, 33, '081328228661', 8, '2023-07-01', 2, 5, 4, 1, 12),
(265, 'CPMI 04', 'C8784450', 'Tati Hayati Bt Surya Rustaya', 2, 2, 1, 1, 'Dan. Mari ikuti II Rt 011/003 Tambak Dahan', 3213, 32, '083170881065', 8, '2023-07-01', 2, 5, 4, 1, 12),
(266, 'CPMI 05', 'E3581752', 'Abah Bt Atam Carmu', 2, 189, 7, 3, 'Dan Belendung 02 Rt 009/003 Sumber Jaya Tempuran', 3215, 32, '085714306112', 8, '2023-07-01', 2, 5, 4, 1, 12),
(267, 'CPMI 06', 'E2825965', 'Siti Musaropah', 2, 2, 1, 1, 'Tambak Sari Rt 004/003 Rawasari', 3324, 33, '085974887587', 8, '2023-07-01', 2, 5, 4, 1, 12),
(268, 'CPMI 07', 'E2455733', 'Sundariyah', 2, 2, 1, 1, 'Sidomukti Rt 007/006 Abung Timur', 1803, 18, '082178460968', 8, '2023-07-01', 2, 5, 4, 1, 12),
(269, 'CPMI 08', 'E3637071', 'Mohammad Burai', 1, 74, 3, 1, 'Jl Trunojoyo III B Rt 001/010 Pejagan Bangkalan', 3526, 35, '082257684330', 8, '2023-07-01', 2, 5, 4, 1, 12),
(270, 'CPMI 09', 'E3819387', 'Suudi', 1, 74, 3, 1, 'Kanigoro Rt 024/003 Pagelaran', 3507, 35, '081213565313', 8, '2023-07-01', 2, 5, 4, 1, 12),
(271, 'CPMI 10', 'C8074414', 'Yudhistira Leovenchi Bani', 1, 1, 1, 1, 'Jl harapan no.20 Babakan tangerang', 3603, 36, NULL, 8, '2023-07-02', 2, 5, 4, 1, 13),
(272, 'B-00131/Damascus/230625', 'B7307900', 'Nurhasni', 2, 207, 8, 3, 'Jangkuk RT 04/270, Kel. Selagalas, Kec. Sandubaya', 5271, 52, NULL, 16, '2023-07-02', 3, 1, 6, 0, 3),
(273, 'b-00228/manila/230629', 'X1212929', 'Muh Muhaimin Latif Albafadhal', 1, 4, 1, 1, 'Jl. kintamani no. 53 bukit', 7371, 73, NULL, 16, '2023-06-29', 2, 1, NULL, 0, 9),
(274, 'b-00228/manila/230629', 'XD983766', 'Marthinus Marselino Alim', 1, 4, 1, 1, NULL, 7171, 71, NULL, 12, '2023-06-29', 2, 1, NULL, 0, 9),
(275, 'b-00228/manila/230629', 'E1140816', 'Anggit Christianto Yusuf', 1, 4, 1, 1, NULL, 3671, 36, NULL, 12, '2023-06-29', 2, 1, NULL, 0, 9),
(276, 'b-00228/manila/230629', 'XD983767', 'Cynthia Fransiska Meinawati', 2, 4, 1, 1, NULL, 3671, 36, NULL, 12, '2023-06-29', 2, 1, NULL, 0, 9),
(277, 'CPMI', 'E3479397', 'Vicky Maulana', 1, 200, 8, 3, 'Jl. Raya Cimahi Timur Rt/Rw. 06/21 Cibeureum, Cimahi Selatan, Kota Cimahi, Jawa Barat', 3277, 32, '08983842880', 8, '2023-07-02', 2, 5, 4, 1, 10),
(278, 'CPMI', 'E3479391', 'Samsul Arifin', 1, 200, 8, 3, 'Kp. Citalu Rt/Rw. 04/01 Cibenda, Cipongkor, Kab. Bandung Barat, Jawa Barat', 3217, 32, '082246485154', 8, '2023-07-02', 2, 5, 4, 1, 10),
(279, 'CPMI', 'C7848460', 'Agung Maulana', 1, 200, 8, 3, 'Dusun Manggabesar 1 Rt/Rw. 011/03 Walahar, Klari, Kab. Karawang, Jawa Barat', 3215, 32, '0859102777847', 8, '2023-07-02', 2, 5, 4, 1, 10),
(280, 'CPMI', 'C6005239', 'Basitj Arief Akbar', 1, 1, 1, 1, 'Kp. Sinargalih Rt/Rw. 03/03 Ds. Cibiuk, Ciranjang, Kab. Cianjur, Jawa Barat', 3203, 32, '-', 8, '2023-07-03', 2, 5, 4, 1, 10),
(281, 'CPMI', 'E2538032', 'Muhammad Rizki', 1, 152, 6, 3, 'Balai panjang Jorong III Kampung, Gaduk, Tilatang Kamang, Kab. Agam, Sumatera Barat', 1306, 13, '085264813479', 8, '2023-07-03', 2, 5, 4, 1, 10),
(282, 'b00000/Korea/2023', 'C5495886', 'Didik.orasetiyono', 1, 73, 3, 1, 'Dan mojoangung RT 02/02 Des majoangung kec ngtru kab Tulungagung Jawa timur', 3504, 35, '.', 1, '2023-07-04', 4, 6, 7, 1, 21),
(283, 'CPMI dari polres Bandara', 'C7314400', 'Michael Rico Pratama', 1, 10, 1, 1, 'Jl. Sawah Lio II Gg. 3 No.80 RT 06/01 Kec. Tambora', 3173, 31, '085216990007', 8, '2023-07-04', 3, 5, 1, 1, 3),
(284, 'CPMI dari polres Bandara', 'X2110937', 'Robert Yohanes', 1, 10, 1, 1, 'Tamburan 6 No.44 RT 02/01 Kec. Tambora', 3173, 31, '081288523608', 8, '2023-07-04', 3, 5, 1, 1, 3),
(285, 'CPMI dari polres Bandara', 'E0711288', 'Yodi Sanusi', 1, 10, 1, 1, 'Jl. Ancol Selatan No.75A Kec. Sunter Agung', 3172, 31, '082298818858', 8, '2023-07-04', 3, 5, 1, 1, 3);
INSERT INTO `imigran` (`id`, `brafaks`, `paspor`, `nama`, `id_jenis_kelamin`, `id_negara`, `id_sub_kawasan`, `id_kawasan`, `alamat`, `id_kab_kota`, `id_provinsi`, `no_telp`, `id_jabatan`, `tanggal_kedatangan`, `id_area`, `id_layanan`, `id_kepulangan`, `terlaksana`, `id_user`) VALUES
(286, 'CPMI dari polres Bandara', 'E4073651', 'Ramlan Mulyana', 1, 1, 1, 1, 'Kp. Pelopor RT 05/01 Kel. Gombonv Kec. Panimbang', 3601, 36, '083109994989', 8, '2023-07-04', 3, 5, 1, 1, 3),
(287, 'CPMI dari polres Bandara', 'E0079907', 'Suwandi', 1, 10, 1, 1, 'Ds. Tunah RT 03/06 Kel. Tunah Kec. Semanding', 3523, 35, '082232835829', 8, '2023-07-04', 3, 5, 2, 1, 17),
(288, 'CPMI dari polres Bandara', 'E0079906', 'Slamet', 1, 10, 1, 1, 'Dsn. Krajan RT 001/002 Kel. Dawung Kec. Palang', 3523, 35, '082131218817', 8, '2023-07-04', 3, 5, 2, 1, 17),
(289, 'cpmi', 'E8015107', 'Wahyu Rejeki Suberkah', 1, 1, 1, 1, 'Jln pondok PKS Libo RT 03/02 sam-sam', 1408, 14, '081374335352', 8, '2023-07-04', 2, 5, 4, 1, 13),
(290, 'cpmi', 'E3357131', 'Paphul Arifin', 1, 22, 1, 1, 'Klesman RT 04/03 warangan kepil', 3307, 33, '085641623059', 8, '2023-07-04', 2, 5, 4, 1, 13),
(291, 'cpmi', 'E2619826', 'Agus Setiawan', 1, 22, 1, 1, 'Jln rumah sakit no 10 lingkungan pekan perbaungan', 1218, 12, '082151845076', 8, '2023-07-04', 2, 5, 4, 1, 13),
(292, 'CPMI', 'E3883095', 'Susilawati', 2, 1, 1, 1, 'Dan pelita RT 02/06 DS mekarsari sungai raya', 6112, 61, '085845199', 8, '2023-07-04', 2, 5, 4, 1, 13),
(293, 'CPMI', 'E3661555', 'Sandiladiato', 1, 1, 1, 1, 'Jln bungur gank andaya puri no 3 RT 2/2 Kebayoran lama', 3174, 31, '082233000990', 8, '2023-07-04', 2, 5, 4, 1, 13),
(294, 'CPMI', 'E2615411', 'Susanto', 1, 5, 1, 1, 'Jl M sohor RT 3/12 DS Pemangkat kota', 6101, 61, '082296603166', 8, '2023-07-04', 2, 5, 4, 1, 13),
(295, 'CPMI', 'E3087303', 'Hartono', 1, 5, 1, 1, 'DS senja RT 02/01 DS belut kec kebas', 6101, 61, '081315965363', 8, '2023-07-04', 2, 5, 4, 1, 13),
(296, 'cpmi', 'C6807102', 'Muhammad Irmasyah', 1, 5, 1, 1, 'Sunggal RT 046/16 Medan sunggal', 1271, 12, '081310931945', 8, '2023-07-04', 2, 5, 4, 1, 13),
(297, 'CPMI', 'E2551785', 'Jaka Prada Kusuma', 1, 5, 1, 1, 'Kel dul RT 02/01 Bangkal baru', 1904, 19, '08872363048', 8, '2023-07-04', 2, 5, 4, 1, 13),
(298, 'CPMI', 'E3383448', 'Putra Nata Pratama', 1, 5, 1, 1, 'Kp.kedaung barat RT 01/01 Sepatan timur', 3603, 36, '081806103082', 8, '2023-07-04', 2, 5, 4, 1, 13),
(299, 'CPMI', 'C7185680', 'Muhammad Arif Rahman', 1, 5, 1, 1, 'Jl P baris gank langgar no 15 lk II Medan sunggal', 1271, 12, '082160281620', 8, '2023-07-04', 2, 5, 4, 1, 13),
(300, 'CPMI', 'E3382101', 'Siti Ayu Malinda', 2, 5, 1, 1, 'Jl teluk gong RT 10/07 penjagalan penjaringan', 3172, 31, '08511297447', 8, '2023-07-04', 2, 5, 4, 1, 13),
(301, 'CPMI', 'E3382100', 'Sefri Yudi Muliatama', 1, 5, 1, 1, 'Sarusunawa tower /8 no 8 RT 01/06 penjaringan', 3172, 31, '081283139052', 8, '2023-07-04', 2, 5, 4, 1, 13),
(302, 'CPMI', 'CPMI', 'Muhammad Iqbal', 1, 1, 1, 1, 'Jl Cipedak RT 4/9 Srengseng sawah', 3174, 31, '081389087050', 8, '2023-07-05', 2, 5, 4, 1, 13),
(303, 'CPMI', 'C9817086', 'Muhammad Rizal', 1, 5, 1, 1, 'Link Tgk syik di pulo RT 0/0 bandar dua', 1114, 11, '082213990707', 8, '2023-07-05', 2, 5, 4, 1, 13),
(304, 'CPMI', 'E3919462', 'Marhamah', 2, 189, 7, 3, 'Kp Gabus pabrik RT 5/4 Sriamur tambun', 3275, 32, '089668995769', 8, '2023-07-05', 2, 5, 4, 1, 13),
(305, 'CPMI', 'C7858641', 'Timotius Fernando', 1, 5, 1, 1, 'Jl jeruk III  block B 31 no 22 PD Makmur', 3603, 36, '089630899389', 8, '2023-07-05', 2, 5, 4, 1, 13),
(306, 'SD.2399/WN/07/2023/04', 'XE429379', 'Titin', 2, 1, 1, 1, NULL, 3218, 32, NULL, 16, '2023-07-05', 2, 1, 5, 1, 9),
(307, 'PMI Non Brafak dari Taipei', 'C4508571', 'Herni', 2, 65, 2, 1, NULL, 3322, 33, NULL, 16, '2023-07-05', 3, 1, 5, 0, 16),
(308, 'B.1231/BP3MI21/PB.03/VII/2023', 'C8965967', 'Nita Rosita', 2, 1, 1, 1, NULL, 3209, 32, NULL, 16, '2023-07-05', 3, 1, 1, 1, 9),
(309, 'CPMI NONPROSEDURAL', 'C6087802', 'Ujang Supriatna', 2, 1, 1, 1, NULL, 3213, 32, NULL, 8, '2023-07-05', 2, 1, 4, 1, 9),
(310, 'CPMI NONPROSEDURAL', 'C3714197', 'Tan Surya Chandra', 1, 1, 1, 1, NULL, 6303, 63, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(311, 'CPMI NONPROSEDURAL', 'AU538619', 'Yuyum Bt Huri Owen', 2, 200, 8, 3, NULL, 3202, 32, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(312, 'CPMI NONPROSEDURAL', 'E2018656', 'Purnomo', 1, 7, 1, 1, NULL, 3318, 33, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(313, 'CPMI NONPROSEDURAL', 'E0107173', 'Arman Nur Alim', 1, 7, 1, 1, NULL, 3318, 33, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(314, 'CPMI NONPROSEDURAL', 'AU538609', 'Sanah', 2, 200, 8, 3, NULL, 3604, 36, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(315, 'CPMI NONPROSEDURAL', 'C8691262', 'Tayani', 2, 1, 1, 1, NULL, 7402, 74, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(316, 'CPMI NON PROSEDURAL', 'X1453264', 'Wawan Carmawan', 1, 1, 1, 1, NULL, 3213, 32, NULL, 8, '2023-07-05', 2, 5, 4, 1, 9),
(317, 'CPMI NON PROSEDURAL', 'X1453256', 'Suherman', 1, 1, 1, 1, NULL, 3213, 32, NULL, 8, '2023-07-05', 2, 5, 4, 0, 9),
(318, 'b00316/denhaa/230703', 'C8069334', 'Sigit Setywan', 1, 78, 3, 1, 'Godegan RT 02/02 kingkang Wonosobo Klaten Jawa tengah', 3310, 33, '081293646033', 5, '2023-07-05', 4, 6, 7, 1, 21),
(319, 'Imigrasi Kelas 1 khusus Soetta', 'C 8338907', 'Maharani', 2, 1, 1, 1, 'Kp.legoso rt,08/01', 3603, 36, '08997764690', 8, '2023-07-06', 2, 5, 4, 1, 6),
(320, 'b00262/Kdei taipe/239704', 'C7813499', 'Muhammad Renldy Prasetyo', 1, 65, 2, 1, 'Dan 2rt91/02dea bujiawa kec Batanghari nuban kab Lampung timur', 1807, 18, '085155221920', 1, '2023-07-06', 4, 6, 9, 1, 21),
(321, 'b00264/Kdei taipe/230705', 'C7601150', 'Chandra Muhammad Ihsan', 1, 65, 2, 1, 'Dan pedes 1 rt004/001 Des payungsaru kec Ponorogo Jawa timur', 3215, 32, '085280386234', 1, '2023-07-06', 4, 6, 9, 1, 21),
(322, 'b00258/Kdei taipe/230704', 'C2870510', 'Tukitlra', 1, 65, 2, 1, 'Des bandar agung RT 013/095 kec bandar sribhawono kab Lampung timur', 1807, 18, '085210118232', 8, '2023-07-06', 4, 6, 7, 1, 21),
(323, 'b 00263/Kdei taipe/230705', 'EX 286906', 'Wiji Lestafi', 2, 65, 2, 1, 'Jl aholik RT 02/01 lingk 1 Kel Paju kec Ponorogo kab Ponorogo Jawa timur', 3502, 35, '085210118332', 1, '2023-07-06', 4, 6, 7, 1, 21),
(324, 'Pencegahan Imigrasi Kelas 1', 'C8338907', 'RIKO SAPUTRA', 1, 1, 1, 1, 'Sriwijaya Mataram bandar mataram', 1802, 18, '082184500600', 8, '2023-07-06', 2, 5, 4, 1, 8),
(325, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'AU588303', 'NI ILOH ELA YUNITHA', 2, 2, 1, 1, 'Setia Budi gunung terang bandar lampung', 1871, 18, '085840065201', 8, '2023-07-06', 2, 5, 4, 1, 8),
(326, 'pencegahan Imigrasi Kelas 1 Soetta', 'C7292832', 'NUR Azizah', 2, 200, 8, 3, 'Lemah wungkuk cirebon', 3209, 32, '085863872920', 8, '2023-07-06', 2, 5, 4, 1, 8),
(327, 'pencegahan Imigrasi Kelas 1', 'E3812010', 'SITI RAHAYU', 2, 200, 8, 3, 'Lemah mungkuk', 3209, 32, '0882002245942', 8, '2023-07-06', 2, 5, 4, 1, 8),
(328, 'pencegahan Imigrasi Kelas 1', 'E3522707', 'AISAH AJID MUKAMAD', 2, 189, 7, 3, 'Lebak wangi', 3604, 36, '085819037568', 8, '2023-07-06', 2, 5, 4, 1, 8),
(329, 'PENCEGAHAN Imigrasi Kelas 1', 'E3685502', 'Yogi Pujo Santoso', 1, 1, 1, 1, 'Cilacap tengah', 3301, 33, '08983493816', 8, '2023-07-06', 2, 5, 4, 1, 8),
(330, 'pencegahan Imigrasi Kelas 1', 'E3165426', 'Wiwin Mintarsih', 2, 1, 1, 1, 'Sukabumi', 3202, 32, '085863677162', 8, '2023-07-06', 2, 5, 4, 1, 8),
(331, 'CPMI', 'E3507569', 'Taminia Satmo', 2, 75, 3, 1, 'Dukuh Krajan RT 1/1 DS bringin kec kauman', 3502, 35, '081367054346', 8, '2023-07-07', 2, 5, 4, 1, 13),
(332, 'CPMI', 'E3047975', 'Kecih', 2, 1, 1, 1, 'Parung Hilir RT 20/10 Parung', 3213, 32, '085314534181', 8, '2023-07-07', 2, 5, 4, 1, 3),
(333, 'SD.2427/WN/07/2023/04', 'E1083003', 'Sahuri', 1, 1, 1, 1, 'Desa Pekalongan, Kelurahan Sampang, Kecamatan Sampang', 3527, 35, NULL, 6, '2023-07-07', 1, 1, 5, 1, 3),
(334, 'SD.2427/WN/07/2023/04', 'C9589378', 'Lega Pitriani', 2, 1, 1, 1, 'Desa Tanjung Genting RT 01 RW 02 Kecamatan Gunung Kerinci', 1501, 15, NULL, 6, '2023-07-07', 1, 1, 5, 1, 3),
(335, 'CPMI', 'C6506004', 'Pangeran Rizkj Mardian Syaputra', 1, 5, 1, 1, 'Pasir Bongkal RT 03/01 Kel. Pasir Bongkal Kec. Sungai Lala', 1402, 14, '089516468850', 8, '2023-07-07', 2, 5, 4, 1, 3),
(336, 'CPMI', 'E3885654', 'Marsiti', 2, 200, 8, 3, 'Parit Tenaga Baru Darat RT 03/02 Ds. Madu Sari Kec. Sungai Raya', 6112, 61, '083140466497', 8, '2023-07-07', 2, 5, 4, 1, 3),
(337, 'SD. 2427/WN/07/2023/04', 'E0698171', 'Yarko', 1, 1, 1, 1, 'Dusun gebalan RT 4 RW 03 desa Wukirharjo, Kecamatan parengah, Kabupaten Tuban, Provinsi Jawa Timur', 3523, 35, '085280086189', 3, '2023-07-07', 3, 1, 5, 0, 16),
(338, 'SD. 2427/WN/07/2023/04', 'AU664545', 'Reny Eka Astutik', 2, 1, 1, 1, 'Desa polean Tamansari Kecamatan Tamansari , Kabupaten Banyuwangi, Jawa Timur', 3510, 35, '+60108968953', 6, '2023-07-07', 3, 1, 2, 1, 17),
(339, 'SD. 2427/WN/07/2023/04', 'C4629189', 'Rinda Karomah', 2, 1, 1, 1, 'Desa mogomulyo RT 01 RW 010, Kecamatan pujer, Kabupaten Jember, Jawa Timur', 3509, 35, '-', 6, '2023-07-07', 3, 1, 2, 1, 17),
(341, 'SD. 2427/WN/07/2023/04', 'C9648933', 'UMMAI', 2, 1, 1, 1, 'Desa Tolang RT 0 RW 0,Kecamatan Banyuates, Kabupaten Sampang, Jawa Timur', 3527, 35, '+60182573858', 6, '2023-07-07', 3, 1, 2, 1, 17),
(342, 'BA/01565/PK/04/2023/66', 'XE227943', 'Cicih Sukarsih BT Karim Samua', 2, 55, 1, 1, 'Desa Sukamulya RT 02 RW 02, Kecamatan Ujungjaya, Kabupaten Sumedang, Provinsi Jawa Barat', 3211, 32, '082126782335', 16, '2023-07-07', 3, 1, 1, 1, 16),
(343, 'BA/01565/PK/04/2023/66', 'E1066599', 'Rosita Rosmayanti BT Wahyat', 2, 55, 1, 1, 'Jalan Sungkai nomor 11 RT 03 RW 01, Desa Ketapang, Kecamatan bangkai Selatan, Kabupaten Lampung Utara, Provinsi Lampung', 1803, 18, '081219947440', 16, '2023-07-07', 3, 1, 2, 1, 16),
(344, 'CPMI', 'E3653824', 'Abyan Rahadi Kusuma Prawira', 1, 10, 1, 1, 'Pamulang Permai II Blok C29/29 Kec. Pamulang', 3674, 36, NULL, 8, '2023-07-07', 2, 5, 4, 1, 3),
(345, 'CPMI', 'E3018173', 'M Adil', 1, 10, 1, 1, 'Dusun 10 Kel. Lawang Agung Kec. Rupit', 1613, 16, '081375508504', 8, '2023-07-07', 2, 5, 4, 1, 3),
(346, 'CPMI', 'E3208019', 'M. Rezky Fani Pratama', 1, 10, 1, 1, 'Jl. Jaring 6 Blok XII No. 258 Kel. Besae Kec. Medan Labuhan', 1271, 12, '085956382292', 8, '2023-07-07', 2, 5, 4, 1, 3),
(347, 'CPMI', 'E3208018', 'Agung Purnomk Aji', 1, 10, 1, 1, 'Dsn III A Suka Makmur Kel. Pantaiomi Kec. Stabat', 1205, 12, '081376508504', 8, '2023-07-07', 2, 5, 4, 1, 3),
(348, 'CPMI', 'E2473425', 'Rangga Theo Bahari', 1, 10, 1, 1, 'Jl. Otista RT 03/05 Kel. Pelabuhan Ratu Kec. Pelabuhan Ratu', 3202, 32, '085877111230', 8, '2023-07-07', 2, 5, 4, 1, 3),
(349, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '--', 'Siti Musbaitilah', 2, 189, 7, 3, 'Desa wisolo Kecamatan Dolo Selatan Kabupaten Sigi Sulawesi Tengah', 7210, 72, '085824157347', 8, '2023-07-07', 3, 1, NULL, 0, 16),
(350, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '---', 'Nova', 2, 189, 7, 3, 'Desa wisolo Kecamatan Dolo Selatan Kabupaten sigih', 7210, 72, '085863193931', 8, '2023-07-07', 3, 1, NULL, 0, 16),
(351, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '----', 'Jaidah', 2, 189, 7, 3, 'Desa wisolo Kecamatan Dolok Selatan Kabupaten Sigi', 7210, 72, '085823019565', 8, '2023-07-07', 3, 5, NULL, 0, 16),
(352, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '------', 'Nurmin', 2, 189, 7, 3, 'Jalan menuju pao RT 04 RW 02 Kecamatan Dolok Selatan Kabupaten Sigi Sulawesi Tengah', 7210, 72, '085825470522', 8, '2023-07-07', 3, 5, NULL, 0, 16),
(353, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '---------', 'Fatmawati', 2, 189, 7, 3, 'Jalan Poros palubangga RT 03 RW 01 Kecamatan pulau Selatan Kabupaten Sigi Sulawesi Tengah', 7210, 72, '089695524362', 8, '2023-07-07', 3, 5, NULL, 0, 16),
(354, 'ND. 469/BP3MI22/PB.04.03/VII/2023', '----------', 'Viki Astria', 2, 189, 7, 3, 'Jalan Guru tua Desa kulo bulu-bulu kecamatan Sigi biromaru Kabupaten Sigi Provinsi Sulawesi Tengah', 7210, 72, '-', 8, '2023-07-07', 3, 5, NULL, 0, 16),
(355, '560/1030.1/316/2023', 'E3128590', 'Perdana Rizki Yuniar', 1, 10, 1, 1, 'Dusun Pertelon RT03/01 Ds. Silo Kec. Silo', 3509, 35, '082140320773', 17, '2023-07-08', 3, 1, 2, 1, 17),
(356, '560/1030.1/316/2023', 'E3128609', 'Nasiruddin', 1, 10, 1, 1, 'Dusun ledok rt 01/04 ds. sidomukti kec. mayang', 3509, 35, '085236379862', 17, '2023-07-08', 3, 1, 2, 1, 17),
(357, '560/1030.1/316/2023', 'E2827970', 'M Latif Ali', 1, 10, 1, 1, 'Dusu  krajan rt 02/28 ds. karangharjo kec. silo', 3509, 35, '085808261425', 17, '2023-07-08', 3, 1, 2, 1, 17),
(358, 'CPMI', 'E3371650', 'Melinda Khoeriyah', 2, 183, 6, 3, 'Gg Luang Rt 006/Rw 002, Kel. Kartigala, Kec. Tukdana', 3212, 32, '083126265232', 8, '2023-07-08', 2, 5, 4, 1, 17),
(359, 'CPMI', 'C9428928', 'Nur Hasan Majid', 1, 200, 8, 3, 'Jl. Mekarwangi Rt 001/Rw 001, Kel. Mekarwangi, Kec. Pagaden Barat', 3213, 32, '08814007142', 8, '2023-07-08', 2, 5, 4, 1, 17),
(360, 'CPMI', 'C9428918', 'Nur Nugraha', 1, 200, 8, 3, 'Kp. Tanjung Jaya Rt 001/Rw 001, Kel. Munjul, Kec. Pagaden Barat', 3213, 32, '085932403546', 8, '2023-07-08', 2, 5, 4, 1, 17),
(361, '12060/PK/07/2022/66', 'XE238722', 'Phendy Rinto', 1, 9, 1, 1, NULL, 6172, 61, '081347665183', 12, '2023-07-08', 3, 1, NULL, 0, 9),
(362, 'CPMI', 'E3562386', 'Arganza Tanza', 1, 200, 8, 3, 'Jl. Uripsumoharjo GG Bintara, Kelurahan Kalibalau, Kecamatan Kedamaian', 1871, 18, '081368904506', 8, '2023-07-08', 2, 5, 4, 1, 17),
(363, 'CPMI', 'C7630031', 'Nurul Khasanah', 2, 74, 3, 1, 'Desa Pager Dawung Rt 003/Rw 001, Kel. Pager Dawung, Kec. Ringinarum', 3324, 33, '085900096878', 8, '2023-07-08', 2, 5, 4, 1, 17),
(364, 'CPMI', 'E1963702', 'Siti Sunarti', 2, 74, 3, 1, 'Pegandon Rt 001/Rw 003, Kel. Pegandon, Kec. Pegandon', 3324, 33, '083842140926', 8, '2023-07-08', 2, 5, 4, 1, 17),
(365, 'CPMI', 'C7417192', 'Entin Hartini', 2, 74, 3, 1, 'KP Kenanga I Rt 002/Rw 002, Kel. Pangsor, Kec. Pagaden Barat', 3213, 32, '081224709011', 8, '2023-07-08', 2, 5, 4, 1, 17),
(366, 'CPMI', 'E3150665', 'Krisnawati', 2, 79, 3, 1, 'Jl. H Gapin Rt 006/Rw 008, Kel. Bakti Jaya, Kec. Sukmajaya', 3276, 32, '081317546691', 8, '2023-07-08', 2, 5, 4, 1, 17),
(367, 'CPMI', 'E1895022', 'Irani Maharani', 2, 79, 3, 1, 'Jl. Anom Untal Untal, Kel. Dalung, Kec. Kuta Utara', 5103, 51, '082145689899', 8, '2023-07-08', 2, 5, 4, 1, 17),
(368, 'CPMI', 'E3150676', 'Indah Fatmawati', 2, 79, 3, 1, 'DSN kleponan Rt 00/009, Kel.Tiudan, Kec. Condang', 3504, 35, '087767633840', 8, '2023-07-08', 2, 5, 4, 1, 17),
(370, 'CPMI', 'E3150682', 'Dadang Hermawan', 1, 79, 3, 1, 'Dusun Mekarsari Rt 003/Rw 008, Kel. Ciparay, Kec. Leuwi Munding', 3210, 32, '081319225009', 8, '2023-07-08', 2, 5, 4, 1, 17),
(371, 'CPMI', 'E1308694', 'Berkat Laia', 1, 5, 1, 1, 'Jl. Gereja Rt 000/Rw 001, Kel. Silamosiki, Kec. Porsea', 1212, 12, '082160201489', 8, '2023-07-08', 2, 5, 4, 1, 17),
(372, 'CPMI', 'C8259899', 'Andri Saputra', 1, 1, 1, 1, 'KP. Pengasinan Rt 006/Rw 001, Kel. Pengasinan, Kec. Rawalumbu', 3216, 32, '0895613337063', 8, '2023-07-08', 3, 5, 1, 1, 1),
(373, 'CPMI', 'C7907452', 'Yorin Aprilia', 2, 1, 1, 1, 'Jl. Denai Gg Sidi, Kel. Tegalsari 1, Kec. Medan Area', 1271, 12, '081219485550', 8, '2023-07-08', 3, 5, 1, 1, 1),
(374, 'CPMI', 'C8643663', 'Arli', 1, 73, 3, 1, 'Perum Griya Permai Rt 001/Rw 001, Kel. Sungai Binti, Kec. Saguling', 2171, 21, '081270061718', 8, '2023-07-08', 2, 5, 4, 1, 17),
(375, 'CPMI', 'C3949262', 'Berkat Sihombing', 1, 73, 3, 1, 'Kav Batu Aji Sentosa Rt 001/Rw 005, Kel. Sungai Lekop, Kec. Sagulung', 2171, 21, '081275288008', 8, '2023-07-08', 2, 5, 4, 1, 17),
(376, 'CPMI', 'E3498303', 'Rapli Aprianto', 1, 153, 6, 3, 'Jl. Puskesmas Rt 001/Rw 023, Kel. Sungai Jawi Dalam, Kec. Pontianak Barat', 6171, 61, '082177908277', 8, '2023-07-08', 2, 5, 4, 1, 17),
(377, 'CPMI', 'E3498302', 'Reski Anggara', 1, 153, 6, 3, 'Jl. Gaya Baru Rt 002/Rw 004, Kel. Tambelan Sampit, Kec. Pontianak Timur', 6171, 61, '083152803627', 8, '2023-07-08', 2, 5, 4, 1, 17),
(378, 'CPMI', 'E3498006', 'Syarif Muhammad Surya', 1, 153, 6, 3, 'Jl. Gaya Baru Rt 001/Rw 004, Kel. Tambelan Sampit, Kec. Pontianak Timur', 6171, 61, '083125660523', 8, '2023-07-08', 2, 5, 4, 1, 17),
(379, 'PMI NONBRAFAK ARAB SAUDI', 'C2387185', 'YUYUN YULIANTI BT UHI DAYAT', 2, 189, 7, 3, NULL, 1871, 18, NULL, 16, '2023-07-09', 3, 1, 2, 1, 9),
(380, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0850118', 'Yudha Aprilyan', 1, 174, 6, 3, 'DS.symber Mulya RT 11/00', 1671, 16, '082125421001', 8, '2023-07-09', 2, 5, 4, 1, 8),
(381, 'Imigrasi kelas 1 khusus Soetta', 'E 0385249', 'Yogi Saipuloh', 1, 174, 6, 3, 'Ds, koba rt,07/00', 1904, 19, '081289795421', 8, '2023-07-09', 2, 5, 4, 1, 8),
(382, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E1156215', 'MUH AWAL', 2, 174, 6, 3, 'DS,bawalipu RT 1', 7324, 73, '085696489318', 8, '2023-07-09', 2, 5, 4, 1, 8),
(383, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0316264', 'Muhamad Hidayat', 1, 174, 6, 3, 'DS,teluk meku', 1205, 12, '082252859272', 8, '2023-07-09', 2, 5, 4, 1, 8),
(384, 'Imigrasi kelas1 khusus Soetta', 'C 8298304', 'Muhammad Affandi', 1, 174, 6, 3, 'Ds, meranti bunting rt,02/03', 1410, 14, '081212171282', 8, '2023-07-09', 2, 5, 4, 1, 8),
(385, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0623600', 'ABABIL', 1, 174, 6, 3, 'DS,limau manis rt2/5', 1371, 13, '082286976276', 8, '2023-07-09', 2, 5, 4, 1, 8),
(386, 'Imigrasi kelas 1 khusus Soetta', 'E 1325734', 'Zulkifli', 1, 174, 6, 3, 'Ds, biring romang rt, 01/02', 7371, 73, '0895365605053', 8, '2023-07-09', 2, 5, 4, 1, 8),
(387, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E1356256', 'M ICHSAN', 1, 174, 6, 3, 'DS.kenten rt2/3', 1607, 16, '081373759600', 8, '2023-07-09', 2, 5, 4, 1, 8),
(388, 'Imigrasi kelas 1 khusus Soetta', 'E 0756367', 'Leo Agung Purwatama', 1, 174, 6, 3, 'Ds, semayap rt, 11/01', 6302, 63, '082326511788', 8, '2023-07-09', 2, 5, 4, 1, 8),
(389, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0745445', 'Sidiq Abda Razak', 2, 174, 6, 3, 'Padang Sarai jorong', 1308, 13, '082310797093', 8, '2023-07-09', 2, 5, 4, 1, 8),
(390, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0385206', 'RUDIANSYAH', 1, 174, 6, 3, 'Kp.air samak rt2/3', 1905, 19, '081990006334', 8, '2023-07-09', 2, 5, 4, 1, 8),
(391, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0312455', 'RANDY WAHYU KURNIAWAN', 1, 174, 6, 3, 'TANJUNG MORAWA', 1207, 12, '082277812393', 8, '2023-07-09', 2, 5, 4, 1, 8),
(392, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0812522', 'VARRWL ARIANTO NUGRAHA', 1, 174, 6, 3, 'Kel.kidul dalem', 3514, 35, '085792657701', 8, '2023-07-09', 2, 5, 4, 1, 8),
(393, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E1419704', 'AHMAD RIFAI', 1, 174, 6, 3, 'Kalidoni', 1671, 16, '0895379630401', 8, '2023-07-09', 2, 5, 4, 0, 8),
(394, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E1783893', 'MUH ALFARIZI', 1, 174, 6, 3, 'Kec sako', 1671, 16, '081312655618', 8, '2023-07-09', 2, 5, 4, 1, 8),
(395, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'C8661459', 'Taufan Rifay Rumoning', 1, 174, 6, 3, 'Jl.warah Made', 9203, 92, '085197278145', 8, '2023-07-09', 2, 5, 4, 1, 8),
(396, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'C7293418', 'EHA JULAIHA BT DIDIN', 2, 189, 7, 3, 'DS.babakan sari kec.sukaluyu', 3202, 32, NULL, 99, '2023-07-09', 2, 5, 4, 1, 8),
(397, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'C7678127', 'MUSROPAH MAHJUM', 2, 3, 1, 1, 'Tegak beleud', 3202, 32, NULL, 8, '2023-07-09', 2, 1, 4, 1, 8),
(398, 'BRAFAKS', 'C1506308', 'SUPENTI', 2, 3, 1, 1, 'Sukabumi', 3202, 32, '085714805737', 16, '2023-07-09', 1, 3, 5, 1, 8),
(399, 'BRAFAKS', 'C4324591', 'NURAINI BT KARIM AMIN', 2, 65, 2, 1, 'DS tengah sumbawa', 5204, 52, NULL, 16, '2023-07-09', 1, 3, 3, 1, 8),
(400, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E0763525', 'RISDO FIRDAUS', 1, 1, 1, 1, 'Gunung sugih', 1802, 18, '081538727737', 99, '2023-07-09', 2, 5, 4, 1, 8),
(401, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'C6910552', 'ATIKAH BT SURYADI', 2, 200, 8, 3, 'Karang sembang', 3209, 32, NULL, 8, '2023-07-09', 2, 5, 4, 1, 8),
(402, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E3606016', 'SARNI Rasmawati', 2, 1, 1, 1, 'DS carimulya RT 10/4', 3215, 32, '081549603075', 99, '2023-07-10', 2, 5, 4, 1, 8),
(403, 'brafak', 'E1656990', 'Ahmad Waris Budianto', 1, 10, 1, 1, NULL, 3509, 35, NULL, 12, '2023-07-10', 3, 1, 2, 1, 8),
(404, 'brafak', 'E1656930', 'Siti Naimah', 2, 10, 1, 1, NULL, 3509, 35, NULL, 12, '2023-07-10', 3, 1, 2, 1, 8),
(405, 'brafak', 'E1656984', 'Maimuna', 2, 10, 1, 1, NULL, 3509, 35, NULL, 12, '2023-07-10', 3, 1, 2, 1, 8),
(406, 'brafak', 'E1657240', 'Dedi Purwanto', 1, 10, 1, 1, 'Jember', 3509, 35, NULL, 12, '2023-07-10', 3, 1, 2, 1, 8),
(407, 'Brafak', 'E2830788', 'Iid Astutik Pujirahayu', 2, 10, 1, 1, NULL, 3509, 35, NULL, 12, '2023-07-10', 3, 1, 2, 1, 8),
(408, 'CPMI', 'E3701669', 'Umar Husen', 1, 205, 8, 3, 'DS kampas meci RT 5/2', 5205, 52, '085238340303', 8, '2023-07-10', 2, 5, 4, 1, 13),
(409, 'CPMI', 'E0543794', 'Deni', 1, 2, 1, 1, 'Kp sadatar RT 1/25', 3217, 32, '085886188089', 8, '2023-07-10', 2, 5, 4, 1, 13),
(410, 'CPMI', 'E3301149', 'Dede Rihayani', 2, 2, 1, 1, 'DS kapur sembilan', 1376, 13, '081364653108', 8, '2023-07-10', 2, 5, 4, 1, 13),
(411, 'CPMI', 'C4374273', 'Isur Suryana', 1, 189, 7, 3, 'Ko. Pamudayan RT 03/01 Ds. Bungur Jaya Kec. Pondok Salam', 3214, 32, '089668031666', 8, '2023-07-10', 2, 5, 4, 1, 3),
(412, 'CPMI', 'C6911258', 'Kuspurwantini', 2, 200, 8, 3, 'Kendawa RT 01/02 kel. kendawa kec. jatibarang', 3329, 33, '087810153417', 8, '2023-07-10', 2, 5, 4, 1, 3),
(413, 'CPMI', 'E0816121', 'I Putu Krisna Prima Satya', 1, 200, 8, 3, 'BR Dinas Karangasem Kel. Sengkidu Kec. Manggis', 5107, 51, '087890802529', 8, '2023-07-10', 2, 5, 4, 1, 3),
(414, 'CPMI', 'E2624108', 'Pande Putu Wika Wiyandari', 2, 200, 8, 3, 'Lingk. Pande Kel. Beng Kec. Gianyar', 5104, 51, '087734050522', 8, '2023-07-10', 2, 5, 4, 1, 3),
(415, 'CPMI', 'E1262259', 'Adetiya Sudira', 1, 200, 8, 3, 'Dsn. Labuhan Ijuk Bawah RT 08/03 Kec. Moyohilir', 5204, 52, '081352288052', 8, '2023-07-10', 2, 5, 4, 1, 3),
(416, 'CPMI', 'E0869235', 'Nariatul Natasya', 2, 200, 8, 3, 'Dsn. Kraja  RT 01/16 Kel. Sabang Kec. Ambulu', 3509, 35, '085812172512', 8, '2023-07-10', 2, 5, 4, 1, 3),
(417, 'CPMI', 'E0815980', 'Ni Kadek Sintha Wulandari', 2, 200, 8, 3, 'Br Bernasi Buduk Kel. Buduk Kec. Mengwi', 5103, 51, '085792920557', 8, '2023-07-10', 2, 5, 4, 1, 3),
(418, 'CPMI', 'C3983084', 'Ni Putu Dita Pradnyani', 2, 200, 8, 3, 'Br. Dinas Semseman Kel. Sangkan Gunung Kec. Sidemen', 5107, 51, '085857862573', 8, '2023-07-10', 2, 5, 4, 1, 3),
(419, 'CPMI', 'E3653649', 'Gildan Ramadhan', 1, 200, 8, 3, 'Kp. PDK Pucung RT 02/03 Kel. Pondok Pucuk Kec. Karang Tengah', 3671, 36, '085691233425', 8, '2023-07-10', 2, 5, 4, 1, 3),
(420, 'CPMI', 'E3385317', 'Slamet Mulyadi', 1, 1, 1, 1, 'Ko. Cimerang Hilir RT 01/01 Kecm Purabaya', 3202, 32, '085760686684', 8, '2023-07-10', 2, 5, 4, 1, 3),
(421, 'CPMI', 'C7576956', 'Suheni BT Kirma Tirsa', 2, 10, 1, 1, 'Ds. Kendal Jaya RT 09/04 Kec. Pedes', 3215, 32, '085716041643', 8, '2023-07-10', 2, 5, 4, 1, 3),
(422, 'CPMI', 'E0507226', 'Nurtini Aprilia Syamsuddin', 2, 74, 3, 1, 'Dsn. Tatede B RT 01/02 Kel. Tatede Kec  Lopok', 5204, 52, '081239386095', 8, '2023-07-10', 2, 5, 4, 1, 3),
(423, 'B-00084/Burnos Aires/230704', 'C4713786', 'Tomi Wijayanto', 1, 120, 4, 2, 'Jl. Mawar No.27 RT 02/05 Pakembaran Kec. Slawi', 3328, 33, '08817474969', 1, '2023-07-10', 2, 1, 5, 1, 3),
(424, 'CPMI', 'E2431486', 'Neneng Nurhayati', 2, 189, 7, 3, 'Ds. Wargur Jaya Kec. Cempaka', 3203, 32, '083824635644', 8, '2023-07-11', 2, 5, 4, 1, 3),
(425, 'CPMI', 'X2156760', 'Bambang Irawan', 1, 1, 1, 1, 'Ds. Mentok Kec. Pujut', 5202, 52, '0859630135640', 8, '2023-07-11', 2, 5, 4, 1, 3),
(426, 'CPMI', 'E2766758', 'Lalu Nizar Parisi Duana', 1, 1, 1, 1, 'Ds. Muncan Kec. Koporo', 5202, 52, '085338972227', 8, '2023-07-11', 2, 5, 4, 1, 3),
(427, 'CPMI', 'X2156755', 'Dandi', 1, 1, 1, 1, 'Ds. Mertok Kec. Pujut', 5202, 52, '087803205370', 8, '2023-07-11', 2, 5, 4, 1, 3),
(428, 'CPMI', 'C8077659', 'David Ginola', 1, 5, 1, 1, 'Ds. Benua Melayu Barat Kec. Pontianak Selatan', 6171, 61, '081255811558', 8, '2023-07-11', 2, 5, 4, 1, 3),
(429, 'CPMI', 'E4176424', 'Fendy', 1, 5, 1, 1, 'Ds. Darat Sekip Kec. Pontianak Kota', 6171, 61, '089516772187', 8, '2023-07-11', 2, 5, 4, 1, 3),
(430, 'CPMI', 'C4917811', 'Lim Je Gi', 1, 1, 1, 1, 'Jl. Kalimantan No. 25, Singkawang Tengah, Kota Singkawang, Kalimantan Barat', 6172, 61, '081212006230', 8, '2023-07-11', 2, 5, 4, 1, 10),
(431, 'CPMI', 'E3608156', 'Mochammad Wahid Riyadi Junior', 1, 1, 1, 1, 'Jl. Mantareha Lebak no. 9 Rt/Rw. 01/02 Panaragan, Kota Bogor Tengah, Kota Bogor, Jawa Barat', 3271, 32, '081350980046', 8, '2023-07-11', 2, 5, 4, 1, 10),
(432, 'CPMI', 'C8571248', 'Endi Rohendi', 1, 1, 1, 1, 'Ds. Pangkalan Pari Rt/Rw. 01/01 Jatitujuh, Majalengka, Jawa Barat', 3210, 32, '083824393771', 8, '2023-07-11', 2, 5, 4, 1, 10),
(433, 'CPMI', 'E0578977', 'Renaldi', 1, 1, 1, 1, 'Jl. Bakti Dusun VI Ds. Sidomulyo, Binjai, Langkat, Sumatera Utara', 1205, 12, '0895360400500', 8, '2023-07-11', 2, 5, 4, 1, 10),
(434, 'CPMI', 'E3111130', 'Adi Dwi Handoko', 1, 1, 1, 1, 'Jl. May Sabara, No. 38/2567 Rt/Rw. 37/10, 20 Illir D.1, Illir Timur 1, Kota Palembang, Sumatera Selatan', 1671, 16, '089627221480', 8, '2023-07-11', 2, 5, 4, 1, 10),
(435, 'CPMI', 'E2249419', 'Puja Dwi Sagita', 2, 1, 1, 1, 'Dusun I Rt/Rw. 02/01 Segayam, Gelumbang, Kab. Muara Enim, Sumatera Selatan', 1603, 16, '082289416113', 8, '2023-07-11', 2, 5, 4, 1, 10),
(436, 'CPMI', 'E3483014', 'Fina Deviana Nur Ramdani', 2, 198, 8, 3, 'Jl. Sariwates Timur 3, Rt/Rw. 02/16 Antapanu Kidul, Antapani, Kota Bandung, Jawa Barat', 3273, 32, '08310788958', 8, '2023-07-11', 2, 5, 4, 1, 10),
(437, 'CPMI', 'X2212428', 'Muhammad Asyur Gharaudy', 1, 198, 8, 3, 'Kp. Jati Parung Gang Wira Rt/Rw. 02/03 Parung, Parung, Kab. Bogor, Jawa Barat', 3201, 32, '085157138922', 8, '2023-07-11', 2, 5, 4, 1, 10),
(438, 'SD.2467/WN/07/2023/04', 'XE440313', 'Imakulata Sako', 2, 1, 1, 1, NULL, 5303, 53, NULL, 16, '2023-07-11', 2, 1, 6, 1, 9),
(439, 'SD.2467/WN/07/2023/04', 'E0734625', 'Mariska Shinta Dewi', 2, 1, 1, 1, NULL, 3507, 35, NULL, 16, '2023-07-11', 2, 1, 6, 1, 9),
(440, 'b-00186/sequl/230709', 'C8814886', 'Abdul Basit', 1, 73, 3, 1, 'Dsn III rr023/006 Des Kalisari kec Losari kab Cirebon Jawa barat', 3209, 32, '085860606703', 8, '2023-07-11', 4, 6, 7, 1, 21),
(441, 'CPMI', 'E2266590', 'Agung Mulyana', 1, 1, 1, 1, 'Bunut Girang Rt/Rw. 02/01 Parungpanjang, wanasalam, Kab. Lebak, Banten', 3602, 36, '085776875778', 8, '2023-07-11', 2, 5, 4, 1, 10),
(442, 'CPMI', 'E1740966', 'Ryan Setia Budi', 1, 200, 8, 3, 'Kampung Banjar Air Ratu Rt/Rw. 01/06 Air Raja, Tanjung Pinang Timur, Kota Tanjung Pinang, Kepulauan Riau', 2172, 21, '082121214723', 8, '2023-07-11', 2, 5, 4, 1, 10),
(443, 'CPMI', 'C5282301', 'Sergio Pangestu', 1, 200, 8, 3, 'Kp. Sinagar Rt/Rw. 02/07 Cihideung Udik, Ciampeka, Kab. Bogor, Jawa Barat', 3201, 32, '087812258355', 8, '2023-07-11', 2, 5, 4, 1, 10),
(444, 'CPMI', 'E3954370', 'Syafiq Ridwan', 1, 1, 1, 1, 'Kav. Darussalam Rt\\Rw. 01/01 Ketapang, Cipondok, Kota Tangerang, Banten', 3671, 36, '089507705921', 8, '2023-07-11', 2, 5, 4, 0, 10),
(445, 'CPMI', 'E4074672', 'Achmad Rasyidin Farhan', 1, 1, 1, 1, 'Jl. Kelapa Sawit V no. 1 Rt/Rw. 00/09, Bekasi Barat, Kota Bekasi, Jawa Barat', 3275, 32, '081295703119', 8, '2023-07-11', 2, 5, 4, 0, 10),
(446, 'CPMI', 'E34660093', 'Sunarni Kromo Semito Witor', 2, 1, 1, 1, 'Dusun VI Rt/Rw. 09/00 Pipas Putih, Ogan Illir, Sumatera Selatan', 1610, 16, '083178277197', 8, '2023-07-11', 2, 5, 4, 1, 10),
(447, 'CPMI', 'AU495500', 'Teti Nurhayati', 2, 2, 1, 1, 'Kp. Paradio Rt/Rw. 04/06 Ds. Mulyasari, Garut, Jawa Barat', 3205, 32, '085223797272', 8, '2023-07-11', 2, 5, 4, 1, 10),
(448, 'CPMI', 'E3589508', 'Khabib Muharom', 1, 1, 1, 1, 'Jl. Sandimeja No. 33 Rt/Rw. 02/02 Segaralangu, Cipari, Kab. Cilacap, Jawa Tengah', 3301, 33, '083174558286', 8, '2023-07-11', 2, 5, 4, 1, 10),
(449, 'CPMI', 'E3589798', 'Khusnul Mawahib', 1, 1, 1, 1, 'Jl. Malangdirana Rt/Rw. 01/02, Cipari, Kab. Cilacap, Jaw Tengah', 3301, 33, '088806593192', 8, '2023-07-11', 2, 5, 4, 1, 10),
(450, 'CPMI', 'E3589097', 'Misbahul Munir', 1, 1, 1, 1, 'Jl. Malangdirana Rt/Rw. 04/01 Segaralangu, Cipari, Kab. Cilacap, Jawa Tengah', 3301, 33, '085741883579', 8, '2023-07-11', 2, 5, 4, 1, 10),
(451, 'CPMI', 'E1171879', 'Guruh Sanggra Anggriyanto', 1, 1, 1, 1, 'Jl. Surabaya No. 64 A Rt/Rw. 01/07 Cepu, Cepu, Kab. Blora, Jawa Tengah', 3316, 33, '08569002696', 8, '2023-07-11', 2, 5, 4, 1, 10),
(452, 'CPMI', 'C8480072', 'Johan Indarto', 1, 177, 6, 3, 'Ds Pandeyan, Umbilharjo, Yogyakarta', 3471, 34, '08139845459', 8, '2023-07-11', 2, 5, 4, 1, 10),
(453, 'CPMI', 'E3116173', 'Hasri', 1, 22, 1, 1, 'Parengki Rt/Rw. 01 Kel. Taswalie, Supa, Pinrang, Sulawesi Selatan', 7315, 73, '082261099507', 8, '2023-07-11', 2, 5, 4, 1, 10),
(454, 'CPMI', 'E3790142', 'Tahir Ringka', 1, 22, 1, 1, 'Dusun Tabulo, Mappedeceng, Mappedeceng, Kab. Luwu Utara, Sulawesi Selatan', 7322, 73, '081288721726', 8, '2023-07-11', 2, 5, 4, 1, 10),
(455, 'CPMI', 'E4074516', 'Muhammad Nur Haidar Nadhir', 1, 1, 1, 1, 'Jl. Sutomo Ujung Rt/Rw. 17/05 Kampung Dalam, Siak, Kab Siak, Riau', 1408, 14, '082217730950', 8, '2023-07-11', 2, 5, 4, 1, 10),
(456, 'CPMI', 'C8192720', 'Purwati', 2, 2, 1, 1, 'Dsn Kasih Rt/Rw. 09/03 Sepanjang, Condanglegi, Kab. Malang, Jawa Timur', 3507, 35, '0881057093320', 8, '2023-07-11', 2, 5, 4, 0, 10),
(457, 'CPMI', 'E2584959', 'Berkat Anwar Siagian', 1, 1, 1, 1, 'Desa Amin Jaya Rt/Rw. 18/04, Amin Jaya, Pangkalan Banteng, Kotawaringin Barat, Kalimantan Tengah', 6201, 62, '081257615405', 8, '2023-07-11', 2, 5, 4, 1, 10),
(458, 'CPMI', 'E3387669', 'Darsinah', 2, 194, 7, 3, 'Kp. Cimenteng Girang Rt/Rw. 02/08 Sala Gedang, Cibeber, Kabupaten Cianjur, Jawa Barat', 3203, 32, '082121025841', 8, '2023-07-11', 2, 5, 4, 1, 10),
(459, 'CPMI', 'E0286003', 'Ndharu Fikri Foza Nasution', 1, 5, 1, 1, 'Sei Bulih Pergaungan, Pergaungan, Serdang Berdagai, Sumatera Utara', 1218, 12, '082169675703', 8, '2023-07-12', 2, 5, 4, 1, 10),
(460, 'CPMI', 'E0286005', 'Muhammad Endar Pratama', 1, 5, 1, 1, 'Dusun Mawar, Beringin, Kab. Deli Serdang, Sumatra Utara', 1207, 12, '083169317993', 8, '2023-07-12', 2, 5, 4, 1, 10),
(461, 'PENCEGAHAN IMIGRASI KELAS 1 SOETTA', 'E4290612', 'Wira Nugraha', 1, 1, 1, 1, 'Ds. kopo 7/4', 3204, 32, '087727640363', 99, '2023-07-12', 2, 5, 4, 1, 8),
(462, 'PENCEGAHAN IMIGRASI KELAS I SOETTA', 'E4290607', 'Muhamad Aldi Pratama', 1, 1, 1, 1, 'Ds. kopi bojong kelor', 3204, 32, '089658311960', 99, '2023-07-12', 2, 5, 4, 1, 8),
(463, 'CPMI', 'E0091719', 'Helda', 2, 200, 8, 3, 'Ds candi rt 3', 1472, 14, '+601790050009', 8, '2023-07-12', 2, 5, 4, 1, 8),
(464, 'CPMI', 'E3917414', 'Ahmad Khumaidi', 1, 1, 1, 1, 'Ds. indah cikarang bekasi', 3216, 32, '082111632533', 8, '2023-07-12', 2, 5, 4, 1, 8),
(465, 'CPMI', 'E3918413', 'Catur Yuni Prasetto', 1, 1, 1, 1, 'Cikarang', 3216, 32, '082111632533', 8, '2023-07-12', 2, 5, 4, 1, 8),
(466, 'CPMI', 'E0908495', 'Titiek Nurhayati', 2, 155, 6, 3, 'Sraten', 3510, 35, '082815649879', 8, '2023-07-12', 2, 5, 4, 1, 8),
(467, 'CPMI', 'E2203578', 'Mic Nurkholis', 1, 155, 6, 3, 'Pesanggaran', 3510, 35, '081236824344', 8, '2023-07-12', 2, 5, 4, 1, 8),
(468, 'CPMI', 'E3692226', 'Sri Handayani', 2, 2, 1, 1, 'Kesugihan', 3301, 33, '0882006098635', 8, '2023-07-12', 2, 5, 4, 1, 8),
(469, 'CPMI', 'E4062629', 'EKA ILYAS YASRO', 1, 7, 1, 1, 'Unyer', 3604, 36, '0895622108215', 8, '2023-07-12', 2, 5, 4, 1, 8),
(470, 'CPMI', 'C3864263', 'Sonny Paruhum', 1, 1, 1, 1, 'Helvetia', 1271, 12, '082160436369', 8, '2023-07-12', 2, 5, 4, 1, 8),
(471, 'CPMI', 'E4062612', 'Febri Lukmansyah', 1, 7, 1, 1, 'Unyur', 3604, 36, '0895616522201', 8, '2023-07-12', 2, 5, 4, 1, 8),
(472, 'CPMI', 'E3836991', 'Rani', 1, 1, 1, 1, 'Karang anyar', 1207, 12, '082160719620', 8, '2023-07-12', 2, 5, 4, 1, 8),
(473, 'CPMI', 'E3837096', 'Indra Irawan', 1, 1, 1, 1, 'Ramunia', 1207, 12, '085212270280', 8, '2023-07-12', 2, 5, 4, 1, 8),
(474, 'CPMI', 'E0262041', 'Suwandi', 1, 1, 1, 1, 'Pasir putih jambi', 1571, 15, '082260001699', 8, '2023-07-12', 2, 5, 4, 1, 8),
(475, 'CPMI', 'E0584104', 'Indah Purnama Sari', 2, 1, 1, 1, 'Sukamaju', 3204, 32, '087781921126', 8, '2023-07-12', 2, 5, 4, 1, 8),
(476, 'CPMI', 'C3510476', 'Masamah  Misnarim Sawinta', 2, 2, 1, 1, 'Kp Cikondang RT 015/08 mekarwangi', 3213, 32, '081318591140', 8, '2023-07-13', 2, 5, 4, 1, 13),
(477, 'CPMI', 'C8243184', 'Iwan Septiana', 1, 1, 1, 1, 'Grumbul Pamulihan RT 03/03', 3301, 33, '087882653663', 8, '2023-07-13', 2, 5, 4, 1, 13),
(478, 'CPMI', 'E1255406', 'Muhammad Al Amin', 1, 3, 1, 1, 'Lamaau RT 01/01 Kel. Lamaau Kec. Ile Ape Timur', 5313, 53, '082261667364', 8, '2023-07-13', 2, 5, 4, 1, 3),
(479, 'CPMI', 'E4104081', 'Angga Firmansyah', 1, 5, 1, 1, 'Jl. Kebon Mangga 1 RT 13/03 Kel. Cipulir Kec. Kebayoran Lama', 3174, 31, '081296745246', 8, '2023-07-13', 2, 5, 4, 1, 3),
(480, 'CPMI', 'C8429353', 'Yosephat Novia  Eko Pratikno', 1, 5, 1, 1, 'Mijen Permai B-105 RT 04/07 Kel. Mijen Kec. Mijen', 3322, 33, '081325833343', 8, '2023-07-13', 2, 5, 4, 1, 3),
(481, 'CPMI', 'E4023773', 'Raizul Muttaqin', 1, 1, 1, 1, 'Jl. Yossudarso Komplek Rumah 4 RT 04/00 Kel. Batuah Kec. Pulau Laut Utara', 6302, 63, '082251789906', 8, '2023-07-13', 2, 5, 4, 1, 3),
(482, 'CPMI', 'C2487071', 'Arifudi', 1, 1, 1, 1, 'Dusun Bantek RT 11/04 Kel. Bagik Payung Kec. Suralaga', 5203, 52, '081916790086', 8, '2023-07-13', 2, 5, 4, 1, 3),
(483, 'CPMI', 'E3983960', 'Anisah', 2, 1, 1, 1, 'Kp. Kaladi RT 01/05 Kel. Tugubandung Kec. Kabandungan', 3202, 32, '081586844973', 8, '2023-07-13', 2, 5, 4, 1, 3),
(484, 'CPMI', 'E3983961', 'Oktavia Sri Mulyani', 2, 1, 1, 1, 'Dusun Jayagiri RT 04/02 Kel. Bojong Kec. Kawunganten', 3301, 33, '085900370507', 8, '2023-07-13', 2, 5, 4, 1, 3),
(485, 'CPMI', 'E4074882', 'Khusnul Umam', 1, 1, 1, 1, 'Kp. Pasepatan Kompa RT 05/04 Kel. Teras Kec. Carenang', 3604, 36, '085779753680', 8, '2023-07-13', 2, 5, 4, 1, 3),
(486, 'CPMI', 'E4074884', 'Muhammad Deny Rafael', 1, 1, 1, 1, 'Ps. Minggu Kembangan Selatan No.32 RT 03/01 Kec. Kembangan', 3173, 31, '08888190039', 8, '2023-07-13', 2, 5, 4, 1, 3),
(487, 'CPMI', 'E4074886', 'Ahmad Rohaidi', 1, 1, 1, 1, 'Kp. Kadingding RT 08/02 Kel. Tambak Kec. Kibin', 3604, 36, '085782052337', 8, '2023-07-13', 2, 5, 4, 1, 3),
(488, 'B-00275/KDEI Taipei/230713', 'E3793922', 'Siti Aisah', 2, 65, 2, 1, 'Ds. Sampora RT 02/01 Kel. Kutaraharja Kec. Banyusari', 3215, 32, '083806322201', 16, '2023-07-13', 2, 1, 5, 1, 3),
(489, 'SD. 2517/WN/07/2023/04', 'C9305281', 'Yati Sumiati', 2, 1, 1, 1, 'RT 3 RW 10 kelurahan dewasari kecamatan Cijeunjing Kabupaten Ciamis Jawa Barat', 3207, 32, '-', 16, '2023-07-13', 3, 1, NULL, 0, 16),
(490, 'SD. 2517/WN/07/2023/04', 'E0672803', 'Nurcholis', 2, 1, 1, 1, 'Congol RT 02 RW 02 Karangjati, Semarang', 3374, 33, '085701668193', 16, '2023-07-13', 3, 1, 5, 0, 16),
(491, 'SD. 2517/WN/07/2023/04', 'E0772667', 'Grace Rering', 2, 1, 1, 1, 'Dusun a malatu way RT 06 Kelurahan Suli, Kecamatan salahutu, Kabupaten Maluku Tengah,provinsi Maluku', 8101, 81, '082198050701', 16, '2023-07-13', 3, 1, NULL, 0, 16),
(492, 'SD. 2517/WN/07/2023/04', 'XE424485', 'Melvi Jahara Marpaung', 2, 1, 1, 1, 'Jalan Panglima Polim, Kelurahan Kisaran Barat, Kabupaten Asahan', 1209, 12, '-', 16, '2023-07-13', 3, 1, NULL, 0, 16),
(493, 'b 00469/Riyadh/230710', 'C6190363', 'Ja\'far Bn Rodi Kayad', 1, 189, 7, 3, 'Dsn kemakmuran RT 08/01 Des jatimakmur kec Songgom kab Brebes Jawa tengah', 3329, 33, '085810114445', 10, '2023-07-13', 4, 6, 7, 1, 21),
(494, 'CPMI', 'E3361886', 'Sri Lestari', 2, 183, 6, 3, 'Guyangan RT 022/00 Kel. Bendo Kec. Sukodono', 3314, 33, '082220044748', 8, '2023-07-13', 2, 5, 4, 1, 3),
(495, 'CPMI', 'E1446347', 'Rikki Fernando', 1, 1, 1, 1, 'Jl. R. Sukamto No.65 RT 042/008, Kel. Delapan Ilir, Kec. Ilir Timur Tiga', 1671, 16, '082122284411', 8, '2023-07-13', 2, 5, 4, 1, 3),
(496, 'CPMI', 'E3871259', 'Naufal Habibi Dinata', 1, 1, 1, 1, 'Jl. Martil LK. I Kel. Dadi Mulyo Kec. Kota Kisaran', 1209, 12, '082278726481', 8, '2023-07-13', 2, 5, 4, 1, 3),
(497, 'CPMi', 'E4075127', 'Aditya Dharmawan', 1, 1, 1, 1, 'Bambu Larangan RT 06/09 Pegadungan Kec. Kalideres', 3173, 31, '081389219620', 8, '2023-07-13', 2, 5, 4, 1, 3),
(498, 'CPMI', 'E4075128', 'Rianto Wibowo', 1, 1, 1, 1, 'Komp. Dewa Kembar B/28 RT 05/01Kel. Semper Timur Kec. Cilincing', 3172, 31, '083895472956', 8, '2023-07-13', 2, 5, 4, 1, 3),
(499, 'CPMI', 'E4075130', 'Agung Nugraha', 1, 1, 1, 1, 'Jl. Pintu Air RT 07/14 Cengkareng Timur Kec. Cengkareng', 3173, 31, '085817810600', 8, '2023-07-13', 2, 5, 4, 1, 3),
(500, 'CPMI', 'E4075126', 'Muhammad Adnan Basayev', 1, 1, 1, 1, 'Ds. Pekiringan Kec. Kebambi', 3209, 32, '0895325803750', 8, '2023-07-13', 2, 5, 4, 1, 3),
(501, 'CPMI', 'E5304252', 'Fendi Perdana', 1, 1, 1, 1, 'Jl. Let Umar Baki LK VII Suka Ramai Kec. Binjai Barat', 1275, 12, '081573514706', 8, '2023-07-13', 2, 5, 4, 1, 3),
(502, 'CPMI', 'E3609464', 'Anas Haryanto', 1, 1, 1, 1, 'Blok. G. 2 No.14 Jl. Pangrang I RT 03/17 Kec. Bojong Gede', 3201, 32, '085731910690', 8, '2023-07-13', 2, 5, 4, 1, 3),
(503, 'CPMI', 'E3216542', 'Nasaruddin Muhammad Nasir', 1, 22, 1, 1, 'Teppo RT 01/02 Pangaparang Kec.Lembang', 7315, 73, '081241871819', 8, '2023-07-13', 2, 5, 4, 1, 3),
(504, 'CPMI', 'C2992911', 'Muhlis', 1, 22, 1, 1, 'Pabbentengan RT 02/02 Kel. Bintang bngun kec. rilau ale', 7302, 73, '087777908148', 8, '2023-07-13', 2, 5, 4, 1, 3),
(505, 'CPMI', 'E3517260', 'Ical', 1, 22, 1, 1, 'Ds. Samaena Kec. Bengo', 7308, 73, '0882019486690', 8, '2023-07-13', 2, 5, 4, 0, 3),
(506, 'Non Brafks', 'XE024240', 'Rina Mariana', 2, 189, 7, 3, 'Desa Kopang rembiga, Kecamatan Kopang, Kabupaten Lombok Tengah, Nusa Tenggara Barat', 5202, 52, '-', 16, '2023-07-14', 3, 1, 4, 1, 1),
(507, 'Non Brafks', 'XE024183', 'Leni Silviana BT Juhana', 2, 189, 7, 3, 'Bandung', 3204, 32, '-', 16, '2023-07-14', 3, 1, NULL, 0, 16),
(508, 'CPMI', 'E4108199', 'Muhamad Ardika Fauzan', 1, 10, 1, 1, 'GG. Harapan I Rt/Rw. 03/12 Sayang, Cianjur, Kabupaten Cianjur, Jawa Barat', 3203, 32, '082115926500', 8, '2023-07-14', 2, 5, 4, 1, 10),
(509, 'CPMI', 'E3818472', 'Yanti Yulianti', 2, 1, 1, 1, 'Dusun II Sidorahayu, Rt/Rw. 08/04 Sumur Kucing, Pasir Sakti, Kab. Lampung Timur, Lampung', 1807, 18, '085658977969', 8, '2023-07-14', 2, 5, 4, 1, 10),
(510, 'b 00216/Cairo/230713', 'C5083285', 'Rosidah', 2, 40, 1, 1, 'Des tugu blok mundu RT 12/1 kec silyed kab Indramayu Jawa barat', 3212, 32, '08121460105', 16, '2023-07-14', 4, 6, 7, 1, 21),
(511, 'CPMI', 'C9759563', 'Usiati', 2, 155, 6, 3, 'Karyatani Rt/Rw. 11/02 Karya Mulya Sari, Candipuro, Kab. Lampung Selatan, Lampung', 1801, 18, '083844429094', 8, '2023-07-14', 2, 5, 4, 1, 10),
(512, 'CPMI', 'E2208494', 'Desi Antika Sari', 2, 155, 6, 3, 'Dusun Blok Agung Rw. 04, Tegal Sari, Kab. Banyuwangi, Jawa Timur', 3510, 35, '082145208661', 8, '2023-07-14', 2, 5, 4, 1, 10),
(513, 'CPMI', 'E0816153', 'Feri Nuri Arifin', 1, 155, 6, 3, 'Sumber Mulyo Rt/Rw. 051/008 Tegaldlimo, Tegaldlimo, Kab. Banyuwangi, Jawa Timur', 3510, 35, '082145001011', 8, '2023-07-14', 2, 5, 4, 1, 10),
(514, 'CPMI', 'C9990255', 'ST. Nurul Hidayah', 2, 155, 6, 3, 'Gempoldampit, Rt/Rw. 05/05 Kedungwungu, Tegaldlimo, Kab. Banyuwangi, Jawa Timur', 3510, 35, '-', 8, '2023-07-14', 2, 5, 4, 1, 10),
(515, 'CPMI', 'E0568489', 'Asyura Taher', 2, 155, 6, 3, 'Jl. Lingkar Lanyer Rt/Rw. 01/04 Galungan Maloang, Bacukiki, Kota Pare-pare, Sulawesi Selatan', 7372, 73, '085237740018', 8, '2023-07-14', 2, 5, 4, 1, 10),
(516, 'CPMI', 'E1655460', 'Firman Arif', 1, 155, 6, 3, 'Ling K Krajan, Rt/Rw. 04/02 Kalipuro, Kalipuro, Kab. Banyuwangi, Jawa Timur', 3510, 35, '081259255747', 8, '2023-07-14', 2, 5, 4, 1, 10),
(517, 'CPMI', 'E3093557', 'Husni Imron Febri Ansyah', 1, 10, 1, 1, 'Dusun Telogorejo Rt/Rw. 05/03 Dusun Lumorejo, Lawang, Kab. Malang, Jawa Timur', 3507, 35, '083869067007', 8, '2023-07-14', 2, 5, 4, 1, 10),
(518, 'CPMI', 'C3405854', 'Linda Naini', 2, 1, 1, 1, 'Bandar sribhawono', 1807, 18, '08128008109', 8, '2023-07-15', 2, 5, 4, 1, 8),
(519, 'CPMI', 'E3524836', 'M Nurwansyah', 1, 1, 1, 1, 'Curup tengah', 1702, 17, '085268941216', 8, '2023-07-15', 2, 5, 4, 1, 8),
(520, 'CPMI', 'X2211293', 'Rahmat Sulistiono', 1, 4, 1, 1, 'Curup tengah', 1702, 17, '085268917216', 8, '2023-07-15', 2, 5, 4, 1, 8),
(521, 'CPMI', 'C6332210', 'Dedeh Rukiyah', 2, 2, 1, 1, 'Sukabumi', 3202, 32, '085779172868', 8, '2023-07-15', 2, 5, 4, 1, 8),
(522, 'CPMI', 'X1751136', 'Walyati', 2, 2, 1, 1, 'Rawasari', 3324, 33, '081327619741', 8, '2023-07-15', 2, 5, 4, 1, 8),
(523, 'CPMI', 'C2754436', 'Siti Marminah', 2, 2, 1, 1, 'Godong', 3315, 33, '088902916507', 8, '2023-07-15', 2, 5, 4, 1, 8),
(524, 'CPMI', 'C5200727', 'Wida Bt Arma', 2, 189, 7, 3, 'Ds, citeureup', 3215, 32, '085776017276', 8, '2023-07-16', 2, 5, 4, 1, 8),
(525, 'CPMI', 'C4936538', 'Muhamad Mukhlishin', 1, 5, 1, 1, 'Lumajang', 3508, 35, '081353999240', 8, '2023-07-16', 2, 5, 4, 1, 8),
(526, 'CPMI', 'C6122521', 'Umbar', 1, 5, 1, 1, 'Ds. cluring', 3510, 35, '087761584590', 8, '2023-07-16', 2, 5, 4, 1, 8),
(527, 'CPMI', 'C2496057', 'Roni Khoirudin', 1, 5, 1, 1, 'Kawak', 3320, 33, '081246919992', 8, '2023-07-16', 2, 5, 4, 1, 8),
(528, 'CPMI', 'E1387529', 'Anang Murthonda', 1, 5, 1, 1, 'Sesetan', 5171, 51, '081339883936', 8, '2023-07-16', 2, 5, 4, 1, 8),
(529, 'CPMI', 'E1945452', 'El Mawaddah Ersya', 2, 5, 1, 1, 'Da. labuhan padi', 5204, 52, '-', 8, '2023-07-16', 2, 5, 4, 1, 8),
(530, 'CPMI', 'E3548020', 'Sugianto', 1, 1, 1, 1, 'Lari krejo', 3319, 33, '088973273170', 8, '2023-07-16', 2, 5, 4, 1, 8),
(531, 'SD. 2517/WN/07/2023/04', 'XE427961', 'Agustina Wati', 1, 1, 1, 1, 'Dusun 4 Kelurahan Duren sembilang, Kecamatan Pancur Batu, Kabupaten Tanggamus, Provinsi Lampung', 1806, 18, '-', 16, '2023-07-13', 3, 1, 5, 0, 16),
(532, 'SD. 2517/WN/07/2023/04', 'E047037', 'Deni Sri Mulyani', 2, 1, 1, 1, 'Jalan Bebedahan 1 Nomor 55 RT 01 RW 08, Kelurahan Sukanagara, Kecamatan purbaratu, Kabupaten Tasikmalaya, Jawa Barat', 3206, 32, '-', 16, '2023-07-13', 3, 1, 5, 0, 16),
(533, 'SD. 2517/WN/07/2023/04', 'E1224744', 'Kursini', 2, 1, 1, 1, 'Larangan RT 022 RW 04 Kelurahan Larangan Kecamatan Lohbener Kabupaten Indramayu Jawa Barat', 3212, 32, '-', 99, '2023-07-13', 1, 1, 5, 0, 16),
(534, 'SD. 2517/WN/07/2023/04', 'E2438233', 'Rijemah', 2, 1, 1, 1, 'Karawang Jaya RT 12 RW 01,Kelurahan Karang Maritim, Kecamatan panjang, Kabupaten Bandar Lampung, Lampung', 1871, 18, '-', 16, '2023-07-13', 1, 1, 5, 0, 16),
(535, 'B-00171/Vientiane/230714', 'X1064124', 'Moelyanto Soesanto Putra', 1, 8, 1, 1, 'Jl. Sei kera Gg. Jawa No. 60A Kel. Sei Kera Hulu Kec. Medan Perjuangan', 1271, 12, '087869706151', 17, '2023-07-16', 2, 1, 5, 1, 3),
(536, 'CPMI', 'X2305237', 'Andi Dwi Martinus', 1, 74, 3, 1, 'Sidoharjo RT11/03 Kel. Sidoharjo Kec. Selagai Lingga', 1802, 18, '087743976805', 8, '2023-07-16', 2, 5, 4, 1, 3),
(537, 'CPMI', 'C 2487071', 'Arifudin', 1, 189, 7, 3, 'Dusun Bantek RT11/04 Kel. Bagik Payung Kec. Suralaga', 5203, 52, '081916790086', 8, '2023-07-16', 2, 5, 4, 1, 3),
(538, 'CPMI', 'E 4023773', 'Raizul Muttaqin', 1, 189, 7, 3, 'Jl. Yossudarso Komplek Rumah 4 RT 04/00 Kel. Batuah Kec. Pulau Laut Utara', 6302, 63, '082251789906', 8, '2023-07-16', 2, 5, 4, 1, 3),
(539, 'CPMI', 'AU446003', 'Ita Paramita', 2, 1, 1, 1, 'Lanta RT 02/01 Kel. Lanta Kec. Lambu', 5272, 52, '085784731237', 8, '2023-07-16', 2, 5, 4, 1, 3),
(540, 'CPMI', 'E2977229', 'Murdi', 1, 1, 1, 1, 'Sagik Mateng RT 02/02 Kel. Pene Kec. Jerowaru', 5203, 52, '085933284575', 8, '2023-07-16', 2, 5, 4, 1, 3),
(541, 'CPMI', 'C1558543', 'Hermayanti', 2, 1, 1, 1, 'Jl. Sulawesi RT 43/09 Kel. Ganjarasri Kec. Metro Barat', 1872, 18, '088272215571', 8, '2023-07-16', 2, 5, 4, 1, 3),
(542, 'CPMI', 'E1489329', 'Faozah', 2, 2, 1, 1, 'Blok Pon RT 02/03 Rawaurip Kec. Pangenan', 3209, 32, '+6584239838 / 083137613469', 8, '2023-07-16', 3, 5, NULL, 0, 3),
(543, 'CPMI', 'E4107941', 'Surya Hakiki', 1, 10, 1, 1, 'Kp. Karang Kendal RT 01/08 Rorotan Kec. Cilincing', 3172, 31, '089655043351', 8, '2023-07-16', 2, 5, 4, 1, 3),
(544, 'CPMI', 'E3984284', 'Very Andrian', 1, 10, 1, 1, 'Jl. Pemukiman RT 07/09 Salembaran Kec. Kosambi', 3671, 36, '0895381890019', 8, '2023-07-16', 2, 5, 4, 1, 3),
(545, 'CPMI', 'C8286397', 'Yoga Irgo Pratama', 1, 10, 1, 1, 'Catur Karya Buana Jaya Rat 02/03 Kec. Banjar Margo', 1805, 18, '085768624396', 8, '2023-07-16', 2, 5, 4, 1, 3),
(546, 'CPMI', 'E3589091', 'Badrun', 1, 1, 1, 1, 'Ds. Sirau RT 02/08 Sirau Kec. Kemranjen', 3302, 33, '082322244147', 8, '2023-07-16', 2, 5, 4, 1, 3),
(547, 'Info Wa', '-1', 'IIS SUKAESIH', 2, 1, 1, 1, 'Jalan Antapani lama RT 02 RW 09,Kecamatan Antapani,Kabupaten Bandung', 3204, 32, '0881023010599', 16, '2023-07-16', 3, 1, NULL, 0, 16),
(548, 'CPMI', 'C6936473', 'Jennifer', 2, 5, 1, 1, 'Jl. Budi Mulia RT 10/07 Kel. Pademangan Kec. Pademangan', 3172, 31, '089653382922', 8, '2023-07-17', 2, 5, 4, 1, 3),
(549, 'CPMI', 'E3132848', 'Qurroti Ayun Adnan', 2, 5, 1, 1, 'Blok B No.7 Polomo Graha RT 01/04 Kel Hinekombe Kec. Sentani', 9103, 91, '082351743940', 8, '2023-07-17', 2, 5, 4, 0, 3),
(550, 'CPMI', '33387923', 'Rina', 2, 5, 1, 1, 'Kp. Cimahi RT 07/04 Kel. Sukamahi Kec. Cikarang Pusat', 3216, 32, '083110760004', 8, '2023-07-17', 2, 5, 4, 1, 3),
(551, 'CPMI', 'C7274362', 'Mohammad Miftahuddin AB', 1, 1, 1, 1, 'Ds. Karang Anyar Kec. Wates', 3506, 35, '089512995886', 8, '2023-07-17', 2, 5, 4, 1, 3),
(552, 'CPMI', 'C8120520', 'Burhanudin', 1, 1, 1, 1, 'Kp. Bojong Herang RT 06/02 Kel. Pamanuk Kec. Carenang', 3604, 36, '082259466030', 8, '2023-07-17', 2, 5, 4, 1, 3),
(553, 'b 09461/Riyadh/230715', 'C 9015923', 'Susi Malianti', 2, 189, 7, 3, 'Des labulia kec jonggat kab Lombok Tengah ntb', 5202, 52, '087865796101', 16, '2023-07-17', 4, 6, 7, 1, 21),
(554, 'CPMI', 'E2768411', 'WIDARTI', 2, 2, 1, 1, 'Ciawitali Rt 006/Rw 003, Kel. Rejodadi, Kec. Cimanggu', 3301, 33, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(555, 'CPMI', 'E3347915', 'MUHAMMAD HAMID JABBAR', 1, 1, 1, 1, 'Kp. Sinarbakti Rt 004/Rw 001, Kel. Buniasih, Kec. Tegal Buleud', 3202, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(556, 'CPMI', 'E3347916', 'HENGKY PURNAMA', 1, 1, 1, 1, 'Kp. Sinarbakti Rt 004/Rw 001, Kel. Buniasih, Kec. Tegal Buleud', 3202, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(557, 'CPMI', 'E3347914', 'DEDE EVAN MAULANA', 1, 1, 1, 1, 'Kp. Sinarbakti Rt 004/Rw 001, Kel. Buniasih, Kec. Tegal Buleud', 3202, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(558, 'CPMI', 'X1241051', 'RIO ANDRIAN', 1, 5, 1, 1, 'Perum Sukit Purnama Indah Rt 011/Rw 004, Kel. Kemang Manis, Kec. Ilir Barat II', 1671, 16, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(559, 'CPMI', 'E2332972', 'HERU WIYONO', 1, 5, 1, 1, 'Jl. Kertadirja Sukaraja Kulon Rt 002/Rw 005, Kel. Sukaraja Kulon, Kec. Sukaraja', 3302, 33, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(560, 'CPMI', 'E2360031', 'YUSUF HENGKY SAPUTRO', 1, 5, 1, 1, 'Dukuh Dayu Rt 028/Rw 008, Kel. Jurangjero, Kec. Karang Malang', 3314, 33, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(561, 'CPMI', 'E1853510', 'SUPARMAN', 1, 5, 1, 1, 'Parang Rejo Rt 001/Rw 003, Kel. Paduroso, Kec. Purworejo', 3306, 33, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(562, 'CPMI', 'C1511143', 'EKO BUDIANTO', 1, 1, 1, 1, NULL, 1271, 12, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(563, 'CPMI', 'E3402102', 'M MAHBUB', 1, 1, 1, 1, 'Dusun 2 Rt 004/Rw 002, Kec. Rumbia', 1802, 18, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(564, 'CPMI', 'E4260911', 'RIDHO AHMAD DAHLAN', 1, 1, 1, 1, 'Dusun 4 Sido Rejo Rt 001/Rw 004, Kel. Mataram Jaya, Kec. Bandar Mataram', 1802, 18, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(565, 'CPMI', 'E3402099', 'TARYONO', 1, 1, 1, 1, 'Dusun 4 Sido Rejo Rt 002/Rw 004, Kel. Mataram Jaya, Kec. Bandar Mataram', 1802, 18, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(566, 'CPMI', 'X1946675', 'SRI HELVYA NOERWADANI', 2, 1, 1, 1, 'Kp. Haur Panggung Rt 001/Rw 003, Kel. Haur Panggung, Kec. Tarogong Kidul', 3205, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(567, 'CPMI', 'E3024003', 'FITRI RAHMA DANI', 2, 1, 1, 1, NULL, 3201, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(568, 'CPMI', 'C6947391', 'ARIFIN JUNAIDI', 1, 1, 1, 1, 'Dusun III Rejo Sari, Kel. Kwala Begumit, Kec. Stabat', 1205, 12, NULL, 8, '2023-07-18', 2, 5, 4, 0, 17),
(569, 'CPMI', 'E2703590', 'ABDUL QOHAR', 1, 1, 1, 1, 'Lingkungan III Sejahtera Rt 000/Rw 000, Kel. Dendang, Kec. Stabat', 1205, 12, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(570, 'CPMI', 'C6947429', 'BENNI ISMONO', 1, 1, 1, 1, 'Jl. Starban Ujung Rt 000/Rw 000, Kel. Polonia, Kec. Polonia Medan', 1271, 12, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(571, 'CPMI', 'C6947390', 'SIDIK AMIN', 1, 1, 1, 1, 'Dusun Bukit Timur Rt 000/Rw 000, Kel. Tanjung Putus, Kec. Padang Tualang', 1205, 12, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(572, 'CPMI', 'E2703591', 'EKO PURNOMO', 1, 1, 1, 1, 'Dusun IX Pasar Besar Rt 000/Rw 000, Kel. Sei Semayang, Kec. Sunggal', 1207, 12, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(573, 'CPMI', 'C9918777', 'DINA APRILIA', 2, 200, 8, 3, 'Jl. Aster 2 No.5 BKKBN Rt 002/Rw 008, Kel. Jatiwaringin, Kec. Pondok Gede', 3216, 32, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(574, 'CPMI', 'E1141182', 'MUTIAROH', 2, 37, 1, 1, 'Kp. Kosambi Dalem Rt 002/Rw 001, Kel. Lebak Wamgi, Kec. Lebak Wangi', 3604, 36, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(575, 'CPMI', 'E3817997', 'FITRIANI', 2, 1, 1, 1, 'Dusun Gading Rejo Rt 006/Rw 003, Kel. Banarjoyo, Kec. Batanghari', 1807, 18, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(576, 'CPMI', 'E307564', 'ISNAN HUSAIRI', 1, 3, 1, 1, 'Gubuk Dasan Rt 004/Rw 001, Kel. Paokmotong, Kec. Mashagik', 5203, 52, NULL, 8, '2023-07-17', 2, 5, 4, 0, 17),
(577, 'NonBrafaks/UEA/18072023', 'C6201169', 'Liah', 2, 200, 8, 3, 'Ds. Tegal Karang Palimanan RT. 002/005', 3209, 32, '0', 9, '2023-07-18', 3, 1, NULL, 0, NULL),
(578, 'B-00402)/JEDDAH/230717', 'XD765977', 'Lusiana Baddoloh Sulo', 2, 189, 7, 3, 'Pakalu Kalabbirang, Kec. Pakalu', 7309, 73, '085256307648', 16, '2023-07-18', 3, 1, NULL, 0, NULL),
(579, '09159/Istambul/230715', 'C7861914', 'Badaria', 2, 183, 6, 3, 'Dsn jorok tiram RT 002/004 Des batu putih kec taliwang kab Sumbawa barat', 5201, 52, '082146371361', 16, '2023-07-19', 4, 6, 7, 1, 21),
(580, 'Non Brafaks', 'XE023986', 'Kokom Komariah BT Oib Sirat', 2, 189, 7, 3, 'Kp. Cimaung RT 10/05 Kel. Warung Jeruk Kec. Tegal Waru', 3214, 32, '083164092898', 16, '2023-07-19', 3, 1, NULL, 0, 3),
(581, 'Non Brafaks', 'XE024211', 'Kusnaeni Saom', 2, 189, 7, 3, 'Kp. Kliwon Ds. Banyuning Kec. Kadugede', 3208, 32, '089664368884', 16, '2023-07-19', 2, 1, 5, 1, 3),
(582, 'Non Brafaks', 'XE023902', 'Fatimah BT Asan Atun', 2, 189, 7, 3, 'Kp. Ketapang Ds. Kampung Besar RT 01/15 Kec. Teluknaga', 3603, 36, '085697746953', 16, '2023-07-19', 3, 1, NULL, 0, 3);
INSERT INTO `imigran` (`id`, `brafaks`, `paspor`, `nama`, `id_jenis_kelamin`, `id_negara`, `id_sub_kawasan`, `id_kawasan`, `alamat`, `id_kab_kota`, `id_provinsi`, `no_telp`, `id_jabatan`, `tanggal_kedatangan`, `id_area`, `id_layanan`, `id_kepulangan`, `terlaksana`, `id_user`) VALUES
(583, 'Non Brafaks', 'XE023863', 'Laila BT Oja Yasin', 2, 189, 7, 3, 'Kp. Ciuender Kulon Ds. Bumisari Kec. Warung Kondang', 3203, 32, '085793756165', 7, '2023-07-19', 3, 1, NULL, 0, 3),
(584, 'CPMI', 'E4075270', 'Ifan Afrianto', 1, 1, 1, 1, 'Pringkumpul RT 08/05 Pringsewu Selatan Kec. Pringsewu', 1810, 18, '085719628037', 8, '2023-07-19', 2, 5, 4, 1, 3),
(585, 'CPMI', 'E4075142', 'Helmi Dimas Kurniawan', 1, 1, 1, 1, 'Lk. V Jl. Kesehatan RT 05/05 Kec. Pringsewu', 1810, 18, '0895610044909', 8, '2023-07-19', 2, 5, 4, 1, 3),
(586, 'CPMI', 'E4075199', 'Jerry Gunawan', 1, 1, 1, 1, 'Kp. Cikahrupin RT 02/06 Kec. Neglasari', 3603, 36, '081292452761', 8, '2023-07-19', 2, 5, 4, 1, 3),
(587, 'CPMI', 'E4075197', 'Zulvikri Aprillian Fachdila', 1, 1, 1, 1, 'Jl. Cipaku I No. 53 RT 02/02 Ledeng Kec. Cidadap', 3204, 32, '088219410138', 8, '2023-07-19', 2, 5, 4, 1, 3),
(588, 'CPMI', 'E4075172', 'Andres Wiranata', 1, 1, 1, 1, 'Cikahuripan RT 04/05 Mekarsari Kec. Neglasari', 3603, 36, '089652267271', 8, '2023-07-19', 2, 5, 4, 1, 3),
(589, 'CPMI', 'E4074882 (2)', 'Khusnul Umam', 1, 1, 1, 1, 'Kp. Pasepatan Kompa RT 05/04 Teras Kec. Carenang', 3604, 36, '085779753680', 8, '2023-07-19', 2, 5, 4, 1, 3),
(590, 'CPMI', 'C7805674', 'Robert Hendry Runtukahu', 1, 10, 1, 1, 'Jl. Pangkalan Jati II Blok A No.5 RT 07/13 Kec. Cipinang Meluju', 3175, 31, '08111972088', 8, '2023-07-19', 2, 5, 4, 1, 3),
(591, 'CPMI', 'C3110826', 'Rialang Patakdungan', 1, 189, 7, 3, 'Kunnu RT 01/04 Kel. Maroangin Kec. Telluwanua', 7373, 73, '085254230686', 8, '2023-07-19', 2, 5, 4, 1, 3),
(592, 'CPMI', 'C5069054', 'Siti Sohibah', 2, 5, 1, 1, 'Kp. Cimanggu RT 011/06 Kel. Kademangan Kec. Surade', 3202, 32, '085863136201', 8, '2023-07-19', 3, 5, NULL, 0, 3),
(593, 'CPMI', 'E3653217', 'Anwar Rizky', 1, 5, 1, 1, 'Kp. Guji RT 02/02 Kel. Duri Kepa Kec. Kebon Jeruk', 3173, 31, '085772962944', 8, '2023-07-19', 3, 5, NULL, 0, 3),
(594, 'CPMI', 'E3814984', 'Satria Gilang Buana Putra', 1, 5, 1, 1, 'Jl. Lebak Para RT 08/02 Kel. Cijantung Kec. Pasar Rebo', 3175, 31, '0895386203842', 8, '2023-07-19', 3, 5, NULL, 0, 3),
(595, 'CPMI', 'E3654313', 'Arieffial Dwika Rachmaddan', 1, 5, 1, 1, 'Kp. Guji RT 02/02 Kel. Duri Kepa Kec. Kebon jeruk', 3173, 31, '085794005751', 8, '2023-07-19', 3, 5, NULL, 0, 3),
(596, 'CPMI', 'C8429848', 'Moh Sahrul Efendi', 1, 200, 8, 3, 'Kertasari RT 05/04 Kec. Suradadi', 3328, 33, '081902610345', 8, '2023-07-19', 2, 5, 4, 1, 3),
(597, 'CPMI', 'E3266024', 'Eva Dewi Irma', 2, 200, 8, 3, 'Dusun Gentan RT 01/08 Kel. Truko Kec. Bringin', 3322, 33, '083119879965', 8, '2023-07-19', 2, 5, 4, 1, 3),
(598, 'CPMI', 'E3266027', 'Hanifa Mikrotul', 2, 200, 8, 3, 'Dsn. Sumberan RT 01/022 Kel. Ambulu Kec. Ambulu', 3509, 35, '082328004955', 8, '2023-07-19', 2, 5, 4, 1, 3),
(599, 'CPMI', 'E4118035', 'Indri Farianti', 2, 1, 1, 1, 'Jl. Laswi Cinta Asih No. 219/122 RT 05/11 Kec. Batununggal', 3204, 32, '081999568502', 8, '2023-07-19', 2, 5, 4, 1, 3),
(600, 'CPMI', 'E0783365', 'Zulfikri Priamdanu', 1, 5, 1, 1, 'Dasana Indah SD 2 No.21 RT 10/10 Kec. Kelapa Dua', 3603, 36, '081213174341', 8, '2023-07-19', 2, 5, 4, 1, 3),
(601, 'CPMI', 'E3955602', 'Rizky Juniartanto', 1, 5, 1, 1, 'Riwong Permai Blok C2 No 11 RT 02/01 Binong Kec. Curug', 3603, 36, '089637537306', 8, '2023-07-19', 2, 5, 4, 1, 3),
(602, 'CPMI', 'E3955604', 'Thomas Mahendra', 1, 5, 1, 1, 'Dasana Indah Blok TF 2/59 RT 07/02 Kec. Kelapa Dua', 3603, 36, '081585812628', 8, '2023-07-19', 2, 5, 4, 1, 3),
(603, 'CPMI', 'C9428918 (2)', 'Nur Nugraha BN Seh Nurdin Wand', 1, 200, 8, 3, 'Kp. Tanjung Jaya RT 01/01 Kel. Munjul Kec. Pagaden Barat', 3213, 32, '085932403546', 8, '2023-07-19', 2, 5, 4, 1, 3),
(604, 'CPMI', 'C9428928 (2)', 'Nur Hasan Majid', 1, 200, 8, 3, 'Kp. Mekarwangi RT 01/01 Kec. Pegaden Barat', 3213, 32, '088814007142', 8, '2023-07-19', 2, 5, 4, 1, 3),
(605, 'CPMI', 'E4291033', 'Hengky Setyadi', 1, 2, 1, 1, 'Ds. Garuda Kec. Andir', 3204, 32, '082116886696', 8, '2023-07-19', 2, 5, 4, 1, 3),
(606, 'CPMI', 'C7173025', 'Tati Mulatifah Kumala Intan', 2, 74, 3, 1, 'Pacar RT 01/02 Pacar Kec. Rembang', 3317, 33, '082278822989', 8, '2023-07-19', 2, 5, 4, 1, 3),
(607, 'CPMI', 'E4150584', 'Muhammad Rifai', 1, 74, 3, 1, 'Sumurpule RT 11/05 Kec. Kragan', 3317, 33, '082112516739', 8, '2023-07-19', 2, 5, 4, 1, 3),
(608, 'CPMI', 'C7224650', 'Robertus Agustine Mahesha', 1, 1, 1, 1, 'Kel.Pegadengan Kec. Kalideres', 3173, 31, '081323859456', 8, '2023-07-19', 2, 5, 4, 1, 3),
(609, 'CPMI', 'E4075468', 'Siti Zahra Aliana Napsiah', 2, 1, 1, 1, 'Panga Galih RT 02/03 Ds. Loji Kec. Kota Bogor Barat', 3201, 32, '0895701941414', 8, '2023-07-19', 2, 5, 4, 1, 3),
(610, 'CPMI', 'E3579773', 'Yonas Valian', 1, 1, 1, 1, 'Jl. Kebun Bawang X No.19 Kec. Tanjung Priok', 3172, 31, '081221691034', 8, '2023-07-19', 2, 5, 4, 1, 3),
(611, 'CPMI', 'E3661231', 'Agung Rizky Zamzami Bahagia', 1, 1, 1, 1, 'Kel. Kedoya Utara Kec. Kebon Jeruk', 3173, 31, '089652430886', 8, '2023-07-19', 2, 5, 4, 1, 3),
(612, 'CPMI', 'E3385978', 'Debi Usha Jasmine', 2, 1, 1, 1, 'Jl. Asia Baru RT 08/04 Duri Kepa Kec.Kebon Jeruk', 3173, 31, '085693002451', 8, '2023-07-19', 2, 5, 4, 1, 3),
(613, 'CPMI', 'E0398189', 'Rudi Hermansyah', 1, 4, 1, 1, 'Nusa Maju RT 04/02 Kel. Nusa Maju Kec. Belitang III', 1608, 16, '081294565497', 8, '2023-07-20', 2, 5, 4, 1, 3),
(614, 'CPMI', 'C8073710', 'David Irawan', 1, 4, 1, 1, 'Lrg. Muhira No 03 RT 18/00 Kel. Tanjung Pinang Kec. Jambi Timur', 1571, 15, '0895605356537', 8, '2023-07-20', 2, 5, 4, 1, 3),
(615, 'CPMI', 'E3640009', 'Adi Suradi', 1, 74, 3, 1, 'Cuwadi RT 14/04 Kel. Simbang Kec. Kali kajar', 3307, 33, '085822822230', 8, '2023-07-20', 2, 5, 4, 1, 3),
(616, 'CPMI', 'C7090167', 'Siti Hajar Dali Munte', 2, 5, 1, 1, 'Lambung RT 00/04 Kel. Lubuk Landai Kec. Tanah Sepenggal', 1508, 15, '0887437082383', 8, '2023-07-20', 2, 5, 4, 1, 3),
(617, 'CPMI', 'E3578570', 'Hendi Hermawan', 1, 5, 1, 1, 'Sido Luhur Kec. Sukaraja', 1705, 17, '082279454193', 8, '2023-07-20', 2, 5, 4, 1, 3),
(618, 'CPMI', 'C6742199', 'Kurniawan', 1, 10, 1, 1, 'Jl. Adi Sucipto Komp Bumi Indah Permai No.13 Kec. Sungai Raya', 6112, 61, '081256618824', 8, '2023-07-20', 2, 5, 4, 1, 3),
(619, 'CPMI', 'E3890210', 'Mega Indriyanti', 2, 1, 1, 1, 'Perum Taman Raya Tahap 2A Blok GC no. 20 Rt/Rw. 01/035 Belian, Batam Kota, Kota Batam, Kepulauan Riau', 2171, 21, '083898330103', 8, '2023-07-20', 2, 5, 4, 1, 10),
(620, 'CPMI', 'X954902', 'Erwin', 1, 5, 1, 1, 'Gang Taruna Rt/Rw. 03/07 Mangga Dua Selatan, Sawah Besar, Jakarta Pusat, DKI Jakarta', 3171, 31, '081294900759', 8, '2023-07-20', 2, 5, 4, 1, 10),
(621, 'CPMI', 'E2456860', 'Risma Yulinda', 2, 2, 1, 1, 'Gunung Terang Rt/Rw. 01/08 Gunung Terang, Bulok, Kab. Tanggamus, Lampung', 1806, 18, '085267150657', 8, '2023-07-20', 2, 5, 4, 1, 10),
(622, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'XE427527', 'Herti Rustini', 2, 1, 1, 1, 'Perum Bumi Cikembang Asri Rt/Rw. 01/12 Cikembar, Kab. Sukabumi, Jawa Barat', 3202, 32, '085883086286', 16, '2023-07-20', 2, 1, 5, 1, 10),
(623, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'E2178578', 'Kusniawati', 2, 1, 1, 1, 'Dusun Walahar I Rt/Rw. 05/01 Walahar, Klari, Kab. Karawang, Jawa Barat', 3215, 32, '089512266660-089662038899', 16, '2023-07-20', 2, 1, 5, 1, 10),
(624, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'XE427522', 'Cut Mutia', 2, 1, 1, 1, 'Pelemrenteng Rt/Rw. 08/02 Kacangan, Andong, Kab. Boyolali, Jawa Tengah', 3309, 33, '087881968729', 4, '2023-07-20', 2, 1, 5, 1, 10),
(625, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'E0802362', 'Ratni', 2, 1, 1, 1, 'Cikiara Rt/Rw. 01/03 Mekarjaya, Ciemas, Kab. Sukabumi, Jawa Barat', 3202, 32, '085773807349', 16, '2023-07-20', 2, 1, 5, 1, 10),
(626, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'XE425629', 'Rokayah', 2, 1, 1, 1, 'Genting Rt/Rw. 02/01 Plipir, Purworejo, Kab. Purworejo, Jawa Tengah', 3306, 33, '088233037076', 16, '2023-07-20', 3, 1, NULL, 0, 10),
(627, 'KBRI KUALA LUMPUR (SD.2642/WN/07/2023/04)', 'E1872701', 'Tan Hen Luny', 2, 1, 1, 1, 'Kalideres Rt/Rw. 07/01, Kalideres, Jakarta Barat, DKI Jakarta', 3173, 31, '-', 16, '2023-07-20', 3, 1, 1, 0, 10),
(628, 'b 00286/Kdei taipe/230718', 'E 3537533', 'Wawan Setyanwan', 1, 65, 2, 1, 'Dan ndliem RT 015/004 Des tanggafang kec pule kab Trenggalek Jawa timur', 3503, 35, '082272123714', 8, '2023-07-20', 4, 6, 7, 1, 21),
(629, 'SD.2642/WN/07/2023/04', 'C9553384', 'Marlina', 2, 1, 1, 1, NULL, 3207, 32, NULL, 16, '2023-07-20', 3, 1, 1, 0, 9),
(630, 'b 00283/Kdei taipei/230717', 'AR 844189', 'Nunung Nurhayati', 2, 65, 2, 1, 'Dsn Wales RT 015/094 Des Binong kec Binong kab Subang Jawa barat', 3213, 32, '083891781751', 16, '2023-07-20', 4, 6, 7, 1, 21),
(631, 'SD.2642/WN/07/2023/04', 'XE427523', 'Eti Suryati', 2, 1, 1, 1, NULL, 3205, 32, NULL, 16, '2023-07-20', 3, 1, 1, 0, 9),
(632, 'b00285/Kdei taipei/230718', 'C 3901208', 'Japar', 1, 65, 2, 1, 'Jalan Nusa Mandala RT 095/001kel kutawaru kec Cilacap tengah kab Cilacap Jawa tengah', 3301, 33, '085712064963', 3, '2023-07-20', 4, 6, 7, 1, 21),
(633, 'b 00284/Kdei taipei/230717', 'AU 640633', 'Rohana', 2, 65, 2, 1, 'Dsn II RT 091/002 Des karya makmur kec labuhan kab Lampung timur', 1807, 18, '0857830817', 8, '2023-07-20', 4, 6, 7, 1, 21),
(634, 'b 00287/Kdei taipei/230718', 'E1U08384', 'Trimay Munah', 2, 65, 2, 1, 'Dsn III kec Mataram baru kab Lampung tumur', 1807, 18, '081919222602', 1, '2023-07-20', 4, 6, 7, 1, 21),
(635, 'b 00288/Kdei taipei/230718', 'C 8593822', 'Gusri', 1, 65, 2, 1, 'Jl kemongo RT 094/091 Des Winong kec oenawangan grobokan Jawa tengah', 3315, 33, '081350403778', 1, '2023-07-20', 4, 6, 7, 1, 21),
(636, 'CPMI', 'E2802199', 'Muchtar Efendi Tobing', 1, 5, 1, 1, 'Jl. Dr Wahidin Lk III, Jati Makmur, Binjai Utara, Kota Binjai, Sumatera Utara', 1275, 12, '083113247158', 8, '2023-07-21', 2, 5, 4, 1, 10),
(637, 'CPMI', 'C6810836', 'Muhammad Febryansyah Ritonga', 1, 5, 1, 1, 'Jl. Tak Raw LK II, Timbang Langkat, Binjai Timur, Kota Binjai, Sumatera Utara', 1275, 12, '082365560368', 8, '2023-07-21', 2, 5, 4, 1, 10),
(638, 'CPMI', 'E3439906', 'Agus Tinus', 1, 5, 1, 1, 'Jl. Bayu LK I, Tanjung Bejo, Medan Sunggal, Kota Medan, Sumatera Utara', 1271, 12, '081296788787', 8, '2023-07-21', 2, 5, 4, 1, 10),
(639, 'NON-BRAFAK', 'C9996476', 'Rowin Mokodompit', 1, 1, 1, 1, 'Lorong Dokulu Rt/Rw. 13/06 Desa Moyag, Kota Mobagu Timur, Kotamobagu, Sulawesi Utara', 7174, 71, '-', 15, '2023-07-21', 2, 1, NULL, 0, 10),
(640, 'CPMI', 'E4074757', 'Abdul Ghofur', 1, 4, 1, 1, 'Dsn. Wayen, Rt/Rw. 07/04 Kayangan, Diwek, Jombang, Jawa Timur', 3517, 35, '085893345475', 8, '2023-07-20', 2, 5, 4, 1, 10),
(641, 'CPMI', 'E4075683', 'Ketut Hartanto', 1, 4, 1, 1, 'Giriharjo Rt/Rw. 01/01 Giriharjo, Puhpelem, Kab. Wonogiri, Jawa Tengah', 3312, 33, '085329091005', 8, '2023-07-20', 2, 5, 4, 1, 10),
(642, 'CPMI', 'E4076020', 'Badrus Salam', 1, 4, 1, 1, 'Darussalam Rt/Rw. 12/02 Jatimulyo, Jenggawah, Kab. Jember, Jawa Timur', 3509, 35, '081212214984', 8, '2023-07-20', 2, 5, 4, 1, 10),
(643, 'CPMI', 'E4076040', 'Sukamto', 1, 4, 1, 1, 'Dsn. Kapi Rt/Rw. 01/01 Kapi, Kunjang, Kunjang, Kab. Kediri, Jawa Timur', 3506, 35, '085711674738', 8, '2023-07-20', 2, 5, 4, 1, 10),
(644, 'CPMI', 'E4075658', 'Willianto Aji Saputro', 1, 4, 1, 1, 'Danaraja Rt/Rw. 03/03 Danaraja, Purwanegara, Kab. Banjarnegara, Jawa Tengah', 3304, 33, '081779543098', 8, '2023-07-20', 2, 5, 4, 1, 10),
(645, 'CPMI', 'C6873314', 'Rios Husada Putra', 1, 10, 1, 1, 'Kp. Bangko, Rt/Rw. 09/03 Dahu, Cikedal, Kab. Pandeglang, Banten', 3601, 36, '085773333772', 8, '2023-07-20', 2, 5, NULL, 0, 10),
(646, 'CPMI', 'C3291728', 'Andi', 1, 10, 1, 1, 'Dusun Fajar Rt/Rw. 01/01 Sungai Jaga A, Sungai Raya, Kab. Bengkayang, Kalimantan Barat', 6107, 61, '081215376005', 8, '2023-07-20', 2, 5, NULL, 0, 10),
(647, 'CPMI', 'E3400894', 'Yogi Nugraha Bn Eman Sulaeman', 1, 189, 7, 3, 'Kp. Anyar Rt/Rw. 20/05 Sindangsari, Ciranjang, Kab. Cianjur, Jawa Barat', 3203, 32, '087864084090', 8, '2023-07-20', 2, 5, 4, 1, 10),
(648, 'CPMI', 'E3494523', 'Yayan Setia Mulyana', 1, 1, 1, 1, 'Kp. Cimenteng Rt 002/Rw 015, Kel. Jagabaya, Kec. Cimaung', 3204, 32, '082258229756', 8, '2023-07-20', 2, 5, 4, 1, 17),
(649, 'CPMI', 'E3422078', 'Endang Suryana Bn Toyek Sarkum', 1, 205, 8, 3, 'Kp. Batu Karut Rt/Rw. 02/01 Liunggunung, Plered, Kab. Purwakarta, Jawa Barat', 3214, 32, '085963176188', 8, '2023-07-20', 2, 5, 4, 1, 10),
(650, 'CPMI', 'E4156556', 'Karang Gempita Simbolon', 1, 1, 1, 1, 'Jl. Lintas Samudra Rt/Rw. 08/03 Talang Langkat, Batang Gansal, Kab. Indragiri Hulu, Riau', 1402, 14, '082169849554', 8, '2023-07-20', 2, 5, 4, 1, 10),
(651, 'CPMI', 'E3776353', 'Advent Preddy Nababan', 1, 1, 1, 1, 'Jl. Bersama Psr Haras No. 7 LK IX, Sunggal, Medan Sunggal, Kota Medan, Sumatera Utara', 1271, 12, '082179360112', 8, '2023-07-20', 2, 5, 4, 1, 10),
(652, 'CPMI', 'E3495451', 'Rupiyanah', 2, 1, 1, 1, 'Kp. Bojong Rt/Rw. 02/01 Pasir, Kronjo, Kab. Tangerang, Banten', 3603, 36, '087817030210', 8, '2023-07-20', 2, 5, 4, 1, 10),
(653, 'CPMI', 'E3494538', 'Hajjah Maswah', 2, 1, 1, 1, 'Pulau Harapan Rt/Rw. 01/02 Pulau Harapan, Kep. Seribu Utara, Kepulauan Seribu, DKI Jakarta', 3101, 31, '083139493633', 8, '2023-07-20', 2, 5, 4, 1, 10),
(654, 'CPMI', 'E4299171', 'Mayang Puspita Sari', 2, 1, 1, 1, 'Kp. Ciparia Rt 004/Rw 005, Kel. Wargamekar, Kec. Bale Endah', 3204, 32, '083876317664', 8, '2023-07-20', 2, 5, 4, 1, 17),
(655, 'CPMI', 'C3019158', 'Arief Susanto', 1, 189, 7, 3, 'Lengek 2 Rt 002/Rw 005, Kel. Jatimulya, Kec. Terisi', 3212, 32, '081398933780', 8, '2023-07-20', 2, 5, 4, 1, 17),
(656, 'CPMI', 'C8090431', 'Muhammad Alham Amin Kasim', 1, 189, 7, 3, 'Jl. Saakonara Rt 007/Rw 003, Kel. Soa, Kec. Ternate Utara', 8271, 82, '081219728579', 8, '2023-07-20', 2, 5, 4, 1, 17),
(657, 'CPMI', 'C4727756', 'Agni Muhammad Malik', 1, 189, 7, 3, 'Cilolohan No. 52 Rt 004/Rw 008, Kel. Kahuripan, Kec. Tawang', 3206, 32, '081312454245', 8, '2023-07-20', 2, 5, 4, 0, 17),
(658, 'CPMI', 'C4999244', 'Yulandi Fadli', 1, 189, 7, 3, 'Jl. Kalui No. 146 Rt 006/Rw 003, Kel. Babussalam, Kec. Mandau', 1403, 14, '081275059465', 8, '2023-07-20', 2, 5, 4, 1, 17),
(659, 'CPMI', 'C9825357', 'Komang Hardi Wiguna', 1, 183, 6, 3, 'Banjar Dinas Bingin, Kel. Galungan, Kec. Sawan', 5108, 51, '0881037075866', 8, '2023-07-20', 2, 5, 4, 1, 17),
(660, 'PMI Non Brafak', 'XE486828', 'Deana Harahap Bt. Aman', 2, 200, 8, 3, NULL, 1271, 12, NULL, 16, '2023-07-20', 3, 1, NULL, 0, 9),
(661, 'PMI Non Brafak', 'XE433289', 'Yosefina Sue', 2, 1, 1, 1, NULL, 5308, 53, NULL, 16, '2023-07-20', 3, 1, NULL, 0, 9),
(662, 'CPMI', 'E4018277', 'Putu Diah Wardani', 2, 183, 6, 3, 'Banjar Dinas Kelodan, Kel. Ringdikit, Kec. Seririt', 5108, 51, '083838427876', 8, '2023-07-20', 2, 5, 4, 1, 17),
(663, 'CPMI', 'E3215434', 'Ida Widia  Wati', 2, 2, 1, 1, 'Kp. papak serang Rt 001/Rw 001, Kel. Serang Mekar, Kec. Ciparay', 3204, 32, '083826751691', 8, '2023-07-20', 2, 5, 4, 1, 17),
(664, 'SD.2671/WN/07/2023/04', 'XE434860', 'Sukki', 1, 1, 1, 1, 'DS. Torgulon kec.Robatal Kan. Sampang', 3527, 35, NULL, 3, '2023-07-21', 3, 1, 1, 0, 11),
(665, 'SD.2671/WN/07/2023/04', 'XE434866', 'Samat', 1, 1, 1, 1, 'DS.Ogan Lima Kec. Ogan Lima', 1803, 18, NULL, 99, '2023-07-21', 3, 1, 1, 0, 11),
(666, 'SD. 2671/WN//07/2023/04', 'XE434859', 'Purwanto', 1, 1, 1, 1, 'Dsn. Curah Lengkong RT. 019/007 Kec. kedung Jajang', 3508, 35, '0', 3, '2023-07-21', 3, 1, 5, 0, 1),
(667, 'SD.2671/WN/07/2023/04', 'XE434856', 'Ali Komba', 1, 1, 1, 1, 'DS.Ogan Lima Kec. Ogan Lima', 1803, 18, NULL, 99, '2023-07-21', 3, 1, 1, 0, 11),
(668, 'SD.2671/WN/07/2023/04', 'XE434861', 'Hamid', 1, 1, 1, 1, 'Kp. Pucuk Timur Kec. Tambru', 3528, 35, '082334849191', 3, '2023-07-21', 3, 1, 1, 0, 11),
(669, 'SD. 2671/WN/07/2023/04', 'XE434836', 'Sri Wahyuni', 2, 1, 1, 1, 'Ds. Umbul Sari RT. 04/06 Kec. Windusari', 3308, 33, '0', 6, '2023-07-21', 3, 1, NULL, 0, NULL),
(670, 'SD.2671/WN/07/2023/04', 'C9316446', 'Lisa Saharini', 2, 1, 1, 1, 'Kp.Bilik Pintar Kec. Setia budi', 3174, 31, '081283621460', 9, '2023-07-21', 3, 1, 1, 0, 11),
(671, 'SD.2671/WN/07/2023/04', 'XE434803', 'Zepri Situmorang', 1, 1, 1, 1, 'Jl. Pala Barat Blok B DS. Meyasem Kec. Kramat', 3328, 33, NULL, 15, '2023-07-21', 3, 1, 1, 0, 1),
(672, 'SD. 2671/WN/07/2023/04', 'XE434815', 'Sumpari', 2, 1, 1, 1, 'Kp. Poreh Ds. Poreh Kec. Kerampenan', 3527, 35, '0', 3, '2023-07-21', 3, 1, 5, 0, 1),
(673, 'SD. 2671/WN/07/2023/04', 'XE434819', 'Jusan', 1, 1, 1, 1, 'Ds. Saplasah Kec. Sepuluh', 3526, 35, '0', 3, '2023-07-21', 3, 1, 5, 0, 1),
(674, 'non brafax/Malaysia/21_7/2023', 'XE417013', 'Suryaningsih Bt Karsum Kawair', 2, 1, 1, 1, 'DS. Karangrena Kec. Maos', 3301, 33, NULL, 16, '2023-07-21', 3, 1, NULL, 0, 11),
(675, 'SD. 2671/WN/07/2023/04', 'XE434942', 'Abdul Aziz Muslim', 1, 1, 1, 1, 'Ds. Borok Toyang Kec. Cakra Barat', 5201, 52, '0', 3, '2023-07-21', 3, 1, 6, 0, 11),
(676, 'SD.2671/WN/07/2023/04', 'XE434838', 'Susilo Kuswari Ponimin', 2, 1, 1, 1, 'DS. Pengen Juru Tengah Kec. Purworejo', 3306, 33, NULL, 7, '2023-07-21', 3, 1, NULL, 0, 11),
(677, 'SD. 2671/WN/07/2023/04', 'XE434937', 'Yahya', 1, 1, 1, 1, 'Da. Kedawang Kec. Nguling', 3514, 35, '082340999899', 3, '2023-07-21', 3, 1, NULL, 0, 11),
(678, 'SD.2671/WN/07/2023/04', 'XE434816', 'Muhamad Rizalul Istigfar', 1, 1, 1, 1, 'Kp.Gunubg RIPIN DS. Barobali Kec. Batukliang', 5202, 52, '085337967717', 15, '2023-07-21', 3, 1, 6, 0, 11),
(679, 'SD.2671/WN/07/2023/04', 'XE434857', 'Agus Hambali', 1, 1, 1, 1, 'DS. Longlongan Kec. Sekotong', 5201, 52, NULL, 15, '2023-07-21', 3, 1, 6, 0, 11),
(680, 'SD.2671/WN/07/2023/04', 'XE434804', 'Munawir', 1, 1, 1, 1, 'DS. Mbawi Kec. Dompu', 5205, 52, '0', 11, '2023-07-21', 3, 1, 5, 0, 1),
(681, 'SD.2671/WN/07/2023/04', 'XE434833', 'Tina', 2, 1, 1, 1, 'DS.Ogan lima Kec. Abung Barat', 1803, 18, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(682, 'SD.2671/WN/07/2023/04', 'XE434834', 'Nur Laila', 2, 1, 1, 1, 'DS. Sumber Pura Kec. Sangkapura', 3525, 35, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(683, 'SD.2671/WN/07/2023/04', 'XE434832', 'Suliha', 2, 1, 1, 1, 'DS. Banyiur Kec. Sepuluh', 3526, 35, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(684, 'SD.2671/WN/07/2023/04', 'XE434801', 'Suwandi', 1, 1, 1, 1, 'DS. Sepuk Laut Kec. Sungai Kakap', 6112, 61, '0', 11, '2023-07-21', 3, 1, 5, 0, 1),
(685, 'SD.2671/WN/07/2023/04', 'XE434840', 'Yuliana', 2, 1, 1, 1, 'DS. Tanah Merah Kec. Tanah Merah', 3526, 35, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(686, 'SD.2671/WN/07/2023/04', 'XE434824', 'Sulistyawati Wiwik', 2, 1, 1, 1, 'DS. Tulungrejo Kec.Glenmore', 3510, 35, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(687, 'SD.2671/WN/07/2023/04', 'XE434802', 'Firdaus Anton Maulana', 1, 1, 1, 1, 'DS.Pesulan Kec. Petarukan', 3327, 33, '0', 3, '2023-07-21', 3, 1, 5, 0, 1),
(688, 'SD.2671/WN/07/2023/04', 'XE433270', 'Retno Wati', 2, 1, 1, 1, 'Dsn. Kahuripan DS.Cibuntu Kec. Pasawahan', 3208, 32, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(689, 'SD.2671/WN/07/2023/04', 'XE433271', 'Ayu Murca Ayi', 2, 1, 1, 1, 'Dsn. Kahuripan DS. Cibuntu Kec. Pasawahan', 3208, 32, '0', 16, '2023-07-21', 3, 1, 5, 0, 1),
(690, 'SD.2671/WN/07/2023/04', 'XE434933', 'Dani', 1, 1, 1, 1, 'Dusun Barat Kec. Dompu', 5205, 52, '0', 11, '2023-07-21', 3, 1, 5, 0, 1),
(691, 'NonBrafaks/ArabSaudi/VII/2023', 'E0795074', 'Nina Suryani', 2, 189, 7, 3, 'Karang Tengah Kec. Nagrak', 3202, 32, '0', 16, '2023-07-22', 3, 1, NULL, 0, NULL),
(692, 'NonBrafaks/ArabSaudi/VII/2023', 'C5127412', 'Meliyana Astuti', 2, 189, 7, 3, 'Pelabuhan ratu Kp. legok ds. citarik', 3202, 32, '0', 16, '2023-07-22', 3, 1, NULL, 0, NULL),
(693, 'NonBrafaks/ArabSaudi/VII/2023', 'C9469069', 'Nina Herlina', 2, 189, 7, 3, 'Purabaya kec. cimerang', 3202, 32, '0', 16, '2023-07-22', 3, 1, NULL, 0, NULL),
(694, 'NonBrafaks/ArabSaudi/VII/2023', 'E0805607', 'Rahmawati Rahmat Aca', 2, 189, 7, 3, 'Ds. cibadak RT 03/19 kec. cibadak', 3202, 32, '0', 16, '2023-07-22', 3, 1, NULL, 0, NULL),
(695, 'b 001221/Warsawa/230720', 'C5715805', 'Saepul Latip', 1, 172, 6, 3, 'Des jatirokeh RT 001/002 Songgom Brebes Jawa tengah', 3329, 33, '085713296208', 1, '2023-07-22', 4, 6, 7, 1, 21),
(696, 'b00199/Hongkong/230714', 'C7426757', 'Rosita', 2, 74, 3, 1, 'Kp pasar daon RT 001/093 Kel daon kec Rajeg kab Tangerang banten', 3603, 36, '083894132507', 16, '2023-07-20', 4, 6, 9, 1, 21),
(697, 'Non Brafak', 'E2281989', 'Komariyah', 2, 65, 2, 1, 'Blok Klampok RT 07/04 Kel. Segeran Lor Kec. Juntinyuat', 3212, 32, '083842410144', 16, '2023-07-22', 2, 1, 5, 1, 3),
(698, 'B-00239/Abu Dhabi/230720', 'B2988444', 'Ai BT Maman Mahpud', 2, 200, 8, 3, 'KP. Cikembang RT 01/13 Kel. Cikembang Kec. Kertasari', 3204, 32, '083151582841', 16, '2023-07-22', 2, 1, 5, 1, 3),
(699, 'B-00239/Abu Dhabi/230720', 'XE113299', 'Shamsa Ihsan Nullah', 2, 200, 8, 3, 'KP. Cikembang RT 01/13 Kec. Kertasari', 3204, 32, '083151582841', 99, '2023-07-22', 2, 4, 5, 1, 3),
(700, 'b 00216/Frankfurt /239723', 'C6811362', 'Nesty Tarigan', 1, 11, 1, 1, 'Dea merek kab karo Sumatra utara', 1206, 12, '081382123202', 16, '2023-07-22', 4, 6, 11, 1, 21),
(701, 'CPMI', 'E4289618', 'Sriyani', 2, 1, 1, 1, 'Kp. Barusinduk, Sumur Barang, Kec. Cobogo', 3213, 32, '081221125609', 8, '2023-07-23', 2, 5, 4, 1, 17),
(702, 'CPMI', 'E3009847', 'Ahmad Yusuf', 1, 1, 1, 1, 'Dusun Gondangrejo Rt 003/Rw 010, Kel. Gondangrejo, Kec. Windusari', 3308, 33, '08132742902', 8, '2023-07-23', 2, 5, 4, 1, 17),
(703, 'KBRI Khartoum', 'XE227945', 'Wiwi Wiarsih', 2, 55, 1, 1, 'Dusun Mariuk RT 02/01 Kel. Sukamulya Kec. Ujung Jaya', 3211, 32, NULL, 16, '2023-07-23', 3, 1, 1, 0, 3),
(704, 'KBRI Khartoum', 'AU354394', 'Titi Tariti Bt Carmun', 2, 55, 1, 1, 'Dusun Mariuk RT 03/02 Kec. Ujung Jaya', 3211, 32, NULL, 16, '2023-07-23', 3, 1, 1, 0, 3),
(705, 'Deportasi KBRI Riyadh', 'B8400129', 'Lasma Muda Simbar', 2, 189, 7, 3, 'Dsn Jakan RT 02/01 Desa Parseh Kec. Socah', 3526, 35, NULL, 16, '2023-07-23', 3, 1, NULL, 0, 3),
(706, 'pmi sudan', 'XE227944', 'Elah BT Surya Tasmin', 2, 55, 1, 1, 'Kp. Gandaria Malang RT 01/04 Kel. Gandaria Kec. Mekar Baru Tangerang', 3603, 36, NULL, 16, '2023-07-23', 3, 1, NULL, 0, 3),
(707, 'brafaks', 'AU375194', 'Suyimah Bt Isar Rasiman', 2, 189, 7, 3, 'Ds. tulung puyung', 3202, 32, '081909523923', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(708, 'brafaks', 'XE023951', 'Fitriani Ramdani', 2, 189, 7, 3, 'Ds. rengas sengklok utara', 3215, 32, '085693221205', 16, '2023-07-24', 1, 1, 5, 1, 8),
(709, 'brafaks', 'XE023720', 'Maunah Bt Ahmad Syadu', 2, 189, 7, 3, 'Kamper raya rt 2/5', 3326, 33, '085600414215', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(710, 'Brafaks', 'XE023150', 'Nuranisah Setianingsih Jarwoto', 2, 189, 7, 3, 'Ds. pakunceng rt 2/2', 3326, 33, '085712255026', 16, '2023-07-24', 1, 1, 5, 1, 8),
(711, 'brafaks', 'XE024051', 'Nani Bt Sabun Seran', 2, 189, 7, 3, 'Da. sabajaya kec tirtayasa', 3215, 32, '-', 16, '2023-07-24', 1, 1, 5, 1, 8),
(712, 'Brafaks', 'C7787515', 'Oleh Bt Andi Adam', 2, 189, 7, 3, 'Ds.bagung kec, ligung', 3210, 32, '083195600243', 16, '2023-07-24', 1, 1, 5, 1, 8),
(713, 'Brafaks', 'C8281814', 'Iswatul Faizah', 2, 189, 7, 3, 'Ds. padi talang kec. turen', 3507, 35, '085100323918', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(714, 'Brafaks', 'C6940093', 'Sumiah Bt Tolib', 2, 189, 7, 3, 'Ds. cigugur', 3213, 32, '082120607264', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(715, 'Brafaks', 'XE023781', 'Nisa Fitri Bt Salim', 2, 189, 7, 3, 'Ds. kencana', 3210, 32, '085840054419', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(716, 'Brafaks', 'E1067317', 'Ranti Sundari', 2, 189, 7, 3, 'Ds. gunung hejo', 3214, 32, '081523765821', 16, '2023-07-24', 1, 1, 5, 1, 8),
(717, 'Brafaks', 'XE024159', 'Ida Nur Aida', 2, 189, 7, 3, 'Ds. jari tengah', 3210, 32, '083121594429', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(718, 'Brafaks', 'XE085888087153', 'IiS Kholisoh Bt Ujang', 2, 189, 7, 3, 'Ds. sundajaya rt 24/07 kec. sukabumi', 3202, 32, '085888087158', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(719, 'Brafaks', 'XE023709', 'Hotimah Bt Uci Hari', 2, 189, 7, 3, 'Ds. jampang kulon', 3202, 32, '085659112237', 16, '2023-07-24', 3, 1, NULL, 0, 1),
(720, 'NonBrafaks/Bahrain/VII/2023', 'C4044051', 'Siti Aminah', 2, 195, 7, 3, 'Karang Baru RT. 00/00 Segala Anyar Kec. Pujut', 5202, 52, '081917187662', 16, '2023-07-23', 3, 1, NULL, 0, 1),
(721, 'Brafaks/ArabSaudi/24072023', 'XE023892', 'Nurhikmah Bt Romli', 2, 189, 7, 3, 'Kepuh kiriman RT. 01/08 Kec. Waru', 3515, 35, '081999977510', 16, '2023-07-24', 3, 1, NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jabatan`
--

CREATE TABLE `jabatan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_penjemput` varchar(255) DEFAULT NULL,
  `hubungan_dengan_pmi` varchar(255) DEFAULT NULL,
  `no_telp_penjemput` varchar(255) DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_penjemput` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jemput_keluarga`
--

INSERT INTO `jemput_keluarga` (`id`, `id_kepulangan`, `id_imigran`, `nama_penjemput`, `hubungan_dengan_pmi`, `no_telp_penjemput`, `tanggal_serah_terima`, `foto_penjemput`, `foto_serah_terima`, `id_user`) VALUES
(1, 5, 48, 'dudung bin odin', 'ayah', '085716371673', '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/3c4cdeab-0e7b-4aa7-aa21-52e69120c772.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6fae8f56-ac98-4b2a-a6d7-03c6f4682e26.jpg', 9),
(2, 5, 50, 'hanifah', 'adik ipar', '085881035499', '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/7de4ebd9-d2e0-4b86-8aa8-4569de759c6e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2dd0d280-42ad-41a6-8e0f-a3bd2edf8471.jpg', 9),
(3, 5, 58, 'ISNAIN AFANDI', 'Menantu', '085919215660', '2023-06-21', 'https://kepulanganbp3mibanten.site/public/uploads/5a444cbd-bac0-41c8-b464-4eb7c786179a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/66b58f83-cf3b-4cf4-99ff-f6c7ccd97c3b.jpg', 16),
(5, 5, 83, 'Anton Wahyudi', 'Paman', '081399364484', '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/293587a7-030f-4de8-81b1-cecb0b753aee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/161ec560-f5c0-48db-8076-4b505fc3e577.jpg', 3),
(6, 5, 111, 'untung leksono', 'anak', '081318280397', '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/36f973ab-b4ba-411e-9905-daca595afc6a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2ac7849c-e867-4042-ae16-199eb7756bcd.jpg', 9),
(7, 5, 113, 'ayo', 'ayah', '085890565652', '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/e0da2ec2-b5ca-473f-890c-400a8093c210.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1c386924-e41d-4937-9eef-a6c0188b1404.jpg', 9),
(8, 5, 223, 'Jumsikah', 'Kakak kandung', '085863098475', '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/e2e59339-65ce-48a8-8d0c-2453df2a7cbc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e245a26d-dafa-406a-bfa0-4eee1ad1bf07.jpg', 1),
(9, 5, 225, 'Jumsikah', 'Tante', '085863098475', '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/65a4398f-f8c8-4624-ab54-3fcc75fd8b3d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b5a5c3d0-33ed-4f4c-8b3b-22a32a14e599.jpg', 1),
(10, 5, 226, 'Jumsikah', 'Tante', '085863098475', '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/4698e496-12f9-4e67-aad8-da73aa1c73c4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4bc60d13-f54d-4f0c-8284-669000d8bed0.jpg', 1),
(11, 5, 207, 'Neneh', 'adik Kandung', '085861251325', '2023-07-03', 'https://kepulanganbp3mibanten.site/public/uploads/dca438f9-2571-4ac4-87f1-42c981be9114.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e10861b5-0a11-4a01-a722-fca29b83ea26.jpg', 16),
(12, 5, 306, 'taopik sahidan', 'anak', '085318822245', '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/877d6dee-43a1-4206-b6ea-4a0f822c90ea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c7df8414-5fea-4afd-8b26-9052aec2be18.jpg', 9),
(13, 5, 333, 'Suhdi', 'Anak menantu', '087777509288', '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/b270b570-476e-4e0f-817a-85a9cb26b6de.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0f38142a-6e27-4b3a-b024-36212feaa4cb.jpg', 3),
(14, 5, 334, 'Suha Nabella', 'Sepupu', '085377249063', '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/3f213dcf-bb13-41c8-be60-464700b9d53d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4b93202e-683c-414a-8e9a-72d6af5496b5.jpg', 3),
(15, 5, 337, 'Didik Susanto', 'adik kandung', '-', '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/2d9f5016-e443-4158-9369-3a472f155d1b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/49565bd4-781b-4d8a-8497-d4369a01413d.jpg', 16),
(16, 5, 307, 'Katri Apriyani', 'adik Kandung', '+62 895-3243-98966', '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/ca22015f-c5fb-431b-ac49-80211de1b902.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48b6c343-feef-4e42-b144-42eddd649f9a.jpg', 16),
(17, 5, 398, 'SRI AYU WIDANINGSIH', 'KEPONAKAN', '085714805737', '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/af4e23d0-3a8d-43f1-aa54-3dfc26848e9e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2438836-6ee8-47fb-93b7-18306002fcbe.jpg', 8),
(18, 5, 423, 'Toto Raharjo', 'Kakak Ipar', '087776530301', '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/a220e89f-8080-4360-8835-fa09ee2647ac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bd9adc38-4c09-4a8f-b04c-bd14a9aad96d.jpg', 3),
(19, 5, 488, 'Warsem', 'Bibi', '085894401939', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/80dca1b1-f06d-4ae2-859c-b3eea0b42d5b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0a031bab-8ddc-4a8c-a5de-41315ff967b4.jpg', 3),
(20, 5, 531, 'Lely Irawati', 'saudara kandung', '-', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/bb3a22aa-e51f-495b-a8cd-f1096f2936cf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cf08d2ac-a22c-4c29-84ef-d9c0b4e72734.jpg', 16),
(21, 5, 532, 'Yayah Pardiana', 'ibu kandung', '-', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/e8c397dc-058c-4792-b2cd-fed2da2eb72e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3cd3828f-e9fa-41f1-ad8b-f7fadb997148.jpg', 16),
(22, 5, 533, 'Satang', 'ayah', '-', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/55b929a7-22df-4fbe-8aa8-fa22eca34905.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fc1bd36a-1acf-42a6-9cc8-7985bdcd3625.jpg', 16),
(23, 5, 534, 'Riski Novriansah', 'Saudara Sepupu', '-', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/4a04b87e-a6d6-4f92-834f-5d880aca2958.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/64883c28-c092-434d-9fd4-8cc0234b59a1.jpg', 16),
(24, 5, 490, 'Muhammad Fizki Abdulrochim', 'Menantu', '-', '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/4b26e50c-b5c0-4444-9ed5-7992f053d5b6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a4b97898-ee37-4767-a702-9ed28d8549c1.jpg', 16),
(25, 5, 535, 'Moelyono Soesanto Putra', 'Saudara Kandung', '083123430470', '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/12f5e845-7278-445f-90e0-6e7b784d26f2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/80339424-b9af-4e5c-afba-76ccd113f837.jpg', 3),
(26, 5, 581, 'Ryan Septiadi', 'Anak Kandung', '089664368884', '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/ce37e22e-a5a3-4731-b413-afd226f148ee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/db58c688-6557-40ac-8452-cd785a859843.jpg', 3),
(27, 5, 622, 'Yana Suryana', 'Suami', '085883086286', '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/4b703def-179a-494b-8012-1be6370ba391.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b4db1801-e8f7-4f29-a1ee-f6a76950fd59.jpg', 10),
(28, 5, 623, 'Ani Indriani', 'Adik Kandung', '089681710006', '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/91cef5aa-1548-4331-aac7-b7e1730680ce.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ac48f442-a803-4142-bde5-12d536bf68b1.jpg', 10),
(29, 5, 624, 'Dwi Setyo Mahendro', 'Suami', '087881968729', '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/f0bb7345-1aa1-4c12-868a-0512bd9a4fea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/311d9beb-b39e-4f60-8697-27012954ebd8.jpg', 10),
(30, 5, 625, 'Siti Mulyati', 'Ibu Mertua', '085773807349', '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/d1cd37e2-a8e6-4d88-af14-0600aaa21dab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9c88a52a-3a3b-4368-a2a0-df6824de11d4.jpg', 10),
(31, 5, 688, 'muhamad ipan cahyadi', 'kakak', '089501133306', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/a7e8ca50-a6a1-49f3-9099-05aa1aefaf54.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45b5c6bb-ea2f-4020-9558-72798f818532.jpg', 1),
(32, 5, 673, 'abdul rouf', 'sepupu', '087850924894', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/af8e2cf7-0a58-4a6e-b9ab-f5a3d8966b5b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/af2335f2-c8ba-4e2a-a82b-3bd3dba87cd9.jpg', 1),
(33, 5, 672, 'Abdullah Rangga Saputra', 'Keponakan', '081315467540', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/fc90e953-486a-4180-8f1c-9d912cadf179.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e1e434f5-98b2-487c-82d2-d10be6340726.jpg', 1),
(34, 5, 666, 'Ahmad Suaidin', 'Kakak', '082302448959', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/21561220-169c-4508-97f6-8be22999fea6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0b88f332-2d90-486f-8e3b-5e63dedf3514.jpg', 1),
(35, 5, 690, 'Muhammad Putra', 'Saudara', '085238943356', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/096decbc-f0c9-4031-8bbd-47e9ea61df04.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8b585f29-7e38-46ca-969a-d8bc9206d2e4.jpg', 1),
(36, 5, 680, 'Muhammad Putra', 'Kakak Sepupu', '085238943356', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/98f5d8e8-c304-43e5-9a44-dd9d29c740ff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ee947321-80c0-4257-a2b0-632de6e6c353.jpg', 1),
(37, 5, 689, 'muhammad ipan cahyada', 'Kakak', '089501133306', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/1c1f5f10-4150-4320-911f-b29bafc5b277.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0eab8a41-daaa-4048-be15-2a38d4fd760c.jpg', 1),
(38, 5, 687, 'Andri Kaharno', 'Ayah', '087892792962', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/43db082b-d7cc-4b14-a9db-dabe7c4aa057.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/319173da-f104-482b-9729-1bd3bf633c9b.jpg', 1),
(39, 5, 686, 'sukron', 'sepupu', '081153975287', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/6b94e6bd-d430-4a9a-adb0-9b038324571f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c6745568-cec0-4f72-a0de-d4168b828723.jpg', 1),
(40, 5, 685, 'Sukron', 'Kakak ipar', '087778319411', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/057828e2-dde4-4f51-8b3a-a60186c12235.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/06d472e3-8727-4cec-8ec3-bd5dfdc3d7da.jpg', 1),
(41, 5, 684, 'edi kurniawan', 'kakak sepupu', '0813947044414', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/52dd0ca4-d99e-4eac-93f3-9d21434ea3b2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/98f8c5a9-082e-4746-b665-b06f592ec3bd.jpg', 1),
(42, 5, 683, 'Ririn masrina', 'Kakak', '087758828386', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/3042a3bf-c44d-42b2-898a-88adef3d411d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ab4747f2-ada7-4d3e-a347-9fed31032c87.jpg', 1),
(43, 5, 682, 'Cahaya rizki', 'saudara', '082279866368', '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/8c23d95e-7f98-4a5b-af4f-f5cd7df94c1a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/afbb3cd8-8318-4787-9b5c-5ba5683ed1ca.jpg', 1),
(44, 5, 681, 'cahaya rizki', 'saudara', '082279866368', '2023-07-22', 'https://kepulanganbp3mibanten.site/public/uploads/a5eaecf6-0578-4baf-bc1a-e47384f0d877.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b1d48f0d-f98f-41ac-9f64-3e7dd3dbda60.jpg', 1),
(45, 5, 697, 'Kusni', 'Ponakan Mama', '0895326991225', '2023-07-22', 'https://kepulanganbp3mibanten.site/public/uploads/c56a38f2-abe9-4777-ae3c-6efadb178e91.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/289f5a4d-f6c6-4bca-8d95-4c24c72df884.jpg', 3),
(46, 5, 698, 'Ayu Dita Emalia', 'Anak Kandung', '083151582841', '2023-07-22', 'https://kepulanganbp3mibanten.site/public/uploads/7679b43e-8dc6-4969-83c0-377e8a580e88.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ef5e6109-3b50-4a8f-afa0-1e54696d676a.jpg', 3),
(47, 5, 699, 'Ayu Dita Emalia', 'Anak Kandung Ibu Ai', '083151582841', '2023-07-22', 'https://kepulanganbp3mibanten.site/public/uploads/244c83df-8ae6-4ad7-a58f-510e4a4c938f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/08f18a4f-5465-42c0-8a91-f272ad10f7fa.jpg', 3),
(48, 5, 708, 'cipto trguh', 'suami', '-', '2023-07-24', 'https://kepulanganbp3mibanten.site/public/uploads/0492383a-a89c-4548-b7b7-86d082149f89.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/983296e7-4702-4ad0-abe3-bfb6cd517159.jpg', 8),
(49, 5, 711, 'tarsin', 'suami', '085714156472', '2023-07-24', 'https://kepulanganbp3mibanten.site/public/uploads/246cc8e6-f607-4e99-9ede-06eb1013fd3e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0ac2f597-0c38-44b8-8c85-753f84f99a34.jpg', 8),
(50, 5, 710, 'Andi', 'keponakan', '08514770946', '2023-07-24', 'https://kepulanganbp3mibanten.site/public/uploads/804e8a58-f7b7-4614-85e3-2a0572504282.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/053ca62e-fe9c-4076-9e6d-5d55bfad1d6a.jpg', 8),
(51, 5, 712, 'Royan', 'suami', '083195600243', '2023-07-24', 'https://kepulanganbp3mibanten.site/public/uploads/f100dc90-bd42-49cc-aca3-2cf70984c7e7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8203c52c-a614-473a-8595-2aa0a2ac866b.jpg', 8),
(52, 5, 716, 'Endang supandi', 'Bapak Kandung', '081523765821', '2023-07-24', 'https://kepulanganbp3mibanten.site/public/uploads/52baa2de-3896-4e35-9947-72934ab44289.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/743787f8-1c1d-4b7f-b85d-6b31a9a95316.jpg', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jemput_pihak_lain`
--

CREATE TABLE `jemput_pihak_lain` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_bast_pihak_lain` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jemput_pihak_lain`
--

INSERT INTO `jemput_pihak_lain` (`id`, `id_kepulangan`, `id_imigran`, `id_bast_pihak_lain`) VALUES
(1, 6, 62, 1),
(2, 6, 272, 2),
(3, 6, 439, 3),
(4, 6, 438, 3),
(5, 6, 679, 4),
(6, 6, 675, 4),
(7, 6, 678, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenazah`
--

CREATE TABLE `jenazah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_cargo` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_jenazah` varchar(255) DEFAULT NULL,
  `foto_paspor` varchar(255) DEFAULT NULL,
  `foto_brafaks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenazah`
--

INSERT INTO `jenazah` (`id`, `id_imigran`, `id_cargo`, `foto_jenazah`, `foto_paspor`, `foto_brafaks`) VALUES
(1, 239, 2, 'https://kepulanganbp3mibanten.site/public/uploads/59c03e45-9e35-4332-b820-b86c3a99d3f0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48477a0e-7058-49b4-9e44-5df186378bbe.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/635c8a72-70a1-4155-81c4-bce71c063627.jpg'),
(2, 263, 1, 'https://kepulanganbp3mibanten.site/public/uploads/d0260575-be47-4d71-b2cb-f2b403dc165b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aa831808-4ca8-4d6c-ac02-143e7d12f841.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/008bb20b-07fe-4e60-88bd-3d0a76b6e0c7.jpg'),
(3, 282, 1, 'https://kepulanganbp3mibanten.site/public/uploads/dc856873-7136-47e2-8392-f846a5b62d49.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f0c882b8-3316-47cb-a5b9-612dfe6136df.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a2584c3d-0910-4ccd-8b55-80ce96b2a1f9.jpg'),
(4, 318, 1, 'https://kepulanganbp3mibanten.site/public/uploads/97b22f86-ddfd-44b1-a6be-3c8d1e260e95.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a5d26b2f-59c8-40d5-83a0-cac01033cbbf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4d2d6f13-6f53-413c-9727-dd95e3cebc11.jpg'),
(5, 320, 2, 'https://kepulanganbp3mibanten.site/public/uploads/439955b9-c775-403e-9588-567011f76c4a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/150ff028-7477-4abb-b970-7e0c390dbfa0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/88681f9e-722a-4327-a021-899eeb3cd6a3.jpg'),
(6, 321, 2, 'https://kepulanganbp3mibanten.site/public/uploads/b21d5887-7626-4cc0-920b-0fecd6d234bd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b6627020-b9e3-4c09-9e4d-59e81ff062aa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/53f1d1cf-c061-4996-93be-1dba50143db6.jpg'),
(7, 322, 1, 'https://kepulanganbp3mibanten.site/public/uploads/07fc8851-8814-4e9e-ba5c-df89f79881d2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dddfd4cd-720c-467e-9330-b57abbbf3456.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6d642fbe-24a1-43ff-acd5-f6f2f8597027.jpg'),
(8, 323, 1, 'https://kepulanganbp3mibanten.site/public/uploads/f886b751-5819-4351-8cf8-b61681e9fa4e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d178cc84-a257-4a07-9a23-410ebdaeca85.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/09dd71d1-1704-4140-9833-8af63d9c4a02.jpg'),
(9, 440, 1, 'https://kepulanganbp3mibanten.site/public/uploads/e40e2e9c-a487-40a4-bf54-1b481bd3799b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d320ac24-c316-417d-9435-80ad2ed683b2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fd090d44-b8df-46d0-a22b-85e6e33794a5.jpg'),
(10, 493, 1, 'https://kepulanganbp3mibanten.site/public/uploads/8c930628-8c61-4271-a18b-6c552236b8cf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8770ba63-c48c-4943-8c56-131797f13b84.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/68deeb53-6146-4ff9-a453-120ebb8d926f.jpg'),
(11, 510, 1, 'https://kepulanganbp3mibanten.site/public/uploads/6b3b4a64-7f4d-4cc1-bd07-e12d4bac0851.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e8dabf79-118d-404b-8117-aa1371b028de.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/188725d9-987a-4fdc-842a-5cf571647371.jpg'),
(12, 553, 1, 'https://kepulanganbp3mibanten.site/public/uploads/8125ffce-32fd-4b1e-bb1b-d549c558c89a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/23574103-36df-49ae-80db-d6ed4fe65d4e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a8e45b7-a1ac-4186-ac0d-62447b093330.jpg'),
(13, 579, 1, 'https://kepulanganbp3mibanten.site/public/uploads/7cf98e36-e9ec-453e-b6ac-6bc0fc126639.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/29afbc4c-6275-45a8-a57d-0a7c2625da62.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1776b6a1-85b1-455e-8f1f-c4ad6d9bbdc2.jpg'),
(14, 628, 1, 'https://kepulanganbp3mibanten.site/public/uploads/7ca6e0ec-c7dc-423f-9a1a-5917d5a49ff9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e249475c-abf2-48e8-8fbf-dbd0d4ae47f9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45a913b1-e6c4-4168-b85d-fa62ea21394b.jpg'),
(15, 630, 1, 'https://kepulanganbp3mibanten.site/public/uploads/f45a1515-c936-4699-ac55-6bf745b211fb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f85b1473-3557-4382-bb7f-76c643ae6321.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/475590ec-91f7-499b-958b-0b5f0e6424b4.jpg'),
(16, 632, 1, 'https://kepulanganbp3mibanten.site/public/uploads/366b20fa-b0bc-4f86-a4ab-4ecc17706213.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a2cc6b1d-a679-41ae-9989-4c343f680672.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/27a5c6bc-c890-448e-98cf-b92346e09826.jpg'),
(17, 633, 1, 'https://kepulanganbp3mibanten.site/public/uploads/b02c6ec0-924d-4101-8bb4-0cf42011e845.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3fbb4ba5-8afb-4cdd-a216-c4cc55851d93.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ec51b7fb-dcdb-4b0e-9d4a-8aefc901be2d.jpg'),
(18, 634, 1, 'https://kepulanganbp3mibanten.site/public/uploads/241e832d-90c9-4058-a873-6e2b6c73f232.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/18b1a2b2-abee-40fa-a2cc-b0619607697f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ca164a17-70ad-4ccf-a4cf-cbbceec8cf7d.jpg'),
(19, 635, 2, 'https://kepulanganbp3mibanten.site/public/uploads/3f16a4c4-44d4-4fb4-bcb5-adf56cbde17f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5a67c4a0-ac33-498e-a555-574c3497085c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a0ef092a-964a-4858-98b1-bc305f752d2c.jpg'),
(20, 695, 1, 'https://kepulanganbp3mibanten.site/public/uploads/fda97326-67e4-45bf-9834-c818a0225872.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/35c00838-065c-4f88-935c-6e9bd6fb002e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/80dce990-97f0-4d65-92cf-97974dded191.jpg'),
(21, 696, 2, 'https://kepulanganbp3mibanten.site/public/uploads/d92d0948-c700-4415-b1f7-5f612c256652.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/61294f28-8bfc-47b0-9a78-347b5158df6b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ace98871-e6b7-4450-bbb4-4c54f05a71b0.jpg'),
(22, 700, 4, 'https://kepulanganbp3mibanten.site/public/uploads/86041803-c3ba-434e-8f23-ffe7a7ac9c82.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f059c68c-4211-4d5a-a1af-d574658183aa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8e19fb41-d9d3-4b07-8a70-0d3219113f32.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kelamin`
--

CREATE TABLE `jenis_kelamin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_provinsi` bigint(20) UNSIGNED DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_cargo` bigint(20) UNSIGNED DEFAULT NULL
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
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_group` bigint(20) UNSIGNED DEFAULT NULL
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
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL
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
  `id_layanan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_masalah` bigint(20) UNSIGNED DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_bast_makan` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `makan`
--

INSERT INTO `makan` (`id`, `id_imigran`, `id_bast_makan`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 7, 1),
(4, 8, 1),
(5, 9, 1),
(6, 10, 1),
(7, 11, 1),
(8, 16, 2),
(9, 15, 2),
(10, 14, 2),
(11, 13, 2),
(12, 11, 2),
(13, 10, 2),
(14, 9, 2),
(15, 8, 2),
(16, 7, 2),
(17, 6, 2),
(18, 5, 2),
(19, 5, 3),
(20, 6, 3),
(21, 7, 3),
(22, 8, 3),
(23, 9, 3),
(24, 10, 3),
(25, 11, 3),
(26, 5, 4),
(27, 7, 4),
(28, 8, 4),
(29, 6, 4),
(30, 9, 4),
(31, 11, 4),
(32, 10, 4),
(33, 5, 5),
(34, 7, 5),
(35, 8, 5),
(36, 6, 5),
(37, 11, 5),
(38, 9, 5),
(39, 43, 5),
(40, 10, 5),
(41, 5, 6),
(42, 7, 6),
(43, 8, 6),
(44, 6, 6),
(45, 10, 6),
(46, 58, 6),
(47, 5, 7),
(48, 7, 7),
(49, 8, 7),
(50, 6, 7),
(51, 10, 7),
(52, 58, 7),
(53, 5, 8),
(54, 6, 8),
(55, 7, 8),
(56, 8, 8),
(57, 10, 8),
(58, 58, 8),
(59, 64, 9),
(60, 63, 9),
(61, 62, 9),
(62, 61, 9),
(63, 60, 9),
(64, 59, 9),
(65, 64, 10),
(66, 63, 10),
(67, 62, 10),
(68, 61, 10),
(69, 60, 10),
(70, 59, 10),
(71, 83, 11),
(72, 81, 11),
(73, 64, 11),
(74, 63, 11),
(75, 62, 11),
(76, 61, 11),
(77, 60, 11),
(78, 59, 11),
(79, 64, 12),
(80, 63, 12),
(81, 62, 12),
(82, 61, 12),
(83, 60, 12),
(84, 59, 12),
(85, 64, 13),
(86, 59, 13),
(87, 60, 13),
(88, 61, 13),
(89, 63, 13),
(90, 62, 13),
(91, 59, 14),
(92, 60, 14),
(93, 61, 14),
(94, 63, 14),
(95, 64, 14),
(96, 102, 14),
(97, 103, 14),
(98, 104, 14),
(99, 110, 14),
(100, 109, 14),
(101, 107, 14),
(102, 106, 14),
(103, 105, 14),
(104, 123, 15),
(105, 102, 15),
(106, 59, 15),
(107, 60, 15),
(108, 61, 15),
(109, 123, 16),
(110, 102, 16),
(111, 59, 16),
(112, 60, 16),
(113, 61, 16),
(114, 123, 17),
(115, 102, 17),
(116, 61, 17),
(117, 60, 17),
(118, 59, 17),
(119, 59, 18),
(120, 107, 18),
(121, 105, 18),
(122, 102, 18),
(123, 60, 18),
(124, 61, 18),
(125, 59, 19),
(126, 123, 19),
(127, 60, 19),
(128, 102, 19),
(129, 61, 19),
(130, 59, 20),
(131, 123, 20),
(132, 60, 20),
(133, 61, 20),
(134, 102, 20),
(135, 131, 20),
(136, 133, 20),
(137, 132, 20),
(138, 134, 20),
(139, 59, 21),
(140, 123, 21),
(141, 60, 21),
(142, 61, 21),
(143, 102, 21),
(144, 60, 22),
(145, 204, 23),
(146, 203, 23),
(147, 202, 23),
(148, 207, 24),
(149, 206, 24),
(150, 204, 24),
(151, 203, 24),
(152, 202, 24),
(153, 207, 25),
(154, 206, 25),
(155, 204, 25),
(156, 203, 25),
(157, 202, 25),
(158, 208, 26),
(159, 207, 26),
(160, 206, 26),
(161, 204, 26),
(162, 203, 26),
(163, 202, 26),
(164, 207, 27),
(165, 206, 27),
(166, 204, 27),
(167, 203, 27),
(168, 202, 27),
(169, 202, 28),
(170, 204, 28),
(171, 203, 28),
(172, 207, 28),
(173, 206, 28),
(174, 202, 29),
(175, 204, 29),
(176, 203, 29),
(177, 207, 29),
(178, 206, 29),
(179, 227, 29),
(180, 224, 29),
(181, 202, 30),
(182, 204, 30),
(183, 203, 30),
(184, 207, 30),
(185, 206, 30),
(186, 202, 31),
(187, 204, 31),
(188, 203, 31),
(189, 206, 31),
(190, 207, 31),
(191, 259, 32),
(192, 202, 32),
(193, 204, 32),
(194, 203, 32),
(195, 206, 32),
(196, 207, 32),
(197, 260, 33),
(198, 204, 33),
(199, 203, 33),
(200, 207, 33),
(201, 206, 33),
(202, 260, 34),
(203, 204, 34),
(204, 206, 34),
(205, 207, 34),
(206, 260, 35),
(207, 204, 35),
(208, 207, 35),
(209, 206, 35),
(210, 260, 36),
(211, 204, 36),
(212, 206, 36),
(213, 207, 36),
(214, 204, 37),
(215, 207, 37),
(216, 206, 37),
(217, 260, 37),
(218, 272, 37),
(219, 204, 38),
(220, 207, 38),
(221, 206, 38),
(222, 260, 38),
(223, 206, 39),
(224, 260, 39),
(225, 204, 39),
(226, 207, 39),
(227, 204, 40),
(228, 260, 40),
(229, 206, 40),
(230, 207, 40),
(231, 206, 41),
(232, 260, 41),
(233, 207, 41),
(234, 204, 41),
(235, 206, 42),
(236, 260, 42),
(237, 204, 42),
(238, 260, 43),
(239, 206, 43),
(240, 204, 43),
(241, 260, 44),
(242, 206, 44),
(243, 204, 44),
(244, 206, 45),
(245, 260, 45),
(246, 204, 45),
(247, 288, 46),
(248, 287, 46),
(249, 308, 47),
(250, 307, 47),
(251, 204, 47),
(252, 308, 48),
(253, 307, 48),
(254, 204, 48),
(255, 204, 49),
(256, 308, 49),
(257, 307, 49),
(258, 204, 50),
(259, 308, 50),
(260, 307, 50),
(261, 204, 51),
(262, 308, 51),
(263, 307, 51),
(264, 204, 52),
(265, 307, 52),
(266, 308, 52),
(267, 338, 52),
(268, 337, 52),
(269, 339, 52),
(270, 341, 52),
(271, 204, 53),
(272, 307, 53),
(273, 308, 53),
(274, 338, 53),
(275, 339, 53),
(276, 341, 53),
(277, 204, 54),
(278, 308, 54),
(279, 338, 54),
(280, 339, 54),
(281, 341, 54),
(282, 343, 54),
(283, 342, 54),
(284, 357, 54),
(285, 355, 54),
(286, 356, 54),
(287, 357, 55),
(288, 356, 55),
(289, 355, 55),
(290, 343, 55),
(291, 342, 55),
(292, 341, 55),
(293, 339, 55),
(294, 338, 55),
(295, 308, 55),
(296, 204, 55),
(297, 204, 56),
(298, 308, 56),
(299, 356, 56),
(300, 343, 56),
(301, 342, 56),
(302, 355, 56),
(303, 357, 56),
(304, 204, 57),
(305, 308, 57),
(306, 342, 57),
(307, 343, 57),
(308, 361, 57),
(309, 204, 58),
(310, 308, 58),
(311, 361, 58),
(312, 343, 58),
(313, 342, 58),
(314, 379, 58),
(315, 204, 59),
(316, 379, 59),
(317, 361, 59),
(318, 343, 59),
(319, 361, 60),
(320, 379, 60),
(321, 204, 60),
(322, 343, 60),
(323, 407, 60),
(324, 406, 60),
(325, 405, 60),
(326, 404, 60),
(327, 403, 60),
(328, 204, 61),
(329, 379, 61),
(330, 343, 61),
(331, 406, 61),
(332, 405, 61),
(333, 404, 61),
(334, 403, 61),
(335, 407, 61),
(336, 343, 62),
(337, 379, 62),
(338, 406, 62),
(339, 405, 62),
(340, 404, 62),
(341, 403, 62),
(342, 407, 62),
(343, 343, 63),
(344, 379, 63),
(345, 406, 63),
(346, 405, 63),
(347, 404, 63),
(348, 403, 63),
(349, 407, 63),
(350, 406, 64),
(351, 405, 64),
(352, 404, 64),
(353, 403, 64),
(354, 407, 64),
(362, 407, 66),
(363, 406, 66),
(364, 405, 66),
(365, 404, 66),
(366, 403, 66),
(367, 407, 67),
(368, 406, 67),
(369, 405, 67),
(370, 404, 67),
(371, 403, 67),
(372, 407, 68),
(373, 406, 68),
(374, 405, 68),
(375, 404, 68),
(376, 403, 68),
(377, 407, 69),
(378, 406, 69),
(379, 405, 69),
(380, 404, 69),
(381, 403, 69),
(382, 407, 70),
(383, 406, 70),
(384, 405, 70),
(385, 404, 70),
(386, 403, 70),
(387, 407, 71),
(388, 403, 71),
(389, 404, 71),
(390, 405, 71),
(391, 406, 71),
(392, 492, 72),
(393, 491, 72),
(394, 490, 72),
(395, 489, 72),
(396, 507, 73),
(397, 506, 73),
(398, 492, 73),
(399, 491, 73),
(400, 489, 73),
(401, 492, 74),
(402, 491, 74),
(403, 506, 74),
(404, 491, 75),
(405, 492, 75),
(406, 506, 75),
(407, 491, 76),
(408, 492, 76),
(409, 506, 76),
(410, 492, 77),
(411, 506, 77),
(412, 491, 77),
(413, 491, 78),
(414, 492, 78),
(415, 492, 79),
(416, 491, 79),
(417, 491, 80),
(418, 492, 80),
(419, 492, 81),
(420, 492, 82),
(421, 492, 83),
(422, 578, 84),
(423, 577, 84),
(424, 492, 84),
(425, 492, 85),
(426, 578, 85),
(427, 577, 85),
(428, 492, 86),
(429, 578, 86),
(430, 578, 87),
(431, 578, 88),
(432, 627, 89),
(433, 626, 89),
(434, 631, 89),
(435, 629, 89),
(436, 661, 90),
(437, 660, 90),
(438, 626, 90),
(439, 679, 91),
(440, 678, 91),
(441, 677, 91),
(442, 676, 91),
(443, 675, 91),
(444, 674, 91),
(445, 673, 91),
(446, 672, 91),
(447, 671, 91),
(448, 670, 91),
(449, 669, 91),
(450, 668, 91),
(451, 667, 91),
(452, 666, 91),
(453, 665, 91),
(454, 664, 91),
(455, 661, 91),
(456, 660, 91),
(457, 626, 91),
(458, 679, 92),
(459, 678, 92),
(460, 677, 92),
(461, 676, 92),
(462, 675, 92),
(463, 674, 92),
(464, 673, 92),
(465, 672, 92),
(466, 671, 92),
(467, 670, 92),
(468, 669, 92),
(469, 668, 92),
(470, 667, 92),
(471, 666, 92),
(472, 665, 92),
(473, 664, 92),
(474, 661, 92),
(475, 660, 92),
(476, 626, 92),
(477, 694, 93),
(478, 693, 93),
(479, 692, 93),
(480, 691, 93),
(481, 677, 93),
(482, 676, 93),
(483, 674, 93),
(484, 669, 93),
(485, 661, 93),
(486, 660, 93),
(487, 626, 93),
(488, 704, 94),
(489, 703, 94),
(490, 676, 94),
(491, 674, 94),
(492, 669, 94),
(493, 661, 94),
(494, 626, 94),
(495, 705, 94),
(496, 705, 95),
(497, 704, 95),
(498, 703, 95),
(499, 676, 95),
(500, 674, 95),
(501, 669, 95),
(502, 661, 95),
(503, 626, 95),
(504, 705, 96),
(505, 676, 96),
(506, 674, 96),
(507, 669, 96),
(508, 661, 96),
(509, 626, 96),
(510, 705, 97),
(511, 669, 97),
(512, 676, 97),
(513, 674, 97),
(514, 626, 97),
(515, 661, 97),
(516, 720, 97),
(517, 705, 98),
(518, 676, 98),
(519, 674, 98),
(520, 626, 98),
(521, 661, 98),
(522, 720, 98),
(523, 721, 98),
(524, 719, 98),
(525, 718, 98),
(526, 717, 98),
(527, 715, 98),
(528, 714, 98),
(529, 713, 98),
(530, 709, 98),
(531, 707, 98),
(532, 669, 98);

-- --------------------------------------------------------

--
-- Struktur dari tabel `masalah`
--

CREATE TABLE `masalah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `negara`
--

CREATE TABLE `negara` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `id_sub_kawasan` bigint(20) UNSIGNED DEFAULT NULL
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
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyedia_jasa`
--

CREATE TABLE `penyedia_jasa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_perusahaan` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `up` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `penyedia_jasa`
--

INSERT INTO `penyedia_jasa` (`id`, `nama_perusahaan`, `alamat`, `email`, `no_telp`, `up`) VALUES
(1, 'CV. RIZKI SURYA MANDIRI', 'Jl. Darussalam Selatan No. 144, Kota Tangerang', NULL, '81218128653', 'Tn. Suryadi'),
(2, 'PT. INTI HURIP', 'Kota Tangerang', 'intihurip@gmail.com', '088888999999', 'Tn. Suryadi'),
(3, 'PT. PUJANGGA MANDIRI TRANS', 'Jl. Garuda Gg. Kedongdong I No. 14 RT. 02/05 Batu Jaya Batu Ceper Kota Tangerang', NULL, '08985369469', 'Imam Arif Wibowo');

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'Access Token', 'c800e7f99ffbbb306786da414d56ad3649c0e03c940fe76bd34e04f85a97f7f8', '[\"*\"]', '2023-06-17 23:56:38', NULL, '2023-06-17 23:43:16', '2023-06-17 23:56:38'),
(2, 'App\\Models\\User', 2, 'Access Token', 'd4a3de7804879369c924ed584c4ce6811105daa6221cacc12b7d369e48c72cd6', '[\"*\"]', '2023-06-17 23:59:56', NULL, '2023-06-17 23:43:42', '2023-06-17 23:59:56'),
(3, 'App\\Models\\User', 2, 'Access Token', '4c8407fb2567c971b242389c55af9d8cd64ca3c33c18af9e42d79e41dde5939b', '[\"*\"]', '2023-06-18 01:40:39', NULL, '2023-06-18 01:39:21', '2023-06-18 01:40:39'),
(4, 'App\\Models\\User', 2, 'Access Token', '55d9fe461d51aa34347b9ec60f5076fcc42c7bbe8c223e09ae335a0417421629', '[\"*\"]', '2023-06-18 02:12:46', NULL, '2023-06-18 01:42:15', '2023-06-18 02:12:46'),
(5, 'App\\Models\\User', 2, 'Access Token', '60ec86c89a955f7ab5c326f625314852617b11ed10ec9d4fbcf2233ccfb90b12', '[\"*\"]', '2023-06-18 01:57:45', NULL, '2023-06-18 01:52:13', '2023-06-18 01:57:45'),
(6, 'App\\Models\\User', 1, 'Access Token', '27c2e9ff4b4d5db4029c33de7a2cdd86ea91abd4ef7f3704fec71af93071ecde', '[\"*\"]', '2023-07-24 15:43:53', NULL, '2023-06-18 01:54:41', '2023-07-24 15:43:53'),
(7, 'App\\Models\\User', 2, 'Access Token', '321f880e91cc67ed4016d571c9f1f009790319d25a9ddf56bc46aaf268244254', '[\"*\"]', '2023-06-18 03:49:49', NULL, '2023-06-18 03:48:57', '2023-06-18 03:49:49'),
(9, 'App\\Models\\User', 1, 'Access Token', 'b9a364518f22b1c72a2885b64f7cea627f2a9117bab710ebde8da5e95b68d65b', '[\"*\"]', '2023-06-18 06:02:04', NULL, '2023-06-18 05:59:20', '2023-06-18 06:02:04'),
(10, 'App\\Models\\User', 1, 'Access Token', '5551766360b3018ce443db91997e57119d016f1ec6c944b028b61141e9c26335', '[\"*\"]', '2023-06-18 06:30:28', NULL, '2023-06-18 06:07:29', '2023-06-18 06:30:28'),
(11, 'App\\Models\\User', 2, 'Access Token', '67131f409d398b1eaa8fa2b1fcac467b11c7d69a76333da506d743cda451d4b5', '[\"*\"]', '2023-06-18 06:52:44', NULL, '2023-06-18 06:33:19', '2023-06-18 06:52:44'),
(12, 'App\\Models\\User', 1, 'Access Token', '0b54a576c9110df17c0b4cac6b2ec8d6ef9c9a16d60e41dc73250cd928c9f87a', '[\"*\"]', '2023-06-18 07:06:04', NULL, '2023-06-18 06:58:14', '2023-06-18 07:06:04'),
(13, 'App\\Models\\User', 2, 'Access Token', 'e6335cdb844b3beb6879be5ea7c773f74a7a1b08fad1bbd7bf16c975fffe1f95', '[\"*\"]', '2023-06-18 09:21:54', NULL, '2023-06-18 07:11:01', '2023-06-18 09:21:54'),
(14, 'App\\Models\\User', 2, 'Access Token', '6d2b65b9bde13ddd4458f9b4d5298d693befe2496b08e399dbebada4b820d01e', '[\"*\"]', '2023-06-18 08:47:46', NULL, '2023-06-18 08:46:09', '2023-06-18 08:47:46'),
(16, 'App\\Models\\User', 1, 'Access Token', '23529362d75e6a297e745398c6bcc63092e4b34484cbf218aef04821007604f4', '[\"*\"]', '2023-06-18 09:39:20', NULL, '2023-06-18 09:19:25', '2023-06-18 09:39:20'),
(18, 'App\\Models\\User', 1, 'Access Token', '6e436573f72c58b6b48c667909a6349e79b8aeec20fefa4d8bf3ab36cce1b77c', '[\"*\"]', '2023-06-18 10:13:20', NULL, '2023-06-18 09:41:16', '2023-06-18 10:13:20'),
(19, 'App\\Models\\User', 1, 'Access Token', '2590982fd082d630a01d5e4e391384e0344aa95d086d697bbec137009f3eae28', '[\"*\"]', '2023-06-18 09:54:01', NULL, '2023-06-18 09:52:45', '2023-06-18 09:54:01'),
(20, 'App\\Models\\User', 1, 'Access Token', 'a2a63f402eb3963a77ad868c15bdfd0b47dc9da2e77bf3123c077233cd63462a', '[\"*\"]', '2023-06-18 10:24:16', NULL, '2023-06-18 10:07:07', '2023-06-18 10:24:16'),
(22, 'App\\Models\\User', 2, 'Access Token', 'a2128558d9a4b2506c2ecc95e338798f6255a4ed8a202c94a813232f5840bd32', '[\"*\"]', '2023-07-20 04:02:47', NULL, '2023-06-18 11:20:03', '2023-07-20 04:02:47'),
(24, 'App\\Models\\User', 9, 'Access Token', '928781678e3099b9ded1b2dff4c31c9c201ebf9175c29c8d045d4980e09c4c41', '[\"*\"]', '2023-07-24 03:51:11', NULL, '2023-06-19 00:24:01', '2023-07-24 03:51:11'),
(25, 'App\\Models\\User', 3, 'Access Token', 'e9296c21d391003333546fa037fb83ca153fbba23e4ef7f3b6300e968fc41826', '[\"*\"]', '2023-07-21 14:46:13', NULL, '2023-06-19 00:41:41', '2023-07-21 14:46:13'),
(27, 'App\\Models\\User', 6, 'Access Token', '97f069a2ed8b3aad6fa4327e3cc9bec8aaaf5b80f18d3198cc9207bea47db512', '[\"*\"]', '2023-07-13 05:57:20', NULL, '2023-06-19 03:39:23', '2023-07-13 05:57:20'),
(28, 'App\\Models\\User', 4, 'Access Token', 'caef6612555f0da65a660e6cacb90baca2375504c447e81b021e8c925f77f99b', '[\"*\"]', '2023-06-25 08:23:35', NULL, '2023-06-19 03:39:33', '2023-06-25 08:23:35'),
(29, 'App\\Models\\User', 1, 'Access Token', '0139b62bc2ffc1c42a3cb96ad723f86b136408c50a5ed168b7520e9a16f77337', '[\"*\"]', '2023-07-02 09:26:51', NULL, '2023-06-19 09:59:55', '2023-07-02 09:26:51'),
(30, 'App\\Models\\User', 10, 'Access Token', 'e0ed78ffc24da9243fadc82f7e2ab700fd4cd2b16716a7c64d0d756977545ba6', '[\"*\"]', '2023-06-20 13:57:17', NULL, '2023-06-20 02:57:46', '2023-06-20 13:57:17'),
(31, 'App\\Models\\User', 11, 'Access Token', '5c2bcab818e62a71c0b34bd67d50897a3dd1e5be626f5006110dde3ad57bae8c', '[\"*\"]', '2023-07-21 12:13:28', NULL, '2023-06-20 07:50:03', '2023-07-21 12:13:28'),
(32, 'App\\Models\\User', 10, 'Access Token', 'b7c5b0d9eddd3150d92539828f0d3549c1370cca4ab2763bec419d96b8969647', '[\"*\"]', '2023-06-29 15:47:58', NULL, '2023-06-20 11:51:33', '2023-06-29 15:47:58'),
(33, 'App\\Models\\User', 16, 'Access Token', '2eb5f3efbbec5bfb3b2f4ac0f8509bfad3c87c7bc3e2773773d393686cbb23d3', '[\"*\"]', '2023-07-20 01:03:54', NULL, '2023-06-21 02:51:42', '2023-07-20 01:03:54'),
(34, 'App\\Models\\User', 17, 'Access Token', 'b6399a7302132ebbc398cb336516213ae0ae695b8e07d79a64c317a715b275cb', '[\"*\"]', '2023-07-09 09:32:24', NULL, '2023-06-21 03:05:51', '2023-07-09 09:32:24'),
(35, 'App\\Models\\User', 18, 'Access Token', '5f6e623acdf505c368189cbdc82a27c88bb64149a82b8b4c7f74d9557c94a6b6', '[\"*\"]', '2023-06-27 14:34:13', NULL, '2023-06-21 03:11:05', '2023-06-27 14:34:13'),
(36, 'App\\Models\\User', 17, 'Access Token', 'db4df148122edd5191b4e43aaf74558243e6f75bc23d2f255c3f03accf9cbfc1', '[\"*\"]', NULL, NULL, '2023-06-21 03:12:08', '2023-06-21 03:12:08'),
(37, 'App\\Models\\User', 17, 'Access Token', '3e11188ec7ef623d358ce6c82e05ebbdcc0363da12384c1d6ce6ff0ebf9e0660', '[\"*\"]', NULL, NULL, '2023-06-21 03:12:17', '2023-06-21 03:12:17'),
(39, 'App\\Models\\User', 17, 'Access Token', 'e0baf1614dd57a5a2858a231497f219b10ffdd7a7e7939a93a57a001d6d972df', '[\"*\"]', NULL, NULL, '2023-06-21 03:13:46', '2023-06-21 03:13:46'),
(40, 'App\\Models\\User', 17, 'Access Token', '4a62c5ecee992be0efd5204642333ccd4a644646a2034e72835335e1bbb7c6da', '[\"*\"]', NULL, NULL, '2023-06-21 03:13:56', '2023-06-21 03:13:56'),
(41, 'App\\Models\\User', 17, 'Access Token', '79591870b4e17cb8f01040e8757fe5d10202781f815a31be7ed23af624faaf4a', '[\"*\"]', NULL, NULL, '2023-06-21 03:14:02', '2023-06-21 03:14:02'),
(42, 'App\\Models\\User', 11, 'Access Token', '8986bcb3b746ebf5d0e10f1feb4a31ee6e17fe0cbcd1abaef35d383d8c93012e', '[\"*\"]', NULL, NULL, '2023-06-22 07:33:03', '2023-06-22 07:33:03'),
(43, 'App\\Models\\User', 11, 'Access Token', 'a154c5afc966aac6e6d1cb66eba3b818dd6c5151e9e4847ce35b98f78f92b921', '[\"*\"]', '2023-06-27 13:31:21', NULL, '2023-06-22 07:33:19', '2023-06-27 13:31:21'),
(44, 'App\\Models\\User', 5, 'Access Token', '3df6d49f28f2f1128f4a35b7dce12bd1c5680dcfad823613214642c29d39f7c9', '[\"*\"]', '2023-07-04 01:30:25', NULL, '2023-06-22 09:32:11', '2023-07-04 01:30:25'),
(46, 'App\\Models\\User', 12, 'Access Token', '6d8a60cd5f4926cc84927d5fd8201d1e09f4e4b09fcd32079f2b616852c9ff49', '[\"*\"]', '2023-07-25 05:27:38', NULL, '2023-06-24 09:26:14', '2023-07-25 05:27:38'),
(47, 'App\\Models\\User', 1, 'Access Token', '2e8109979d2766e23765d8e3136252234ed16038e23b7b833ca5e2afcb150722', '[\"*\"]', '2023-07-05 21:39:16', NULL, '2023-06-27 14:04:04', '2023-07-05 21:39:16'),
(48, 'App\\Models\\User', 21, 'Access Token', '9d6bd98aa948dffcb617965c5c9510625f03b5749c53ad3b21e9e60c39d8a9bb', '[\"*\"]', '2023-07-22 16:27:35', NULL, '2023-06-29 09:05:13', '2023-07-22 16:27:35'),
(49, 'App\\Models\\User', 14, 'Access Token', 'b8c054abec34543fc5ec157198b751c54224dc118d1467a01545c13e8fca76a6', '[\"*\"]', NULL, NULL, '2023-06-30 05:15:32', '2023-06-30 05:15:32'),
(50, 'App\\Models\\User', 14, 'Access Token', '6173c8cfd6ef2489e816898e89603b29f32bea73edae36f61bdd4d246ef56839', '[\"*\"]', NULL, NULL, '2023-06-30 05:15:39', '2023-06-30 05:15:39'),
(51, 'App\\Models\\User', 14, 'Access Token', 'db990d51b7f6efea37b0da275a6a4cd6f7fedc25efd36f0f2f4d5d0e1d41f888', '[\"*\"]', '2023-06-30 05:23:35', NULL, '2023-06-30 05:15:44', '2023-06-30 05:23:35'),
(52, 'App\\Models\\User', 13, 'Access Token', '9a0ee1b5a2e4e2c06fd1418d42c9f5ff204e98a60c9a95badb715dcb4655fa95', '[\"*\"]', '2023-07-25 14:37:01', NULL, '2023-07-01 23:50:42', '2023-07-25 14:37:01'),
(53, 'App\\Models\\User', 13, 'Access Token', 'e07921eb8cd8e81d26879e5fee12e7f51edc5c43984a5ba9a16a66acc3cd6fd9', '[\"*\"]', '2023-07-23 01:20:37', NULL, '2023-07-02 03:35:26', '2023-07-23 01:20:37'),
(54, 'App\\Models\\User', 10, 'Access Token', 'b849a4f605f9e6f3b06f41aaa8ebb324fbd189cfcbc39fa0f89635e517327e32', '[\"*\"]', '2023-07-20 21:10:49', NULL, '2023-07-02 09:50:55', '2023-07-20 21:10:49'),
(55, 'App\\Models\\User', 14, 'Access Token', '3021af07204eeebb949cd9742d4e87efdfa52393d50bf5344f26209e78b9adcf', '[\"*\"]', '2023-07-05 01:45:15', NULL, '2023-07-04 05:04:00', '2023-07-05 01:45:15'),
(58, 'App\\Models\\User', 8, 'Access Token', '1fb4bb583aa5f1cc8eaa07228c3231525a17d5d7bcaa9e182dc695d0a6f63393', '[\"*\"]', '2023-07-24 16:22:03', NULL, '2023-07-07 01:18:48', '2023-07-24 16:22:03'),
(59, 'App\\Models\\User', 17, 'Access Token', 'b71967022cdf5eea894de7183e046e84b93f038e91f54a52e3e1c7b50d715bc6', '[\"*\"]', '2023-07-23 07:56:14', NULL, '2023-07-10 10:28:48', '2023-07-23 07:56:14'),
(60, 'App\\Models\\User', 3, 'Access Token', 'd2bae1381101b27cf5976fc7424b6f388de711a14ef3b79fad4fc2afb7ada6e4', '[\"*\"]', '2023-07-23 14:16:40', NULL, '2023-07-15 10:32:37', '2023-07-23 14:16:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pihak_kedua`
--

CREATE TABLE `pihak_kedua` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_identitas` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `instansi` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pihak_kedua`
--

INSERT INTO `pihak_kedua` (`id`, `nama`, `no_identitas`, `jabatan`, `instansi`, `alamat`, `no_telp`) VALUES
(1, 'Lid Anggia Rahma', '199801282022052001', 'Staff Kemenlu', 'Kementrian Luar Negeri RI', 'Jl. Pejambon No. 6', '089538692371'),
(2, 'Andika Pratama', '-', 'Petugas BP3MI Jakarta', 'BP3MI DKI Jakarta', 'Ciracas', '0821117132177'),
(3, 'Suwitno', '0', 'Staff Pelindungan dan Pemberdayaan BP3MI DKI Jakarta', 'BP3MI DKI Jakarta', 'Ciracas Pengantin Ali No. 7', '085921298604'),
(4, 'Suwitno.', '001', 'Staff Pelindungan dan Pemberdayaan', 'BP3MI DKI Jakarta', 'Ciracas, Pengantin Ali No. 7', '085921298604'),
(5, 'Agus', '_', '-', 'Upt Bp2mi Jakarta', 'Jakarta', '081310693310'),
(6, 'RUTH EVELINE CH', '--', 'Pendamping sosial', 'RPTC', 'Kemensos', '087719998222'),
(7, 'Abdul Hamid', '3173081807820008', 'Anggota Himalo', 'Himalo (Himpunan Masyarakat Lombok)', 'Tebet Dalam - Jaksel', '081996922609');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pmi`
--

CREATE TABLE `pmi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_group` bigint(20) UNSIGNED DEFAULT NULL,
  `id_masalah` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_pmi` varchar(255) DEFAULT NULL,
  `foto_paspor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pmi`
--

INSERT INTO `pmi` (`id`, `id_imigran`, `id_group`, `id_masalah`, `foto_pmi`, `foto_paspor`) VALUES
(3, 3, 1, 5, 'https://kepulanganbp3mibanten.site/public/uploads/715743ae-6637-4dd7-ad81-2a1e040ae76f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8f882f9b-2020-420d-9b9c-8ceb7858a482.jpg'),
(4, 4, 1, 6, 'https://kepulanganbp3mibanten.site/public/uploads/ee87d59e-14e2-49b4-a702-94fe8643bb8b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6f234ec4-d0b9-4572-be63-2c62e577fd0a.jpg'),
(5, 5, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/06365ac6-e975-497b-853b-36f643564c37.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/85952949-181b-4e10-944d-3aa35c42026e.jpg'),
(6, 6, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/3b7df550-5358-4271-8ddf-c3e18430a438.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/20a974f6-b8a7-4924-aced-c3b7434959ab.jpg'),
(7, 7, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/75cd86b7-f948-4034-901b-b9398099c052.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/20c07ca2-8358-4aca-a710-9ffa73ef7ce2.jpg'),
(8, 8, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/44f196f2-efc9-44ca-bc94-35cf74688e58.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/959812b4-7b96-4de9-93a0-020cf395bc46.jpg'),
(9, 9, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/77296ee2-02fd-44a7-aff5-df25a4710816.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/972fa655-cf21-473f-891d-f86335229227.jpg'),
(10, 10, 3, 7, 'https://kepulanganbp3mibanten.site/public/uploads/e49fb93c-eb2d-4018-8f99-135e6f3d96fe.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/30f9c834-c10d-46aa-a469-93e00471f371.jpg'),
(11, 11, 3, 15, 'https://kepulanganbp3mibanten.site/public/uploads/4cb3ce76-c062-4819-9a20-b18647fafb44.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/63378ed0-77e5-45cf-bf0a-cfb6113ccf90.jpg'),
(12, 12, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/c953a80c-fd84-48cd-88cf-0de0acd66a8d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/add0d7ac-1d33-4d9e-9ada-c05a7eba2037.jpg'),
(13, 13, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4c7aaa9a-51f9-4dab-a438-63cb474143d1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2380a20e-e08f-4b49-aafe-2e4db20ef9df.jpg'),
(14, 14, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8d3838a2-4496-4ffc-8dc2-db74d69ee64c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/152a1a0c-5c14-4e3e-a31c-423bb4835e44.jpg'),
(15, 15, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e1e15138-e55b-421f-8264-a017a0f14448.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a7666cad-f162-4d81-a240-e4d28343f68d.jpg'),
(16, 16, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d22154a7-4e10-4e55-a2f8-7fba51200297.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/024afdbd-22f7-425d-9fad-a2337a77426a.jpg'),
(17, 17, 1, 5, 'https://kepulanganbp3mibanten.site/public/uploads/897b1365-76bb-4ab7-95a6-0c52e38885f4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d0e468cf-e82b-492a-8856-3447608f2c89.jpg'),
(18, 18, 1, 6, 'https://kepulanganbp3mibanten.site/public/uploads/675b0f52-77d4-46ec-9bca-8038eaeaf9b1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/12bc928b-7936-46be-a624-6428478e7e48.jpg'),
(19, 19, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/825bccd0-71ce-4b18-b480-1c5e3a2b7970.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a838fce0-7358-471d-9469-a714eec507b0.jpg'),
(20, 20, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/830879a0-1c5d-4ca8-ba1a-db5093488e90.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a23b6b31-19a1-4e0a-b4b9-a88ff979724e.jpg'),
(21, 21, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/f93ea028-2b8a-4725-b58a-2fdd62b67937.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8b8dcdc4-262e-4a0b-8f7e-2d8365cbafb0.jpg'),
(22, 22, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c2a62007-dcbc-4927-82f6-9f3e1aec6be2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c7898a3c-1658-438f-8246-14a493c1ccd8.jpg'),
(23, 23, 3, 3, 'https://kepulanganbp3mibanten.site/public/uploads/aa96d94d-5e47-4b92-a603-03dbbe9114cc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/80cba901-fc80-46bf-92a2-ed5343060edc.jpg'),
(24, 24, 1, 3, 'https://kepulanganbp3mibanten.site/public/uploads/06fe1207-e362-4138-9320-43ffe587ba52.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/463204f3-2185-4eb2-bfe0-c3e0527ad897.jpg'),
(25, 25, 1, 3, 'https://kepulanganbp3mibanten.site/public/uploads/7c13f725-84e6-4e67-9e4a-afe39b324f98.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/418b1fe3-3314-476f-8916-93265261be53.jpg'),
(26, 26, 1, 3, 'https://kepulanganbp3mibanten.site/public/uploads/1d311a45-82dd-40f6-b482-37fc704dafbf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7dab2eea-3fed-4bbb-a6cb-29988859d6a7.jpg'),
(27, 27, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/3d32ddb4-0f60-4c64-8a2a-15afa96a730d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f40070a4-3e43-41da-b243-39d272533362.jpg'),
(28, 28, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fd4ad54d-4bf0-4168-ad4f-54e48170783e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/02b456e0-c38c-460d-8135-457d34d18bd4.jpg'),
(29, 29, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/da75939b-9339-402d-bc6d-493109dc9abf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/36e4f7e8-b5d1-4386-8df3-937641d6ecdf.jpg'),
(30, 30, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cf739a58-02cd-4bb7-91a5-2c848acf1186.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bf63f01f-48c0-45c5-a5fa-4cbf910b4fd4.jpg'),
(31, 31, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc92bd9a-6ed0-4c13-a916-a1ff48dd6ea0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5771cc39-5b4d-4d0f-8b46-d00d93529539.jpg'),
(32, 32, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/20acd2a4-6ea8-4091-a62c-9243c7a8457f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/83b745ff-899a-4d24-95f2-1289c6b42ded.jpg'),
(33, 33, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/4bf3c02f-8405-4807-994e-af09ee0502f0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bc429f87-0e9d-4395-8c39-07bb8c364b01.jpg'),
(34, 34, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/a0d0f1c3-2982-4839-9122-3889a8a82e36.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/472ec4c5-f3d5-4c16-ac9c-1ebae7ab45de.jpg'),
(35, 35, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4643951e-4c04-409c-91c0-3698a7d6b0f0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/921e1c43-aa68-40b4-9f78-5a6c384216c9.jpg'),
(36, 36, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3c8b5fc3-9de3-4426-9834-efbcb5138180.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7126ad40-dac7-42bd-86fd-5dbb71c00c50.jpg'),
(37, 37, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/903251cf-c46e-4790-b455-2f96413bacf1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d6434e4c-6b68-43a1-aab2-b9b24b763a83.jpg'),
(38, 38, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d072a63c-f1c5-4da9-8bd6-26571360f1fa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3b9633f0-2ed1-48fd-90a4-c839390134b8.jpg'),
(39, 39, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f29fc539-ee77-4798-a987-b3b9471289d8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1586d467-6507-4396-bc3b-e8f75f24f240.jpg'),
(40, 40, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d09b4811-cac2-40a8-869a-83ec096e44dd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2d787b14-5f90-41eb-b46d-ad356a2e0b4b.jpg'),
(41, 41, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/51f1b4f3-65ae-46b5-a464-7fc556a3006d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a50aa6ba-ee5d-4292-a90f-03c4108447b6.jpg'),
(42, 42, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6144477b-85b2-4565-aaac-1df6e0d87f18.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/21fec4bc-5219-463b-9e52-69d5f0f1d504.jpg'),
(43, 43, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/50b79adc-d598-4ce4-95d4-ead4c0da7530.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/51e43331-a7e6-44bc-be96-dba86e5e351b.jpg'),
(44, 44, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fcb81631-4d99-4a5d-b575-3dd6bc373f1d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f06eca34-81d5-4868-891c-18b98a799a94.jpg'),
(45, 45, 2, 10, 'https://kepulanganbp3mibanten.site/public/uploads/20b7fad4-6217-446c-81a5-b276e22d09e3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/da5eb3b8-21fe-4573-a330-67810dcce136.jpg'),
(46, 46, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bd697d0b-f2d0-4923-8a10-b2b7b0759bc2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a7dab40b-ac66-4d24-9413-09d40d381c30.jpg'),
(47, 47, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/53b584be-8dc2-46c4-aaf1-50e188440c1f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9eef8f13-12d6-45db-9360-9bc7498436ff.jpg'),
(48, 48, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/0b1e6f81-a17d-458f-8ce8-9fac7f53afb1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5775dc83-6dea-4bf3-8a1a-df0588e583cf.jpg'),
(49, 49, 3, 15, 'https://kepulanganbp3mibanten.site/public/uploads/e0a0a0a9-ead8-4af6-bd32-7bb4abf80727.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1fc4899b-8d35-4128-a7fd-00d86beca991.jpg'),
(50, 50, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/15e5f52a-03c7-470e-9112-13b66181c69e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/220f9e2b-3a25-4eba-bc0a-4303c16f9c02.jpg'),
(51, 51, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/01676b43-3e18-4617-90bd-0b905b5bb4ef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/606c4feb-d27a-4dd7-a089-0ceac85e5e62.jpg'),
(52, 52, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c4947403-6d19-4b71-8188-f240ec7617a3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f7b341bf-1adb-49a1-ac50-158bc6f32550.jpg'),
(53, 53, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/5bcbe2a9-279c-419d-80d3-1f7c52dbbfd8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c68cdf4e-d2de-47e5-94e7-4eac98d420c3.jpg'),
(54, 54, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/78a29ab0-e06c-4e7e-8b2d-212ed25bbc21.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e7e5ae36-6d4c-44be-b618-a6047c81a761.jpg'),
(55, 55, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d34611ed-c1ee-484a-a9c2-6bcf7fdd9a63.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/221d0a6d-df8c-4e3d-9443-e05ba1374267.jpg'),
(56, 56, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d104eea8-72c6-4202-856f-251efb099fea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/34b162fa-36df-4468-a4fd-f8838748ff99.jpg'),
(57, 57, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/49402205-0f2c-4c56-a68d-b6a04290e096.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f071086b-dea3-43ec-a259-7b76b73d3d69.jpg'),
(58, 58, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/3b537b60-d75b-4ad1-9c9f-48b75dc37428.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a7f1b86-7d19-4fab-9530-8fca1f55e4ca.jpg'),
(59, 59, 2, 9, 'https://kepulanganbp3mibanten.site/public/uploads/cea90dde-6d97-4dad-b0c5-8b656655dd3c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9ba0783b-4b9a-42ae-b6f2-bc7d056c1795.jpg'),
(60, 60, 2, 9, 'https://kepulanganbp3mibanten.site/public/uploads/ff81469a-4124-4651-a302-d7acefc186a7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d7001baf-aa4f-4363-9652-faa22c73adc7.jpg'),
(61, 61, 2, 9, 'https://kepulanganbp3mibanten.site/public/uploads/e84cb582-c18e-4e3c-b153-5e28b9738b31.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4b0477dc-797f-47f0-abff-605bf24778a9.jpg'),
(62, 62, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/03564200-7e94-496b-a54f-7523cf2feb45.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/63597a22-0176-42c6-b8e2-478f90e6127c.jpg'),
(63, 63, 2, 7, 'https://kepulanganbp3mibanten.site/public/uploads/c879e994-dd93-4013-8acc-0ac917cfa7bc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/668b4f06-6cb5-41be-9309-d556d3bae55f.jpg'),
(64, 64, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/0252d69a-cafa-4175-9b00-3e4bebf68e42.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/785f05bc-b9fd-4dfb-8b81-a12d7364efa2.jpg'),
(65, 65, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc3121ec-f3a9-4ac2-8335-32dd490c81a6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a25db26c-6d6c-4770-aa83-51df425f8f23.jpg'),
(66, 66, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4533fea8-0e05-43c1-a025-1370cbd9603a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4c7dec94-2441-40c8-8c16-46668b301691.jpg'),
(67, 67, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/072a5b9d-8fdc-4762-b189-e6bc6863fc37.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aaab13a5-0bfb-4409-bd3f-8b778981a177.jpg'),
(68, 68, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ebbf8830-c3f3-4a6e-bbcc-bb13f0cc0e9e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3c147b10-5cbf-4c85-9557-3b1adf7d8ed0.jpg'),
(69, 69, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2a412cd0-5be5-400e-b274-5f4a9e1eba47.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/94db3899-ff66-4ee1-813d-2d63650b254e.jpg'),
(70, 70, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/28188ec2-4d6c-4665-819d-0014924ea52e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4dee9b50-f23e-444a-89d2-b7f520e170e8.jpg'),
(71, 71, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6924661a-6c5e-4fb2-bad4-cb973a81b0ea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c15eb2aa-bd87-4fdc-8aaf-e2a970b1ddfc.jpg'),
(72, 72, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a261915c-b735-4dbf-9089-b79ee7fe2a5f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4045835e-6f4a-443a-8546-7d5e1f257e8f.jpg'),
(73, 73, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/511c4cc2-e9d1-4fed-8868-c0a256227108.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3297af26-8107-43ad-af02-af98caa05c76.jpg'),
(74, 74, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5ed6a3e5-43f2-4332-99f3-9be727bbbcbd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c389cb1a-9f61-409e-99ef-7c67c6b6c045.jpg'),
(75, 75, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d846ca68-01a6-457f-86c8-7c30c9b9a545.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d269c99a-5b90-4e4a-8a86-9bb8cff18ede.jpg'),
(76, 76, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/11887155-e5c6-43fb-9a2e-2a954afcaba3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0174045d-184e-4293-b40f-e88d2a347904.jpg'),
(77, 77, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/aea40132-e411-49d4-8eb2-ac2f23ed1687.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/683030e3-999e-434a-9165-b9f780a7602e.jpg'),
(78, 78, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0be1c091-d1c8-4daf-98c1-f5d4ef324473.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/88f65601-980c-41ab-9be0-6e5615365730.jpg'),
(79, 79, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/36240e37-675a-4a91-a464-0f51906ab2e6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cbd9802a-a27a-41d2-a297-349aa034de57.jpg'),
(80, 80, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/79d86a44-e4e2-4aea-b54e-bf8ddb4c394e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2061ade1-fe6e-4c8e-9afe-6a49c7468575.jpg'),
(81, 81, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/c6810843-39fb-42e7-875a-07a90ebccacd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/15f73d10-2ccf-42c8-8e64-7618faf0aa51.jpg'),
(83, 83, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/f3b05a98-a5fa-44d7-8863-b4328678ecff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6daea6c0-be4b-42d3-8f68-2072fc910011.jpg'),
(84, 84, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8a1b6df0-5fa8-42dc-9e4a-388735caae88.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b792d1d6-1498-4894-ad24-cc8b152f7d13.jpg'),
(85, 85, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/de3933fb-9dc3-4127-9581-8a654e3407f1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2596f79-2a54-4cff-9c9d-d2db4b649e28.jpg'),
(86, 86, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/76c1541c-1637-4f19-b346-1990525e010b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1e9144d6-f7ae-4fbf-960c-14723e4ef2ef.jpg'),
(87, 87, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7e97e977-083a-4279-be1e-9c8e75fe8220.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2b7fa438-a505-47dd-9e87-cb1f82c573d9.jpg'),
(88, 88, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f0caaddb-450b-432a-93d2-760914c11c7c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/10378f3b-675c-49bf-b1e0-4d20be66b0be.jpg'),
(89, 89, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5cc7f7af-cb96-4823-bcb4-2e9e4080aa7a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/733166aa-fa25-4fd4-a193-bcfd4ac1e8b5.jpg'),
(90, 90, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c0558249-d2f5-4d7a-87de-ba95498cfbcf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/307292b3-37f9-4904-a55a-4e7b86e5c443.jpg'),
(91, 91, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6ac1a0df-10e6-4863-9f62-38ae5afdd133.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b5867ce9-68c4-4422-89a6-ee81154fa52e.jpg'),
(92, 92, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cd002930-ee75-43b1-ae70-22702987772e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f7ed7ead-7b9e-4af5-9bbe-0022d0c907cd.jpg'),
(93, 93, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8fae8c67-4eb7-4415-ad0f-7846758e1f1d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d4a30056-348e-47dc-a9c3-abfcd75029f9.jpg'),
(94, 94, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/cb45007b-5cfe-483f-b134-63b56a620e15.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6719eac2-f37f-4f7f-818c-3ec8daddddd2.jpg'),
(95, 95, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/4c751614-315a-4cdf-90e0-79979bd795c6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fe89aa25-5b86-4b74-a2dc-6dbd57dc0d15.jpg'),
(96, 96, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/19bb60db-0f32-4232-aaaa-874fcc7c1391.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5ea1d728-c75c-4596-9d97-74fbdbf497e0.jpg'),
(97, 97, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/6c40fb34-49d0-4db1-8caf-30a3ce050d5b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ab800033-5807-4300-a4b3-d925e80dc992.jpg'),
(98, 98, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/0ac5b122-849e-4f09-ab19-0459aee3171b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f67e56b4-7931-4732-a535-ac977f411b63.jpg'),
(99, 99, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/6f660476-b24d-4357-91af-aa43b53097c3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6d27d18b-61e9-4b39-bfda-41b27ab19eb0.jpg'),
(100, 100, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/4e1ca0a4-a35f-4685-87e5-40346014a67a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6da8a2ae-ee64-4466-a656-f79fa6383152.jpg'),
(101, 101, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b501e1cb-3c77-4772-a55d-a794c1b58325.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/112cef73-8a34-4450-9819-82a657795d3c.jpg'),
(102, 102, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/9c03fc56-3e97-42cd-b281-bdde2ca885c5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e17eca15-8c9a-4b94-8d09-5a0b6fd4a959.jpg'),
(103, 103, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/2db10692-905d-4841-8dfc-e1f9de6f09e3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/00730d76-0c70-4632-a476-66c319ef2907.jpg'),
(104, 104, 1, 14, 'https://kepulanganbp3mibanten.site/public/uploads/0fd9fde7-9583-4b70-8501-e26d48d56079.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/75829836-8ca0-42f0-ba32-d5eeda12ac55.jpg'),
(105, 105, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/bd3c8ff2-4bcf-4b53-a7e3-0fa7dfd26e76.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/756a2d1d-d848-46ea-943d-bc43765d6128.jpg'),
(106, 106, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/866cbbf4-2acf-4ef2-abe6-4d303c8026c4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/302f59da-38a0-4ee3-862b-88061b1f6e9f.jpg'),
(107, 107, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/708b5cb9-2fa0-437c-a5f2-65bc58abaafc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/04d3db2a-bc34-464f-af31-d6a18aff4157.jpg'),
(109, 109, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/56368216-9071-4ee3-a303-a810b608f536.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2d5edf4-3c20-4b92-b008-1018bd7ba2f3.jpg'),
(110, 110, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/67ad24e6-c2be-43f3-bd1d-aa7c71c1cc54.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3d85afce-db85-4697-bb5d-6265a274df9a.jpg'),
(111, 111, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d03feacf-bf76-496e-b573-0a37f71cdb7a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/923d398a-25bb-48fe-b0e3-46c0dbcaead9.jpg'),
(112, 112, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/ee1059a0-f6aa-4992-bc43-96e959393fc2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/232340f0-2432-4153-a1cd-952000c29b0a.jpg'),
(113, 113, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/5cc108b9-2ae5-4cf1-8f27-c270147911ac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/127ef912-c9d2-412e-ab96-8338c484dd8b.jpg'),
(114, 114, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c4ac472c-b85e-4287-868e-b1550f948718.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c8f0ba6c-ba8b-484e-94f1-e93a87c7d915.jpg'),
(115, 115, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8fac1b03-e740-4a1b-be7c-0a258221876c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7ce680ba-e324-4f7f-90c3-ea2e485422b3.jpg'),
(116, 116, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/876a1da4-8475-4df2-b96a-f10846aeff6b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c26c2e66-d192-4a81-8b78-66349a85fade.jpg'),
(117, 117, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/838adbd0-bb22-47c7-aa69-08b11ebc8edb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/97c5d7cb-7c9c-4a3f-aa7b-5e4202b49420.jpg'),
(118, 118, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/db624e86-a80c-4265-ab64-3fd3146d8e56.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9bc95ca0-e1da-4836-8efc-39a1fccf29ec.jpg'),
(119, 119, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/68590a70-28e7-46a6-9176-a08c75851f48.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/882b2a00-6d5e-4235-be2d-4b46b85bbf4d.jpg'),
(120, 120, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1063ddbe-5dae-4df6-82a8-97e10aa01da7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c1ce7d9f-f481-4057-a064-e783c16fb082.jpg'),
(121, 121, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0abb20f8-c847-4417-b244-1198154597e1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b0f54889-d214-4700-a7cb-32b6cfe21ac5.jpg'),
(122, 122, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/72d2c2ef-eb6f-4056-83b3-4ccc57928371.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2af0d8d5-f783-49e0-b24c-69615ab58302.jpg'),
(123, 123, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/6baa7622-fbd2-49f3-88f6-b6ab10c84c8e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a7816b64-5d13-462a-a31a-910eb0e14602.jpg'),
(124, 124, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/26fa945b-b2f0-48a8-b158-a413127c34db.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1deaad28-3be5-461d-9aed-cdac6fcb2f3a.jpg'),
(125, 125, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2ac3a82e-4c86-40f2-9989-fc3bfeebd57e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8b99d3e3-0081-4b59-83e4-8b546924d311.jpg'),
(126, 126, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/034b70a2-2936-4643-a32d-0b6d4c91a5a9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7d96ff1f-fe7b-4e23-a20c-02791d6beaef.jpg'),
(127, 127, 3, 2, 'https://kepulanganbp3mibanten.site/public/uploads/1a011018-e3a7-4c15-be28-73223c8107b3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fd71f5a0-382c-4712-a5f0-ee2a8e73b6cc.jpg'),
(128, 128, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/48a0ee9e-8aaa-4b87-b6da-311b83c92cd9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a03ff401-a214-44a5-b026-5b68d21de45a.jpg'),
(129, 129, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8fac11ed-8a6f-4d03-8900-e4d7b2633b14.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/44714a14-2df7-40bc-9a9c-0d29a3f3cc35.jpg'),
(130, 130, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5526edc8-bbd8-4b3e-9ea0-392f8a620bdc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aa0ab26d-602f-4627-9f50-7991215ff23b.jpg'),
(131, 131, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/ff2af970-6ee0-4555-8d98-e1244db1bfae.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7a2f0e49-1c69-42c6-ae87-d7f46ac619b4.jpg'),
(132, 132, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/2627d979-a40d-412b-aa8c-4792e28618aa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/00401dea-ae42-4496-9eef-45b0f1537e84.jpg'),
(133, 133, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/3637b413-0724-49b3-8aab-a4dc107bc893.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/87e08889-890a-4cb1-9328-588d0a3c3877.jpg'),
(134, 134, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/df61ad18-8171-4b5f-b73c-fa0ae5797f78.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8fc94067-835d-4f1d-8c07-8dd609beba51.jpg'),
(135, 135, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/a9e75c70-f590-45b4-94ba-19f0f1c1b040.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3f66aad1-1a55-40c9-9f52-09c81f53941d.jpg'),
(136, 136, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d494589f-9fab-4c9b-8159-342e233ee17c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d505529c-6049-4785-8395-50cc5ecf85ae.jpg'),
(137, 137, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bb16f76b-794f-43f2-b3b1-aedc8438c23e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6564890d-8764-46cc-97c6-a8f3d7429267.jpg'),
(138, 138, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/09f5fd08-e74b-4cf1-b72b-3650be7551bd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f9c3e49-2c46-4048-bafe-0645f4b3dd43.jpg'),
(139, 139, 3, 7, 'https://kepulanganbp3mibanten.site/public/uploads/2369a9e7-a700-4549-8b27-a460c1b92eab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8b0da89b-e742-4f1a-92fe-46c75a414dcf.jpg'),
(140, 140, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/31f843f5-b753-4460-b453-5bfe02c16f71.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5d96c9df-3937-48d1-8981-b4e32b9057b9.jpg'),
(141, 141, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/887b5389-4896-4b3d-8ea2-72f18e95e89b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d1f63c0a-08b9-4de1-bcd7-bab2c9e0b6f8.jpg'),
(142, 142, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/8f999d0e-1551-457a-9126-952acc009bcc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9dae9b8a-179a-47d2-8e21-0df1fc24ac02.jpg'),
(143, 143, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/5c81bc03-b26e-4b6c-bd30-861888d3e71f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0c52e35d-1bf0-40f9-a8fe-51d8b1237ab7.jpg'),
(144, 144, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/b3235f35-6858-4078-9d1e-79a2048ccc4a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e067cf3b-6e04-4cc8-8c5c-f19e64e20eca.jpg'),
(145, 145, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/1e026290-61f6-4b3f-921b-00e688149f0c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/258ce661-7f22-431d-91eb-ccd27e04af4b.jpg'),
(146, 146, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/4753a4e1-fb81-41f9-80ae-04510328b1f4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/55684c7b-19af-4193-b6b3-c1261b2c1818.jpg'),
(147, 147, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/69f808e2-6093-4d47-b5ba-f5c244f4cf2f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/967c120e-83aa-4d40-8e52-7799dd375a64.jpg'),
(148, 148, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/f6cb7d38-cc9e-4012-94ad-7454e41b5a6e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/75292d9f-5cd9-4fa5-89f2-f82971df2fef.jpg'),
(149, 149, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/f2cedc1c-837a-437d-b3ed-3e6b582fd134.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/16767a02-70fb-4cc3-8c03-c43268e5f15c.jpg'),
(150, 150, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/dbb2172c-2320-499c-8d6a-9b71b1b72163.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/731a71d6-bfe8-4678-a53b-a0c287f53b2f.jpg'),
(151, 151, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/ef83bf8d-e407-4ecf-a212-36fff808db2a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e4e269fc-3786-4946-8f53-6fe7e288bd8c.jpg'),
(152, 152, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/75ddcd04-18df-4640-a2fb-3db0a7e5766c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e9e74796-b0cf-492e-9370-5b4112b61b1e.jpg'),
(153, 153, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/7fbd20e4-bbbb-4f81-b881-2c504c035294.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/64304adb-acdf-44c6-88be-a4a87481371c.jpg'),
(154, 154, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/29a6417e-d5cd-4358-9d3f-2821d7522d55.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1bea7b3e-1e6d-492f-b0b7-303c3abccedd.jpg'),
(155, 155, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bd731402-68d3-48c0-9dce-7834cda20731.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/750bbebe-291e-407a-acfb-83f40f627a3d.jpg'),
(156, 156, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/83134a3e-c80c-4fdd-8db2-6e4b40028c42.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48aedcdd-f80c-4274-9c5d-5594bf058066.jpg'),
(157, 157, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/a27a3f5e-8523-481b-9174-8759b1e00b6d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/78f04257-2725-4e5a-9a99-09dbd8463bfd.jpg'),
(158, 158, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/18e0154f-b6ba-49c9-8b35-14e4530200b8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b4f2043d-2ae5-4cdd-97e9-9113fe3a8310.jpg'),
(159, 159, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/364e3376-dae7-4283-b27b-94ca11d0dc16.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/26e2980d-eef1-4267-9994-b23e8d494d0e.jpg'),
(160, 160, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/de68d0f6-0225-4344-bfa6-82bc4acffe20.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a2be8a0-7210-4ce8-965e-4b0761746980.jpg'),
(161, 161, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d725a9a7-bd60-4be2-a44b-5078e89acd85.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/feb09a50-eae5-4b2c-9c32-f0f1c76c4226.jpg'),
(162, 162, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/85447536-1d14-41d4-bfec-4200408446e7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/32f2492c-7c68-441b-a238-f75e43813313.jpg'),
(163, 163, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/62f1c057-ba8e-4a1b-9de2-02703de103f9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7635b0b9-8acc-40b4-b970-c97c6b3b8c36.jpg'),
(164, 164, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c36ea0ff-f92f-43b6-b852-cc47e67e6d6c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6269555c-c8d1-4999-bc2e-fc08a8238b2c.jpg'),
(165, 165, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/73b12eec-8896-4f05-8751-b821614e0ff6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8286f02b-b604-40ec-a490-6472eab67816.jpg'),
(166, 166, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e770ae16-3591-4384-a1f5-8e0bd288a6a6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/192882ef-140c-4690-9665-590208a69f96.jpg'),
(167, 167, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/17f0b4a4-d2d5-43a4-99aa-d6f9e313bcd3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ebd4f3ab-2846-4201-863c-f96ecf28121c.jpg'),
(168, 168, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/80e54d25-86d4-49a1-a046-5a5ddfb72570.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45a96299-0a16-4137-bf94-99b515a1409c.jpg'),
(169, 169, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e25f35e0-6934-4c7a-aa38-c0b36912e200.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c8e060e1-6154-46ec-bf54-2db391cf7312.jpg'),
(170, 170, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7897fd89-4440-4d46-9311-7f92974336c8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/676d7421-7129-400d-9de2-ab833b2ebd44.jpg'),
(171, 171, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e49a7889-53f3-4863-b035-01d2673612d7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4242d600-3128-4077-8431-3e2004fe28f8.jpg'),
(172, 172, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b1523540-a7e5-4cd7-ac18-e82b32338522.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b8c7cb26-2cb5-4e26-8f5b-6d0bfca65413.jpg'),
(173, 173, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/5174c419-5be8-4ed7-b4ad-1f48594f9d48.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f9ef2494-ca6c-4662-8d0b-4c9fb8367204.jpg'),
(174, 174, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/8a1b6463-e3f6-465d-86e4-9003f5e62480.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4d318638-73e1-41cc-88eb-39dc78bbb443.jpg'),
(175, 175, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/d2957b47-b19e-4b41-8aeb-5d92acf4c395.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fc9682d9-1fb4-4c41-9a6b-bf750b111f15.jpg'),
(176, 176, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/1113fad3-f25e-4200-ae72-42bf4a5e2526.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d93f360e-c926-47da-a4d0-91618965ec21.jpg'),
(177, 177, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/f017f7f1-c8a9-48e9-a46a-135539880eb1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dcb605f9-30fe-4780-94ca-1da249f6a664.jpg'),
(178, 178, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/a38cafe6-0d08-4e43-9255-d7fb5c05ceb0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2a964d2e-fa65-4501-9e0f-49aa449cf871.jpg'),
(179, 179, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/2344a317-fe32-493c-89fb-620a9ac77cef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2df71640-cd49-44fb-bbda-66178b9b186e.jpg'),
(180, 180, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/470162ba-a4bb-4c8e-a9b6-9cd140181af2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f1d8b87c-232a-4497-97a2-950cbf6c43a7.jpg'),
(181, 181, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/3b62c9c1-02a3-4742-ae18-d8235edeb30a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/203db5ef-2c67-471a-a79a-d979d465cfd1.jpg'),
(182, 182, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/0d0821f3-9d53-47c3-b4f3-3a80ccc23f89.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/92357cca-1f49-4ae5-88e9-15edc881a6f1.jpg'),
(183, 183, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/ec0d8775-ba20-4735-8feb-fce10ae1de62.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e08dfd46-f34d-413f-b0cd-f5fe86f52d17.jpg'),
(184, 184, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/35a16abe-67b7-400b-ba95-b83fc52baa25.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d260154d-feab-4bd3-b9dd-1b9c8ac23464.jpg'),
(185, 185, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a92b9974-f8cb-4b58-9dec-ce6ec825a47f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1ac80d8b-e769-4b2c-9e99-f2af01bdda6b.jpg'),
(186, 186, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c4fb2473-9b64-4f7a-b90c-bbe00500ab58.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4e6d732a-c1a7-494a-89c7-179a29e48eda.jpg'),
(187, 187, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9dd2e5d4-9faa-487b-b004-4332b9ed6b95.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2242b999-b2fb-4b7b-a265-35cb84d3fe77.jpg'),
(188, 188, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b4e5b482-23d4-48b8-af05-2f1288d80fdf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8b7f9b12-184d-4836-8845-fab8f8cec725.jpg'),
(189, 189, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/180e65b4-8135-4473-b2d3-2cc3dc217aac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1d40ac0-0e26-49cf-9636-b4e3b90759f9.jpg'),
(190, 190, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e9bc54c2-281b-47d3-9358-0ed1e713211b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/25005860-bdb3-4b9c-9e97-b2cafc3f75a5.jpg'),
(191, 191, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5b820397-98ae-40c4-a8fb-d44247db9780.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f25d1db-0841-4489-9231-68a7a4b1e050.jpg'),
(192, 192, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0b8e64e3-4074-4031-9573-c5530a0522b3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45692f3c-d43f-41f9-a885-8f7a9664850f.jpg'),
(193, 193, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/005f2ee8-bebe-4a7e-9f1d-c4ea60c07d72.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/966f94a4-0fb8-4be5-a6f5-5f57520059f5.jpg'),
(194, 194, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a4861d6f-7ec7-4db1-8706-8ef5e07bd1f7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6382a89c-c39e-47d0-a917-e84df50d6475.jpg'),
(195, 195, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/178dfed0-5862-4a2b-aca6-39979e0315c1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5868ce28-0177-4aa1-ad76-1e544e7f296b.jpg'),
(196, 196, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/9e1a8747-d9e0-439b-a2d1-ec7d19871a0c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e76ca2c5-ac50-4a0f-a1a4-7c18fc5910e6.jpg'),
(197, 197, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/32483017-c128-4bd4-8356-38494e87b22f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/882570c6-8b8b-4998-86a1-392c37f75629.jpg'),
(198, 198, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b45c10e7-fef4-49ed-a62e-4725f6b33751.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f0aaa03-99cb-44db-adce-0330763a9403.jpg'),
(199, 199, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/742c359b-5296-4509-8921-e642691c54ae.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f598f6d8-2d77-474e-ae4b-33604ccd4cd1.jpg'),
(200, 200, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e907660d-eff2-4527-91b3-1b1d9149d241.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6dde67c2-b343-4467-80f3-8b2230d8f943.jpg'),
(201, 201, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/3ededfa3-2407-4a37-a069-555123d30aa0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bbd0635d-0981-4ba7-8ce9-7a13a9564c18.jpg'),
(202, 202, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/5a9465f0-b6ce-4a5c-810a-1cb708f9e0df.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ae1a7f46-c4d6-4641-8fb6-d7a636001f7e.jpg'),
(203, 203, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/ebfd6c34-764c-4ab6-af5b-df1cd4e96e2c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/28ffafc0-d86f-4121-a89f-0a475660089c.jpg'),
(204, 204, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/0409dcc0-e045-4bf5-b8f6-73a754bee865.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c4f3f6e1-12e7-466f-86e9-ca00ec3b4e5a.jpg'),
(205, 205, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/f397cca2-a2ea-45ed-bd2b-f264577f1e4c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ad804b40-8d30-48c1-b250-73533eaca3df.jpg'),
(206, 206, 2, 7, 'https://kepulanganbp3mibanten.site/public/uploads/f1417e27-e910-41bb-aa80-9835549bba00.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1172c6ea-c066-4be3-b8ce-3ad6e5cbab12.jpg'),
(207, 207, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/acde9158-6403-408f-a392-3b2bcd263862.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a0a44b1d-15b6-4586-bbe7-94d0d11da026.jpg'),
(208, 208, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/9e19a733-4ed9-4c00-af4d-c6170dabcdbc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5346ccdf-f2e4-4314-9285-bfc97df5bd3e.jpg'),
(209, 209, 3, 15, 'https://kepulanganbp3mibanten.site/public/uploads/9c3436d7-8980-4826-be3d-d87e5425eaf8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1c569d3c-cac7-4f8e-9bf0-0c989ef97685.jpg'),
(210, 210, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/202d4418-c3a5-471b-8c27-0b2514073311.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/30bdd042-f7cc-4266-8160-8f2aae41f937.jpg'),
(211, 211, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/31f3eb05-3421-4a8c-8e03-9042130892f3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0e71c745-f7c7-4baf-9343-16068eaf7525.jpg'),
(212, 212, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e2250ab1-3ade-495b-b28c-77ca4bb0fec9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/83d46ac7-a83a-4f6c-875d-55229b827b0b.jpg'),
(213, 213, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/aaa1ec23-ae10-4b6f-a022-25efc8ebb33b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f22a1b30-6804-4611-8030-537505ed839c.jpg'),
(214, 214, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/dfa58b2c-89c2-41d3-9fb3-bbe80a853574.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d34b5df9-ecb6-4c9b-b1b8-d09be146258d.jpg'),
(215, 215, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/cc594008-18ef-4b8d-a397-5b95586060ff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/099991c6-ea6c-4e1c-8d5c-efded2eb748b.jpg'),
(216, 216, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/4cff9b48-7251-4cd7-a51e-3d2652a1ea33.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b6318aca-d6ec-40f5-97b4-7a639b820d0a.jpg'),
(217, 217, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/75c584e2-fbf5-4011-9f7a-13f5702545ef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b779d28d-fee6-4af8-bd7e-2eb4b6ef0c50.jpg'),
(218, 218, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/aa607628-c29b-43c2-93f9-2b6d769377f7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/84a4523d-75c2-4e1f-9fe1-922e4f6a3556.jpg'),
(219, 219, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bfda2efd-95c2-434d-8c7d-6e5ffbf3c9dc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/494ad2f8-5001-4c62-af4b-fc882f066280.jpg'),
(220, 220, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/17825ac1-24a4-46e8-9858-969490080d69.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a50985ad-3604-49b3-8447-3eceaa9ba4d6.jpg'),
(221, 221, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/12b46f01-80c5-42f9-9b08-c5a079f0136f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/39b40839-009e-4537-882a-73271e78ea82.jpg'),
(222, 222, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/21f45d9c-1676-44f7-903a-7a58144c3a46.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e094e36b-6c95-41da-ab94-b197568493bd.jpg'),
(223, 223, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bca43a1c-966d-4236-b062-cfd770675b96.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0d217107-23a0-4f77-9e85-f0c5db88c292.jpg'),
(224, 224, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/fd4e9952-ade8-49ab-a8bd-9c767e0649f7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6921be0c-1c68-4a0e-8556-d82de58149ca.jpg'),
(225, 225, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/5998e9c1-d33f-4300-a55a-b453124b10fd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1d9b11fb-0c82-4558-8276-ebf8665d2f16.jpg'),
(226, 226, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b8820ecf-4053-4378-9acb-c7866ee6fd52.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6b518852-750d-4853-b653-dfb90d2d760f.jpg'),
(227, 227, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/07d9475c-8f5a-4a48-9854-ecfc855ad7c2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/61a77271-f29d-4ffb-9c9a-73f54ddfec02.jpg'),
(228, 228, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ab4d7ee6-f326-4281-85a9-0e09707959bd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/eddc7ca8-a1f4-4eae-9bb5-28dcd5f2edca.jpg'),
(229, 229, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/61e06163-94dc-4fa4-b7e5-ea646ed31b8c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/46dfdc59-aa92-4eb7-9a08-55d44a15e8ad.jpg'),
(230, 230, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/f3cf436e-a3e9-46b9-8f36-2d4612e69c0e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/15e3263f-cf28-41f0-916a-f2edb5e958e7.jpg'),
(231, 231, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c5aedc89-a005-4eff-bedc-eba6050d6bbd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/22029a72-0db0-45f8-9faf-d7df3540e733.jpg'),
(232, 232, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d5fc9003-bc2c-4647-974d-7df863c1791b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0281ff75-7eed-415e-bdfc-573a95180e81.jpg'),
(233, 233, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e0fe6b2d-ec6d-4884-accc-cd881ae169f9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8bbcfe24-4b69-4f34-9b2a-b3c8ff00ec8f.jpg'),
(234, 234, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/48eae479-f5ed-4933-a8f6-8aad65fd23cb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8f290ff7-8809-45e2-9501-d33bb93b3fd6.jpg'),
(235, 235, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c51c3013-bcbd-45db-9df1-31d9968442fa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2b149deb-6528-4b88-bad7-94cdf26e9a68.jpg'),
(236, 236, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/2a1ee1ed-ab69-4eb0-87e3-a8ddf2120c54.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8a7905e6-5117-48e2-abfe-f9b4f17aa34b.jpg'),
(237, 237, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d4f02b85-4d3d-49dd-a801-9334e9d7fdfb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/eb39ef04-f4d3-42b0-bd6e-2de7b2ff753a.jpg'),
(238, 238, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/883b5087-fad9-4e64-ba6a-ab0752fa90f0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/05b2408e-a3ed-4f83-a284-a0ebd7f7c4aa.jpg'),
(239, 240, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/48cf57b5-a95d-4f41-9a0c-1c1b8325d875.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cf4ce290-2ef8-4862-8da5-6e4ac478718b.jpg'),
(240, 241, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e75b1e62-d5f6-44e5-8738-04787fb502d0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b4b8405c-32df-4bee-ac3f-4ea9f0a345e5.jpg'),
(241, 242, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/161311ed-e7c0-48fc-9ce8-873e408bf01d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f5c8b78c-58d4-4aab-a9e8-d04452f8ea73.jpg'),
(242, 243, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/7e5b0542-fc08-4eda-a95f-ab364a8feadb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9105ad59-852d-4b1b-9211-b667625afa17.jpg'),
(243, 244, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/34638f76-fee3-4cec-851b-9abd5883c632.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/05c4e88f-5963-4e4e-937f-80ac829c0bf2.jpg'),
(244, 245, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/9ade63b7-275f-47ad-9720-7fd1421ec6ae.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6455e7a6-a640-4a06-b64b-0e0af0b3ad47.jpg'),
(245, 246, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c29362bf-9c7c-42c0-a322-a4d8af7fa86a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4da06592-7f99-4a3f-8768-0dc9b2c228b7.jpg'),
(246, 247, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c08af4ec-b077-4a62-a6ec-cf2c0629202f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dffa1778-0dd6-4659-bca4-c268be6b732f.jpg'),
(247, 248, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/6735938e-34a0-437d-b8c5-7fd5db638abd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1c98b23e-5f99-40cc-a623-c22048c28720.jpg'),
(248, 249, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/1798043d-e07c-4161-b994-c972291721ab.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/818bb0ec-0592-41dc-bfdc-c77e921e3783.jpg');
INSERT INTO `pmi` (`id`, `id_imigran`, `id_group`, `id_masalah`, `foto_pmi`, `foto_paspor`) VALUES
(249, 250, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c1f5e8b2-8562-4d4c-9b71-f7451cb474ca.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f55f3842-be4b-4599-8170-89024734bfe1.jpg'),
(250, 251, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/29a2e735-e60a-4022-9684-c5e6b25b7033.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ebb87f49-d4a3-40ff-9d8a-f9130694a417.jpg'),
(251, 252, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/90587bd2-e547-45f5-a76a-6d7c4a008612.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5b7eb6ba-0d97-4061-8565-58d40394ef0a.jpg'),
(252, 253, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/97f70105-825c-42ff-992f-96b290c4efd6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ec2a4c54-ba85-40c0-9056-b06971eae8f7.jpg'),
(253, 254, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/76117ed2-39af-4c13-824a-a24a2a3ddac4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f15630cb-0be9-493c-a6cf-97a18bf53f56.jpg'),
(254, 255, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fc476a76-157c-4743-94fd-0e741069ca6d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4997a920-224d-403a-acc4-0f6f8b35025c.jpg'),
(255, 256, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c62e8b09-962a-4981-90ec-455a60527b4c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/97bf9568-c853-4ce0-9a3e-1da41a3e3759.jpg'),
(256, 257, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e0b90074-5991-44d2-b6e1-b20a0a76a252.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/582b1f48-146a-4379-aa83-9a1e2324e7ad.jpg'),
(257, 258, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7284aa71-ba18-4816-b710-3d9f57018f05.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/17aa86ee-d99a-4fa6-8ded-fa7e311fb19f.jpg'),
(258, 259, 2, 7, 'https://kepulanganbp3mibanten.site/public/uploads/c87b81d4-118e-45fa-a450-978e8e9cac0f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0ba4e5b6-4d7a-4225-981e-3c5019ef4b27.jpg'),
(259, 260, 2, 12, 'https://kepulanganbp3mibanten.site/public/uploads/7c2094a9-bd9d-4565-9611-11e66b1f05c7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/88228a4c-6688-43e0-9c1a-27bb32ce073b.jpg'),
(260, 261, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4824136e-521e-4662-be79-38664d2cb377.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cfbe6616-aa28-4a7a-b445-68856dd49fb9.jpg'),
(261, 262, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f73b1202-1d3b-4c5d-97d3-72ffbcf63b58.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f400efb9-4757-4b7f-9a9a-2fb92f30c456.jpg'),
(262, 264, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6bf2272b-37fc-4ced-959a-f38a30a5cf9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f0c004d-5ce8-4c18-9b6b-66fd5f98a3f5.jpg'),
(263, 265, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2be44190-2427-47d8-8c38-45189982578f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2996b7a-ddb8-45b3-ae2f-99c336ea275d.jpg'),
(264, 266, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f40bbce9-bafa-45ba-8db8-df2ea7f02d0f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a5a8adb8-2ac1-4965-95d5-b9c312edf3b7.jpg'),
(265, 267, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1048cae7-5be9-42f5-8f99-a0894a3fb0ba.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d5246185-a420-48aa-9761-752c61bdda25.jpg'),
(266, 268, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/30235ce4-baf9-4671-aa55-e3b21a3f2a18.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/60c8c1b5-36ac-4c21-a7d5-332ce3ee2ab5.jpg'),
(267, 269, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/dbc4d87b-09c6-4212-a147-dbbe3a20f42d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/27cbbe6a-8ca0-4a44-a72d-ffbb0ed34955.jpg'),
(268, 270, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c302fbbc-4222-497a-97c6-80e80c94b17c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6ae411e5-d9b8-4cf7-9e9d-9ab3e8e87a72.jpg'),
(269, 271, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/aeb1bc4e-7cc9-4699-b331-7887ac21eb5b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/12b0e7d3-e2a1-4c33-af80-bc852a34e385.jpg'),
(270, 272, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/a9db123d-1f42-4e76-9dd3-9b9dee0211bc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2ee8e0be-0202-4e93-8865-2e84028c2752.jpg'),
(271, 273, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b0289b6b-5062-4d2a-a91d-cb11c862278f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e5a753e7-0533-4500-a1b8-f2c10d525c58.jpg'),
(272, 274, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/3af8b99a-4188-4c7c-b2a3-eea0928d7e25.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ba20911c-4477-4711-a5b9-bc2912e17131.jpg'),
(273, 275, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/1ac528e0-bdf4-423b-bfe7-0d46e2853ae4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d5a04040-9d1a-4632-9b3b-a5508a4a9208.jpg'),
(274, 276, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/01147f52-65c5-41bf-ad5d-95ece774f966.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1921b7a0-0418-4f1e-80c0-e7f39f50bfb7.jpg'),
(275, 277, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0112008c-ba38-4ee8-bffd-f0834fc63091.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/06596ceb-ce2d-4316-8601-cedab0b99bd4.jpg'),
(276, 278, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8e35992f-fdd3-4a1b-977c-5b3fdb6dfd77.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/089f6434-dbb7-4e5a-bbd9-07e0b875481a.jpg'),
(277, 279, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/df81531c-ed0b-4fa3-b4e2-590b202dab09.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5c6b9ab8-62c9-4483-a662-e4ef127e3b22.jpg'),
(278, 280, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/dba6ed8f-e166-463b-a0c0-6beb74db4056.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0f3ec5f1-c689-43f1-9d2d-9cfca64e693e.jpg'),
(279, 281, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ac619e35-47f0-4190-a7ab-a08a5154a4f8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5101c4c6-12b6-4828-a18d-8f80c0cd1ba4.jpg'),
(280, 283, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/33bd47a7-8249-4798-8052-ee168b255a0a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/70e5054d-adac-489e-8dbe-0e1a1f2812dd.jpg'),
(281, 284, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/350d8e96-54db-4f1f-8b14-8301ca93225d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d9e502db-2ff3-4340-86e6-79b7446a2c29.jpg'),
(282, 285, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/db48b3ab-8eb9-4bbc-8a86-2c21c182bd33.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0eab2ce4-ab1f-4b94-a44d-e8d7f461d14c.jpg'),
(283, 286, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/93aea1dc-3b51-4556-9956-764ac0c3466e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c0e2239f-7b44-42eb-bc48-582a89ef9d7a.jpg'),
(284, 287, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/69ef5c00-779b-4e38-85c4-02bafaf5b65d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fa2b77eb-02c6-43fa-9a01-4b02342a40e4.jpg'),
(285, 288, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/46306037-1cf8-4c1c-b427-0b9ed0aed6a9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6386713e-d2e7-4e5a-bacc-8eae0e3b0a63.jpg'),
(286, 289, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/21d941d8-c653-4b53-8200-bce9d633e3a4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8adf7803-bcd0-4346-833f-fe3ddd702b27.jpg'),
(287, 290, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7a79de71-280a-47eb-a281-84e3444bafac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c2a8dd71-8970-4c4e-bc97-bec465aaf94c.jpg'),
(288, 291, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9cdb1b78-5b64-4fa4-af99-fc8f0b32bbf2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e119f5bc-8daf-42ce-81fa-e2b19d010566.jpg'),
(289, 292, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fab7d966-9978-482a-bd1d-8fe9d13069dc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5bb17985-8fc9-4309-a38c-09fa1916474b.jpg'),
(290, 293, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a222f03f-5228-4c1d-9849-35dca212b3d9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/373ef833-51ac-4edc-a3c4-0ae358f07d61.jpg'),
(291, 294, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2dcf2670-be1b-4f15-90f7-d2ac28d2368b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/703e1e87-1324-4646-aabe-9c897f8c1414.jpg'),
(292, 295, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4cb701c0-37bd-43ac-b50e-a2b948b2e967.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f3472278-fc7e-43af-aa80-fb26d395ab08.jpg'),
(293, 296, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/838f1a95-5f9f-4523-8dcd-3e0ffcceb616.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b9bca7b1-d91a-42d4-9c90-1ab973243490.jpg'),
(294, 297, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/10f252ab-1044-4451-b4d1-95245ec35bc9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e3077aae-c060-4a68-af16-d144c153506f.jpg'),
(295, 298, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ed64952a-a998-4e12-b454-d8a11f18fce7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9b2ef9c3-8027-4a03-b0d8-4098f6ee9fab.jpg'),
(296, 299, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/af8c74a3-ddfc-43a9-82d0-3fc16e3f0a06.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6c6de382-7c63-40da-b512-1fb1d45745b5.jpg'),
(297, 300, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/906035e8-a7ca-4772-b833-773130c6258c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/11ee8807-3678-4350-b847-59f45a29cdee.jpg'),
(298, 301, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/717748e5-2507-4de7-9c3e-543c756c44bb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/39549144-13bb-467f-aeb6-fc454feffad7.jpg'),
(299, 302, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c0c1956e-d79c-42a0-be5b-068f3a312cb3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8819b5c8-49f7-4ca7-b70f-ef5c15eb259f.jpg'),
(300, 303, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/edabb027-96b2-4ff6-bca9-98e7d74791be.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8c4d5fa8-65f4-4387-b9f7-31dc72b45ddf.jpg'),
(301, 304, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/144df04c-afdf-4082-9512-9d558367acf5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/757ebd3e-65e4-430e-b43c-c0d4e6a714de.jpg'),
(302, 305, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5d51405a-57b4-4352-9ac9-e09efc3e48b9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1ade66f-a83d-4e80-993e-e759dd3e67e6.jpg'),
(303, 306, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/d5447ef6-507e-4839-984f-644e3ebb89c2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f01bbb68-b3e5-40ad-8e5a-e19d308a23a1.jpg'),
(304, 307, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/aedf7ea8-cccb-4e4a-a3f1-4ccb64a30f7c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ca88ba71-e77a-49a3-a540-c0205cacc487.jpg'),
(305, 308, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/978606ca-9ff6-428c-83dc-c9806d936b18.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a525e3f0-74ea-4740-92a1-d11f7db64189.jpg'),
(306, 309, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/13dd4611-3cfa-495b-b557-b8dc304242ae.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a47f8b60-d551-435b-b7ae-5662b4049fdf.jpg'),
(307, 310, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3ac5cc10-6f56-4235-ac67-cf72fd2d0c41.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a3dcb59b-b3f2-4331-8275-b30ae2fc3c3b.jpg'),
(308, 311, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2935a8c2-63a3-4372-94f2-484d5858b978.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b118a02b-04c2-4101-bf34-cf3b40ce2a46.jpg'),
(309, 312, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/87e42108-5d91-495a-9575-685ec4568c75.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0b8031f0-0e70-4924-aad8-a5e9555eee6d.jpg'),
(310, 313, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/40dcd167-3f9d-4c5b-90da-c8225cc53856.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f76e8a40-4005-46f5-ac50-a0293abbbdd8.jpg'),
(311, 314, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a4a3112a-f8b7-4f5d-9683-aeff2975dd5a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c4b8e7ad-740e-42a9-a04d-711bab76df7b.jpg'),
(312, 315, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f2a464f9-a6af-43c2-ab10-3215d26e4172.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/74354006-a611-450d-bb9b-dc2933e3dd22.jpg'),
(313, 316, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/41bd12d2-7947-410d-bfac-6a0cc3a6cdc5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/af456532-0523-4288-80a3-fc2d74e6d053.jpg'),
(314, 317, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8c15ebc4-1293-47d0-b2f2-3720f2ad1dc1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/579baa11-40de-48d1-860d-8af9625ca663.jpg'),
(315, 319, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3a216f32-133c-44b0-a2da-1611c7ba5911.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/99630027-4805-4d4a-8c71-2fced2ca1f2d.jpg'),
(316, 324, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/247619c5-afe1-4e48-9c9a-16fb9137631d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/76189234-8050-41c0-9914-f973a773359d.jpg'),
(317, 325, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4ef9d333-a508-44c7-9cf2-dcd44f0616b1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6923be0e-bb5f-43e1-87b9-4888fea3f3c1.jpg'),
(318, 326, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7e4a2ee9-e42b-4a02-88dd-014199280a34.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dd470be8-a661-41de-8373-8fba6c399810.jpg'),
(319, 327, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/65cd432d-d201-47f6-bb84-442dad2e8f85.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b3bcddac-f08f-479d-8a82-b274257ecba2.jpg'),
(320, 328, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/97856b61-a8a6-4fe9-b81c-84e9bc2382bc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9e96e85b-c3cd-47fa-88ca-20f116dcc82c.jpg'),
(321, 329, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9f5c0aff-9c2d-4ebf-a588-a3e8b5f0aaa4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7a7df948-0e1d-4d6c-96e2-1f37e7224e66.jpg'),
(322, 330, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7ec88408-08ca-4a3a-abb9-278200334ec6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3d37fc6d-5816-4cda-a2bf-ae436ee833ee.jpg'),
(323, 331, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4ea18813-46d4-4005-b4bf-0dcfc149c37c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1014c1cb-52bc-48df-b20b-be7fe287b8fc.jpg'),
(324, 332, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2d1a306a-1863-493f-a7c5-fc7fe1d52c9c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d1ebf78f-0f16-4797-95ff-1c88f21084f8.jpg'),
(325, 333, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/787f7478-3267-4a2d-867c-1dd06fe7cf51.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/488e72f7-f4d6-425f-adc6-03363e5a18bc.jpg'),
(326, 334, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c5418d2b-98eb-4fee-836a-10c96bf816ff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7e9eefcc-5670-4902-adf1-26e36b5fe10d.jpg'),
(327, 335, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1968d496-9e90-4396-aad3-ade739656ce3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e007ea90-c4cd-4fb2-b370-79d3648757e0.jpg'),
(328, 336, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3cbfc7f9-6120-42ff-b175-6c25b3b5d310.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/461bfc37-c795-4089-baf5-f7d10e0b6d12.jpg'),
(329, 337, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2e8cbce3-8c6e-43c8-a607-d9bd9457f3e5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/08ae7d9c-fbe9-4410-b71a-def9571e0145.jpg'),
(330, 338, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/43da6620-de9b-4c17-81a2-4a7dec08e9e3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dce8b762-8982-4079-8aa7-c9c395416950.jpg'),
(331, 339, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/05930774-1b4e-49eb-a1e8-86b73e470bad.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0f3f9992-c000-4004-97ab-3b2bd39afc7e.jpg'),
(333, 341, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/04dc6ca8-4200-4a2f-963c-abe9da636eb2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6ac70342-6eff-4de9-aeb4-29a5ef871d6c.jpg'),
(334, 342, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/01c03f2e-d0f9-4cbe-a37f-6a0eac2ddfff.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d770d78e-2e92-4e60-bc71-0c73ef28b64d.jpg'),
(335, 343, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/8ca0cb86-865d-4a58-b1c8-ea4fa298d9e4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dd21ecb2-4aa5-4337-9ce7-16d7d7590af9.jpg'),
(336, 344, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/262efde3-c353-4d03-b0e6-254aeb9551f3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/442ae8d3-e81d-47f9-ac6f-647dfe25eeb8.jpg'),
(337, 345, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e36e571c-8c73-4f39-9a7e-8a6cc3eafcef.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1f4227bc-2dfa-43ef-99e2-71fe550aec1a.jpg'),
(338, 346, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/af842386-13a0-4588-8125-a2d45e1853d5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/48c8efff-db00-4f32-982d-01bacbcb32fc.jpg'),
(339, 347, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/32317a28-5479-4092-96a9-1749babb7139.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/76c13472-442b-4fd4-b52b-3477ceeabf64.jpg'),
(340, 348, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/abb12568-c47e-4e67-bc1c-18240ff150b1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f548d405-7096-4c5b-ae24-2f71bd94ed82.jpg'),
(341, 349, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/3fe97226-46a8-4060-b22c-3ae10e7a2250.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2c716dfa-2f69-44bf-bae1-4a6e42f1997a.jpg'),
(342, 350, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/46ea9325-1df4-4037-baed-2f5d102aac11.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/80d64f18-2ee6-4bb2-a35a-792a2255ce8f.jpg'),
(343, 351, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/c40c7e8d-ed5a-41dc-9c49-df5e22f2ee3f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0005ceda-7110-4a02-a27c-a772fcc9a3c5.jpg'),
(344, 352, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/b942e48f-9033-4a20-a686-1b477f0d8689.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/85eb9884-fd26-43e8-916f-f50609edb832.jpg'),
(345, 353, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/acfa7d16-3d52-40df-b0ea-90051bd7a19b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7f43c244-6910-450d-bb31-b948ca006a88.jpg'),
(346, 354, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/99ca6a3a-9ded-47a7-8122-effb3a40916e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/35fd86d3-e826-40d2-9c52-d25109d3ced7.jpg'),
(347, 355, 3, 18, 'https://kepulanganbp3mibanten.site/public/uploads/d74c1254-61ca-4b63-869e-5d37a2ed6d74.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ded1501b-4452-4e5e-ad39-9c9e49b257e2.jpg'),
(348, 356, 3, 18, 'https://kepulanganbp3mibanten.site/public/uploads/2186f153-2149-4b88-a7e2-ebfc18603ace.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ef9b8909-ed1f-45fc-87d8-8f07030dd916.jpg'),
(349, 357, 3, 18, 'https://kepulanganbp3mibanten.site/public/uploads/aa7732e5-fe33-454f-b143-fbc4b006864b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/63e8333b-a668-4ea6-bca2-c11fd4ff9039.jpg'),
(350, 358, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ba72fe7c-135c-4f8e-8af8-4838085e4e9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/374bf2c1-ad38-4a12-8d58-365448b5e085.jpg'),
(351, 359, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/39029e81-1f0f-424a-a7ba-544d8381c426.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5e09e348-d900-4ccc-9cc5-2eb92d48691c.jpg'),
(352, 360, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2e991773-3a71-4a46-ba1e-29c7600ff640.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0a4b9264-f5dc-4efd-b96d-44faae2cb4a1.jpg'),
(353, 361, 1, 18, 'https://kepulanganbp3mibanten.site/public/uploads/95b48162-faee-4cf9-afba-0dd2b7509120.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2ed6d740-e859-4571-8758-4d951ad639e7.jpg'),
(354, 362, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc77a5ce-40f5-4f08-a053-18b05ee2ce8d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cee6ee70-eb61-466c-b437-db501343f7a0.jpg'),
(355, 363, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc8a827d-a890-4d8c-aa4b-b22904ce2683.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aa1cddc9-90de-450c-9750-282cf9f211c2.jpg'),
(356, 364, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/712d9fcf-ab92-41c0-8c3e-7d26904128d3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fb11bfea-1ec2-493b-8dd2-9115b6cd3c53.jpg'),
(357, 365, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b310d779-91d7-4b64-8f15-259f97b839d6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d7e6abbd-547c-401b-84b6-3902d9722b3c.jpg'),
(358, 366, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3e25e33d-34df-466e-ab07-d202a5ee417d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cfca661e-e426-4b06-9b59-ea3c003cb4e2.jpg'),
(359, 367, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7e79305c-9f97-44f7-be33-0152ebe3cbb1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d6369ceb-b98c-4124-8fd5-bf834a6d8931.jpg'),
(360, 368, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7dbc452a-0c22-459f-890a-83524833eade.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6ae5bc2d-7d05-4c27-8fe1-769368dc8ed7.jpg'),
(362, 370, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/700a45a5-c1db-4c51-8b50-f5ebdff0c1eb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1af0aff-f926-40b2-9cd3-a1509d4dcdf7.jpg'),
(363, 371, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e166ecfd-48e9-430e-a066-bcaec7df6f37.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c114c94f-07d9-4355-afee-6dad9b61ddbd.jpg'),
(364, 372, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4e38b025-fd3d-4d91-b76e-02ec8022c4b9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/50d595ca-5dec-4769-ac53-69efd5934064.jpg'),
(365, 373, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fa246c44-3c58-4662-9aa7-9cc1f6b004e9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ede16232-502f-4fa8-aa4e-95fa3ca3652f.jpg'),
(366, 374, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d0552987-65dc-4724-98a4-bd0f6726c567.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/04ef8406-ca79-4119-bac6-b4caf28c9723.jpg'),
(367, 375, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/61ae44ed-98f8-4044-a672-c91e2aaf9ca9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/862ca864-2ace-4e21-9542-0af027b01f16.jpg'),
(368, 376, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a19e24c6-1a45-4dba-8ef5-fc057736a0d9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/95dc7976-4437-421a-9ee7-9e2467480211.jpg'),
(369, 377, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2f00cddf-c40f-4c57-a6aa-a5650c53fe81.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a8cdb825-9035-470c-afd2-82c6b1931dc7.jpg'),
(370, 378, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c35003c4-bf2f-4408-9d99-cdb15b24e72a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cbecb352-4691-46d1-96a2-c7f71bd7cb68.jpg'),
(371, 379, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/767d89f7-cdf2-4cf0-8737-d8dd598d2688.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/36d00393-f796-4439-bd25-ab677d7c7130.jpg'),
(372, 380, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/54b5f3b8-4425-47ce-a200-cb8d65e14bd8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9b828475-b4d7-4113-8376-ba8630899ec7.jpg'),
(373, 381, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2fb52682-fab6-4d07-8087-de531441a185.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/94b8aaf8-a636-4cc0-9694-45da3fc115f7.jpg'),
(374, 382, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5da985a4-c8a8-4658-ac84-8a07d9b22e76.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/651cdbe6-3031-43cf-b4da-136919e6decb.jpg'),
(375, 383, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a31874bb-ec94-410d-bb69-365b508522be.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c9cc7976-cf6b-4464-9d42-c4816d84a797.jpg'),
(376, 384, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ae168bb8-6fdb-4ab1-b479-873a4ec14242.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4d55ac43-5021-41e8-bc59-0111967a2eab.jpg'),
(377, 385, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0d2bc144-84cf-4eb0-9dc8-bca63fc4ac89.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9992dc78-9b6c-4cfd-930b-4e7040f9180e.jpg'),
(378, 386, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6d5d5015-b945-4dbb-8ad2-0260c0e26355.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ceeb9fb9-599d-4afa-a293-e96bf84deb68.jpg'),
(379, 387, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/68f9f5e4-a06c-40c3-a7b9-49576dac2fe3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/480b4849-ebbc-4b6c-99ad-6bfe98c60871.jpg'),
(380, 388, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/09ad2aee-bfa7-4f34-875a-9f843e144489.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/98b74f78-b51c-4b70-9261-9e71a59e142a.jpg'),
(381, 389, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4e453cc5-88a1-42e6-afa6-fa5155902c54.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0f752af0-7358-4fa3-b167-081572cc7b2a.jpg'),
(382, 390, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8147dec1-0503-4504-b468-72d6e60e7a03.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/51e6fd10-fff8-4292-b350-ae43a3d955c7.jpg'),
(383, 391, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7bfd01b4-2b27-4b30-8b88-16e759157c14.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/eec63e9a-499a-4658-a65d-9a51aeb1b919.jpg'),
(384, 392, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b84c3f86-0c59-49ed-9083-f4642bd0715b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1405b83-2232-4047-ae6a-13460aaeb485.jpg'),
(385, 393, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e8fe555e-8b86-4ce0-b774-354e79746a1e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/be2668f8-da17-4684-b749-23310e63a273.jpg'),
(386, 394, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1fa724d4-1a53-4fd6-bbb6-86b1708daa38.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/599bf914-8899-490e-8fb7-308bb935dac6.jpg'),
(387, 395, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/67cef3e5-2ded-4204-9ff6-e9ee8589e3f1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/392dda13-6555-4a52-ab95-01689f4dbd01.jpg'),
(388, 396, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/eafca533-e178-4ab8-a00f-0eff12b56c0f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f4fe8b77-b7bc-47eb-bfc7-10483424174d.jpg'),
(389, 397, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8abe576b-d547-482a-92f9-c2b6aeae3627.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/204eaae7-cf02-410d-845f-986c64d04308.jpg'),
(390, 398, 2, 2, 'https://kepulanganbp3mibanten.site/public/uploads/9238475e-cb39-4eeb-8b51-94acfc71da0a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/67602dce-66cc-4052-9dc6-caa27ab016f2.jpg'),
(391, 399, 2, 2, 'https://kepulanganbp3mibanten.site/public/uploads/b1c78496-6e2f-49ff-ac09-382e0cc5559f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5488a4a3-5145-44a3-b2ec-3ee36bc4406f.jpg'),
(392, 400, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/acf01dde-6f65-479a-aa75-46212c880b95.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8fc4bb2d-dcb2-47b8-87e3-7c98e0d89635.jpg'),
(393, 401, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/9f0ccd6b-e8be-4411-b47a-4d6e79b71769.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5d4d4e94-4e79-4cc5-a8d1-d650e017a95b.jpg'),
(394, 402, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/933defae-b4af-4624-97ad-461f99da6280.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/44e6b2a2-666c-45ca-80c1-050cd97c3d16.jpg'),
(395, 403, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/e574c159-c0cd-46c3-af43-f89d04c94120.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9f1e3080-c375-476d-8db4-dd68458ae423.jpg'),
(396, 404, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/423f01e3-d17a-4ae8-bb1c-8cb1ea5cdb9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4e0bdfec-5549-408b-9027-46b2d0737ece.jpg'),
(397, 405, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/17f6ea5d-5b4d-4f0e-aff5-12df5a9e9eee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a754aede-7d17-4d9a-8723-58c61bea70c7.jpg'),
(398, 406, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/a494c5e3-e18e-4328-a41d-87e33a083002.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fafad65e-1be4-460f-bd66-2c85f5bbd93d.jpg'),
(399, 407, 2, 18, 'https://kepulanganbp3mibanten.site/public/uploads/e8160af1-89e4-485b-9610-8e5520309f48.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a08ff725-3a9e-4c4e-9276-defcb53bb604.jpg'),
(400, 408, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d0f62fce-644f-4cfd-b62f-3c6fbb90b30f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e9e95103-6dc2-4796-8ee8-cefc485b4712.jpg'),
(401, 409, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/71efce08-2100-47da-a502-841d12f5879c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1815d853-129b-41f1-b4f1-de0e8a17966c.jpg'),
(402, 410, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fd55fc73-5c1e-42dc-8725-65f5e803c9ea.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/833439a8-d2c3-4af2-ac09-22f1a6490330.jpg'),
(403, 411, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ee1b94dd-d75d-4b26-81a5-0bbd85dde95c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/51681058-7251-48f5-a934-240c346d0494.jpg'),
(404, 412, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fe7e1411-208d-4640-bebc-3fea0e83ee0b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5de7c42a-9d8f-4457-929e-1cb8521a88cf.jpg'),
(405, 413, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/65533881-8222-4462-a76f-5db4e20f319c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bb6b948d-c141-4ab3-91b9-a911e70c0d5e.jpg'),
(406, 414, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ad7d8e7c-da48-42eb-955d-0815362a5b6e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/892b2d3a-3a7b-4cda-ad1f-a15552d1b5ea.jpg'),
(407, 415, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0080f1c5-bc58-4600-9877-14c39c81f623.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/706def40-3380-430a-bee9-63e73df53f40.jpg'),
(408, 416, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2adc1eb2-40f1-4780-8fb4-0c179fd9ff5d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/86f1735d-3721-4db1-9db9-586d2e8a42f7.jpg'),
(409, 417, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c0b72e97-7f9d-48ed-8d07-d0290c28bb3a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/891114d2-5a97-4b0b-a245-10f5e765efc4.jpg'),
(410, 418, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f653e46a-75e6-4b24-8a9b-208014b3bb8f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c670d042-688f-4591-beb3-0a5fa0f85f0d.jpg'),
(411, 419, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6bbe9e07-c21e-440b-9d1d-dbe31bbe7e31.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/014a94e6-3d49-4ae9-a24e-50dc769614c1.jpg'),
(412, 420, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d80812bb-f311-44b1-bd0a-7bf72bb20f31.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/97c71183-77dc-4775-b366-3e19d616e4b4.jpg'),
(413, 421, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/fb7cff85-03fa-4f23-b8eb-40995d9dffc2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e93371b1-331b-4e1f-8362-52493c1aaf9c.jpg'),
(414, 422, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e8f6fd1f-6c20-460f-aabb-ddf46fea9862.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/436e651c-7f26-4d50-bf45-f5ad0a0cd410.jpg'),
(415, 423, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/37d9f64a-ae26-46ff-a842-aac8f268d38a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45e39bd5-a44f-4e1c-9647-7282b82d0b7c.jpg'),
(416, 424, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/faf53ad7-5461-43c4-972f-4331cc8e706e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b172c984-facf-4025-9ea2-4b71143ba763.jpg'),
(417, 425, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/86537e52-edf2-4fc9-b1ab-2228ebf1197e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/49a48b25-f40c-4185-abb4-a30fe16f18cc.jpg'),
(418, 426, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/817ee1f6-c67a-47d0-a1c1-c562e23df302.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0fee6f06-0906-431e-8700-ffadd6b82b38.jpg'),
(419, 427, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b9415dcb-9900-4d7b-8a19-8832f5b6984a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ceaa3c34-866f-4352-9a13-91cc01cd7a95.jpg'),
(420, 428, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3290fdac-74ba-4f7d-9442-24455356dbde.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ec1b391f-7806-457d-a2f8-086f5a973eba.jpg'),
(421, 429, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b0001a07-2bab-4486-88aa-a5e1989c1e07.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f4b102ee-05c5-40ca-bbd3-a771ddfe6a79.jpg'),
(422, 430, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/45ea6739-3e2e-43fc-9ceb-081908f28f08.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8ef79fbb-c8b7-4400-99b9-da3154d5fcba.jpg'),
(423, 431, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/feb048b6-737f-4b48-b8d9-40e7fd3cb06b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/01bda7be-feeb-4582-8404-560b147e940e.jpg'),
(424, 432, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/16ed31a6-98c6-4c4f-bd6f-dfa533bb2577.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/530a4773-a797-4ab6-9e2a-4c859fdd42b7.jpg'),
(425, 433, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e1e5fb30-2dff-4683-89fe-f45001f52e91.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2f3693c8-95a0-48ec-8e37-3e2a5c92047a.jpg'),
(426, 434, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c5c890f4-7058-4761-a5ca-be60b7c16e5d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/de3b8e6e-65d8-49de-a281-d6629a80534d.jpg'),
(427, 435, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d1a42234-f563-44ca-af31-1d98aafa60bf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/27fbcded-a970-418d-a0e1-2f114eeef969.jpg'),
(428, 436, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d7549f29-33a2-46ad-a972-1f75359dc96c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9e304af8-1ad8-4930-b700-2464f6eac780.jpg'),
(429, 437, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/6dcc9288-cf37-4756-b500-3dd22c5b409e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/32f232ed-16fd-4632-9514-eea23104925a.jpg'),
(430, 438, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b1d6685d-230f-4059-ac48-fe4bf15842f5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/67d49cb2-c3df-4237-9474-b3c617849a1d.jpg'),
(431, 439, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/f43e2fbd-89a8-4dc4-956d-2c9750189f9a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/85b6193c-9606-4238-a051-32101b8ea104.jpg'),
(432, 441, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ee604ede-c2b0-470d-bdeb-074647c9d780.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b1fa8966-d158-494b-8225-187fbc2d6817.jpg'),
(433, 442, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d655a93b-403e-43cd-88c4-f4267b9e7b91.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f05c4ac6-8bbf-423f-829c-43ec4ea48e20.jpg'),
(434, 443, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ec5b15d1-7bda-4886-82ca-50f34c7f448e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f9a3c7d7-080c-4410-80f9-edfe317cc5a5.jpg'),
(435, 444, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d144c57e-3abe-48d1-966f-374223abc1f1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/babd2cbd-a5a6-49e6-a542-8ba2317a60e1.jpg'),
(436, 445, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/bfa5f96f-2590-48ba-a731-093db44c35c8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3d35b367-ba35-466b-ba43-1b3f05d4997f.jpg'),
(437, 446, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e35e575b-f252-4f9d-9be3-cbb1072fa4c1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/93bf17bf-544f-4f89-ae34-9787ba46558d.jpg'),
(438, 447, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f6381cfa-4542-432e-b311-dd6a7adf1125.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0a260737-7ab6-455f-9209-f6c78045b54b.jpg'),
(439, 448, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/080eba69-314a-469b-97b8-4effda227dbc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9d4b9f7f-1956-4d4f-8da7-741c543466ed.jpg'),
(440, 449, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/40cfb03f-aaf0-41e4-9ab2-b48915ed2bc6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a9f4b1d5-1e0f-4e6b-a98e-8245880646c9.jpg'),
(441, 450, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/958bbf12-2841-4acc-a3fc-af49072ae3d2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/876c6b42-e0dc-4a6f-8358-eb606fa9fc82.jpg'),
(442, 451, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/62ec0fed-1e8a-4f6f-b836-1279ebd335da.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d518e7b3-0f47-47f0-b752-8c17ac8cbdac.jpg'),
(443, 452, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d084e27f-3724-419c-9dc2-68545cebb87a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6083c072-5ef2-4a21-9812-bc3d7abce81e.jpg'),
(444, 453, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ce4796d5-4ed5-4344-85de-8e246ecd892b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e3bf2f71-5ca5-4351-b8a4-4f8de9ee088d.jpg'),
(445, 454, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a9d5e1af-e186-4519-ae6e-8bf8cc8aee8b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e4dae90a-a5fa-405d-a656-e37a87bcac35.jpg'),
(446, 455, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e9a6667b-93da-4af7-bcde-5a427bdf0262.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d4e2b33a-9e2a-4d7c-a79a-4f378d3a104f.jpg'),
(447, 456, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a65bf44e-b489-4e86-814a-cbe4170df1fd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/40d0afa5-0738-4c55-9656-d5b7cac25580.jpg'),
(448, 457, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/671ade1b-994f-4ec1-93cd-f652272625a2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/683bdfb5-377c-44ca-84c8-1d227d37156b.jpg'),
(449, 458, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e0b89830-b982-4957-93eb-2107e2a74d7d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1442ed5-b5f7-4579-bfbd-ad4a547a568d.jpg'),
(450, 459, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/829af801-4252-42c6-8c04-83601ae9a6c0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8a38e1b3-0449-4e17-bb5c-e818837221a7.jpg'),
(451, 460, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2968d174-430f-4a16-b75a-b5327aecd939.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/55e14b71-1c5c-4bb5-8103-deebd94d0292.jpg'),
(452, 461, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/8182db7c-6779-4243-8dad-b94fd4611a32.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c1674e13-b912-4776-8c33-1ec1ff96c9c5.jpg'),
(453, 462, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/5b1c91fe-5456-4680-b855-74632285dbac.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a25485d6-d56c-40cc-aa6c-9e4c2e3d31a7.jpg'),
(454, 463, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7411b949-6f7e-49a8-bda8-d01bcc8ffa96.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4e6ecc31-517c-46e4-aabd-11f9fa8e0f62.jpg'),
(455, 464, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/64158dca-a771-4187-a8d4-aed3c321d139.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d4d77b9b-ab32-4460-b01f-55ba76864aaa.jpg'),
(456, 465, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f5c0556f-03d2-4dfa-8839-b4dcff6be1c7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f33a9ad2-a01d-4d4a-9051-ba5000789db2.jpg'),
(457, 466, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2578933d-7458-4d15-a953-e53b86e6601f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/080daca7-2794-4cbd-bca5-88e52ef54c1f.jpg'),
(458, 467, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/50c45f51-477d-4fd9-855b-cd26be56abed.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0aac0e1f-1314-4d4c-96f4-3e8b7d621012.jpg'),
(459, 468, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b6a280ea-0569-4216-8344-15a9ed95f9aa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/037dea6f-f75b-4629-8f7c-3b94fade13f7.jpg'),
(460, 469, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/eecb16aa-4965-4715-89f9-f0cd8ab75448.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4945e57f-63ac-4629-8d7e-4de29463b3b8.jpg'),
(461, 470, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/97e43393-a107-4f8b-8211-b64a9b69b708.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/88c58d9d-2b51-4bb8-b4eb-d88c5daacf18.jpg'),
(462, 471, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/55cbed04-094e-49a1-a961-b63282a0e508.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/deb34387-94eb-4993-affc-d210c494eac7.jpg'),
(463, 472, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/54584405-f397-47ea-9733-8f9e416aff66.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/891b7a87-d235-40e5-bf13-3ca896e1426d.jpg'),
(464, 473, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ec3898bd-7d93-453b-89b0-1059397f9c09.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fc66c47e-1a6c-48ee-8baf-8ae9cd57d6a7.jpg'),
(465, 474, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0dcbc7d6-7395-431e-b620-900eb0751262.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2507b781-bd73-4f6c-83e1-db063202d20c.jpg'),
(466, 475, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b45be604-a53e-4d3c-a0e2-aa507e86764f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/929ed89c-e550-4415-94c7-68ed23e6b126.jpg'),
(467, 476, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a80e2cee-d2e3-485b-937f-f188a8e54e7d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/138c2fc7-8399-429b-bbef-277e4791928c.jpg'),
(468, 477, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/73fb01b6-eead-4055-a193-120c0d423973.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2457a329-1f1a-40aa-8fa4-8dd20793d520.jpg'),
(469, 478, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/72402fad-0505-40a4-abab-2830ff09fb60.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f4939b91-4f43-4210-963a-c5383bf12516.jpg'),
(470, 479, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2f4f4faa-917b-400b-89de-34c088662e6a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9f13aa8a-4ed5-40bc-a1c7-7d6495bdb524.jpg'),
(471, 480, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/52c38b32-4569-4985-8229-d84710fbfac9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/355d8d6f-b93e-4f85-87cd-d5b7c3005ff2.jpg'),
(472, 481, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/800363dd-027a-4779-b613-c30fdde16c3c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2383c71c-5824-43ea-b9a3-bb054094528f.jpg'),
(473, 482, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a65a2c94-7e68-447a-840c-51ff3eaa198e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c5b20b67-8e4f-4d37-8be0-1867dfc9fb5c.jpg'),
(474, 483, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/44f7727f-a9d0-4612-9e6c-5479d7c672d1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/251ab6a6-58ca-47b7-8e1d-cf6cebe28648.jpg'),
(475, 484, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/33a17f23-b846-445c-9945-7be01c83b358.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c9464147-7941-4911-a9e2-19390bbc66f3.jpg'),
(476, 485, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/507b7639-c30c-4e51-abb9-05f1826e2a44.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ffd6736f-72a6-4bd0-af32-a6652d91331c.jpg'),
(477, 486, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8dcf6ed5-23e9-4daa-8485-29290ab77773.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ea94dfc0-d97e-4c47-b19f-39233d97530b.jpg'),
(478, 487, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e423dc58-60ed-4424-a3ea-587eec00c70d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3883da4e-d2e8-4069-9fae-fc312d26382b.jpg'),
(479, 488, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/18dd4b39-fa0f-43b4-9a96-365fcf05f52e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/14dee2de-b78e-4bff-907e-efd457cfed3c.jpg'),
(480, 489, 3, 5, 'https://kepulanganbp3mibanten.site/public/uploads/ede4bd23-3c63-4a84-a052-d38181ae332e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f5458c6-0ec2-4c18-bbf0-1bf89fb247e0.jpg'),
(481, 490, 3, 5, 'https://kepulanganbp3mibanten.site/public/uploads/946d6733-416d-413d-b999-d734811dcdf3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c9bb1842-b902-46c5-a970-567791cadd72.jpg'),
(482, 491, 3, 7, 'https://kepulanganbp3mibanten.site/public/uploads/5a8b30d9-fac0-4b2b-b4d3-ae3231e6e635.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/562fe758-8e20-43ba-9e06-a80c45e01ead.jpg'),
(483, 492, 3, 6, 'https://kepulanganbp3mibanten.site/public/uploads/4f5820c1-b95c-4d4c-8326-10744043e1dd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/934136fa-9c0e-43c0-bdae-f85ce89ed298.jpg'),
(484, 494, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c0e370fc-e949-4d3e-a9c2-070e87987642.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6aa42c5f-816f-469f-a94b-4e3ffea0d28a.jpg'),
(485, 495, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2f79e0f1-5937-4160-b16e-07b926c5fc34.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b9c6aea7-5aed-4a04-9aca-d6ef594297ae.jpg'),
(486, 496, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f8a60726-7b6a-43d2-8ba9-f3f12743e2d1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f2834d0-35f4-40e8-9042-ba0738c3ed5f.jpg'),
(487, 497, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/471941d6-2f03-4a5c-b378-7ca5a37d03d8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/aa3e61eb-cd6a-4bb3-8a1a-3b3dc67b9545.jpg'),
(488, 498, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4eafc8ab-8ecd-4155-996a-39940efc01f5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1a000ad6-7275-4c4b-87a3-e5996e0ea208.jpg'),
(489, 499, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc41ddf7-2e4c-49ef-a099-5c96a56683ad.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/51b2c55f-efa5-48c8-9336-b36bff968ded.jpg'),
(490, 500, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f7bd3bc5-4148-4774-b018-5be3135e4be5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3ba649b5-1074-422b-8a86-46e6d0cf91a1.jpg'),
(491, 501, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/628154a6-a0da-4ed4-b540-3c264c26bb25.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/baa2d41d-3088-42ed-a21c-7098944d9b78.jpg'),
(492, 502, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b9976256-55af-4746-94d3-f6bcfa67d748.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8478093a-4394-4de7-a809-4e4413288d9e.jpg'),
(493, 503, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/dbe6690d-11cd-4127-9b00-39b63ba7f13a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b097c8fb-950c-4546-a787-1988500a57e0.jpg'),
(494, 504, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3e9ecd23-9eff-4224-86ac-ef620ac22a7c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/73661843-6464-483e-9825-c18df3f26398.jpg');
INSERT INTO `pmi` (`id`, `id_imigran`, `id_group`, `id_masalah`, `foto_pmi`, `foto_paspor`) VALUES
(495, 505, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d4b84538-3410-43c2-9f9c-48627e684323.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fee072a0-f9ba-4c3b-8002-0b125d7c2794.jpg'),
(496, 506, 3, 5, 'https://kepulanganbp3mibanten.site/public/uploads/746e237b-aa14-4f8e-a21c-ad158ab59dfb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1b7c7430-f3dc-48d9-a3a9-ac5ffbb94437.jpg'),
(497, 507, 3, 5, 'https://kepulanganbp3mibanten.site/public/uploads/fd18d89b-ca24-47ff-b335-71c71ec392c7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/acd406fd-e77f-4902-806f-77226f36f5bf.jpg'),
(498, 508, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e71291d0-a9b8-4899-a244-285c79d8481e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7b191cf1-0d8c-44ba-bca3-0d3e9861e745.jpg'),
(499, 509, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/db4ccea4-8866-458f-9e23-bd1c88c27d39.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/566b53cd-3a1c-4581-b43c-1f15100566ed.jpg'),
(500, 511, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5ee9c66c-49cc-499d-b8c1-0f9a027e7206.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/99892b42-19fc-4d09-921c-24c0b0452c68.jpg'),
(501, 512, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f37b09cc-372f-4a0b-942f-f78d096744ee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bb11fde0-423e-449a-9626-091ba65bcbfa.jpg'),
(502, 513, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fb9356c0-9632-4487-a1c3-40131b06ada8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/23860431-59ef-4342-8c65-1275d07f094c.jpg'),
(503, 514, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc0a096a-dcc7-40cb-ac77-f51febe2d692.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/027cdead-6250-4389-bf68-52af79b354f7.jpg'),
(504, 515, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c3f5794f-ff3a-4421-9575-4d62c8fe2599.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/968a604b-bf38-4cc3-b6fd-98cfca912fc9.jpg'),
(505, 516, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9b477ae2-6c29-4e3c-aa7a-bc76df27b80a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dd5ccfdc-319f-49ea-b685-622c27afc8ed.jpg'),
(506, 517, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/bc4d968a-d204-4ea3-97e4-b4ff3c149fdb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9154ea90-cb04-4946-aa89-27b01b7c2b7b.jpg'),
(507, 518, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/871d338a-e45d-43a4-aa83-afca1f382acd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c78afc82-bd05-4b41-bd78-221bb90ddf4d.jpg'),
(508, 519, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5110e333-88eb-4148-8ba6-05498023ebc0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fe4aed4f-1a84-439c-8e02-051f12ef8b1e.jpg'),
(509, 520, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d5fef229-398c-4e67-95cb-6c4262d86f8c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f92ce14f-a49a-45ef-86ba-45855b202e2b.jpg'),
(510, 521, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/52e0ea4a-77ca-41c4-9ee1-f39c5fd176fc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/093343c7-d680-4646-9098-4245a844f488.jpg'),
(511, 522, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b0fd6985-4ecf-4700-94c3-7ccff7a25c17.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6d420411-e245-47b8-b1ec-f3220e9a53ae.jpg'),
(512, 523, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/81387c4e-cb89-4122-af20-012aa26b61c0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d32effef-c95d-4eb0-b6a1-da1a4a76a7bb.jpg'),
(513, 524, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9ac1040d-55ce-4f27-b02f-058da74c6c84.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c9a6578e-1dad-447d-8ef5-255fed4dbaa3.jpg'),
(514, 525, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/637e9086-422c-4d60-aa0a-021aa8ee774b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/283e7cbe-6def-4944-90f9-48a102ce86df.jpg'),
(515, 526, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d635d8e4-8cf1-49c0-b5c3-b1d77190a2fe.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6b2bba41-1802-4652-b0e0-1ce6f9e9c733.jpg'),
(516, 527, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/15f4934e-4b0f-450c-b98d-26c91acfc127.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3d088ecc-9c88-4446-be3e-f85b90b7f14a.jpg'),
(517, 528, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/72dea672-4f02-462c-917a-01becdddd2bd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/67eb8dbe-241e-4fdb-9b50-ff167369ed91.jpg'),
(518, 529, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3f965c0d-f7e3-4c44-9816-aa1eebfc0376.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/54c17ea3-dc72-4dab-92dc-dfde2964cb29.jpg'),
(519, 530, 2, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4e9b8cdc-16fd-4380-ba8a-551aba87e096.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7a2424e3-dff2-407f-a91d-09348e842f58.jpg'),
(520, 531, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/8b469dd2-a96d-4d12-beef-f75c019193dc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8960e23f-a2f4-4843-b8e3-3c8740eeaa16.jpg'),
(521, 532, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/cb73bc5e-5041-4554-b14b-440c002bf85d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1f1d28b0-a70d-4312-aa4e-c76ab44262b8.jpg'),
(522, 533, 3, 9, 'https://kepulanganbp3mibanten.site/public/uploads/36d4a108-c9be-4de9-b9e6-6cd96109d454.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c026eca2-62b2-49f8-8abd-61460de6e71b.jpg'),
(523, 534, 3, 9, 'https://kepulanganbp3mibanten.site/public/uploads/5d30ea07-9374-4f72-9be8-22a3f675c191.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/252e85b2-af9d-4814-81c5-06069c62767d.jpg'),
(524, 535, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/af8584cc-194e-45d8-9969-29e8536faa9b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/85fd9c1b-23ff-4e1f-acbe-0198828fc405.jpg'),
(525, 536, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/098988a5-b18e-44ce-9fba-d0a12a19c62a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/723cd7dc-831d-4875-ba0f-63214f7a9f14.jpg'),
(526, 537, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7e245fe9-66c2-4744-b40c-37aec6007cd1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ba8f5b21-b343-474a-b124-33a4596ba2eb.jpg'),
(527, 538, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/574ec325-e7b1-4e9c-9d1f-eb539601a979.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/45311a5f-fb36-4bb2-887c-0fa31956fb6a.jpg'),
(528, 539, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/498e3842-3acb-42b8-9a88-c010ccb7bb49.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/56c16165-1a90-4051-99be-195168fa3bf3.jpg'),
(529, 540, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/25dd09fe-8c5d-4a54-ac2f-fcba75e44c35.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/720fb9d9-ba67-42b2-a267-6bb03d8ac10b.jpg'),
(530, 541, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f65f5f3a-555f-4b5e-8905-da033da89ca8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/367b2e0b-c768-4930-8cf6-c65f429dc8ec.jpg'),
(531, 542, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a6cad12b-866c-4b74-a6ab-cbcae756d86b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/31b70eb9-4370-48bb-9ce0-0f068c41330e.jpg'),
(532, 543, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/67e2c92b-d72d-4f7a-91f8-2f16aedf5e50.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/35265a63-4bc7-4de1-a477-0861bcfd16a9.jpg'),
(533, 544, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/56561ddd-b569-4f1c-aa99-63acd9ace326.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b1c7c124-1a33-410c-b620-b9d238087d55.jpg'),
(534, 545, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b6f44c50-8593-45dd-864b-b885bdf932b1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d77bd210-0970-46ac-b54a-80ea6b40d3e8.jpg'),
(535, 546, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8644c07e-defa-4cfe-a249-479513236c4e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/05c0c6f4-0300-45e5-91d1-1a3cd0f677c5.jpg'),
(536, 547, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/27845d57-b1f5-48e9-a499-d08d844837e1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9e4c0bd3-7dee-4113-8de9-303d66f3678a.jpg'),
(537, 548, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c74ae8d8-2417-4276-a2d3-6d4d9579342c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/573a4835-09d3-4aff-8ea8-ba81b5f9b07d.jpg'),
(538, 549, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/24112b03-9144-415f-92f3-a5662caf4b19.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f211030c-be2b-4a5e-a54a-b5d495c88d32.jpg'),
(539, 550, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e3bb5bd4-1447-4f2b-8502-90567b8f772a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/40622c7f-d710-4402-87fe-fa73c87f5a9c.jpg'),
(540, 551, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/deac5154-bac7-4c65-b9d7-47157ee6be64.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a1b9d999-96ba-455d-b5ff-a0517dc0f7b6.jpg'),
(541, 552, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ef1b35ad-cd22-482b-bef0-da5031e11260.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2c85eddf-ba0a-4e6d-bfc8-40305a41c82c.jpg'),
(542, 554, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/bd1c7622-91f2-4296-95eb-68b8f12ded5b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b1afa377-717c-465f-9e19-932386cf0def.jpg'),
(543, 555, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1c76978a-a519-4229-a54e-c7e2d42a6e53.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8cb970c3-57d0-4f1d-96a2-7383535569a0.jpg'),
(544, 556, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a5f0422f-5cf3-469c-af52-29beedc03bf9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/34d57b49-7caa-4fad-b6e4-6a35a56004b1.jpg'),
(545, 557, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2c1ab139-9ae0-4f95-bbcd-a11200597ff7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f8b0c133-ce16-4fe4-a959-2169fe9ca8c7.jpg'),
(546, 558, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f4968481-6a05-446e-8b5f-4dafa96e8a95.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3b763c0a-634c-41f5-9792-359a4e62b0c6.jpg'),
(547, 559, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5a6d7c0b-0d5e-4984-ab67-f20f3a0c63b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9c7e9b5a-d339-45a5-8719-cd03ca0333ed.jpg'),
(548, 560, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/97b8c946-aa48-4920-ac05-324b41ed9143.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a79d89d0-7d55-494b-941b-6d40b3f10d9f.jpg'),
(549, 561, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e15c604b-d3cd-45b6-8f33-57e6635abf31.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/24bbc29e-8a25-4bf4-95e8-e4ddabe09636.jpg'),
(550, 562, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f1279ed1-c16b-4e7d-9bb8-6fbfe59ab4a9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/392ddea2-ac01-4160-9c06-cb0b513306e0.jpg'),
(551, 563, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2dc5fd9c-35c0-4865-9e3d-bac4c34a4ad6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2bb3f655-b8a3-4dc2-8f2b-cef027482f7c.jpg'),
(552, 564, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c9b53a38-993f-401a-9655-5a771c7c88f7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0b885e3c-0909-4893-96d7-970aa16a634b.jpg'),
(553, 565, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7af309b7-1fc7-48d0-8625-2bb0e6662811.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/84c2e6c6-ed37-4729-a5b1-a579d09f04ae.jpg'),
(554, 566, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a1b7db8f-101d-471e-a417-6753cae4b4ce.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/66ee3c24-e942-492d-8949-eb321fbff894.jpg'),
(555, 567, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2d56f1dc-2f01-4df3-bbe2-b8920e11a78a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d8b97153-598f-4e6e-814c-8ec97ebdf892.jpg'),
(556, 568, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/93ceeae0-8bef-48f0-94ee-27584a94d3e7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a5dd3af1-71fb-4f1a-951e-49a7a99ad63d.jpg'),
(557, 569, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0a888cfb-06b6-484e-89f4-b3f02f54f478.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f82a818-ab6f-4a6b-94c1-37e62836dafc.jpg'),
(558, 570, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7f69f9e3-e94b-46fd-8d75-e7c3bc506d4c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0d372300-ad47-4e80-b9fb-7971a6f7b273.jpg'),
(559, 571, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9fe6b0f8-c642-40f1-87d0-ce8b61b1dbc2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e8a019a9-1813-4b4d-91af-9ab2e61a5c27.jpg'),
(560, 572, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/69e02afe-1806-447b-a19e-4655fae0faf1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2921bf75-e94b-4790-89c1-3495871233d1.jpg'),
(561, 573, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/65ae9e40-77ea-4f18-aec5-26dcbcb2a456.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/57166c37-9e7b-476c-a1b2-1360a75fae2a.jpg'),
(562, 574, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8b4b6b42-bee2-46b1-8255-2a4392719110.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c90de706-46ed-4bed-a481-1ace454d12fb.jpg'),
(563, 575, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/15cbdfc4-9024-4ce1-9f93-9ea90bb47dc3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e8b5043a-80a3-48b3-bd27-db9c5e75d01f.jpg'),
(564, 576, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/7eeaff45-b56d-4b72-846b-05e5088eded6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3dab5968-fd07-4b16-af1e-8a02f3a47650.jpg'),
(565, 577, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/2333e89c-a674-4e42-af5a-09772fd43f1a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d17c6190-0746-4351-ba0c-55ca37539ecc.jpg'),
(566, 578, 2, 7, 'https://kepulanganbp3mibanten.site/public/uploads/8c2c84c1-1795-4d4d-9f9a-d40f603d4af1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/50cd882d-5bd9-48af-bd5d-20697263a66b.jpg'),
(567, 580, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/8c5a535b-b208-45de-89dd-00158fad26e1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cd44ac18-6347-4483-9318-231725e0be3b.jpg'),
(568, 581, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/e7bdc317-e1ec-41fa-a8fa-7530138364cd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/66224df1-8dd1-4f5e-9be1-f7314b91ef7e.jpg'),
(569, 582, 3, 14, 'https://kepulanganbp3mibanten.site/public/uploads/53672339-a4c6-4645-9937-e5482cb9b496.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0f1acd97-191c-4acc-8437-c40326b9161a.jpg'),
(570, 583, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/24d5838f-dfaf-446c-97d4-14b9bdd6d7f7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9e832b88-379b-4333-8934-25e3fa3c4539.jpg'),
(571, 584, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/859a3c2f-5c97-4f4d-9e28-56606832ce40.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/99e4de6e-da21-4ca5-9708-32be1847d8e9.jpg'),
(572, 585, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/5e3cd68e-ddf4-414e-acd9-74ee2b7e6751.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d322e260-ef0f-42aa-927c-a2bc5f6a06f4.jpg'),
(573, 586, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/628112c2-b3b3-45d7-a2d0-74bf5849d8a5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/56e784ba-4e5c-4fa5-a024-600df078224f.jpg'),
(574, 587, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d9de8382-f878-4fd4-b3bf-f50b018bd321.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/35680bcf-b50b-4740-9482-505712757909.jpg'),
(575, 588, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0090909c-1fe9-4d06-9e94-82caeda23cdf.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/89955aa9-7a10-4766-9e76-e807b36d3baa.jpg'),
(576, 589, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/667b54d2-f227-4006-b749-bbeb5f4df44f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/00519dd7-3f2e-4fa2-94fc-74d9ea492bd7.jpg'),
(577, 590, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9e9b6ce8-e21c-4de7-b2f9-b299ff4551ae.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a19dc4f6-4496-4437-b28f-18a52c28bf2d.jpg'),
(578, 591, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/39a1a64a-35b9-4448-99c1-8d8757ec3697.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6e4457d9-d94e-4d6d-af2c-f65d262a3218.jpg'),
(579, 592, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f2362bf8-b6f8-41b2-a025-7e0ad7c2aadc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/522a0eaa-173b-428a-9f2f-b4d6a2515630.jpg'),
(580, 593, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ea35d144-9330-40ce-8b10-c5d55dfdf7a3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d008dea2-6d02-4866-a96c-7dacd1a5e639.jpg'),
(581, 594, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2ff24fe4-8bbc-48d8-b593-f19ab43ee9a0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/df2d2103-8a11-4fd9-baa7-34d35098996f.jpg'),
(582, 595, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ef7a669c-31cd-4baa-b5a4-9673141f0300.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/42bbdb1e-c338-4f50-a7a2-09bb5900903c.jpg'),
(583, 596, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9db2dfd6-37cf-4aae-a344-3511b2735591.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c14e4785-6380-4c3b-96cb-bc7456a2c904.jpg'),
(584, 597, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f2896208-a522-4219-808d-2616f4bedb69.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6f417b2a-7511-497c-9284-8d7e8d35e6ed.jpg'),
(585, 598, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/161f0fd9-bf12-463f-a167-9f0661d71f17.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8132a496-5268-4e8c-9d53-5f4cd644d8b4.jpg'),
(586, 599, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/14bca850-495c-4a7c-8770-f0204e096fde.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/58dd409b-2509-4a04-96fc-3842afa1ceda.jpg'),
(587, 600, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9b0e3fa1-8978-4f33-8a91-2841d405d10f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6eddb30b-4ab3-4e62-a2ae-dfcfa5864715.jpg'),
(588, 601, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/35e75b82-f15d-4ab3-a7f7-5d1e637a1f8b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/969e4931-db01-4837-bb07-d0adda42270e.jpg'),
(589, 602, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/71e7af29-4e69-40b1-a675-66521c6609d1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/487ddeee-7c5e-4e46-9dd5-f7aed411646a.jpg'),
(590, 603, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a27d2018-50a2-4832-905e-ef50dca917eb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/057fc6e2-353a-44aa-8c4b-a5cfbaf4569d.jpg'),
(591, 604, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f675d65a-2263-4ffa-a45d-f716fadff04c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/742feca4-5b89-431d-ae43-d0c0e49389f8.jpg'),
(592, 605, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0e1fbd0c-b592-4f05-acd9-bac233129b6a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8159c981-42cd-4268-b3e0-e1821a51f235.jpg'),
(593, 606, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d4ab5eb7-04bc-4c88-8d2e-d1e724b92bcb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3364088f-09c8-4379-9cf1-02e202b8b3d0.jpg'),
(594, 607, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3d027c16-321d-4705-be83-d378291af5df.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ff565243-7042-4b3a-becb-94e4299a233a.jpg'),
(595, 608, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c9cc0a8b-ca1a-4954-9a6d-6bb736951bf2.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e40bff6e-488c-4c6d-b04f-fa22fed8c47e.jpg'),
(596, 609, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fa7620db-abd4-412f-bafd-3c9fb6eba870.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c30f60d1-a1bb-4994-8ab6-d02db976a50f.jpg'),
(597, 610, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2b33161c-925f-49f3-94b3-2fcc1090641b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cd435885-2e91-4e12-8392-d95cbec4f474.jpg'),
(598, 611, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/21aea1bb-9bb8-4a1b-92ea-926628ff881e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ae3789f8-0efe-4b7f-b0a8-74e8fa9131e4.jpg'),
(599, 612, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/58402d80-279a-47b6-9c1b-4a3dbc1cdb56.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3a71c41a-d204-4196-af72-c5a65c4e75b3.jpg'),
(600, 613, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c2dc3fee-9bf2-4f7d-9ffa-cf2570a67e3d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/591362c5-9c65-44e5-9769-429e4d8e691d.jpg'),
(601, 614, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9f71e1e6-bd20-4e1c-9aed-e314275e0d18.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/93af11b4-63ec-4f10-895d-f4425a7a6d72.jpg'),
(602, 615, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/fada321e-6b8d-4f23-88a2-76eb4ec526c9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e09a67e2-715c-4273-a43c-391fe180f784.jpg'),
(603, 616, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/e3cd8e48-d5ba-4dad-8f75-4599657f2524.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5c752996-af60-450b-a6a8-ef63a77b5233.jpg'),
(604, 617, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cfa5a43c-3361-44ef-89a5-caacc6ddf0ed.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6d2483ff-e547-41bf-ba8a-31cd2e944c18.jpg'),
(605, 618, 3, 8, 'https://kepulanganbp3mibanten.site/public/uploads/9bc60be4-3fad-4508-913e-51274faf4af6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1ceff651-9a7f-477f-93f6-f23e9eea14cc.jpg'),
(606, 619, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a3e1a602-378a-4675-8425-bb26d20936c5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/41ebc4af-ceaf-4d5d-bb62-613dce8c3f20.jpg'),
(607, 620, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/207d32fa-7831-4fb2-8dbb-41c6a89ceb55.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/dcf24950-d491-439c-a67f-c03b9827d685.jpg'),
(608, 621, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b949d636-3ef9-4c87-97d6-32fc0abb12e3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0206f166-886e-4946-8856-427f196772a9.jpg'),
(609, 622, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/140e38cf-e8f6-469a-83f8-ce2c10bef245.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6e43a10e-4880-4f59-b051-55fa3980382d.jpg'),
(610, 623, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/3f74bef2-7bc5-47c1-9ee5-c5e7983a5f2b.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/25b2d9c2-93ca-4b38-b6c0-3c399e878da2.jpg'),
(611, 624, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c0563089-b76a-4306-ae3b-83d76537d3c6.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/937c2ec8-065f-412d-ab64-637f98c65479.jpg'),
(612, 625, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/7a49ba60-ffd5-4b59-a0a3-31b9483866fd.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/24480686-75bf-49eb-ba74-85c6bebe4d7e.jpg'),
(613, 626, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/9bc0ea33-80e5-4584-bc46-bec020cd8037.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d2e00cf3-e95d-4568-8218-3588e27b0ac6.jpg'),
(614, 627, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/f69935cb-63db-4666-81fc-026560b98d92.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/04e861bf-3023-4716-b064-52ba9780e0c0.jpg'),
(615, 629, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/33be80bd-838e-4640-8053-c5e757558045.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ebe5d459-7796-42ce-824c-91f1c4cc744e.jpg'),
(616, 631, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/41c1ecfc-7b57-486a-85a6-f4c5bb2c3748.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f62bedd9-f8cd-4ae0-9298-ea46610c1796.jpg'),
(617, 636, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/c7b90951-fe9b-49bd-af6a-536a8cb504b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/36bbacf5-cc74-490e-974d-5834a13bb395.jpg'),
(618, 637, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1e9cf36a-50d7-4518-b5c3-acea99d2b1c4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2433408d-01b8-4dc8-84f2-695f97947d3e.jpg'),
(619, 638, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/2b7ddaf8-a348-4d65-9fd1-28c6d7c059d0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bae4f423-500e-4981-a98a-8ae048beb35d.jpg'),
(620, 639, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/1b743087-7c5b-4dcd-8221-fbc5505c0263.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5f511a06-c984-4165-ba12-c1b0e72f9f9a.jpg'),
(621, 640, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/481402c5-2d8b-47f1-a1ab-77887d7f2b00.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f0f54c70-55c1-4c9f-bd6c-04337a159ebe.jpg'),
(622, 641, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/d83d9e79-e18d-4239-8d6e-9607bfceb4b4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e0ebc526-c8be-458e-ad21-1bbc1cff0d0b.jpg'),
(623, 642, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/97547416-6ed0-40f0-9543-93e5d9eda604.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c10733ae-4481-46ed-93a5-0a5e97f8b0e4.jpg'),
(624, 643, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/32bdba31-447a-47b6-bcab-49041b3e6131.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1e281b2e-bef0-4708-bcc6-a307ace61405.jpg'),
(625, 644, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b31bdda3-4c1b-4e36-a260-efc4c8a71a11.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8a3f0472-19c6-4bdc-9920-2fc56bd3fbde.jpg'),
(626, 645, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/cc1a8422-0a25-4f52-bd28-fac65fde7072.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/690fe4f1-8165-4589-b771-3ca7c2cf4b68.jpg'),
(627, 646, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/718af6a2-97ca-490b-9193-90d72b9afa19.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f4259946-13ac-44c5-8f09-04e4e1af3123.jpg'),
(628, 647, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/0c2db526-1c8e-440a-8b70-29d90c2e804c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d733312f-adf0-47f9-8e7a-afad9382874b.jpg'),
(629, 648, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/81b1f295-577d-468f-9875-974f0fb322db.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/17900642-df0a-4e6d-a43c-c246d084b5a3.jpg'),
(630, 649, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/3d780515-4b9d-4ca5-a12f-6ccedde6bd38.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c140a8d5-46b8-4578-b6fe-14b0d8efe199.jpg'),
(631, 650, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/17fee72e-762f-4645-8656-0c53d9f7e989.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f0ad6db-c97a-4a4a-aa5a-4d674c5b347c.jpg'),
(632, 651, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/ad0a3716-3b28-46c8-8068-6112f08fe56c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/cbf0ee60-2bc2-4e2d-9dc2-da9309cf7895.jpg'),
(633, 652, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/41741235-be64-40d9-b56c-295e45d0f057.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b56082d3-25ee-461d-b656-781e6cf88c50.jpg'),
(634, 653, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/1a993288-2d88-45d1-8485-1f33fb7c6879.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f761cb7c-dfb9-4eb4-9559-fd09d0384cf5.jpg'),
(635, 654, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/4dad4932-6091-416f-80b4-015d091db667.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c64fb88f-4895-40dd-bb11-e31d02a55978.jpg'),
(636, 655, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/a1d9a0e3-6af8-495f-b0db-616685126a18.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/00c5ddd8-837a-49fb-945f-ae46f05c8e28.jpg'),
(637, 656, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/33cd0fae-b477-4a0e-8299-7a5b57e6f9c8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d75582f2-ae4c-4979-bd5d-7d051f7a4ac0.jpg'),
(638, 657, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/b0fd8fb4-2153-4693-9dd9-7e70f5c25223.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b4473ed3-c71d-4a63-8ef1-60a4b2893ca3.jpg'),
(639, 658, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/8b3c3c6d-1574-4f0d-8b27-3064b12c88a8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b1a6e7de-7aeb-460d-86fe-c9c08751c3a6.jpg'),
(640, 659, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/53603814-4d9f-4151-9d26-c3b186e163ee.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/2b4dfd55-2176-40a9-be29-0b59f6d908e1.jpg'),
(641, 660, 1, 5, 'https://kepulanganbp3mibanten.site/public/uploads/53028a19-7457-47bf-a6eb-44f9e663fcdb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4238c642-da51-49e3-876d-c657255967a8.jpg'),
(642, 661, 1, 16, 'https://kepulanganbp3mibanten.site/public/uploads/17a7f11b-cece-4a81-a920-6e44b85ad0f0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4ca22c09-3368-4c04-a134-af6436f162e6.jpg'),
(643, 662, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/aa6f3bdd-894e-4b3b-a050-f8628aed80e8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/554c243f-dc05-427b-9b55-3ed2e081fbe2.jpg'),
(644, 663, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/acaaa035-4eb6-4fd4-a46e-9085a1044d0c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/02e20eeb-68fc-40fc-9037-b4b6805f2d12.jpg'),
(645, 664, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/39a6a255-2514-47f7-8d35-4c79517d8d8a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c4369d81-b665-4f93-be9f-87654d4ee19c.jpg'),
(646, 665, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/5bb8e79b-9bea-4aa4-a02f-4197bb93d26f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d3336f6c-bf43-41cf-9e91-eadcfe7fd534.jpg'),
(647, 666, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bc2002e2-3a96-4a53-8cf9-65341eab4648.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/0af6a4f2-d5fe-40cc-ab88-c26f04356f0e.jpg'),
(648, 667, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/498d0a3e-d7ca-4cab-bda0-7872450ddfd5.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1f5bebfd-f043-43e7-a93d-00aae0ec1b19.jpg'),
(649, 668, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e0efb349-1b8f-4180-8b9c-ba97aa5e03b8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a93270e1-4512-433c-a7b4-1d37cb1d68fe.jpg'),
(650, 669, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/8e493fe0-8172-4a22-8652-413b05f8d1c0.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5cf7f6f7-a545-41b3-a542-32125c85b042.jpg'),
(651, 670, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/71d1d593-00e3-4858-8be9-30ee70bd1d14.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9820b859-138e-4289-a098-c27bf6ccfef7.jpg'),
(652, 671, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e5592551-e89c-4c9c-8ffa-cc6bbd2fa32d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/488a0d04-dc7b-4d12-841b-5bf6bfa9fb90.jpg'),
(653, 672, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/2c0fc5f6-77a7-4fdf-8d8a-544601dbdd67.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d8bd5b15-a2f6-4f1f-a99e-9efdf43f8e97.jpg'),
(654, 673, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/7a4a69e6-75aa-44ec-81c7-27cb34a6489a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/5e43e30d-3579-47a7-8d39-e074029e0f45.jpg'),
(655, 674, 1, 7, 'https://kepulanganbp3mibanten.site/public/uploads/1b30eead-0eda-4230-9d2f-ff44b0505cda.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/fa09cba0-f913-41b4-8599-f56854d09169.jpg'),
(656, 675, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/87029bc7-718d-4461-aedb-d2e337735107.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/73323c1f-8caa-4b56-9146-fad04e3efafb.jpg'),
(657, 676, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/ebfbf932-ab1c-49ea-8abc-95ac7864041c.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8f14a716-8cb0-495a-ad2b-4a05fb62757a.jpg'),
(658, 677, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/217ead67-9662-4181-b344-d10b3669feb1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ad0008cb-81b3-46c5-a016-8c4336c5e411.jpg'),
(659, 678, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b2f7ee65-f0f7-438d-a643-d749ac6561de.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6510ca81-7d27-4c10-834d-cd54deea8673.jpg'),
(660, 679, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/b0725713-712a-4617-a6ee-a72b9b6c170a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ddeaf9c7-78c0-4830-baa0-47be6c33d99f.jpg'),
(661, 680, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/264e5e4d-c96a-4e98-95c1-08ea20fe03d8.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a53a7a40-1a91-4b18-991e-bda73208844e.jpg'),
(662, 681, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/fdd95b5e-5b65-48dd-a969-37ed3f99eb7e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4c502e4e-0084-445d-9d85-ec6b946d26d4.jpg'),
(663, 682, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/f4f6d052-b5ba-4577-bd2b-7281c9c1d1b7.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7456a0d8-929e-4728-b372-d88f2cfa8e11.jpg'),
(664, 683, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/8adcbca8-49aa-4b3c-9599-c1d6866658bb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/df296f31-a7d5-4b94-a1f4-56a28238f34e.jpg'),
(665, 684, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/25028d9c-f36f-483f-b774-372ba28fda92.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/88a4b9b0-ab0d-4310-bf04-e98f61a7d741.jpg'),
(666, 685, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/cd91d9e3-bdca-406c-8ae6-a1ded44b2420.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/3de85f06-395b-4fb8-80ee-dc2d4ea0f3ac.jpg'),
(667, 686, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/17548bbc-0e3a-45df-97ca-2570828f00bc.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/ac61eecd-8bb9-4c3b-9c65-ab75d79171e1.jpg'),
(668, 687, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/e9048de0-5d39-40b9-a62f-58726ba408fe.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c3c8be25-dcf5-44cd-a26a-6d09f5dd4588.jpg'),
(669, 688, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/1d1f748b-bf8c-4aa6-84b8-7cd65273a3f1.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/736f6259-9fff-48f8-91a5-cf396f371588.jpg'),
(670, 689, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/7594edc4-a80c-44b9-8c8c-eba1a228a603.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1169059e-a58e-4195-8ba4-aa4669218317.jpg'),
(671, 690, 1, 17, 'https://kepulanganbp3mibanten.site/public/uploads/56754155-4070-4c0e-b849-80002baa7d5e.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/925d4281-7b73-49b7-a515-da46ff931174.jpg'),
(672, 691, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/d2399124-5509-48a1-8847-7df45240b704.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/a674bc69-446e-4dff-9d60-2ed314eb08f5.jpg'),
(673, 692, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/56dd1902-87db-4be8-bc84-f78d69386d8d.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/4f031806-7804-48d1-b98a-f2c3e2a54dfe.jpg'),
(674, 693, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/2de9f53c-297e-4450-95a6-d88299570a92.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d3875a0c-e014-4c65-a769-503f0923bace.jpg'),
(675, 694, 2, 9, 'https://kepulanganbp3mibanten.site/public/uploads/7899b1f8-b18c-4304-ac6b-f187912a9a0a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/27345197-715e-4524-9888-4d6d6d86d5ca.jpg'),
(676, 697, 3, 16, 'https://kepulanganbp3mibanten.site/public/uploads/60d452f9-13e5-4e42-aa3b-9a5892ace40a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/df6be3bb-023c-4d42-974c-2bd85aac5835.jpg'),
(677, 698, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/34a424d7-1e19-4471-9836-e750bff64711.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/19633ac6-c48a-451e-8faf-e19d2f082ced.jpg'),
(678, 699, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/9cce5fe1-ce78-4e45-9adc-c2e7b1f61ffb.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/32ba2358-9e6f-47fb-ad3a-b928febe0372.jpg'),
(679, 701, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/95557fc9-bc35-4f08-a413-68be1c7ff5aa.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6cd4f522-0713-487c-af14-536c04ec4096.jpg'),
(680, 702, 1, 8, 'https://kepulanganbp3mibanten.site/public/uploads/f54b0078-5ce2-4c4c-995d-e1f518614845.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b77ef6ca-a7c8-49eb-9965-ab05963491b0.jpg'),
(681, 703, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/3d0345df-d075-4209-a86b-2b9ad9c6b090.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/753c89a9-be13-42fa-939a-0c6a7e91ed74.jpg'),
(682, 704, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/0afb696e-2ddd-41c0-83dd-2b5824951584.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/f64b33c3-684b-4a3c-9733-1dd8727e4a84.jpg'),
(683, 705, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/75d6bfa1-af42-4b33-a0dc-30c02ea27a91.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6b1deddc-a158-47b6-8348-b0ecb029736e.jpg'),
(684, 706, 3, 17, 'https://kepulanganbp3mibanten.site/public/uploads/779c9361-742a-43f4-af84-6928d2936659.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/c7fdb7a9-5c80-47d8-b05c-82b55de5cc3f.jpg'),
(685, 707, 2, 16, 'https://kepulanganbp3mibanten.site/public/uploads/6b9e88e4-03a8-4a77-b24c-ab8e47b2e10f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/bab2c7d0-b84e-4617-8876-7ad52b9da773.jpg'),
(686, 708, 2, 9, 'https://kepulanganbp3mibanten.site/public/uploads/a5c4fb8a-494e-4d32-9b34-518fcaba7ed3.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/122f730a-14f1-4378-8147-4ffcd485f78e.jpg'),
(687, 709, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/36019146-5fd8-40e4-b6cc-6cabeea7bf46.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d30f0646-c9d9-48de-8ea7-06796ed3a4c5.jpg'),
(688, 710, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/c8095a55-6f97-4421-b672-cd5bb98c8750.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/795f3328-9f5f-4d03-ae27-edc00cc629a3.jpg'),
(689, 711, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/645e9746-e522-449e-8666-50a269d6147a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b29be2a5-5011-49ad-8422-d304cbd46d78.jpg'),
(690, 712, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/689c80ce-86c3-4ebc-8d93-dd88b593a879.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/b104d96a-f8e0-4724-af3a-5d0a4678708a.jpg'),
(691, 713, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/2fb79b78-1ab2-4e2c-91ca-7746a6786ca4.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8c4b6e5f-0617-4241-bc16-0ee00a6f812a.jpg'),
(692, 714, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/04a41c8e-aeb9-45e6-a660-a003c784a42a.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/e44ff6f5-3542-4fc1-9a38-d6e8945ad515.jpg'),
(693, 715, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/37f11960-cb7a-491f-9c7c-f7432a8edd4f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8f741702-27a2-46cc-8114-1a618b471917.jpg'),
(694, 716, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/bdf370e6-0dfc-416a-8f17-12b8caee05d9.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/79d1444a-50b4-4c32-a434-576d4a6ecc5f.jpg'),
(695, 717, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/caf80ebd-c760-4ee7-8e3f-128af2d06054.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/1cfd3542-4202-4169-8623-f517103cbff9.jpg'),
(696, 718, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/08ca4c58-0e92-4a46-91f2-7f8af65db44f.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/6249c987-bf60-4665-a2cd-940eb4abb94a.jpg'),
(697, 719, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/156392da-c391-46e7-a17d-80cb5d059c02.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7a7dd612-6075-4f43-8688-a105e7af8c2b.jpg'),
(698, 720, 1, 9, 'https://kepulanganbp3mibanten.site/public/uploads/60270d7c-e51f-440b-860c-23938c2d1e62.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/d2a1d3ee-50d9-40c8-a9f4-2cfaf3df8146.jpg'),
(699, 721, 2, 17, 'https://kepulanganbp3mibanten.site/public/uploads/89930e29-30ba-41da-b1b2-f3e0eb1ac5ca.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/9c44bba2-89f4-4358-85e6-d1959db8e10c.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `provinsi`
--

CREATE TABLE `provinsi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pulang_mandiri`
--

INSERT INTO `pulang_mandiri` (`id`, `id_kepulangan`, `id_imigran`, `tanggal_serah_terima`, `foto_serah_terima`, `id_user`) VALUES
(1, 4, 3, '2023-06-18', 'https://kepulanganbp3mibanten.site/public/uploads/04f18a5e-a29f-46b2-bdda-5f0c43389e25.jpg', 1),
(2, 4, 16, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/92fc8c7b-1b0a-4437-a60c-4e822c123d8e.jpg', 3),
(3, 4, 15, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/561213c1-6a5c-4854-9715-2076df3d8dfa.jpg', 3),
(4, 4, 14, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/16971165-45ea-4ebf-a4d5-a7ded096c7a6.jpg', 3),
(5, 4, 13, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/68948e9b-5f2a-4bf7-80d0-49eaa099b334.jpg', 3),
(6, 4, 35, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/0eb70a0c-60e0-4d8e-8573-62be77c9be5d.jpg', 10),
(7, 4, 36, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/779728f8-0fc6-4172-9ca7-6bb61164a0df.jpg', 10),
(8, 4, 37, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/ec7593a7-b594-458b-a433-a4b64854e1e7.jpg', 10),
(9, 4, 38, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/4fd41e6d-399d-4213-b99d-0c3420c8ca7d.jpg', 10),
(10, 4, 39, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/01a64067-db12-48eb-9dfa-52ae7b1aedc5.jpg', 10),
(11, 4, 40, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/acebcf50-a1b2-431b-b3d6-759e81e9eb6a.jpg', 10),
(12, 4, 41, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/acd454ae-fdca-4343-8ff9-d2a2503a49a3.jpg', 10),
(13, 4, 42, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/d8b3689e-83a1-48ed-8f54-cff7242ee85c.jpg', 10),
(14, 4, 44, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/f28b2b10-d7ad-4f6a-b9a9-f2f343f741cc.jpg', 10),
(15, 4, 52, '2023-06-20', 'https://kepulanganbp3mibanten.site/public/uploads/0ad274b6-42d0-46a8-8f05-58f97a560611.jpg', 9),
(16, 4, 65, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/441ebf62-fab4-4cce-b220-fa798926c0f4.jpg', 6),
(17, 4, 66, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/ceed60be-79d2-404f-810f-25fa34e5ca18.jpg', 6),
(18, 4, 67, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/62e62838-b8eb-432d-8a64-5bebdfd83154.jpg', 6),
(19, 4, 68, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/cf24bd85-4475-45ae-b01f-2eaa2e3f5a34.jpg', 6),
(20, 4, 69, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/8a9491d8-09cc-4989-bee1-4b94a0173063.jpg', 6),
(21, 4, 70, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/e2978777-bbe7-4baa-8c11-b3909afc716b.jpg', 6),
(22, 4, 71, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/b17e2a81-6553-4a28-afb6-a1167becbe77.jpg', 6),
(23, 4, 72, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/173188d2-8daf-4201-9649-c0e117ecf66a.jpg', 6),
(24, 4, 73, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/d6170751-ea6b-4536-a8d6-5a2d8f28b21d.jpg', 6),
(25, 4, 74, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/9921dc30-9072-4727-9eb4-824663dc2a2f.jpg', 6),
(26, 4, 75, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/c05bd72c-d9cf-4aa5-a32c-9498c41704cc.jpg', 6),
(27, 4, 76, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/22d6e2b8-f16a-490e-a51e-d74a1006a03d.jpg', 6),
(28, 4, 77, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/acda3297-55ce-498c-b4af-cf16a3110244.jpg', 6),
(29, 4, 78, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/6f79ccf9-6435-421f-b234-df0ad5ebe131.jpg', 6),
(30, 4, 79, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/479f40d7-104f-43a4-a6e0-68649b41ea71.jpg', 6),
(31, 4, 80, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/174c8443-659f-4772-b9af-002d40a99e0f.jpg', 6),
(32, 4, 84, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/6740a3da-a241-4921-924e-229b860f8a22.jpg', 6),
(33, 4, 85, '2023-06-22', 'https://kepulanganbp3mibanten.site/public/uploads/1cd5d939-f89c-4f70-bddb-c60f13451fb6.jpg', 6),
(34, 4, 81, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/810b5cf0-218d-439b-9809-0042d964041e.jpg', 3),
(35, 4, 86, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/f5803d30-2f5a-40ca-9844-c85f1422f711.jpg', 6),
(36, 4, 87, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/31bb1e39-0824-4d02-aced-9eb15230bafe.jpg', 6),
(37, 4, 88, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/e63fbdd1-9b8f-4905-926e-986c88d176e5.jpg', 10),
(38, 4, 89, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/4775dd67-4490-4f49-bcd4-02d8a7704d86.jpg', 10),
(39, 4, 90, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/e1dae3cf-3217-4e18-9d63-19161e95e38d.jpg', 10),
(40, 4, 91, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/0785ea31-a3c2-459e-9f1d-0897c7653355.jpg', 10),
(41, 4, 92, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/4a290c19-7e46-429b-bf5f-9b9e6abf1736.jpg', 10),
(42, 4, 93, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/7c823e26-5af3-4d09-8439-1ea39dbf213e.jpg', 10),
(43, 4, 101, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/ad6e3070-8db7-43c9-8832-cd34ad9c3e5e.jpg', 10),
(44, 4, 103, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/6dcc5568-fd3e-4480-8c26-6c2e00e04cbc.jpg', 1),
(45, 4, 104, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/c3503a91-2743-4e6d-b33d-a56679b63328.jpg', 1),
(46, 4, 114, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/4af02c07-9312-4973-a17f-e078bf18f40f.jpg', 10),
(47, 4, 115, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/3c51b3ab-7e23-451c-b5d4-36ec4e7562ac.jpg', 10),
(48, 4, 116, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/d8fe243d-7e49-4003-a11f-f80197bfce8f.jpg', 10),
(49, 4, 117, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/555b58ba-67e9-4ce7-a05b-3686d8290990.jpg', 10),
(50, 4, 118, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/7c387cea-f3fc-43f5-8660-ba987084edfe.jpg', 10),
(51, 4, 119, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/8349d2ab-be44-430e-a9fa-29a8edb34b7f.jpg', 10),
(52, 4, 120, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/de12c1ee-2af3-4e5f-b66e-9676740495a3.jpg', 10),
(53, 4, 121, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/9a0b2ce3-ac24-4eec-8c59-e8c3d3de7c0e.jpg', 10),
(54, 4, 122, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/ade608d4-8c69-4153-b071-7851469d21a0.jpg', 10),
(55, 4, 124, '2023-06-25', 'https://kepulanganbp3mibanten.site/public/uploads/c06c9c2c-0e36-4535-9f06-495753276d9d.jpg', 8),
(56, 4, 125, '2023-06-25', 'https://kepulanganbp3mibanten.site/public/uploads/672e002b-8365-4080-bdd9-383f2e9731be.jpg', 8),
(57, 4, 126, '2023-06-25', 'https://kepulanganbp3mibanten.site/public/uploads/c67e24ae-2396-4b83-b769-6b7cbde80728.jpg', 8),
(58, 4, 127, '2023-06-25', 'https://kepulanganbp3mibanten.site/public/uploads/0b58fe75-7735-4113-b5e7-b664243bb712.jpg', 8),
(59, 4, 128, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/9a1cca91-6f37-4d68-96c2-20bde20a520a.jpg', 10),
(60, 4, 129, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/ad0a53fb-4018-4487-a7dd-c437eb63eb18.jpg', 10),
(61, 4, 130, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/9e848d40-ef40-401d-b42a-afbb3cc4ebc4.jpg', 10),
(62, 4, 107, '2023-06-24', 'https://kepulanganbp3mibanten.site/public/uploads/e945a359-4963-43d9-8a87-529f85ca0b91.jpg', 1),
(63, 4, 105, '2023-06-24', 'https://kepulanganbp3mibanten.site/public/uploads/85dcd692-a49f-412b-abce-571b45ee0768.jpg', 1),
(64, 4, 154, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/8c80cae2-ba21-4451-8389-5badb5cbc7a3.jpg', 10),
(65, 4, 168, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/e55812a3-eb55-479d-90de-9cc17b886577.jpg', 10),
(66, 4, 169, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/f4447e63-8fec-4d86-b338-c03d06b1757e.jpg', 10),
(67, 4, 170, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/eeeb5b16-7845-4d7d-b173-9698c08192dc.jpg', 10),
(68, 4, 171, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/9fee1689-98d9-40c9-9ae2-2401c6bc50c8.jpg', 10),
(69, 4, 172, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/819cfc4e-6609-4159-a0c1-60e4e9b049d3.jpg', 10),
(70, 4, 185, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/e0af3bff-bf83-4d1a-ad25-50bd6f0ade73.jpg', 10),
(71, 4, 184, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/7f44e720-f00c-4d48-9124-90f0a8aef007.jpg', 10),
(72, 4, 186, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/ca0bfed4-4f14-4c69-b49c-8c336bed45fa.jpg', 10),
(73, 4, 187, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/dc4e5d06-5605-4085-b779-740808347479.jpg', 10),
(74, 4, 188, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/f00b1336-9548-4f4e-a43a-6bc7140aaca2.jpg', 10),
(75, 4, 189, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/cd0f83e2-5d56-4cd0-bcf1-b086151630d8.jpg', 10),
(76, 4, 190, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/2ab1057b-1fd0-4c7d-b697-1eee5a59d3f7.jpg', 10),
(77, 4, 191, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/6748464e-8038-4fab-b6ca-00eddeaca978.jpg', 10),
(78, 4, 192, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/438cd095-1f06-4d09-a2ed-4072fbdd2a51.jpg', 10),
(79, 4, 193, '2023-06-26', 'https://kepulanganbp3mibanten.site/public/uploads/bc24648f-0d23-47e9-abb9-3f6635b4b752.jpg', 10),
(80, 4, 194, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/ad8346ff-5cad-4022-943f-70729f9c3930.jpg', 10),
(81, 4, 133, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/9a940278-88a3-4133-bcec-31578e818dac.jpg', 1),
(82, 4, 131, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/d036080a-19d2-4835-a5b1-ab3c319830a6.jpg', 1),
(83, 4, 132, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/d39a3017-7b0e-4660-b49e-cb3cd0eb93fc.jpg', 1),
(84, 4, 134, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/52aa1c90-3d8e-4c8f-8769-d78bcfc040a0.jpg', 1),
(85, 4, 61, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/5a2c2e07-4253-443e-8a91-00a499ed1f4d.jpg', 1),
(86, 4, 59, '2023-06-27', 'https://kepulanganbp3mibanten.site/public/uploads/311cc5e5-7772-464a-9563-2c945f2ea5d7.jpg', 1),
(87, 4, 208, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/549148e2-554b-4f3e-8262-5f4bd1beea22.jpg', 3),
(88, 4, 240, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/fa68bd14-8821-43b1-a637-9bb7a14d0eb0.jpg', 10),
(89, 4, 255, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/6d8f28be-6c6b-4872-bd4a-e2219ffd097c.jpg', 10),
(90, 4, 256, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/6a5d2606-4662-46e0-bd4c-70b387753c9e.jpg', 10),
(91, 4, 257, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/0e99e037-3045-4665-889a-fcce096c09b8.jpg', 10),
(92, 4, 258, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/83c61fd0-fa27-4cfa-8692-383e28368ea3.jpg', 10),
(93, 4, 261, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/3dfe443b-dbf5-4edc-83b2-0ed8564bf473.jpg', 12),
(94, 4, 262, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/678a4847-e9cf-415b-8f76-e68a842220b1.jpg', 12),
(95, 4, 264, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/4294718b-5b20-4ea2-a797-818df4ec8cbf.jpg', 12),
(96, 4, 265, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/086ee354-e083-49f8-bca4-461292f9f7d7.jpg', 12),
(97, 4, 266, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/52f7df84-8cc8-4411-b1bf-690d6aa0ce0f.jpg', 12),
(98, 4, 267, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/98e9c387-25b5-48a2-a5fd-db067daffa90.jpg', 12),
(99, 4, 268, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/46186ca3-3fbe-4fc5-bf85-1d7642a6fbd3.jpg', 12),
(100, 4, 269, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/6bde20a3-ed7e-4d03-adb2-5b11becd5ffd.jpg', 12),
(101, 4, 270, '2023-07-01', 'https://kepulanganbp3mibanten.site/public/uploads/2f5eb871-5f20-49c1-963a-7915b2cee4da.jpg', 12),
(102, 4, 271, '2023-07-02', 'https://kepulanganbp3mibanten.site/public/uploads/2a842225-462b-46f7-b762-8aa3a89a67af.jpg', 13),
(103, 4, 224, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/44382508-6f63-4aab-ad2f-7b7620def999.jpg', 1),
(104, 4, 227, '2023-06-29', 'https://kepulanganbp3mibanten.site/public/uploads/a6eb7224-9ddd-422e-8f99-5b5cd308bab5.jpg', 1),
(105, 4, 277, '2023-07-02', 'https://kepulanganbp3mibanten.site/public/uploads/c11296cd-6b91-46b4-8a6e-9b58a36c9f45.jpg', 10),
(106, 4, 278, '2023-07-02', 'https://kepulanganbp3mibanten.site/public/uploads/f261f825-ea14-4106-90c1-a1601c15209b.jpg', 10),
(107, 4, 279, '2023-07-02', 'https://kepulanganbp3mibanten.site/public/uploads/f1a59282-4a50-4359-a8b7-fef72fe380cd.jpg', 10),
(108, 4, 280, '2023-07-03', 'https://kepulanganbp3mibanten.site/public/uploads/9ad08bda-b654-4906-88ac-7daa63135b00.jpg', 10),
(109, 4, 281, '2023-07-03', 'https://kepulanganbp3mibanten.site/public/uploads/9b3cd14c-280c-4282-b410-ad9eacf83539.jpg', 10),
(110, 4, 289, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/433fd736-7bb2-4d33-aa54-2f5fe962485d.jpg', 13),
(111, 4, 290, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/45640771-7fe7-4a34-8114-61ece47f2108.jpg', 13),
(112, 4, 291, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/ade227b7-d5e9-4172-ae53-bcd8bcd9e3e9.jpg', 13),
(113, 4, 292, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/8d6b7150-e17b-403a-a82c-189a2a489a3d.jpg', 13),
(114, 4, 293, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/6b14469e-243a-44a5-bbc3-5eec65843ba4.jpg', 13),
(115, 4, 294, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/23d7939c-8db6-4778-816d-c8c0332b81e3.jpg', 13),
(116, 4, 295, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/ca7baec2-5190-446d-998b-718d6b8ac5c1.jpg', 13),
(117, 4, 296, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/4c2966c9-aabb-44a5-b7b1-65a4f01a8dea.jpg', 13),
(118, 4, 297, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/ce73eeee-2e96-41e8-b8ce-f68924697754.jpg', 13),
(119, 4, 298, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/d5a03023-2ea6-4f96-8d3f-3622ae5ac3ad.jpg', 13),
(120, 4, 299, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/69b2cd4e-b3aa-40c4-adda-e4aa0592ba06.jpg', 13),
(121, 4, 300, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/eb0ac333-eecf-43f7-a41c-1712273add3f.jpg', 13),
(122, 4, 301, '2023-07-04', 'https://kepulanganbp3mibanten.site/public/uploads/f5a6bbc8-be9f-43a4-be41-4b525b9cbeac.jpg', 13),
(123, 4, 302, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/9e5d5ca9-fd93-41ce-bc3c-8e44e77562a8.jpg', 13),
(124, 4, 303, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/28fd873d-0e4b-48c8-8bbc-70663e60cb95.jpg', 13),
(125, 4, 304, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/2afd807b-f2be-40c9-a570-4d146ec467d5.jpg', 13),
(126, 4, 305, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/f26d7f4e-9451-40f5-8165-a08d6e74a83c.jpg', 13),
(127, 4, 309, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/5b5cfd2d-470d-4bcb-935f-0a4d6c938fee.jpg', 9),
(128, 4, 310, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/adcc2d09-da01-4c72-a8c2-96701597ec97.jpg', 9),
(129, 4, 311, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/043dc022-8ddf-4e30-997d-92df7c3b710c.jpg', 9),
(130, 4, 312, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/35e8ac0c-dfa1-4518-a4d9-a93921624fb3.jpg', 9),
(131, 4, 313, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/1e175d92-9052-40db-b989-aca617e98c7e.jpg', 9),
(132, 4, 314, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/d0ebadab-62dc-4e4c-bbba-edcfa8361866.jpg', 9),
(133, 4, 315, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/e9a35d09-4970-4f42-a54b-7a2738cb3baa.jpg', 9),
(134, 4, 316, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/1043c930-da4d-4550-8714-2a9599efeed9.jpg', 9),
(135, 4, 317, '2023-07-05', 'https://kepulanganbp3mibanten.site/public/uploads/73623d09-199c-4f97-bce6-1efdeedf1d2f.jpg', 9),
(136, 4, 319, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/db780129-dfc6-4e57-a556-c588eedc5fce.jpg', 6),
(137, 4, 324, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/c65e17a4-ffef-4ecd-b787-721343241b79.jpg', 8),
(138, 4, 325, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/24f29095-5cf5-4dc5-bd6a-0b3e88b2b41b.jpg', 8),
(139, 4, 327, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/66b94c72-d7f2-4543-ae37-8dd5698c30ff.jpg', 8),
(140, 4, 326, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/6ce31926-e2fc-43bf-b415-1e6868162013.jpg', 8),
(141, 4, 328, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/6458885c-0df7-4fbf-985c-f413b7687c95.jpg', 8),
(142, 4, 329, '2023-07-06', 'https://kepulanganbp3mibanten.site/public/uploads/d561a924-6087-4518-8dd4-247d00ac1688.jpg', 8),
(143, 4, 330, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/f0729c36-1b03-4151-86f0-619a6147999c.jpg', 8),
(144, 4, 331, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/933a4086-2990-4ef4-9909-fdf60b869980.jpg', 13),
(145, 4, 332, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/010b0f30-b95c-43f0-8f4a-7cc5ce8463b9.jpg', 3),
(146, 4, 335, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/021ffad5-7047-44ed-bd2e-99e82cca9f1c.jpg', 3),
(147, 4, 336, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/5868d3dd-7ea8-4ff6-8883-9657eb90fd38.jpg', 3),
(148, 4, 344, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/ebe7670b-bde3-45a7-ac23-a266ce5e4bf4.jpg', 3),
(149, 4, 345, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/41e27ffe-f627-4a8f-a83d-fa004185d905.jpg', 3),
(150, 4, 346, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/c5855d2b-7577-4616-92ca-b57156bdb742.jpg', 3),
(151, 4, 347, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/946cfe0d-46ae-4369-9054-8cbe92feec6b.jpg', 3),
(152, 4, 348, '2023-07-07', 'https://kepulanganbp3mibanten.site/public/uploads/5c039867-b786-46e4-a535-48cdb67f8047.jpg', 3),
(153, 4, 358, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/26362c6d-3029-43e4-8933-f978b6a1253d.jpg', 17),
(154, 4, 359, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/916834f7-d7b5-4984-bad4-420addcfddf9.jpg', 17),
(155, 4, 360, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/9f690b9e-09b2-481d-9e87-86e650fdbe41.jpg', 17),
(156, 4, 362, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/b9ee5cb4-b7a6-4fba-979e-93942804a50b.jpg', 17),
(157, 4, 363, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/d416e12b-8b90-4d5d-8f00-acda272469b1.jpg', 17),
(158, 4, 364, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/5ca530e0-5a8d-4030-804a-eda372108998.jpg', 17),
(159, 4, 365, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/86f357cf-900c-462c-aec1-343b2a822eb4.jpg', 17),
(160, 4, 366, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/91766533-7396-4344-abf4-b78a5f7fabe2.jpg', 17),
(161, 4, 367, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/788559e1-4c2d-4555-8c67-8ec2c8eee3bf.jpg', 17),
(162, 4, 368, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/1093982a-e92b-4569-bbf6-04ad38a63181.jpg', 17),
(163, 4, 370, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/a9afa159-0f75-4910-824d-eaaace92a116.jpg', 17),
(164, 4, 371, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/ab1f15c0-bccf-4abf-9e9e-d672a64de622.jpg', 17),
(165, 4, 374, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/a4bb58ba-84d4-4fef-870f-7c6367e0a2cc.jpg', 17),
(166, 4, 376, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/a0ec4c5a-c78b-4c06-9504-af9c4aa4f5f2.jpg', 17),
(167, 4, 378, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/e133b718-cce3-4723-94a7-400c97fd5a70.jpg', 17),
(168, 4, 377, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/cec22187-034e-47d4-a74a-dd957e31b20a.jpg', 17),
(169, 4, 375, '2023-07-08', 'https://kepulanganbp3mibanten.site/public/uploads/8cdb6362-0d9e-4b4d-a63d-2b1e3fae3cec.jpg', 17),
(170, 4, 387, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/4034b2c3-950e-4713-8256-9038630668ec.jpg', 8),
(171, 4, 388, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/c7b018a1-bfd4-4d6d-bff4-41c93dc79ba0.jpg', 8),
(172, 4, 380, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/d8214483-67f3-46b1-b989-769b48c93474.jpg', 8),
(173, 4, 381, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/7840b9e3-5b62-4877-ba1e-f4f45591f16a.jpg', 8),
(174, 4, 382, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/47b7e693-79c9-45c0-b099-1acd06e90994.jpg', 8),
(175, 4, 383, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/967584fa-224f-4fd1-b398-e2c5870fd60c.jpg', 8),
(176, 4, 384, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/a69b5a15-bba9-4100-ae02-1c03dc1f4fde.jpg', 8),
(177, 4, 385, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/a2e194d3-b5d4-43d7-b9c3-0f6036b1848c.jpg', 8),
(178, 4, 386, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/5ee18e33-267e-4611-8cb2-2d262a7b0bd8.jpg', 8),
(179, 4, 389, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/578e175a-7694-4037-b510-acf971a8c6cb.jpg', 8),
(180, 4, 390, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/5b9671c1-9cec-413c-b1c7-673f95fac384.jpg', 8),
(181, 4, 391, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/8d0b3480-bf89-4442-9089-bcfe2abb9169.jpg', 8),
(182, 4, 392, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/c5ccf8f6-bccd-499b-bdcf-7000d293ae31.jpg', 8),
(183, 4, 393, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/44d25af1-5e5c-43d7-afed-4eff37c589cf.jpg', 8),
(184, 4, 394, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/f43715c1-570a-4f6d-a12b-db0c643f2d29.jpg', 8),
(185, 4, 395, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/359476d1-0919-40f5-b5dd-7d0d09395eba.jpg', 8),
(186, 4, 396, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/24dd7e0f-8277-4ae3-922d-305407e91538.jpg', 8),
(187, 4, 397, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/d127f2d6-e8dd-4c58-8778-1ce0a406a479.jpg', 8),
(188, 4, 400, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/e39e9896-b9a0-48a8-bc39-8ffd25e203ef.jpg', 8),
(189, 4, 401, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/bc3322d1-9eb0-4288-bc22-c26a9cedc8e0.jpg', 8),
(190, 4, 402, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/a1a28612-86ea-4ef5-89b7-bb4580c56025.jpg', 8),
(191, 4, 408, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/0f3be0c6-5ad4-4884-8325-273dc7036588.jpg', 13),
(192, 4, 409, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/ddc5e62f-82a2-41c7-bd5c-f13989f24f6f.jpg', 13),
(193, 4, 410, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/180c186a-86ed-4b6b-8933-c740b318fe33.jpg', 13),
(194, 4, 411, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/eb8f9ab1-800d-475d-8b62-7d2ab33236a0.jpg', 3),
(195, 4, 412, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/4ca76331-f1a5-4eb3-a4fb-3643994a3284.jpg', 3),
(196, 4, 413, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/af6de6fc-952e-43f4-b8b5-b1857c0258c4.jpg', 3),
(197, 4, 414, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/d445f77d-0da0-4028-9635-97b77a8a697f.jpg', 3),
(198, 4, 415, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/1aace006-a7ae-4085-83f2-b77bffa91050.jpg', 3),
(199, 4, 416, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/303f8279-6b44-44fd-948f-cc80366055b6.jpg', 3),
(200, 4, 417, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/084c0f71-8ebf-421c-91da-375dd25c24f7.jpg', 3),
(201, 4, 418, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/4c464064-6c07-48ee-b18f-bb42ec1b57c5.jpg', 3),
(202, 4, 419, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/c8d2b780-10a4-44dc-9e7f-090247ddbd4b.jpg', 3),
(203, 4, 420, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/c0c66378-40dd-4471-b200-7b6242259cbb.jpg', 3),
(204, 4, 421, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/1e16f096-aebf-4414-b274-f16dffa5f333.jpg', 3),
(205, 4, 422, '2023-07-10', 'https://kepulanganbp3mibanten.site/public/uploads/13e4f82c-ed33-42f9-b4b5-3e1c5c91bb74.jpg', 3),
(206, 4, 424, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/98484307-5c07-44b2-ad6a-3f5ab134eba9.jpg', 3),
(207, 4, 425, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/88b8c8a2-ed56-4456-9c31-89b468e2878e.jpg', 3),
(208, 4, 426, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/9661108a-9b9c-4ec3-b590-c688aaf95cf7.jpg', 3),
(209, 4, 427, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/89a066a6-8a40-4652-b625-11d59a3cb12c.jpg', 3),
(210, 4, 428, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/0aa3f0c2-8045-4c0d-a600-c3c06288aa1c.jpg', 3),
(211, 4, 429, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/9d8e52a8-c208-44f5-b897-2cf8efd3600d.jpg', 3),
(212, 4, 431, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/98abc8cc-a3e4-42a2-8e24-294b6603fd68.jpg', 10),
(213, 4, 432, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/3ececdd4-6788-4a06-beeb-04fcf9078fb1.jpg', 10),
(214, 4, 433, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/c21fa8fb-436a-4d7f-9cee-963584094f8b.jpg', 10),
(215, 4, 434, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/a015e1c5-f01f-48ce-9233-60637db23e34.jpg', 10),
(216, 4, 430, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/2f7ff89d-4479-4e44-8c02-8bf25fab68fc.jpg', 10),
(217, 4, 435, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/749fe214-dcfa-4eb5-86c4-34c14a4f0e70.jpg', 10),
(218, 4, 436, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/92d7ab4d-9ef0-42ed-9f6d-a47d427bbf29.jpg', 10),
(219, 4, 437, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/5625299a-1ed6-4df3-b5e8-dedbaef63a52.jpg', 10),
(220, 4, 441, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/a5c9878a-f88e-4d69-88da-adee4ecb1d40.jpg', 10),
(221, 4, 442, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/9827fadd-790a-4850-a87c-ce644fd30f59.jpg', 10),
(222, 4, 443, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/e4cde8cd-069a-436a-87e2-eb255f3f8dfb.jpg', 10),
(223, 4, 444, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/0ebf15d6-529f-4b47-a0cf-cf479ee0d68a.jpg', 10),
(224, 4, 445, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/e4892f3a-bcc5-4d98-98c8-74c0b3129870.jpg', 10),
(225, 4, 446, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/5050a251-3f6b-47a6-9d8e-5752e9ee509f.jpg', 10),
(226, 4, 447, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/00ef7d60-70ab-4273-95fc-e6fbf0b68d68.jpg', 10),
(227, 4, 448, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/ec72d833-2fe0-4832-a4ef-bf19190215da.jpg', 10),
(228, 4, 449, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/f23312f7-0ee4-4ddd-83eb-da58d5b995c8.jpg', 10),
(229, 4, 450, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/0410d0b8-658d-49f9-971c-1e9931c444d4.jpg', 10),
(230, 4, 451, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/83c9df59-68ed-4736-b563-84bbd5f4c8d5.jpg', 10),
(231, 4, 452, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/c8d5590c-67ec-482f-bcf8-8ee0ee2829b1.jpg', 10),
(232, 4, 453, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/747e968c-9a18-46d7-ad9a-d405bb3d0329.jpg', 10),
(233, 4, 454, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/cea0ecf3-cab0-4836-938a-cbc211e31ed4.jpg', 10),
(234, 4, 455, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/208b037f-db89-43c1-bc00-a4f0db65831a.jpg', 10),
(235, 4, 456, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/07509273-4683-455b-82f9-7a766e737a9c.jpg', 10),
(236, 4, 457, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/24a7d990-67e6-4918-8bc0-e57984241761.jpg', 10),
(237, 4, 458, '2023-07-11', 'https://kepulanganbp3mibanten.site/public/uploads/39b439d1-f499-4f11-983e-d10f693f2b7e.jpg', 10),
(238, 4, 459, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/684ff76c-05f8-41c1-b683-11dd2560843c.jpg', 10),
(239, 4, 460, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/08c14850-bf36-4f20-bc46-ca81d1f0c657.jpg', 10),
(240, 4, 462, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/d68ab553-3e06-420b-b379-bac0db0fd769.jpg', 8),
(241, 4, 461, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/1c301a42-3d54-40c9-98d4-62463aab7742.jpg', 8),
(242, 4, 463, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/6d316032-a69a-477e-b459-178a5342ff3f.jpg', 8),
(243, 4, 464, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/60e21bd8-b2f6-4b8b-98f7-fbb741ccccbf.jpg', 8),
(244, 4, 465, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/8846c3fb-aef4-48da-bda9-00350c1f36a9.jpg', 8),
(245, 4, 466, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/cfd4e4cf-4375-4247-8abd-72710507107c.jpg', 8),
(246, 4, 467, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/3e964247-32bc-4e00-875e-a64247a753e7.jpg', 8),
(247, 4, 468, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/7f2be90f-d61d-41d7-abcb-e757f63da93e.jpg', 8),
(248, 4, 469, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/b42ed8ab-a8a2-4d41-8400-7d6a3eef8e71.jpg', 8),
(249, 4, 470, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/ade7c645-56de-41f2-b35c-4b36510b6e4f.jpg', 8),
(250, 4, 471, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/69ba89c4-dae7-4e4f-a933-ba19e0d6dbd1.jpg', 8),
(251, 4, 472, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/b3b92b8c-6ac4-4f79-a576-7198ad41bf33.jpg', 8),
(252, 4, 473, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/5ffc5006-2f7e-44bf-b6d5-0c9a52208a21.jpg', 8),
(253, 4, 474, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/0ba51b5f-d295-4e3f-ad28-2dd4787d15a6.jpg', 8),
(254, 4, 475, '2023-07-12', 'https://kepulanganbp3mibanten.site/public/uploads/21261fff-0191-4f9e-a32a-ce2c0eb39633.jpg', 8),
(255, 4, 476, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/0f7a9908-e62c-4755-89e0-9846adc3535f.jpg', 13),
(256, 4, 477, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/73dbf7a0-3098-427b-bb14-fb1c302b6e4f.jpg', 13),
(257, 4, 478, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/f957f8ac-b5f7-430e-a2d7-6fc086e900df.jpg', 3),
(258, 4, 479, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/e7fe6e95-3f7c-4b54-b026-0781c63f74c0.jpg', 3),
(259, 4, 480, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/174fbe17-470e-42c9-88c2-e3a0c573bfdd.jpg', 3),
(260, 4, 481, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/03b9456b-cd82-48aa-bc44-f0e4a77708bf.jpg', 3),
(261, 4, 482, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/cffc0d35-00a3-4afb-a2d4-ac42d63b44b6.jpg', 3),
(262, 4, 483, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/971cc36e-5b6a-44f7-b31a-d34f67988098.jpg', 3),
(263, 4, 484, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/cf8eeacf-ba4f-42b1-8d34-92d1683bf69f.jpg', 3),
(264, 4, 485, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/f63a432f-4481-4540-af61-cc912394ce7f.jpg', 3),
(265, 4, 486, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/bb0d1d7c-cbba-42ac-ad8e-7470dcea8781.jpg', 3),
(266, 4, 487, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/30c0bcdc-94b7-4cf4-8091-44a0966c7277.jpg', 3),
(267, 4, 494, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/23877eda-ab4a-44e9-a496-163d7e03da33.jpg', 3),
(268, 4, 495, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/c5fb6454-2f98-4bc9-84aa-6446cb0adf26.jpg', 3),
(269, 4, 496, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/ce3dfe42-e5c0-4ba2-b307-45b286194801.jpg', 3),
(270, 4, 497, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/34ce4cd7-e7a7-4f24-b07c-15c0021d6152.jpg', 3),
(271, 4, 498, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/782116e0-a05e-4e79-a1cd-8a50616922b0.jpg', 3),
(272, 4, 499, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/3ac565f2-1ee3-48f1-b14d-8d52063950c8.jpg', 3),
(273, 4, 500, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/f6b855f7-0c5e-4cb9-ae48-ddccb41057b9.jpg', 3),
(274, 4, 501, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/5daf1a7d-86d6-4a50-835b-7dfd10294cc3.jpg', 3),
(275, 4, 502, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/40a73af0-a54a-434a-ae6f-64a1606ce0be.jpg', 3),
(276, 4, 503, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/9d30a35c-0166-4d19-94ea-4e9355c728d8.jpg', 3),
(277, 4, 504, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/3f642f8d-d8fc-4b8b-be6f-a7cad849da9e.jpg', 3),
(278, 4, 505, '2023-07-13', 'https://kepulanganbp3mibanten.site/public/uploads/de6da593-e73e-413b-8094-082c9be2f625.jpg', 3),
(279, 4, 508, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/64f92564-37e8-496f-baa3-b3166e4dd113.jpg', 10),
(280, 4, 509, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/ad74e9d7-4cb4-42a0-b48d-336c649c1bed.jpg', 10),
(281, 4, 511, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/6746c91e-6aff-4384-a6fa-7c867f8e8b9f.jpg', 10),
(282, 4, 512, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/f972321b-71b9-4db0-9de0-9fe1c63a295a.jpg', 10),
(283, 4, 513, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/771bdbc5-19ec-42fd-9df5-f6061aed2f10.jpg', 10),
(284, 4, 514, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/4fb38799-313a-4a59-8a19-f122ee0ca852.jpg', 10),
(285, 4, 515, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/a159fef1-ba89-433c-832c-cf1ad6e7149a.jpg', 10),
(286, 4, 516, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/986a62c9-eea9-4c50-bc1b-8b03653a8bcd.jpg', 10),
(287, 4, 517, '2023-07-14', 'https://kepulanganbp3mibanten.site/public/uploads/fa7ccdc1-964d-4a6a-ba69-44dac542e68d.jpg', 10),
(288, 4, 518, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/458bde48-50a0-4c06-994a-0face7b5514c.jpg', 8),
(289, 4, 519, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/d997bd72-201b-4472-9fe5-cb1465d5b045.jpg', 8),
(290, 4, 520, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/74046e4a-e869-40f2-aaad-e749c34e0a5a.jpg', 8),
(291, 4, 521, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/3b98981c-f318-42d0-8fb7-ce8ed28ba9c2.jpg', 8),
(292, 4, 522, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/e13a4388-6374-43a8-a2ea-5975e5e70ef4.jpg', 8),
(293, 4, 523, '2023-07-15', 'https://kepulanganbp3mibanten.site/public/uploads/d4c45772-82a1-430f-9ec5-31d2fdd0d3d7.jpg', 8),
(294, 4, 524, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/0fafd278-6dda-4681-963e-db0d0e3c70cb.jpg', 8),
(295, 4, 525, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/64738016-6755-40fd-8e07-bd13765cfe1d.jpg', 8),
(296, 4, 526, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/e61b1996-cf9d-4d81-9d09-7d5ff6cadc65.jpg', 8),
(297, 4, 527, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/4f164401-22a6-4b7a-b656-7e4c4072f3e7.jpg', 8),
(298, 4, 528, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/970f72a1-e104-4020-9472-3b9e0c1b5620.jpg', 8),
(299, 4, 529, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/e19c8544-8380-45a0-a4dd-f4483cf152b5.jpg', 8),
(300, 4, 530, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/61ab9d4f-5e0f-4ee8-a7d4-518072fc33ab.jpg', 8),
(301, 4, 506, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/8d5d4812-36e6-45d0-8aae-3dd4fa03fb72.jpg', 1),
(302, 4, 536, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/2f8a29d8-4586-43e8-81ff-60dd9888744d.jpg', 3),
(303, 4, 537, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/f37166db-1321-4fa3-b212-225938a15750.jpg', 3),
(304, 4, 538, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/68b4ab4d-6d3f-4691-9e8e-8a660e919f5d.jpg', 3),
(305, 4, 539, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/1e9add46-8bdd-44e1-b4c8-f9de8338021f.jpg', 3),
(306, 4, 540, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/13d94e01-6984-4b11-bf7c-8fef00fa3bea.jpg', 3),
(307, 4, 541, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/3fbd29d6-fbec-4490-98f0-5fce08ff538a.jpg', 3),
(308, 4, 543, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/50e75bf7-5b72-4088-880a-346185ad9006.jpg', 3),
(309, 4, 544, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/5cc714e2-a42b-4556-8d27-e1fe3b976361.jpg', 3),
(310, 4, 545, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/b130f6e0-e51f-4a80-ac52-2037a057482f.jpg', 3),
(311, 4, 546, '2023-07-16', 'https://kepulanganbp3mibanten.site/public/uploads/0a00eee3-7129-4070-892f-f02e85130ad9.jpg', 3),
(312, 4, 548, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/0b44db1e-7d9a-4534-9af4-44bead1a8670.jpg', 3),
(313, 4, 549, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/1326e349-9fb3-4236-a153-00f74dc9ba06.jpg', 3),
(314, 4, 550, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/cee730cb-2885-42fe-8d23-47e1ca229604.jpg', 3),
(315, 4, 551, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/87dd6da5-3275-4e40-9cf0-a0c8b35dacd6.jpg', 3),
(316, 4, 552, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/340ded86-3740-4a52-84d9-f8a9ccbd46be.jpg', 3),
(317, 4, 554, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/390b8865-54c1-4d7b-adbd-1daddbb49029.jpg', 17),
(318, 4, 555, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/975cfd4f-c6d1-426e-b416-326226fa77dc.jpg', 17),
(319, 4, 556, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/b7af836c-b8bd-4501-b1b3-2b238b2cc749.jpg', 17),
(320, 4, 557, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/d8c4999d-76ec-4758-b643-2f1e907eff10.jpg', 17),
(321, 4, 558, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/3a072e60-be44-4d3d-9eba-15f0ec5fd578.jpg', 17),
(322, 4, 559, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/5077a0a0-0f30-4bc3-b272-fcaae5d1f376.jpg', 17),
(323, 4, 560, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/c53f9bcd-b15f-4072-8d3f-c93768cab507.jpg', 17),
(324, 4, 561, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/c68fc396-70f9-463f-b49a-7347d1a03707.jpg', 17),
(325, 4, 562, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/f1373cff-7da5-4a98-ac8d-686868a675f7.jpg', 17),
(326, 4, 563, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/2ef86245-4fd7-41b7-967b-4433e3f37b75.jpg', 17),
(327, 4, 564, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/71994d1f-44a6-4f0c-b7b4-998ba41295ab.jpg', 17),
(328, 4, 565, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/48e366ae-e0ce-42d4-8cc6-99361fefe4ee.jpg', 17),
(329, 4, 566, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/fafbec47-8509-4525-a193-8e3bc3cea400.jpg', 17),
(330, 4, 567, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/3a781dce-68ec-41af-bc12-8ae43f382990.jpg', 17),
(331, 4, 568, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/56fa49ce-57a5-4463-b527-817b1fc864df.jpg', 17),
(332, 4, 569, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/e6491140-c80a-451e-923b-dce05c457cc4.jpg', 17),
(333, 4, 570, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/b214bc24-7022-4917-b2e0-34ccf41bafb4.jpg', 17),
(334, 4, 571, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/7c54bcd4-9e25-45fc-8c88-9bbf19085fdd.jpg', 17),
(335, 4, 572, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/fbeacc2a-d44f-4975-810c-c28efe9af28d.jpg', 17),
(336, 4, 573, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/2afdb302-60b0-4af7-ac24-9f2c526e6650.jpg', 17),
(337, 4, 574, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/2dba0059-30c8-4d55-8e00-e3733fe9a7d1.jpg', 17),
(338, 4, 575, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/74d4f01c-6049-4568-b31c-e6cbd504096b.jpg', 17),
(339, 4, 576, '2023-07-17', 'https://kepulanganbp3mibanten.site/public/uploads/e68e787e-dcd9-4bb8-a935-88086cd069c7.jpg', 17),
(340, 4, 584, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/eec7c08d-d123-4584-a91b-b7a9083a2eaf.jpg', 3),
(341, 4, 585, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/80fefb9b-7d20-4f6f-9cff-b64b0ab9feae.jpg', 3),
(342, 4, 586, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/920e8e8a-517d-4029-93d0-719c9188c4bb.jpg', 3),
(343, 4, 587, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/a58e47ef-bb65-41e2-9354-c57c879fba1f.jpg', 3),
(344, 4, 588, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/55984d57-ccc0-4151-b1ad-e99b72c01d3a.jpg', 3),
(345, 4, 589, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/f3f200a0-b69f-4537-9938-b3c9619ece46.jpg', 3),
(346, 4, 590, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/c068dff5-c2e9-4f24-a859-dc2dfdba7847.jpg', 3),
(347, 4, 591, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/6203430a-2656-4f4b-aa7c-ab576e906af0.jpg', 3),
(348, 4, 596, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/2a461bd1-78bf-4b1c-9ea7-7cfe0a37957e.jpg', 3),
(349, 4, 597, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/9fcff2ed-7ac0-4838-a7ae-d901fd0c8d90.jpg', 3),
(350, 4, 598, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/da16e144-84b2-4991-b3d4-079569161f29.jpg', 3),
(351, 4, 599, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/be518d95-1753-49ed-acc7-f61fdb050ff1.jpg', 3),
(352, 4, 600, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/77a25add-963c-4720-9b64-bf5546ca9c8a.jpg', 3),
(353, 4, 601, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/9661d9ad-29af-404b-ad11-6f239ba0adaf.jpg', 3),
(354, 4, 602, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/57b4fb22-f386-467a-9e04-9f1a3ce4d1d6.jpg', 3),
(355, 4, 603, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/a6be2c9f-fc3b-4224-9116-889e6a49fc9d.jpg', 3),
(356, 4, 604, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/56b5f004-dfcf-4e8c-9c9e-491b3251753a.jpg', 3),
(357, 4, 605, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/c1b8b850-843b-4c44-9f0b-e94411c5be26.jpg', 3),
(358, 4, 606, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/678bb331-4227-41f9-82d6-443246d1b8bd.jpg', 3),
(359, 4, 607, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/3715bb6b-5817-469d-8da8-6c105be6b3f5.jpg', 3),
(360, 4, 608, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/645bb209-23d8-4f7f-bf1b-1755909bb678.jpg', 3),
(361, 4, 609, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/dec7e434-2351-434f-b56a-879880c32ac0.jpg', 3),
(362, 4, 610, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/dd9c49bc-a3e4-40bc-84d9-562577ef3bb7.jpg', 3),
(363, 4, 611, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/982630b2-4bfc-4f49-835f-8f5912037f1d.jpg', 3),
(364, 4, 612, '2023-07-19', 'https://kepulanganbp3mibanten.site/public/uploads/de8f9283-468e-4760-a1b2-2025118acf1d.jpg', 3),
(365, 4, 613, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/bc1a8212-b30e-470a-9979-f651d2e505dc.jpg', 3),
(366, 4, 614, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/0d1e3d41-8c41-49d5-ad51-6f276687e327.jpg', 3),
(367, 4, 615, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/0d28ef37-fea5-4bee-8822-59dcdcb7f121.jpg', 3),
(368, 4, 616, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/c05e5a16-679b-419f-87ac-1619b445f90f.jpg', 3),
(369, 4, 617, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/a61348a0-bc6f-40c7-bb91-19eca5f479bd.jpg', 3),
(370, 4, 618, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/3162f7cc-b8f9-41f1-abcd-30938bcaf4e9.jpg', 3),
(371, 4, 619, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/01401d3b-ecda-4d8b-b02c-2ebd3b71c0ae.jpg', 10),
(372, 4, 620, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/b96157b3-ff06-4107-b8e0-152f1077bd52.jpg', 10),
(373, 4, 621, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/4233e5d9-016b-42be-902b-f569d98bafe2.jpg', 10),
(374, 4, 636, '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/efe2c5c2-2859-46b5-9f9f-fc877c88f774.jpg', 10),
(375, 4, 637, '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/59f5193b-825b-47c5-97f2-2d98d2e9895d.jpg', 10),
(376, 4, 638, '2023-07-21', 'https://kepulanganbp3mibanten.site/public/uploads/701a6713-791a-4742-8377-fecfc06fd473.jpg', 10),
(377, 4, 640, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/7557d624-674a-4759-890c-add8d73b4601.jpg', 10),
(378, 4, 641, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/1a1ba3f0-9c5e-414c-9423-b4648e65f68c.jpg', 10),
(379, 4, 642, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/131a57bb-b09f-4c98-9dc1-6280d325ec1e.jpg', 10),
(380, 4, 643, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/1317456d-76ba-4c36-89f5-27711100d207.jpg', 10),
(381, 4, 644, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/32195ed1-6c71-4204-9a41-0ccfc6b108e2.jpg', 10),
(382, 4, 647, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/c3a129c0-1796-4d8e-a52f-32dfb59ed4ef.jpg', 10),
(383, 4, 648, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/d46f296d-f8dc-4839-b4e0-ea295fa31082.jpg', 17),
(384, 4, 649, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/1dee4452-e58c-48f2-a155-37e39be7f371.jpg', 10),
(385, 4, 650, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/7109b376-b64a-4015-a7e8-062bc9b63e1b.jpg', 10),
(386, 4, 651, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/657560e4-154f-4626-bc16-b566ba7f1170.jpg', 10),
(387, 4, 652, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/728da82e-28e4-4776-a37b-742e89f25e1c.jpg', 10),
(388, 4, 653, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/025877a3-1866-486e-89d9-9849c6e8a467.jpg', 10),
(389, 4, 654, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/4d6fc025-5f40-45e4-ba39-03f759df6b14.jpg', 17),
(390, 4, 655, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/5e6e11cd-514d-4c6d-83cc-e59609dd7fd2.jpg', 17),
(391, 4, 656, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/e426015b-cd59-4127-9ea3-4c154380caac.jpg', 17),
(392, 4, 657, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/8993823f-28a6-4c94-864a-6b3a1cb4a898.jpg', 17),
(393, 4, 658, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/05306b8d-8151-4406-9083-9ee761f284fa.jpg', 17),
(394, 4, 659, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/24deb3cc-fec8-4563-a6cc-c0fe89e4e14d.jpg', 17),
(395, 4, 663, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/275476f5-ca0e-4afd-8cc0-4caf655d0730.jpg', 17),
(396, 4, 662, '2023-07-20', 'https://kepulanganbp3mibanten.site/public/uploads/649272a0-e735-41a8-9ef7-cec58335ec23.jpg', 17),
(397, 4, 701, '2023-07-23', 'https://kepulanganbp3mibanten.site/public/uploads/eb5deacb-de5a-4751-a197-c8b8eed88ff8.jpg', 17),
(398, 4, 702, '2023-07-23', 'https://kepulanganbp3mibanten.site/public/uploads/d7760409-2127-4623-9e26-98c2b80a2256.jpg', 17);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
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
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rujuk_rs_polri`
--

CREATE TABLE `rujuk_rs_polri` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_pihak_kedua` bigint(20) UNSIGNED DEFAULT NULL,
  `tanggal_serah_terima` date DEFAULT NULL,
  `foto_pihak_kedua` varchar(255) DEFAULT NULL,
  `foto_serah_terima` varchar(255) DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rujuk_rs_polri`
--

INSERT INTO `rujuk_rs_polri` (`id`, `id_kepulangan`, `id_imigran`, `id_pihak_kedua`, `tanggal_serah_terima`, `foto_pihak_kedua`, `foto_serah_terima`, `id_user`) VALUES
(1, 3, 112, 2, '2023-06-23', 'https://kepulanganbp3mibanten.site/public/uploads/29502067-013a-4be7-a233-1e1d06148101.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/8cc63b35-169d-4af3-923f-bdce869b2110.jpg', 9),
(2, 3, 399, 5, '2023-07-09', 'https://kepulanganbp3mibanten.site/public/uploads/af2bd0e0-d83b-49b7-8739-911f4aea9b93.jpg', 'https://kepulanganbp3mibanten.site/public/uploads/7f8a84bf-4056-4ebd-877b-b09f931e4626.jpg', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `spu`
--

CREATE TABLE `spu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_bast_udara` bigint(20) UNSIGNED DEFAULT NULL,
  `no_surat` varchar(255) DEFAULT NULL,
  `tanggal_surat` date DEFAULT NULL,
  `id_provinsi` bigint(20) UNSIGNED DEFAULT NULL,
  `no_pesawat` varchar(255) DEFAULT NULL,
  `jam_pesawat` varchar(255) DEFAULT NULL,
  `tanggal_pesawat` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `spu`
--

INSERT INTO `spu` (`id`, `id_bast_udara`, `no_surat`, `tanggal_surat`, `id_provinsi`, `no_pesawat`, `jam_pesawat`, `tanggal_pesawat`) VALUES
(1, 1, 'SPU/Test', '2023-06-19', 52, 'JT605', '5:30', '2023-06-20'),
(2, 3, 'B. 0114/P4MI Bandara Soekarno-Hatta/PB.05.03/VI/2023', '2023-06-21', 52, 'Jt656', '5:0', '2023-06-22'),
(3, 4, 'B. 0116/P4MI Bandara SoekarnoHatta/PB.05.03/VI/2023', '2023-06-27', 52, 'JT654', '12:5', '2023-06-27'),
(4, 5, 'B. 117/P4MI Bandara SoekarnoHatta/PB.05.03/VI/2023', '2023-06-27', 21, 'JT378', '15:40', '2023-06-27'),
(5, 6, 'B.118/P4MI Bandara Soekarno Hatta/PB.05.03/VII/2023', '2023-07-01', 74, 'QG330', '13:15', '2023-07-01'),
(6, 7, 'B. 0124 /P4MI-BANDARASOETTA/VII/2023', '2023-07-13', 35, 'QG 722', '17:30', '2023-07-13'),
(7, 8, 'B.0123/P4MI Soekarno Hatta/PB.05.03/VII/2023', '2023-07-11', 18, 'JT122', '14:0', '2023-07-11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `spu_tiket`
--

CREATE TABLE `spu_tiket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_spu` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_tiket` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `spu_tiket`
--

INSERT INTO `spu_tiket` (`id`, `id_spu`, `foto_tiket`) VALUES
(1, 1, 'https://kepulanganbp3mibanten.site/public/uploads/a65aca30-beb5-4a67-b75e-39b16dc80759.jpg'),
(2, 2, 'https://kepulanganbp3mibanten.site/public/uploads/d6b8daa5-cbca-41c0-8f1a-f0a40d40f52f.jpg'),
(3, 3, 'https://kepulanganbp3mibanten.site/public/uploads/a4be8bbd-be3e-4dbe-83b1-73a2308d4bdf.jpg'),
(4, 4, 'https://kepulanganbp3mibanten.site/public/uploads/dd30afb4-3ba7-49b8-b920-615adba097e0.jpg'),
(5, 5, 'https://kepulanganbp3mibanten.site/public/uploads/768e70c8-aef3-400b-866a-8e301673b3ad.jpg'),
(6, 6, 'https://kepulanganbp3mibanten.site/public/uploads/57c9fdb0-cef8-4498-92cd-3b4b329c5054.jpg'),
(7, 7, 'https://kepulanganbp3mibanten.site/public/uploads/d129de4b-9ca1-4f8f-8fd7-bca878c5e309.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kawasan`
--

CREATE TABLE `sub_kawasan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `id_kawasan` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sub_kawasan`
--

INSERT INTO `sub_kawasan` (`id`, `nama`, `id_kawasan`) VALUES
(1, 'Asia Tenggara dan Afrika', 1),
(2, 'Asia Timur I dan Asia Tengah', 1),
(3, 'Asia Timur II dan Asia Selatan', 1),
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_kepulangan` bigint(20) UNSIGNED DEFAULT NULL,
  `id_imigran` bigint(20) UNSIGNED DEFAULT NULL,
  `id_bast_udara` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_boarding_pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `udara`
--

INSERT INTO `udara` (`id`, `id_kepulangan`, `id_imigran`, `id_bast_udara`, `foto_boarding_pass`) VALUES
(1, 2, 4, 1, 'https://kepulanganbp3mibanten.site/public/uploads/ae861539-442c-4ce7-bd72-d5a0a81c5d60.jpg'),
(2, 2, 17, 2, 'https://kepulanganbp3mibanten.site/public/uploads/55164118-7a1d-4ddc-9c84-2e3ca9f8c3b7.jpg'),
(3, 2, 5, 3, 'https://kepulanganbp3mibanten.site/public/uploads/c34ca641-62c1-498c-b9d3-a9eaa754e0ce.jpg'),
(4, 2, 6, 3, 'https://kepulanganbp3mibanten.site/public/uploads/ba0dc6dc-6cfd-44f3-95ce-d8040916e876.jpg'),
(5, 2, 7, 3, 'https://kepulanganbp3mibanten.site/public/uploads/bcce0ef2-d533-4210-8426-eadf79db389f.jpg'),
(6, 2, 8, 3, 'https://kepulanganbp3mibanten.site/public/uploads/f183b28c-50ed-4a76-9524-1ab66dda88a9.jpg'),
(7, 2, 10, 3, 'https://kepulanganbp3mibanten.site/public/uploads/7dad29ba-fa50-471b-b25d-794f940cc14c.jpg'),
(8, 2, 102, 4, 'https://kepulanganbp3mibanten.site/public/uploads/01407b3e-f7fe-4ce1-a5c0-62134a4c2e31.jpg'),
(9, 2, 123, 4, 'https://kepulanganbp3mibanten.site/public/uploads/f7d63f83-4db7-4ce9-8e2c-e6798c1272bb.jpg'),
(10, 2, 60, 5, 'https://kepulanganbp3mibanten.site/public/uploads/acb50945-b34d-4aab-9914-04e575a38ce4.jpg'),
(11, 2, 203, 6, 'https://kepulanganbp3mibanten.site/public/uploads/c7db3138-bdf6-43b0-9df3-f0bcc116a0df.jpg'),
(12, 2, 339, 2, 'https://kepulanganbp3mibanten.site/public/uploads/ab1c4486-ce68-4ebf-bf4a-ef812d816061.jpg'),
(13, 2, 287, 2, 'https://kepulanganbp3mibanten.site/public/uploads/dd10d101-0800-4b59-b87a-943ef26be942.jpg'),
(14, 2, 338, 2, 'https://kepulanganbp3mibanten.site/public/uploads/3750ec3e-af2f-4e86-a3a7-5a40860c72e1.jpg'),
(15, 2, 341, 2, 'https://kepulanganbp3mibanten.site/public/uploads/6323c599-95ba-4521-a103-f2d304bbec3f.jpg'),
(16, 2, 288, 2, 'https://kepulanganbp3mibanten.site/public/uploads/075ac255-46e6-4ac6-aa0f-f374f4078b81.jpg'),
(17, 2, 355, 2, 'https://kepulanganbp3mibanten.site/public/uploads/5868d13d-5d41-4e67-83e1-88cce74b8e65.jpg'),
(18, 2, 357, 2, 'https://kepulanganbp3mibanten.site/public/uploads/ae08adbc-7199-4186-b406-1e99229957ad.jpg'),
(19, 2, 356, 2, 'https://kepulanganbp3mibanten.site/public/uploads/8621ec31-3383-4e15-8985-891108e2b0a0.jpg'),
(20, 2, 407, 7, 'https://kepulanganbp3mibanten.site/public/uploads/693245e8-586a-459e-bbf0-2f9bf50d6c6b.jpg'),
(21, 2, 406, 7, 'https://kepulanganbp3mibanten.site/public/uploads/8b02cfbf-b088-4cf2-808a-c134d5d2d03b.jpg'),
(22, 2, 405, 7, 'https://kepulanganbp3mibanten.site/public/uploads/4426e838-a6c9-41a3-8bfc-3ce7d0784458.jpg'),
(23, 2, 404, 7, 'https://kepulanganbp3mibanten.site/public/uploads/bddc95e4-c861-4ca5-9920-268bd77beb5b.jpg'),
(24, 2, 403, 7, 'https://kepulanganbp3mibanten.site/public/uploads/4987e97e-0aa8-4c87-8459-0ae44f32f7bd.jpg'),
(25, 2, 343, 8, 'https://kepulanganbp3mibanten.site/public/uploads/dee36a79-ce68-41c0-a706-591626ffaaea.jpg'),
(26, 2, 379, 8, 'https://kepulanganbp3mibanten.site/public/uploads/765595b8-71c6-4828-86ef-73bf2d12362a.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `no_identitas` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `id_group` bigint(20) UNSIGNED DEFAULT NULL,
  `telepon` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `qr_code` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `no_identitas`, `jabatan`, `id_group`, `telepon`, `avatar`, `qr_code`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '0000000000000000', 'Administrator', 1, '081111111111', 'https://ui-avatars.com/api/?name=a-dmin', 'http://localhost/kepulangan/public/petugas/1', 'admin@email.com', NULL, '$2y$10$wwLhI2..XKqOFRPb6A01UOw4JeLrzOIEqioZeaJhOMY4hPNa1R0EO', NULL, '2023-06-17 23:24:16', '2023-06-17 23:24:16'),
(2, 'Petugas', '1111111111111111', 'Petugas', 2, '082222222222', 'https://kepulanganbp3mibanten.site/public/uploads/4f0789c8-0769-4bd5-9abb-9e5078a7293c.jpg', 'http://localhost/kepulangan/public/petugas/2', 'petugas@email.com', NULL, '$2y$10$U0jlULaZ3SB/7H8a0ovRnOweP8UJTp7B4Ibhk22oQdZXTO8.mm0Pm', NULL, '2023-06-17 23:24:16', '2023-06-18 11:20:57'),
(3, 'Lediana', 'P. 0019', 'Administrasi Group', 3, '0', 'https://ui-avatars.com/api/?name=lediana', 'https://kepulanganbp3mibanten.site/public/petugas/3', 'ledianaaghnia@gmail.com', NULL, '$2y$10$llA5c1YagqMSuVoZTJbnO.6f..Gt7744FxOOrZvb7ueZKBsnh9PJ2', NULL, '2023-06-19 00:01:22', '2023-06-19 00:01:22'),
(4, 'Lutfi', 'P. 0020', 'Petugas T3', 3, '0', 'https://ui-avatars.com/api/?name=lutfi', 'https://kepulanganbp3mibanten.site/public/petugas/4', 'lutfi.lwk@gmail.com', NULL, '$2y$10$0WghHJaEO3e/t/YuIgbln.FkrjDO6UXdPoO6BibYDwwueoqKXk9je', NULL, '2023-06-19 00:03:50', '2023-06-19 00:03:50'),
(5, 'Muhammad Syahreza', 'P. 0021', 'Ketua Group', 3, '0', 'https://ui-avatars.com/api/?name=muhammad-syahreza', 'https://kepulanganbp3mibanten.site/public/petugas/5', 'msyahreza2101@gmail.com', NULL, '$2y$10$zaPIANr9xYyJcgyGzQj.hue8qt0tEtM6hEI8GRpMq8cS2RJiU5EDy', NULL, '2023-06-19 00:06:49', '2023-06-19 00:06:49'),
(6, 'Simon', 'P. 0022', 'Petugas Lounge T3', 2, '0', 'https://ui-avatars.com/api/?name=simon', 'https://kepulanganbp3mibanten.site/public/petugas/6', 'petrushutagalungsimon@gmail.com', NULL, '$2y$10$pv5wtAvo7I7FY5UIFdTdgOp6WQxxvPOSMC9M8HMynS/Al3whzr56K', NULL, '2023-06-19 00:08:10', '2023-07-07 01:19:11'),
(7, 'Riski Satya', 'P. 0023', 'Petugas Lounge T3', 3, '0', 'https://ui-avatars.com/api/?name=riski-satya', 'https://kepulanganbp3mibanten.site/public/petugas/7', 'rizkisatya238@gmail.com', NULL, '$2y$10$1gUqy90UFAhgP.BW3Dx.Ru2ku8bxYruCUjiiq0r8Ai3zV.unU1yNC', NULL, '2023-06-19 00:09:24', '2023-06-19 00:09:24'),
(8, 'Meriani', 'P. 0024', 'Petugas Loung T3', 2, '0', 'https://ui-avatars.com/api/?name=meriani', 'https://kepulanganbp3mibanten.site/public/petugas/8', 'merianitarigan@gmail.com', NULL, '$2y$10$EfMDugSrPxv4dvGLU8fqaubEqr6GMF3Xo3qIjLsv5rQkKsHWSGwrG', NULL, '2023-06-19 00:10:41', '2023-07-07 01:19:04'),
(9, 'Fahri Munandar', 'P. 0005', 'Operator Shelter', 1, '0', 'https://ui-avatars.com/api/?name=fahri-munandar', 'https://kepulanganbp3mibanten.site/public/petugas/9', 'fahrimun77@gmail.com', NULL, '$2y$10$F2tNIThgYzuZz28dSgJWqe4NgdnM/1lM9J7/ZfgHR3N.VbKKifmge', NULL, '2023-06-19 00:14:51', '2023-06-19 00:14:51'),
(10, 'Dika Putri. S', 'P. 0006', 'Opertaor Lounge PMI', 1, '0', 'https://ui-avatars.com/api/?name=dika-putri.-s', 'https://kepulanganbp3mibanten.site/public/petugas/10', 'putrisetyoningrumd@gmail.com', NULL, '$2y$10$i0xE20rPpWt6.LGLgwBBWO6baoWQOhY.sS3h5ryyG1OOy0j8cTdhm', NULL, '2023-06-19 00:18:08', '2023-06-19 00:18:08'),
(11, 'Bibit Murni', 'P. 0032', 'Operator Sekretariat P4MI Basoetta', 1, '085263461363', 'https://ui-avatars.com/api/?name=bibit-murni', 'https://kepulanganbp3mibanten.site/public/petugas/11', 'murnibibit03@gmail.com', NULL, '$2y$10$bq8IgFpPd8u/GdEyNQnDNOWczK8GM2MT7z8KutdCbwpNAEQfdo4vG', NULL, '2023-06-20 07:48:23', '2023-06-20 07:48:23'),
(12, 'Ade Ahmad T', 'P. 0027', 'Operator Lounge PMI', 3, '0', 'https://kepulanganbp3mibanten.site/public/uploads/e4d23433-a359-4e26-9a45-a898439e89bd.jpg', 'https://kepulanganbp3mibanten.site/public/petugas/12', 'adedaniel892@gmail.com', NULL, '$2y$10$5BMugsYNg1fNp1dKtMHkr.7zuXSGRQnCtt6S39RMqfQdH40BGHLS2', NULL, '2023-06-20 13:10:22', '2023-07-05 15:04:31'),
(13, 'Bambang', 'P. 0028', 'Operator Lounge PMI', 3, '0', 'https://ui-avatars.com/api/?name=bambang', 'https://kepulanganbp3mibanten.site/public/petugas/13', 'priantobambang46@gmail.com', NULL, '$2y$10$Xzpd3PAXA/V91YTilDSo1uS2s.zUqU/U/5xSb1XUnO76xzjzqGGZG', NULL, '2023-06-20 13:12:17', '2023-06-20 13:14:25'),
(14, 'Oka Warmana', 'P. 0029', 'Operarot Helpdesk', 3, '082111856900', 'https://ui-avatars.com/api/?name=oka-warmana', 'https://kepulanganbp3mibanten.site/public/petugas/14', 'okawarmana69@gmail.com', NULL, '$2y$10$ShGsSDPqGgwZWFFoiw1DR.VOnjusESAVwo/GFgmvQYdGZQmwnjyy2', NULL, '2023-06-20 13:13:26', '2023-07-04 05:05:31'),
(15, 'Mustaja', 'P. 0030', 'Operator Helpdesk', 2, '0', 'https://ui-avatars.com/api/?name=mustaja', 'https://kepulanganbp3mibanten.site/public/petugas/15', 'michaelmustaja10@gmail.com', NULL, '$2y$10$GBPs1bhBHGVhUt484OP9AeM6aUSXvnwbDxbd0Q.N4XxslbUiL1GQK', NULL, '2023-06-20 13:14:12', '2023-07-07 01:18:54'),
(16, 'Arvian', 'P. 0011', 'Operator Shelter P4MI', 3, '0', 'https://ui-avatars.com/api/?name=arvian', 'https://kepulanganbp3mibanten.site/public/petugas/16', 'arviandwirevianto@gmail.com', NULL, '$2y$10$DQM9h.EpADOAzgSyjry8JeMNOFJcJEtpeyzHxGB3/FBcSvlFuUCOe', NULL, '2023-06-21 02:50:34', '2023-07-07 01:18:46'),
(17, 'Diana', '3174107003790006', 'Operator Lounge', 1, '081284875379', 'https://kepulanganbp3mibanten.site/public/uploads/91cd4c88-2008-4386-8d44-ab234de9f4e0.jpg', 'https://kepulanganbp3mibanten.site/public/petugas/17', 'iyank.vodlatte@gmail.com', NULL, '$2y$10$5Dv0KkWm/lUNsKjw9BvnBuyRpkW.6W6TCT/ZoBnYTYHLQ58tInq9i', NULL, '2023-06-21 03:02:15', '2023-07-10 13:47:28'),
(18, 'Agung', 'P. 0014', 'Operator Lounge PMI', 1, '0', 'https://ui-avatars.com/api/?name=agung', 'https://kepulanganbp3mibanten.site/public/petugas/18', 'wibowoagung662@gmail.com', NULL, '$2y$10$2IjfKH6xoLM0UxhXu6k8FOsWrspOC4VsNQFUfytKLdKbKfsbLFDFO', NULL, '2023-06-21 03:10:32', '2023-07-07 01:18:29'),
(19, 'Hari Priyono', 'P. 0010', 'Ketua Group', 2, '0', 'https://ui-avatars.com/api/?name=hari-priyono', 'https://kepulanganbp3mibanten.site/public/petugas/19', 'haripriyono88@gmail.com', NULL, '$2y$10$nRqZBt8jtTm9bP.4X8dgaOgQMJeyt24EtGCuCkeltAn4qtIc9A/HW', NULL, '2023-06-21 03:14:55', '2023-06-21 03:14:55'),
(20, 'Tajie', 'P. 0015', 'Operator Lounge PMI', 2, '0', 'https://ui-avatars.com/api/?name=tajie', 'https://kepulanganbp3mibanten.site/public/petugas/20', 'tajiesyahzan@gmail.com', NULL, '$2y$10$u4nn229tPFsTdBNdF.4QlelWnBBEDu3scd4UuU2pgf/HFXnPuUF0O', NULL, '2023-06-21 03:45:44', '2023-06-21 03:45:44'),
(21, 'Monang Butarbutar', 'P. 0035', 'Operator Cargo Bandara Soetta', 1, '0', 'https://ui-avatars.com/api/?name=monang-butarbutar', 'https://kepulanganbp3mibanten.site/public/petugas/21', 'monangbutarbutar45@gmail.com', NULL, '$2y$10$UwiAgxhZa8U/kdhiD5BD5u6NxxtyGt3/.1etaJ5dhsfYy7c0gDI9S', NULL, '2023-06-29 09:02:46', '2023-06-29 09:02:46');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `bast_darat`
--
ALTER TABLE `bast_darat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `bast_makan`
--
ALTER TABLE `bast_makan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT untuk tabel `bast_pihak_lain`
--
ALTER TABLE `bast_pihak_lain`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `bast_udara`
--
ALTER TABLE `bast_udara`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `darat`
--
ALTER TABLE `darat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `imigran`
--
ALTER TABLE `imigran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT untuk tabel `jemput_keluarga`
--
ALTER TABLE `jemput_keluarga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `jemput_pihak_lain`
--
ALTER TABLE `jemput_pihak_lain`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jenazah`
--
ALTER TABLE `jenazah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `makan`
--
ALTER TABLE `makan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT untuk tabel `penyedia_jasa`
--
ALTER TABLE `penyedia_jasa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `pihak_kedua`
--
ALTER TABLE `pihak_kedua`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pmi`
--
ALTER TABLE `pmi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700;

--
-- AUTO_INCREMENT untuk tabel `pulang_mandiri`
--
ALTER TABLE `pulang_mandiri`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=399;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rujuk_rs_polri`
--
ALTER TABLE `rujuk_rs_polri`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `spu`
--
ALTER TABLE `spu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `spu_tiket`
--
ALTER TABLE `spu_tiket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `udara`
--
ALTER TABLE `udara`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
