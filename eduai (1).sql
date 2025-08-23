-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Agu 2025 pada 06.19
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eduai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bab`
--

CREATE TABLE `bab` (
  `id_bab` int(11) NOT NULL,
  `judul_bab` varchar(200) NOT NULL,
  `harga` decimal(10,2) NOT NULL,
  `detail` text NOT NULL,
  `sertifikasi` varchar(100) NOT NULL,
  `jumlah_peserta` int(11) NOT NULL,
  `durasi` varchar(50) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `id_pelajaran` int(11) NOT NULL,
  `id_guru` int(11) DEFAULT NULL,
  `id_quiz` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `bab`
--

INSERT INTO `bab` (`id_bab`, `judul_bab`, `harga`, `detail`, `sertifikasi`, `jumlah_peserta`, `durasi`, `rating`, `icon`, `id_pelajaran`, `id_guru`, `id_quiz`) VALUES
(1, 'Matematika: Statistika & Peluang', 0.00, 'Ada data tunggal, ada data kelompok. Kita belajar cara penyajiannya yuk! Video ini video konsep kilat. Materi dijelaskan lebih cepat. Langsung aja yuk mulai belajar!', 'gold', 10, '365', 8.00, '/img/ikonSuratLamaranKerja.png', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `bio_guru` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `waktu_pengerjaan` datetime NOT NULL,
  `id_quiz` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `histori_chat`
--

CREATE TABLE `histori_chat` (
  `id_chat` int(11) NOT NULL,
  `isi_chat` text NOT NULL,
  `tanggal` datetime NOT NULL,
  `role` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jawaban_user`
--

CREATE TABLE `jawaban_user` (
  `id_jawaban` int(11) NOT NULL,
  `jawaban_dipilih` char(1) NOT NULL,
  `id_hasil` int(11) NOT NULL,
  `id_soal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenjang`
--

CREATE TABLE `jenjang` (
  `id_jenjang` int(11) NOT NULL,
  `nama_jenjang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenjang`
--

INSERT INTO `jenjang` (`id_jenjang`, `nama_jenjang`) VALUES
(1, 'Kelas 1'),
(2, 'Kelas 2'),
(3, 'Kelas 3'),
(4, 'Kelas 4'),
(5, 'Kelas 5'),
(6, 'Kelas 6'),
(7, 'Kelas 7 SMP/MTs'),
(8, 'Kelas 8 SMP/MTs'),
(9, 'Kelas 9 SMP/MTs'),
(10, 'Kelas 10 MA/SMA/SMK'),
(11, 'Kelas 11 MA/SMA/SMK'),
(12, 'Kelas 12 MA/SMA/SMK');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelajaran`
--

CREATE TABLE `pelajaran` (
  `id_pelajaran` int(11) NOT NULL,
  `nama_pelajaran` varchar(100) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `link` varchar(255) NOT NULL,
  `id_jenjang` int(11) NOT NULL,
  `id_bab` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pelajaran`
--

INSERT INTO `pelajaran` (`id_pelajaran`, `nama_pelajaran`, `icon`, `link`, `id_jenjang`, `id_bab`) VALUES
(2, 'Bahasa Indonesia', '/img/ikonKelasBahasaIndo.png', 'indo', 10, NULL),
(3, 'Matematika', '/img/mtk.png', 'mtk', 10, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `status_pembayaran` varchar(20) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `point_pembelajaran`
--

CREATE TABLE `point_pembelajaran` (
  `id_point` int(11) NOT NULL,
  `isi_point` varchar(100) NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `progres_bab`
--

CREATE TABLE `progres_bab` (
  `id_progres_bab` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `progres_subbab`
--

CREATE TABLE `progres_subbab` (
  `id_progres_subbab` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `tanggal_selesai` date DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `id_subbab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `quiz`
--

CREATE TABLE `quiz` (
  `id_quiz` int(11) NOT NULL,
  `nama_quiz` varchar(100) NOT NULL,
  `jumlah_soal` int(11) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(11) NOT NULL,
  `pertanyaan` text NOT NULL,
  `opsi_a` varchar(255) NOT NULL,
  `opsi_b` varchar(255) NOT NULL,
  `opsi_c` varchar(255) NOT NULL,
  `opsi_d` varchar(255) NOT NULL,
  `jawaban` char(1) NOT NULL,
  `id_quiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subbab`
--

CREATE TABLE `subbab` (
  `id_subbab` int(11) NOT NULL,
  `judul_subbab` varchar(200) NOT NULL,
  `video_materi` varchar(255) NOT NULL,
  `urutan` int(11) NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `target_peserta`
--

CREATE TABLE `target_peserta` (
  `id_target` int(11) NOT NULL,
  `isi_target` text NOT NULL,
  `id_bab` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_google` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `id_google`) VALUES
(1, 'Dimas', 'dimas@gmail.com', '123456', NULL),
(2, 'newuser', 'newuser@email.com', '12345', NULL),
(3, 'faisal', 'fasial@gmail.com', '123456', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bab`
--
ALTER TABLE `bab`
  ADD PRIMARY KEY (`id_bab`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `fk_bab_quiz` (`id_quiz`),
  ADD KEY `fk_bab_pelajaran` (`id_pelajaran`);

--
-- Indeks untuk tabel `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_quiz` (`id_quiz`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `histori_chat`
--
ALTER TABLE `histori_chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `id_user` (`id_user`);

--
-- Indeks untuk tabel `jawaban_user`
--
ALTER TABLE `jawaban_user`
  ADD PRIMARY KEY (`id_jawaban`),
  ADD KEY `id_hasil` (`id_hasil`),
  ADD KEY `id_soal` (`id_soal`);

--
-- Indeks untuk tabel `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indeks untuk tabel `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD PRIMARY KEY (`id_pelajaran`),
  ADD KEY `id_jenjang` (`id_jenjang`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `point_pembelajaran`
--
ALTER TABLE `point_pembelajaran`
  ADD PRIMARY KEY (`id_point`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `progres_bab`
--
ALTER TABLE `progres_bab`
  ADD PRIMARY KEY (`id_progres_bab`),
  ADD UNIQUE KEY `unique_user_bab` (`id_user`,`id_bab`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `progres_subbab`
--
ALTER TABLE `progres_subbab`
  ADD PRIMARY KEY (`id_progres_subbab`),
  ADD UNIQUE KEY `unique_user_subbab` (`id_user`,`id_subbab`),
  ADD KEY `id_subbab` (`id_subbab`);

--
-- Indeks untuk tabel `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id_quiz`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`),
  ADD KEY `id_quiz` (`id_quiz`);

--
-- Indeks untuk tabel `subbab`
--
ALTER TABLE `subbab`
  ADD PRIMARY KEY (`id_subbab`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `target_peserta`
--
ALTER TABLE `target_peserta`
  ADD PRIMARY KEY (`id_target`),
  ADD KEY `id_bab` (`id_bab`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bab`
--
ALTER TABLE `bab`
  MODIFY `id_bab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `histori_chat`
--
ALTER TABLE `histori_chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jawaban_user`
--
ALTER TABLE `jawaban_user`
  MODIFY `id_jawaban` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jenjang`
--
ALTER TABLE `jenjang`
  MODIFY `id_jenjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pelajaran`
--
ALTER TABLE `pelajaran`
  MODIFY `id_pelajaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `point_pembelajaran`
--
ALTER TABLE `point_pembelajaran`
  MODIFY `id_point` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `progres_bab`
--
ALTER TABLE `progres_bab`
  MODIFY `id_progres_bab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `progres_subbab`
--
ALTER TABLE `progres_subbab`
  MODIFY `id_progres_subbab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id_quiz` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subbab`
--
ALTER TABLE `subbab`
  MODIFY `id_subbab` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `target_peserta`
--
ALTER TABLE `target_peserta`
  MODIFY `id_target` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bab`
--
ALTER TABLE `bab`
  ADD CONSTRAINT `bab_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`),
  ADD CONSTRAINT `fk_bab_pelajaran` FOREIGN KEY (`id_pelajaran`) REFERENCES `pelajaran` (`id_pelajaran`),
  ADD CONSTRAINT `fk_bab_quiz` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`),
  ADD CONSTRAINT `hasil_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `histori_chat`
--
ALTER TABLE `histori_chat`
  ADD CONSTRAINT `histori_chat_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Ketidakleluasaan untuk tabel `jawaban_user`
--
ALTER TABLE `jawaban_user`
  ADD CONSTRAINT `jawaban_user_ibfk_1` FOREIGN KEY (`id_hasil`) REFERENCES `hasil` (`id_hasil`),
  ADD CONSTRAINT `jawaban_user_ibfk_2` FOREIGN KEY (`id_soal`) REFERENCES `soal` (`id_soal`);

--
-- Ketidakleluasaan untuk tabel `pelajaran`
--
ALTER TABLE `pelajaran`
  ADD CONSTRAINT `pelajaran_ibfk_1` FOREIGN KEY (`id_jenjang`) REFERENCES `jenjang` (`id_jenjang`),
  ADD CONSTRAINT `pelajaran_ibfk_2` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `point_pembelajaran`
--
ALTER TABLE `point_pembelajaran`
  ADD CONSTRAINT `point_pembelajaran_ibfk_1` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `progres_bab`
--
ALTER TABLE `progres_bab`
  ADD CONSTRAINT `progres_bab_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `progres_bab_ibfk_2` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `progres_subbab`
--
ALTER TABLE `progres_subbab`
  ADD CONSTRAINT `progres_subbab_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `progres_subbab_ibfk_2` FOREIGN KEY (`id_subbab`) REFERENCES `subbab` (`id_subbab`);

--
-- Ketidakleluasaan untuk tabel `quiz`
--
ALTER TABLE `quiz`
  ADD CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `soal`
--
ALTER TABLE `soal`
  ADD CONSTRAINT `soal_ibfk_1` FOREIGN KEY (`id_quiz`) REFERENCES `quiz` (`id_quiz`);

--
-- Ketidakleluasaan untuk tabel `subbab`
--
ALTER TABLE `subbab`
  ADD CONSTRAINT `subbab_ibfk_1` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);

--
-- Ketidakleluasaan untuk tabel `target_peserta`
--
ALTER TABLE `target_peserta`
  ADD CONSTRAINT `target_peserta_ibfk_1` FOREIGN KEY (`id_bab`) REFERENCES `bab` (`id_bab`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
