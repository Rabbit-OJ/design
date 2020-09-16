-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： mysql
-- 生成日期： 2020-09-16 06:14:45
-- 服务器版本： 8.0.21
-- PHP 版本： 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `oj`
--

-- --------------------------------------------------------

--
-- 表的结构 `contest`
--

CREATE TABLE `contest` (
  `cid` int UNSIGNED NOT NULL,
  `name` varchar(144) NOT NULL,
  `uid` int UNSIGNED NOT NULL,
  `count` int UNSIGNED NOT NULL DEFAULT '0',
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `block_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `participants` int UNSIGNED NOT NULL DEFAULT '0',
  `penalty` int UNSIGNED NOT NULL DEFAULT '300'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `contest_clarify`
--

CREATE TABLE `contest_clarify` (
  `ccid` int UNSIGNED NOT NULL,
  `cid` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `contest_question`
--

CREATE TABLE `contest_question` (
  `cqid` int UNSIGNED NOT NULL,
  `cid` int UNSIGNED NOT NULL,
  `tid` int UNSIGNED NOT NULL,
  `id` int UNSIGNED NOT NULL DEFAULT '0',
  `score` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `contest_submission`
--

CREATE TABLE `contest_submission` (
  `sid` int UNSIGNED NOT NULL,
  `cid` int UNSIGNED NOT NULL,
  `uid` int UNSIGNED NOT NULL,
  `tid` int UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_time` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `contest_user`
--

CREATE TABLE `contest_user` (
  `cuid` int UNSIGNED NOT NULL,
  `cid` int UNSIGNED NOT NULL,
  `uid` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `score` int UNSIGNED NOT NULL DEFAULT '0',
  `total_time` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- 表的结构 `question`
--

CREATE TABLE `question` (
  `tid` int UNSIGNED NOT NULL,
  `uid` int UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `attempt` int UNSIGNED NOT NULL DEFAULT '0',
  `accept` int UNSIGNED NOT NULL DEFAULT '0',
  `difficulty` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `time_limit` int UNSIGNED NOT NULL DEFAULT '1000',
  `space_limit` int UNSIGNED NOT NULL DEFAULT '128',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `question`
--

INSERT INTO `question` (`tid`, `uid`, `subject`, `hide`, `attempt`, `accept`, `difficulty`, `time_limit`, `space_limit`, `created_at`) VALUES
(1, 1, 'A + B Problem', 0, 0, 0, 1, 1000, 128, '2020-09-14 07:29:20');

-- --------------------------------------------------------

--
-- 表的结构 `question_content`
--

CREATE TABLE `question_content` (
  `tid` int UNSIGNED NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sample` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `question_content`
--

INSERT INTO `question_content` (`tid`, `content`, `sample`) VALUES
(1, 'Output A + B ', '[{\"in\": \"1 2\", \"out\": \"3\"}]');

-- --------------------------------------------------------

--
-- 表的结构 `question_judge`
--

CREATE TABLE `question_judge` (
  `tid` int UNSIGNED NOT NULL,
  `mode` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dataset_count` int UNSIGNED NOT NULL,
  `version` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `question_judge`
--

INSERT INTO `question_judge` (`tid`, `mode`, `dataset_count`, `version`) VALUES
(1, 'STDIN_S', 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `submission`
--

CREATE TABLE `submission` (
  `sid` int UNSIGNED NOT NULL,
  `tid` int UNSIGNED NOT NULL,
  `uid` int UNSIGNED NOT NULL,
  `status` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ING',
  `judge` json NOT NULL,
  `language` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `file_name` varchar(144) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_used` int UNSIGNED NOT NULL,
  `space_used` int UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `uid` int UNSIGNED NOT NULL,
  `username` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `attempt` int UNSIGNED NOT NULL DEFAULT '0',
  `accept` int UNSIGNED NOT NULL DEFAULT '0',
  `login_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `username`, `is_admin`, `password`, `email`, `attempt`, `accept`, `login_at`, `created_at`) VALUES
(1, 'admin', 1, '6b483e2bd96b3fcba33921e73cc22fbb', 'yangziyue80@outlook.com', 0, 0, '2020-09-14 07:28:14', '2020-09-14 07:28:14');

--
-- 转储表的索引
--

--
-- 表的索引 `contest`
--
ALTER TABLE `contest`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `uid` (`uid`);

--
-- 表的索引 `contest_clarify`
--
ALTER TABLE `contest_clarify`
  ADD PRIMARY KEY (`ccid`),
  ADD KEY `cid` (`cid`);

--
-- 表的索引 `contest_question`
--
ALTER TABLE `contest_question`
  ADD PRIMARY KEY (`cqid`),
  ADD UNIQUE KEY `cid` (`cid`,`tid`,`id`) USING BTREE;

--
-- 表的索引 `contest_submission`
--
ALTER TABLE `contest_submission`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `cid` (`cid`,`uid`);

--
-- 表的索引 `contest_user`
--
ALTER TABLE `contest_user`
  ADD PRIMARY KEY (`cuid`),
  ADD UNIQUE KEY `cid` (`cid`,`uid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid_2` (`cid`,`score`,`total_time`);

--
-- 表的索引 `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`tid`);

--
-- 表的索引 `question_content`
--
ALTER TABLE `question_content`
  ADD PRIMARY KEY (`tid`);

--
-- 表的索引 `question_judge`
--
ALTER TABLE `question_judge`
  ADD PRIMARY KEY (`tid`);

--
-- 表的索引 `submission`
--
ALTER TABLE `submission`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `tid` (`tid`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `contest`
--
ALTER TABLE `contest`
  MODIFY `cid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `contest_clarify`
--
ALTER TABLE `contest_clarify`
  MODIFY `ccid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `contest_question`
--
ALTER TABLE `contest_question`
  MODIFY `cqid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `contest_user`
--
ALTER TABLE `contest_user`
  MODIFY `cuid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `question`
--
ALTER TABLE `question`
  MODIFY `tid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `submission`
--
ALTER TABLE `submission`
  MODIFY `sid` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `uid` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
