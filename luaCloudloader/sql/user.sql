-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2021-05-14 01:49:23
-- 服务器版本： 5.5.62-log
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api_dlshvh_onlin`
--

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_status` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_status`) VALUES
(1, 'Kiana', 'test', 1),
(2, 'testuser', 'testuser', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
