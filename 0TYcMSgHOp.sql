-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 30, 2019 at 09:46 AM
-- Server version: 8.0.13-4
-- PHP Version: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `0TYcMSgHOp`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `title`, `description`, `image_url`, `link_url`, `view_count`) VALUES
(4, 'Node.js', 'Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside of a browser. Node.js lets developers use JavaScript to write command line tools and for server-side scripting—running scripts server-side to produce dynamic web page content before the page is sent to the user\'s web browser. Consequently, Node.js represents a \"JavaScript everywhere\" paradigm,[6] unifying web-application development around a single programming language, rather than dif', 'upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Node.js_logo.svg/220px-Node.js_logo.svg.png', 'https://en.wikipedia.org/wiki/Node.js', 0);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `image_url`) VALUES
(6, 'Saray uGautam', NULL),
(7, 'Saray uGautam', NULL),
(8, 'Saray uGautam', NULL),
(9, 'Saray uGautam', NULL),
(15, 'Saray uGautam', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `reset_token`) VALUES
(2, 'sarayugautam@gmail.com', '$2a$08$pgOI1NKYmxytH8swRZDbEOGF03qIxgLUZZr4u5g465eD7HjBN.oQG', NULL),
(3, 'saraayugautam@gmail.com', '$2a$08$ZGMDla8bksIhxoAo1OZ/PeipogluKzguH/ItdWPFirpXTKLLwj9ra', NULL),
(4, 'saraaayugautam@gmail.com', '$2a$08$so8BHTxaCwVdzH0GSBIMKufyWQ3FP5hKPIbgYA4LTcaEibFX0g.JC', NULL),
(5, 'saryugautam@gmail.com', '$2a$08$S1/a3jBLy9kbyh.1pCi..Oj.5XaGsgKp7Ck1GfOaU7gX6Wsl1dn9O', NULL),
(6, 'sayugautam@gmail.com', '$2a$08$nfBgxKvbWB4eGfQOuFArFeGxPcDgI6hlDOZbs2xZ/Sl4c.stQA8WS', NULL),
(7, 'sayugautam@gmasil.com', '$2a$08$Yoqp0eXoa9ltTymR0HgAwuJCLZWqmK3O.1mlOyWd4iTiHzlQv17Cu', NULL),
(8, 'saadayugautam@gmasil.com', '$2a$08$WnQ5mtQ9mObkHsyEVywRteVun8exzpWSIbLsr0ignrAQu.pOgS24y', NULL),
(9, 'saadajakyugautam@gmasil.com', '$2a$08$YgXi4CGvOkhcdRINZnO3te8fvKxH4cdfMnWI7WgJ.2YUrdmLN5TnG', NULL),
(11, 'saileshdon@gmasil.com', '$2a$08$yu.x9PgIQD0GaieELhls2OqPIW29.K5cy8k7q1xSIZN3F6jyIeVbC', NULL),
(15, 'hahahah@gmasil.com', '$2a$08$C0iiJoAizY56zOMosckLP.qRSaPSxfOKOfL.p8WKToCvRbF9FufLG', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
