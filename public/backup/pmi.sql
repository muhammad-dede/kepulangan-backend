-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Jun 2023 pada 10.01
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

--
-- Dumping data untuk tabel `pmi`
--

INSERT INTO `pmi` (`id`, `id_imigran`, `id_group`, `id_masalah`, `foto_pmi`, `foto_paspor`) VALUES
(1, 1, 2, 12, 'http://192.168.18.3:9000/uploads/d8e2f828-ca6f-4201-8ffe-ed03d7d7b9a6.jpg', 'http://192.168.18.3:9000/uploads/2cb2ca29-9c84-4cc2-b907-e0855e5f38ac.jpg'),
(2, 2, 2, 20, 'http://192.168.18.3:9000/uploads/6214f66f-0280-49c9-8834-35938f0e9ba7.jpg', 'http://192.168.18.3:9000/uploads/c0d7f7e2-56b8-4de8-af1a-9cb3f403ec61.jpg'),
(3, 3, 2, 20, 'http://192.168.18.3:9000/uploads/9f1dcb7d-547e-4889-b67e-215ac95e3c37.jpg', 'http://192.168.18.3:9000/uploads/88d9c34d-f0a7-4423-a538-26a6abcddb8b.jpg'),
(4, 4, 2, 13, 'http://192.168.18.3:9000/uploads/93c968c1-056e-4fb9-a6fa-c302074ab884.jpg', 'http://192.168.18.3:9000/uploads/b47bf1dd-9b22-4c89-b7d1-d7ffcea2f51b.jpg'),
(5, 5, 2, 17, 'http://192.168.18.3:9000/uploads/4e281264-534d-4146-aeea-398b103c12e5.jpg', 'http://192.168.18.3:9000/uploads/de573477-9e99-4a23-8bfd-e8905a7fc892.jpg'),
(6, 6, 2, 8, 'http://192.168.18.3:9000/uploads/4baffa07-497a-4650-8d93-9c5ea53da7bf.jpg', 'http://192.168.18.3:9000/uploads/e808bafc-12ae-48af-8ca3-73ff21bbbf0e.jpg'),
(7, 7, 2, 4, 'http://192.168.18.3:9000/uploads/fc6cf7c3-d920-45c1-827b-e829e7b960eb.jpg', 'http://192.168.18.3:9000/uploads/81548a6a-2447-44db-8c49-620ff9d477c2.jpg'),
(8, 8, 2, 8, 'http://192.168.18.3:9000/uploads/c5433ec7-e4aa-4177-9301-27557829222a.jpg', 'http://192.168.18.3:9000/uploads/94e763ae-c842-4553-9c66-d3b1a63b5642.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pmi`
--
ALTER TABLE `pmi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pmi_id_imigran_index` (`id_imigran`),
  ADD KEY `pmi_id_group_index` (`id_group`),
  ADD KEY `pmi_id_masalah_index` (`id_masalah`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pmi`
--
ALTER TABLE `pmi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pmi`
--
ALTER TABLE `pmi`
  ADD CONSTRAINT `pmi_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `group` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pmi_id_imigran_foreign` FOREIGN KEY (`id_imigran`) REFERENCES `imigran` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pmi_id_masalah_foreign` FOREIGN KEY (`id_masalah`) REFERENCES `masalah` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
