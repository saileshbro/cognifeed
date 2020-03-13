-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 13, 2020 at 10:12 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

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
  `website` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `view_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `title`, `description`, `website`, `image_url`, `link_url`, `view_count`) VALUES
(1, 'Getting to the Bottom of Navigation in Flutter', 'Bottom navigation in mobile apps is popular because our phones keep getting bigger but our thumbs do not. The Material Design specification describes a bottom navigation bar as a row of three to five buttons at the', '', 'https://miro.medium.com/max/1524/1*pzfLG6bpSs8KGe48AXZR_g.png', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 9),
(2, 'Party Makeup', 'Who doesn\'t enjoy getting dolled up for a party? It\'s a great opportunity to go all out and look your absolute best! You can stun them with some wild and flashy makeup, adding sparkles and bold colors that are just perfect for parties.', '', 'https://www.beautytipsonline.com/images/eye-makeup.jpg', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 6),
(3, 'One of the World’s Most Dangerous Spiders Could Invade Homes after Australia\'s Recent Rainfall', 'While recent rainfall has been a welcome change in Australia after destructive bushfires caused a widespread crisis, it hasn’t come without an asterisk. According to the Australian Reptile Park, the wet and warm conditions have made Sydney funnel web spiders highly active—and the funnel', '', 'https://images2.minutemediacdn.com/image/upload/c_crop,h_1124,w_2000,x_0,y_67/f_auto,q_auto,w_1100/v1579797307/shape/mentalfloss/613403-ianwaldie-gettyimages-56714645.jp}g', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 7),
(4, '5 Mistakes That Could Ruin Your Content Marketing Campaign', 'However, making it work is not easy. Some businesses fail because of silly mistakes such as misconceptions about what content marketing really is and isn’t. For example, they think of content marketing as something that doesn’t require a lot of investments and ultimately fail because of boring, mediocre content.', '', 'https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMDk2Mn0', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 2),
(5, 'What\'s the Best Way to Leash Your Dog?', 'Awe ... You got a puppy. Bet you\'re looking forward to lots of fun days playing with her, taking walks. Feeding her, teaching her to roll over, taking walks. Cuddling on the couch with her and, yes, taking walks. Are you sensing a theme?', '', 'https://resize.hswstatic.com/w_907/gif/dog-leash.jpg', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 7),
(6, 'India’s economy risks swapping stagnation for stagflation', 'The hawkers had some plausible excuses. The weather has been erratic, and delivery systems unreliable. But although an increase in inflation was widely foreseen, the severity of it was not. Consumer prices rose by over 7.3% i', '', 'https://www.economist.com/img/b/1000/563/85/sites/default/files/20200125_FNP501.jpg', 'https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article_tag`
--

INSERT INTO `article_tag` (`article_id`, `tag_id`) VALUES
(1, 9),
(2, 30),
(3, 36),
(4, 41);

-- --------------------------------------------------------

--
-- Table structure for table `favourites`
--

CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `favourites`
--

INSERT INTO `favourites` (`user_id`, `article_id`) VALUES
(2, 3),
(2, 6),
(2, 4),
(4, 1),
(2, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hidden`
--

CREATE TABLE `hidden` (
  `user_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `bio` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'public/images/profile.png',
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `phone`, `bio`, `image_url`, `website`, `about`, `address`) VALUES
(1, 'Sailesh Dahal', '1234567890', NULL, 'public/images/profile.png', NULL, NULL, NULL),
(2, 'Sarayu Gautam', '9813095820', 'FLutter Dev', 'public/uploads/profile1583932762976.jpg', 'www.sarayugautam.com', 'hello there how are you', 'Chandragiri'),
(3, 'Sailesh Dahal', '1234567890', NULL, 'public/images/profile.png', NULL, NULL, NULL),
(4, 'SAILESH DAHAL', '9813095820', NULL, 'public/images/profile.png', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1, 'food and drink'),
(2, 'cooking'),
(3, 'music'),
(4, 'arts'),
(5, 'women'),
(6, 'anime'),
(7, 'stories'),
(8, 'environment'),
(9, 'programming'),
(10, 'general'),
(11, 'sports'),
(12, 'culture'),
(13, 'inspirational'),
(14, 'relationship'),
(15, 'books'),
(16, 'nutrition'),
(17, 'celebrities'),
(18, 'parenthood'),
(19, 'babies'),
(20, 'education'),
(21, 'travel'),
(22, 'humour'),
(23, 'writing'),
(24, 'interesting facts'),
(25, 'animals'),
(26, 'fitness'),
(27, 'beauty'),
(28, 'technology'),
(29, 'movies'),
(30, 'nature'),
(31, 'science'),
(32, 'business'),
(33, 'psychology'),
(34, 'history'),
(35, 'fashion and style'),
(36, 'economics'),
(37, 'mathematics'),
(38, 'philosophy'),
(39, 'health'),
(40, 'finance'),
(41, 'marketing'),
(42, 'television series'),
(43, 'literature'),
(44, 'journalism'),
(45, 'politics');

-- --------------------------------------------------------

--
-- Table structure for table `tag_website`
--

CREATE TABLE `tag_website` (
  `tag_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tag_website`
--

INSERT INTO `tag_website` (`tag_id`, `website_id`) VALUES
(9, 2),
(9, 11),
(21, 15),
(21, 4),
(9, 13),
(9, 12),
(27, 7),
(33, 8),
(21, 14),
(11, 1),
(27, 10),
(11, 3),
(8, 16),
(8, 17),
(1, 18),
(1, 19),
(33, 6),
(1, 21),
(7, 22),
(31, 23),
(31, 24),
(31, 25),
(31, 26),
(5, 27),
(43, 28),
(1, 20),
(43, 30),
(14, 31),
(9, 9),
(29, 33),
(45, 34),
(38, 35),
(44, 36),
(35, 37),
(12, 29),
(43, 39),
(28, 40),
(34, 32),
(6, 42),
(26, 43),
(19, 44),
(18, 45),
(24, 46),
(39, 38),
(40, 48),
(3, 49),
(22, 41),
(40, 47),
(36, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receive_notification` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `reset_token`, `receive_notification`, `created_at`, `updated_at`) VALUES
(1, 'saileshbro@gmaaasil.com', '$2a$08$1dhEk4nyakMIJxmwpO72VO6JtFruzH23ig8Zl0cYTaF/.H426T5a2', NULL, 0, '2020-03-07 09:18:05', '2020-03-07 09:18:05'),
(2, 'sarayugautam1@gmail.com', '$2a$08$TrZ1iIyrtPNXCCHN609MleQEf3vzTi8bqnTKer5SgS4N9hB6mtLTu', '', 0, '2020-03-07 09:21:15', '2020-03-11 13:14:53'),
(3, 'sarayu@gmail.com', '$2a$08$BfwZ.o7n7YLHL/CCxVBiaeZZkpN4Ztz01efytKxc8d7aKkUsH90Qy', NULL, 0, '2020-03-07 13:12:13', '2020-03-07 13:12:13'),
(4, 'saileshbro@ggmail.com', '$2a$08$znZSGPEe9.kmJAdCX/wjRuhZPErLFFYhNTIZA.uEI.K5pvPBvgh5K', NULL, 1, '2020-03-09 11:43:30', '2020-03-09 11:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `user_tags`
--

CREATE TABLE `user_tags` (
  `user_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tags`
--

INSERT INTO `user_tags` (`user_id`, `tag_id`) VALUES
(4, 24),
(4, 17),
(4, 18),
(4, 1),
(2, 24),
(2, 11),
(2, 17),
(2, 18),
(2, 25),
(2, 36),
(2, 12),
(2, 9),
(2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `website_id` int(11) NOT NULL,
  `link_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`website_id`, `link_url`) VALUES
(1, 'https://www.espn.in'),
(2, 'https://davidwalsh.name'),
(3, 'https://sports.yahoo.com'),
(4, 'https://misstourist.com'),
(5, 'https://www.theguardian.com/international'),
(6, 'https://www.mentalfloss.com'),
(7, 'https://www.beautytipsonline.com'),
(8, 'https://www.psychologytoday.com'),
(9, 'https://www.codewall.co.uk'),
(10, 'https://www.mindbodygreen.com'),
(11, 'https://webdevblog.com'),
(12, 'https://www.codingalpha.com'),
(13, 'https://hackernoon.com'),
(14, 'https://travelandtourismnow.blogspot.com'),
(15, 'https://abovethehimalaya.com'),
(16, 'https://www.treehugger.com'),
(17, 'https://www.huffpost.com'),
(18, 'https://iamafoodblog.com'),
(19, 'https://www.thegundruk.com'),
(20, 'https://pinchofyum.com'),
(21, 'https://www.seriouseats.com'),
(22, 'https://www.short-story.me'),
(23, 'https://www.howstuffworks.com'),
(24, 'https://www.sciencedaily.com'),
(25, 'https://www.popsci.com'),
(26, 'https://www.livescience.com'),
(27, 'https://www.bloodandmilk.com'),
(28, 'https://lithub.com'),
(29, 'https://www.newyorker.com/culture'),
(30, 'https://themillions.com'),
(31, 'https://www.loveisrespect.org/blogs'),
(32, 'https://www.smithsonianmag.com'),
(33, 'https://www.cinemablend.com/news'),
(34, 'https://thegeopolitics.com'),
(35, 'https://www.philosophyforlife.org/blog'),
(36, 'https://www.westernjournal.com'),
(37, 'https://www.fashionlady.in/category/fashion'),
(38, 'https://www.fashionlady.in/category/health-tips'),
(39, 'https://www.helpingwritersbecomeauthors.com'),
(40, 'https://arstechnica.com'),
(41, 'https://littleoldladycomedy.com'),
(42, 'https://www.cbr.com'),
(43, 'https://www.eatright.org'),
(44, 'https://www.healthychildren.org/English/ages-stages/baby'),
(45, 'https://bouncebackparenting.com'),
(46, 'https://www.thefactsite.com'),
(47, 'https://www.thepennyhoarder.com'),
(48, 'https://www.mrmoneymustache.com'),
(49, 'https://pitchfork.com');

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
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`website_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `website_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
