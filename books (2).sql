-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2024 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c237_supermarketapp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookId` int(10) NOT NULL,
  `bookTitle` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `publishedDate` date NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookId`, `bookTitle`, `author`, `genre`, `publishedDate`, `image`) VALUES
(1, 'Now You\'re Mine', 'Morgan Bridge', 'Romance', '2023-10-09', 'nowyou\'remine.jpg'),
(2, 'All The Light We Cannot See', 'Anthony Doerr', 'Science Fiction', '2014-05-05', 'allthelightwecannotsee.jpg'),
(3, 'House Across the Lake', 'Riley Sager', 'Thriller', '2022-06-21', 'houseacrossthelake.jpg'),
(4, 'The Surgeon', 'Leslie Wolfe', 'Thriller', '2023-05-08', 'thesurgeon.jpg'),
(5, 'Translation State', 'Ann Leckie', 'Science Fiction', '2023-06-06', 'translationstate.jpg'),
(6, 'Stay Awake', 'Megan Goldin', 'Thriller', '0000-00-00', 'stayawake.jpg'),
(7, 'Atlas Shrugged', 'Ayn Rand', 'Science Fiction', '1957-10-10', 'atlasshrugged.jpg'),
(8, 'Little Fire', 'Hollee Mands', 'Romance', '2021-09-05', 'littlefire.jpg'),
(9, 'Gone Girl', 'Gillian Flynn', 'Thriller', '2012-05-24', 'gonegirl.jpg'),
(10, 'It Ends With Us', 'Colleen Hoover', 'Romance', '2016-08-02', 'itendswithus.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
