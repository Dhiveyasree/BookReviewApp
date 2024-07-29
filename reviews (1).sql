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
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewId` int(10) NOT NULL,
  `bookId` int(10) NOT NULL,
  `reviewerName` varchar(200) NOT NULL,
  `reviewText` varchar(1000) NOT NULL,
  `lastEdited` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviewId`, `bookId`, `reviewerName`, `reviewText`, `lastEdited`) VALUES
(2, 2, 'Bob Smith', 'I definitely suggest this book to new readers. Good read.', '2024-05-20'),
(3, 3, 'Eve Black', 'I am really disappointed with the climax.Would not recommend.', '2024-02-02'),
(4, 4, 'Joe Hill', 'I loved how the story progressed really well. Thriller fans will love it.', '2024-02-11'),
(5, 5, 'Sarah John', 'This is the kind of book that makes new readers even more interested in fantasy.', '2024-02-13'),
(6, 6, 'Sierra Holmes', 'This book is packed with a lot of surprises,twists and turns thriller fans will love.', '2024-02-16'),
(7, 7, 'Harry Wells', 'Very boring.', '2024-02-18'),
(8, 8, 'Regan Nic', 'If you want to improve your vocabulary,this is it.', '2024-02-19'),
(9, 9, 'Regina Malik', 'You can read this book a hundred times and will be surprised every single time.', '2024-02-22'),
(10, 10, 'Levin Sean', 'I am glad I got to read this book. Kept me engaged throughout. Highly recommend.', '2024-02-24'),
(39, 1, 'Tom Tan', 'I really loved the climax of the story so much. I totally did not expect this great work from this author.', '2024-01-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewId`),
  ADD KEY `bookId` (`bookId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `reviewId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `books` (`bookId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
