-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: 2021-05-14 01:48:46
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
-- 表的结构 `lua_list`
--

CREATE TABLE IF NOT EXISTS `lua_list` (
  `lua_id` int(100) NOT NULL,
  `lua_name` varchar(100) NOT NULL,
  `lua_author` varchar(100) NOT NULL,
  `lua_version` varchar(100) NOT NULL,
  `lua_introduce` varchar(100) NOT NULL,
  `lua_url` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `lua_list`
--

INSERT INTO `lua_list` (`lua_id`, `lua_name`, `lua_author`, `lua_version`, `lua_introduce`, `lua_url`) VALUES
(1, 'first lua', 'Kiana', '1.0', 'test lua', '1'),
(2, 'test_lua', 'Kiana', '1.0', 'test', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lua_list`
--
ALTER TABLE `lua_list`
  ADD PRIMARY KEY (`lua_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
