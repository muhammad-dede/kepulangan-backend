-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 14 Jun 2023 pada 10.00
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

--
-- Dumping data untuk tabel `imigran`
--

INSERT INTO `imigran` (`id`, `brafaks`, `paspor`, `nama`, `id_jenis_kelamin`, `id_negara`, `id_sub_kawasan`, `id_kawasan`, `alamat`, `id_kab_kota`, `id_provinsi`, `no_telp`, `id_jabatan`, `tanggal_kedatangan`, `id_area`, `id_layanan`, `id_kepulangan`, `terlaksana`, `id_user`) VALUES
(1, '2819379823', 'G3726152', 'Gani', 2, 189, 7, 3, NULL, 3601, 36, NULL, 8, '2023-06-14', 3, 1, NULL, 0, 2),
(2, '72397123', 'K7281765', 'Kelly', 2, 138, 6, 3, NULL, 3471, 34, NULL, 4, '2023-06-14', 3, 5, NULL, 0, 2),
(3, '21389721893', 'C4738276', 'Celly Boy', 1, 203, 8, 3, NULL, 5201, 52, NULL, 4, '2023-06-14', 1, 1, NULL, 0, 2),
(4, '9382761', 'L9483765', 'Larry', 1, 185, 6, 3, NULL, 3505, 35, NULL, 3, '2023-06-14', 1, 2, NULL, 0, 2),
(5, '123797283', 'H8371654', 'Hasrullah', 1, 89, 4, 2, NULL, 1872, 18, NULL, 21, '2023-06-14', 2, 1, NULL, 0, 2),
(6, '72373', 'A5463728', 'Arya Jaya', 1, 40, 1, 1, NULL, 3603, 36, NULL, 10, '2023-06-14', 2, 5, NULL, 0, 2),
(7, '239187398', 'X6372654', 'Xavier', 1, 138, 6, 3, NULL, 1704, 17, NULL, 22, '2023-06-14', 1, 3, NULL, 0, 2),
(8, '273978123', 'L8376546', 'Laras', 2, 207, 8, 3, NULL, 3316, 33, NULL, 3, '2023-06-14', 2, 5, NULL, 0, 2);

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `imigran`
--
ALTER TABLE `imigran`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
