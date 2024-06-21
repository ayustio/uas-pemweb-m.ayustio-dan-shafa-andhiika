

    CREATE DATABASE IF NOT EXISTS `perpustakaan_merak` ;

     DEFAULT CHARACTER SET = 'utf8mb4';

    USE `perpustakaan_merak`;

    
-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_buku`
--

CREATE TABLE `daftar_buku` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` date NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `gambar` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `di_pinjam` (
  `id` int NOT NULL,
  `buku_id` int NOT NULL,
  `user_id` int NOT NULL,
  `tanggal_pinjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nama`, `email`, `alamat`, `nomor_telepon`, `jenis_kelamin`, `role`) VALUES
(2, 'admin', '$2y$10$Q7Sp2f41hLxLt4VkIgFohumvOCzjmiZ168uDQsbySVzhXJ.NbrZlG', 'Admin Satu', 'admin@admin.com', '', '', 'Laki-laki', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_buku`
--
ALTER TABLE `daftar_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `di_pinjam`
--
ALTER TABLE `di_pinjam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `buku_id` (`buku_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_buku`
--
ALTER TABLE `daftar_buku`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `di_pinjam`
--
ALTER TABLE `di_pinjam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `di_pinjam`
--
ALTER TABLE `di_pinjam`
  ADD CONSTRAINT `di_pinjam_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `di_pinjam_ibfk_2` FOREIGN KEY (`buku_id`) REFERENCES `daftar_buku` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

