-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2023 at 08:46 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `versatile`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinasi_wisata`
--

CREATE TABLE `destinasi_wisata` (
  `destinasiID` int(11) NOT NULL,
  `namaDestinasi` varchar(255) DEFAULT NULL,
  `deskripsiDestinasi` varchar(255) DEFAULT NULL,
  `lokasiDestinasi` varchar(255) DEFAULT NULL,
  `gambarDestinasi` varchar(255) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `transaksiID` int(11) NOT NULL,
  `jmlhTiketDibeli` int(11) DEFAULT NULL,
  `TotalHarga` varchar(255) DEFAULT NULL,
  `tglBooking` date DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `destinasiID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_transaksi`
--

CREATE TABLE `riwayat_transaksi` (
  `riwayatID` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `destinasiID` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `transaksiID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `jmlhTiketDibeli` int(11) DEFAULT NULL,
  `TotalHarga` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `desc` varchar(535) DEFAULT NULL,
  `img` longtext DEFAULT NULL,
  `price` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `title`, `desc`, `img`, `price`) VALUES
(1, 'Trans Snow World Bekasi', 'Trans Snow World adalah pengalaman virtual reality yang menakjubkan, membawa pengguna ke dunia salju yang mempesona dengan grafis realistis dan petualangan seru.', 'data:image/jpeg;base64,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', 150000),
(2, 'Seaworld Ancol', 'Seaworld Ancol adalah taman hiburan keluarga di Jakarta, menyajikan atraksi lumba-lumba, pertunjukan satwa, dan wahana seru untuk pengalaman liburan yang mengesankan.', 'https://media.istockphoto.com/id/1389768890/id/foto/seaworld-san-diego.jpg?s=1024x1024&w=is&k=20&c=qcUGB_p-zWWFZ79LthaiA-eN_mTasaLxm4fWsyNHIa8=', 70000),
(3, 'Bali Zoo', 'Bali Zoo, destinasi konservasi di Pulau Dewata, menyajikan pengalaman unik melihat dan berinteraksi dengan beragam satwa eksotis dalam lingkungan alam.', 'https://momopururu.com/wp-content/uploads/2023/03/BaliZoo_Momo_19.jpg', 100000),
(4, 'Bali Waterboom', 'Bali Waterboom adalah taman air terbesar di Bali, menawarkan wahana seru, kolam renang, dan kegembiraan air menyeluruh untuk pengunjung segala usia.', 'https://www.waterbom-bali.com/media/magentothem/banner7/newhp-banner1x.jpg', 384000),
(5, 'Bugis Waterpark', 'Bugis Waterpark adalah taman air modern di Kota Makassar, menawarkan banyak wahana seru dan kolam renang untuk keluarga dan pengunjung.', 'https://ik.imagekit.io/tvlk/xpe-asset/AyJ40ZAo1DOyPyKLZ9c3RGQHTP2oT4ZXW+QmPVVkFQiXFSv42UaHGzSmaSzQ8DO5QIbWPZuF+VkYVRk6gh-Vg4ECbfuQRQ4pHjWJ5Rmbtkk=/2000566285707/Tiket-Bugis-Waterpark-Adventure-9805ba54-f070-411b-adf9-29c8a7394744.jpeg?_src=imagekit&tr=dpr-2,c-at_max,h-720,q-60,w-1280', 100000),
(6, 'Trans Snow World Makassar', 'Trans Snow World adalah pengalaman virtual reality yang menakjubkan, membawa pengguna ke dunia salju yang mempesona dengan grafis realistis dan petualangan seru.', 'https://lh3.googleusercontent.com/p/AF1QipP-y2V0GNe4Z1A8_pLD1iFzY-DqCaLAxhFWV-tG=s1360-w1360-h1020', 225000),
(7, 'Sailing Komodo', 'Paket Sailing Komodo menawarkan petualangan di Pulau Komodo, menyuguhkan pelayaran mewah, keindahan alam, dan pengalaman menyelam tak terlupakan', 'https://sailingkomodo.com/wp-content/uploads/2019/01/paket-wisata-sailing-komodo-1-harian.jpg', 2500000),
(8, 'Taman Safari Bogor', 'Taman Safari Bogor, Indonesia adalah kebun binatang terbuka yang menawarkan pengalaman safari unik dengan hewan liar dan atraksi interaktif.', 'https://awsimages.detik.net.id/community/media/visual/2020/09/11/berlibur-di-taman-safari-bogor-saat-era-new-normal.jpeg?w=600&q=90', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `username`, `email`, `pwd`) VALUES
(3, 'Alpha', 'Alpha21@gmail.com', '12345678'),
(4, 'Bravo', 'Bravo12@gmail.com', 'qwertyuiop'),
(5, 'rayhanayman', 'rayhanayman@gmail.com', 'ayman'),
(6, 'admin', 'admin@gmail.com', '12345678'),
(7, 'admin', 'admin01@example.com', '123456'),
(8, 'admin02', 'admin02@example.com', '12345678'),
(9, 'imran', 'imran@gmail.com', '123456'),
(10, 'ayman', 'ayman@gmail.com', '123456'),
(11, 'rafa', 'rafa@gmail.com', '12345'),
(12, 'hud', 'hudchan@gmail.com', '12345'),
(13, 'hud2', 'hudchan2@gmail.com', '12345'),
(14, 'rayhanayman', 'rayhanayman8@gmail.com', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinasi_wisata`
--
ALTER TABLE `destinasi_wisata`
  ADD PRIMARY KEY (`destinasiID`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`transaksiID`),
  ADD KEY `destinasiID` (`destinasiID`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `riwayat_transaksi`
--
ALTER TABLE `riwayat_transaksi`
  ADD PRIMARY KEY (`riwayatID`),
  ADD KEY `id` (`id`),
  ADD KEY `destinasiID` (`destinasiID`),
  ADD KEY `transaksiID` (`transaksiID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `jmlhTiketDibeli` (`jmlhTiketDibeli`),
  ADD KEY `TotalHarga` (`TotalHarga`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `destinasi_wisata`
--
ALTER TABLE `destinasi_wisata`
  ADD CONSTRAINT `destinasi_wisata_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ticket` (`id`);

--
-- Constraints for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `detail_transaksi_ibfk_1` FOREIGN KEY (`destinasiID`) REFERENCES `destinasi_wisata` (`destinasiID`),
  ADD CONSTRAINT `detail_transaksi_ibfk_2` FOREIGN KEY (`id`) REFERENCES `ticket` (`id`);

--
-- Constraints for table `riwayat_transaksi`
--
ALTER TABLE `riwayat_transaksi`
  ADD CONSTRAINT `riwayat_transaksi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `riwayat_transaksi_ibfk_2` FOREIGN KEY (`destinasiID`) REFERENCES `destinasi_wisata` (`destinasiID`),
  ADD CONSTRAINT `riwayat_transaksi_ibfk_3` FOREIGN KEY (`transaksiID`) REFERENCES `detail_transaksi` (`transaksiID`),
  ADD CONSTRAINT `riwayat_transaksi_ibfk_4` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
