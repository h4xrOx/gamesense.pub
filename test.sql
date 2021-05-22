-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 17 2018 г., 03:51
-- Версия сервера: 5.7.22-0ubuntu0.16.04.1
-- Версия PHP: 7.2.7-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ajax_chat_bans`
--

CREATE TABLE `ajax_chat_bans` (
  `userID` int(11) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ajax_chat_invitations`
--

CREATE TABLE `ajax_chat_invitations` (
  `userID` int(11) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ajax_chat_messages`
--

CREATE TABLE `ajax_chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `userName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `text` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ajax_chat_online`
--

CREATE TABLE `ajax_chat_online` (
  `userID` int(11) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `userRole` int(1) NOT NULL,
  `channel` int(11) NOT NULL,
  `dateTime` datetime NOT NULL,
  `ip` varbinary(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bans`
--

CREATE TABLE `bans` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `expire` int(10) UNSIGNED DEFAULT NULL,
  `ban_creator` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat_name` varchar(80) NOT NULL DEFAULT 'New Category',
  `disp_position` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `cat_name`, `disp_position`) VALUES
(1, 'General', 0),
(2, 'Premium lounge', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `censoring`
--

CREATE TABLE `censoring` (
  `id` int(10) UNSIGNED NOT NULL,
  `search_for` varchar(60) NOT NULL DEFAULT '',
  `replace_with` varchar(60) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `codes`
--

CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `code` varchar(48) DEFAULT NULL,
  `by` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `admin` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `usedat` datetime DEFAULT NULL,
  `beta` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE `config` (
  `conf_name` varchar(255) NOT NULL DEFAULT '',
  `conf_value` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `config`
--

INSERT INTO `config` (`conf_name`, `conf_value`) VALUES
('o_cur_version', '1.5.10'),
('o_database_revision', '21'),
('o_searchindex_revision', '2'),
('o_parser_revision', '2'),
('o_board_title', 'AFKBOOST'),
('o_board_desc', '<p><span></span></p>'),
('o_default_timezone', '-5'),
('o_time_format', 'H:i:s'),
('o_date_format', 'd-m-Y'),
('o_timeout_visit', '1800'),
('o_timeout_online', '300'),
('o_redirect_delay', '3'),
('o_show_version', '0'),
('o_show_user_info', '1'),
('o_show_post_count', '1'),
('o_signatures', '1'),
('o_smilies', '1'),
('o_smilies_sig', '1'),
('o_make_links', '1'),
('o_default_lang', 'English'),
('o_default_style', 'Cobalt'),
('o_default_user_group', '4'),
('o_topic_review', '15'),
('o_disp_topics_default', '30'),
('o_disp_posts_default', '25'),
('o_indent_num_spaces', '4'),
('o_quote_depth', '3'),
('o_quickpost', '1'),
('o_users_online', '1'),
('o_censoring', '0'),
('o_show_dot', '0'),
('o_topic_views', '1'),
('o_quickjump', '1'),
('o_gzip', '0'),
('o_additional_navlinks', ''),
('o_report_method', '0'),
('o_regs_report', '0'),
('o_default_email_setting', '1'),
('o_mailing_list', 'admin@afkboost.space'),
('o_avatars', '1'),
('o_avatars_dir', 'img/avatars'),
('o_avatars_width', '120'),
('o_avatars_height', '120'),
('o_avatars_size', '50240'),
('o_search_all_forums', '1'),
('o_base_url', 'https://afkboost.space/forums'),
('o_admin_email', 'admin@afkboost.space'),
('o_webmaster_email', 'admin@afkboost.space'),
('o_forum_subscriptions', '0'),
('o_topic_subscriptions', '0'),
('o_smtp_host', 'smtp.yandex.ru'),
('o_smtp_user', 'admin@afkboost.space'),
('o_smtp_pass', 'bBy8oDA1'),
('o_smtp_ssl', '1'),
('o_regs_allow', '1'),
('o_regs_verify', '0'),
('o_announcement', '0'),
('o_announcement_message', 'Enter your announcement here.'),
('o_rules', '0'),
('o_rules_message', 'Enter your rules here'),
('o_maintenance', '0'),
('o_maintenance_message', 'The forums are temporarily down for maintenance. Please try again in a few minutes.'),
('o_default_dst', '0'),
('o_feed_type', '0'),
('o_feed_ttl', '0'),
('p_message_bbcode', '1'),
('p_message_img_tag', '1'),
('p_message_all_caps', '1'),
('p_subject_all_caps', '1'),
('p_sig_all_caps', '1'),
('p_sig_bbcode', '1'),
('p_sig_img_tag', '0'),
('p_sig_length', '400'),
('p_sig_lines', '4'),
('p_allow_banned_email', '1'),
('p_allow_dupe_email', '0'),
('p_force_guest_email', '1'),
('o_poll_enabled', '1'),
('o_poll_max_ques', '3'),
('o_poll_max_field', '20'),
('o_poll_time', '60'),
('o_poll_term', '3'),
('o_poll_guest', '0'),
('o_pms_enabled', '1'),
('o_pms_min_kolvo', '0'),
('o_pms_flasher', '1'),
('o_crypto_pas', 'HJdNBzC6BgLP2TZraKqDdCkRI'),
('recaptcha_site_key', '6Le-6F0UAAAAAHHwwihcjCK-pqI8V3EBb4DbLqM0'),
('recaptcha_secret_key', '6Le-6F0UAAAAAPWHgHlGtc56Z2MIo3qOnOH4jSuQ');

-- --------------------------------------------------------

--
-- Структура таблицы `forums`
--

CREATE TABLE `forums` (
  `id` int(10) UNSIGNED NOT NULL,
  `forum_name` varchar(80) NOT NULL DEFAULT 'New forum',
  `forum_desc` text,
  `redirect_url` varchar(100) DEFAULT NULL,
  `moderators` text,
  `num_topics` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `num_posts` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `last_post` int(10) UNSIGNED DEFAULT NULL,
  `last_post_id` int(10) UNSIGNED DEFAULT NULL,
  `last_poster` varchar(200) DEFAULT NULL,
  `sort_by` tinyint(1) NOT NULL DEFAULT '0',
  `disp_position` int(10) NOT NULL DEFAULT '0',
  `cat_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forums`
--

INSERT INTO `forums` (`id`, `forum_name`, `forum_desc`, `redirect_url`, `moderators`, `num_topics`, `num_posts`, `last_post`, `last_post_id`, `last_poster`, `sort_by`, `disp_position`, `cat_id`) VALUES
(1, 'Announcements', 'Stay up to date with the latest news', NULL, NULL, 10, 10, 1528877622, 10, 'admin', 0, 0, 1),
(2, 'General talk', NULL, NULL, NULL, 1, 1, 1530138748, 17, 'admin', 0, 1, 1),
(3, 'Spotlight', 'Show off screenshots or videos', NULL, NULL, 2, 2, 1530452262, 26, 'admin', 0, 2, 1),
(4, 'CS:GO Discussion', 'General Counter-Strike related discussion', NULL, NULL, 13, 17, 1531298894, 35, 'mulfix', 0, 0, 2),
(5, 'Feedback', 'Report a bug, or suggest a feature here', NULL, NULL, 4, 4, 1528878048, 14, 'admin', 0, 1, 2),
(6, 'Marketplace', 'Buy or sell goods', NULL, NULL, 1, 1, 1528878074, 15, 'admin', 0, 5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `forum_perms`
--

CREATE TABLE `forum_perms` (
  `group_id` int(10) NOT NULL DEFAULT '0',
  `forum_id` int(10) NOT NULL DEFAULT '0',
  `read_forum` tinyint(1) NOT NULL DEFAULT '1',
  `post_replies` tinyint(1) NOT NULL DEFAULT '1',
  `post_topics` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `forum_perms`
--

INSERT INTO `forum_perms` (`group_id`, `forum_id`, `read_forum`, `post_replies`, `post_topics`) VALUES
(4, 1, 1, 1, 0),
(5, 1, 1, 1, 0),
(6, 1, 1, 1, 0),
(4, 4, 0, 0, 0),
(4, 5, 0, 0, 0),
(4, 6, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `forum_subscriptions`
--

CREATE TABLE `forum_subscriptions` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `g_id` int(10) UNSIGNED NOT NULL,
  `g_title` varchar(50) NOT NULL DEFAULT '',
  `g_user_title` varchar(50) DEFAULT NULL,
  `g_promote_min_posts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `g_promote_next_group` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `g_moderator` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_edit_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_rename_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_change_passwords` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_ban_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_mod_promote_users` tinyint(1) NOT NULL DEFAULT '0',
  `g_read_board` tinyint(1) NOT NULL DEFAULT '1',
  `g_view_users` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_replies` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_topics` tinyint(1) NOT NULL DEFAULT '1',
  `g_edit_posts` tinyint(1) NOT NULL DEFAULT '1',
  `g_delete_posts` tinyint(1) NOT NULL DEFAULT '1',
  `g_delete_topics` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_links` tinyint(1) NOT NULL DEFAULT '1',
  `g_set_title` tinyint(1) NOT NULL DEFAULT '1',
  `g_search` tinyint(1) NOT NULL DEFAULT '1',
  `g_search_users` tinyint(1) NOT NULL DEFAULT '1',
  `g_send_email` tinyint(1) NOT NULL DEFAULT '1',
  `g_post_flood` smallint(6) NOT NULL DEFAULT '30',
  `g_search_flood` smallint(6) NOT NULL DEFAULT '30',
  `g_email_flood` smallint(6) NOT NULL DEFAULT '60',
  `g_report_flood` smallint(6) NOT NULL DEFAULT '60',
  `g_pm` tinyint(1) NOT NULL DEFAULT '1',
  `g_pm_limit` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `g_color` varchar(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`g_id`, `g_title`, `g_user_title`, `g_promote_min_posts`, `g_promote_next_group`, `g_moderator`, `g_mod_edit_users`, `g_mod_rename_users`, `g_mod_change_passwords`, `g_mod_ban_users`, `g_mod_promote_users`, `g_read_board`, `g_view_users`, `g_post_replies`, `g_post_topics`, `g_edit_posts`, `g_delete_posts`, `g_delete_topics`, `g_post_links`, `g_set_title`, `g_search`, `g_search_users`, `g_send_email`, `g_post_flood`, `g_search_flood`, `g_email_flood`, `g_report_flood`, `g_pm`, `g_pm_limit`, `g_color`) VALUES
(1, 'Administrators', 'Administrator', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, '#00BFFF'),
(2, 'Moderators', 'Moderator', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 100, '#ff9933'),
(3, 'Guests', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 30, 0, 0, 1, 100, NULL),
(4, 'Members', NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 60, 30, 60, 60, 1, 100, ''),
(5, 'Premium user', 'Premium user', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 60, 30, 60, 60, 1, 100, '#e61515'),
(6, 'Beta user', 'Premium user', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 60, 30, 60, 60, 1, 100, '#e61515');

-- --------------------------------------------------------

--
-- Структура таблицы `online`
--

CREATE TABLE `online` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `ident` varchar(200) NOT NULL DEFAULT '',
  `logged` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idle` tinyint(1) NOT NULL DEFAULT '0',
  `last_post` int(10) UNSIGNED DEFAULT NULL,
  `last_search` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `online`
--

INSERT INTO `online` (`user_id`, `ident`, `logged`, `idle`, `last_post`, `last_search`) VALUES
(2, 'admin', 1531813732, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(10) NOT NULL,
  `goods` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `inv` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pms_new_block`
--

CREATE TABLE `pms_new_block` (
  `bl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bl_user_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pms_new_posts`
--

CREATE TABLE `pms_new_posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `poster` varchar(200) NOT NULL DEFAULT '',
  `poster_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `poster_ip` varchar(39) DEFAULT NULL,
  `message` text,
  `hide_smilies` tinyint(1) NOT NULL DEFAULT '0',
  `posted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edited` int(10) UNSIGNED DEFAULT NULL,
  `edited_by` varchar(200) DEFAULT NULL,
  `post_new` tinyint(1) NOT NULL DEFAULT '1',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pms_new_topics`
--

CREATE TABLE `pms_new_topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic` varchar(255) NOT NULL DEFAULT '',
  `starter` varchar(200) NOT NULL DEFAULT '',
  `starter_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `to_user` varchar(200) NOT NULL DEFAULT '',
  `to_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `replies` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `last_posted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_poster` tinyint(1) NOT NULL DEFAULT '0',
  `see_st` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `see_to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_st` tinyint(4) NOT NULL DEFAULT '0',
  `topic_to` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `poll`
--

CREATE TABLE `poll` (
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `question` tinyint(4) NOT NULL DEFAULT '0',
  `field` tinyint(4) NOT NULL DEFAULT '0',
  `choice` varchar(255) NOT NULL DEFAULT '',
  `votes` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `poll`
--

INSERT INTO `poll` (`tid`, `question`, `field`, `choice`, `votes`) VALUES
(26, 1, 0, 'Add vk send message from events?', 1),
(26, 1, 1, 'Usefull', 2),
(26, 1, 2, 'Useless', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `poll_voted`
--

CREATE TABLE `poll_voted` (
  `tid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `rez` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `poll_voted`
--

INSERT INTO `poll_voted` (`tid`, `uid`, `rez`) VALUES
(26, 2, 'a:1:{i:1;a:1:{i:0;s:1:"1";}}'),
(26, 5, 'a:1:{i:1;a:1:{i:0;s:1:"2";}}'),
(26, 4, 'a:1:{i:1;a:1:{i:0;s:1:"1";}}');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `poster` varchar(200) NOT NULL DEFAULT '',
  `poster_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `poster_ip` varchar(39) DEFAULT NULL,
  `poster_email` varchar(80) DEFAULT NULL,
  `message` mediumtext,
  `hide_smilies` tinyint(1) NOT NULL DEFAULT '0',
  `posted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edited` int(10) UNSIGNED DEFAULT NULL,
  `edited_by` varchar(200) DEFAULT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `likes` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `poster`, `poster_id`, `poster_ip`, `poster_email`, `message`, `hide_smilies`, `posted`, `edited`, `edited_by`, `topic_id`, `likes`) VALUES
(1, 'admin', 2, '172.68.244.39', NULL, '[b]You will be permanently banned without refund for...[/b]\n- Payment fraud\n- Account sharing\n- Malicious activity with the intent to undermine skeet.cc including but not limited to: dumping, reverse engineering, exploiting.\n- Inviting someone that has already been banned.\n\n[b]Other rules[/b] - In most cases, first time offenders will receive a warning. Second time offenders will receive a temporary ban. Third strike will result in a permanent ban.\n- Misleading others with promises of an invitation code.\n- Taking part in doxxing, DDoS, or other inexcusable behavior.\n- Harassing others on the forums or in discord is not tolerated. This includes racism, or a post whose only purpose is to insult someone.\n- Soliciting invites via private messages', 0, 1528779714, NULL, NULL, 1, NULL),
(2, 'admin', 2, '84.244.45.54', NULL, 'Whenever you send Bitcoins, the transaction goes through different computers running the Bitcoin protocol around the world that make sure the transaction is valid. Once the transaction is verified it then waits inside the Mempool (i.e. in some sort of a "limbo" state). It\'s waiting to be picked up by a Bitcoin miner and entered into a block of transaction on the Blockchain. Until it is picked up it\'s considered an [i]unconfirmed transaction or a pending transaction[/i]. A new block of transactions is added to the Blockchain every 10 minutes on average.\nHowever since there are so many transactions lately due to the price increase, and a block can only hold a finite amount of transactions, not all transactions are picked instantly. So you need to wait for a certain amount of time until a miner decided to pick your transaction out of all of those sitting around in the mempool. Once your transaction is included in the block it receives its first confirmation and it\'s no longer pending.\n\n[b]"My BTC payment says it was cancelled, but I sent the proper amount"[/b]\nThe payment processor of GameSense will cancel the bitcoin receiver after 10 minutes. If your transaction was cancelled, then it wasn\'t confirmed within 10 minutes. Any bitcoins confirmed after the 10 minute limit will be refunded automatically. If you didn\'t enter a refund address, then you will receive an e-mail with refund instructions.\n\n[b]"My payment was cancelled but I haven\'t received a refund"[/b]\nBe patient. If you haven\'t received a refund after 72 hours, then please PM me with details of the payment, including amount, date, time, timezone, BTC receiver address, and your BTC address from which you sent the payment.\n\n[b]"How can I make sure my transaction will get included in the next block?"[/b]\nBy adding a big enough mining fee to it. One of the ways miners get paid for their work is by collecting the fees on the different transactions. So naturally they would prefer to include the transactions with the highest fees first. If your fee is high enough – your transaction will go through faster.\n\n[b]"How can I tell how much is the right fee?"[/b]\nFees are calculated by the size of the transaction. Every transaction has a size, just like a file size. The size depends on many factors that I won\'t go in to at the moment. The fastest and cheapest transaction fee is currently 60 satoshis/byte. So if, for example, your transaction is 257 bytes, you will need to pay 257*60 = 15,420 Satoshis as a transaction fee in order to be included in the next block.\nSo now you\'re probably asking "How can I calculate my transaction size?"\nYou can\'t, at least not without extensive knowledge of how Bitcoin works. Your wallet is supposed to do this for you. Most wallets today will either automatically add the required fee to get the transaction confirmed as soon as possible or will let you choose from a variety of fees according to the requested confirmation time (e.g. fast, medium, slow). If you are able to manually enter a fee, you can try using [url=https://bitcoinfees.earn.com/]a bitcoin fee website[/url] to choose a good amount.\n\nExample of choosing a bitcoin fee\nDetermine the size (in bytes) of your transaction using your bitcoin wallet provider. Go to [url=https://bitcoinfees.earn.com/]Earn\'s bitcoin fee stats page[/url]. Change the fee currency to BTC. We want to find the smallest fee that has 0 delay and the shortest duration of time.\n\n[img]https://i.imgur.com/DyfX5LQ.png[/img]\n\nIn this case, a fee of 0.0000018 BTC per byte is the ideal fee. If your transaction is 226 bytes, that would be a fee of 0.0004068 BTC.', 0, 1528877016, NULL, NULL, 2, NULL),
(3, 'admin', 2, '84.244.45.54', NULL, 'Price will be lowered to $10.00/month starting 1 month from now (June 13th, 2018)', 0, 1528877148, NULL, NULL, 3, NULL),
(4, 'admin', 2, '84.244.45.54', NULL, 'More payment plans have been added.\n\n30 days - $10.00\n90 days - $30.00\n365 days - $50.00', 0, 1528877197, NULL, NULL, 4, NULL),
(5, 'admin', 2, '84.244.45.54', NULL, 'If you were kicked from the discord recently or are a new member, Joining the discord is as simple as clicking "Join us on discord".\n\n[b]However make sure you are logged into your MAIN discord account in your web browser.[/b]\n\nHaving trouble finding the hyperlink?\n\n[img]https://i.imgur.com/GPUozTb.png[/img]', 0, 1528877344, NULL, NULL, 5, NULL),
(6, 'admin', 2, '84.244.45.54', NULL, 'You now have the option to choose another payment methods:\n[img]https://afkboost.space/forums/pm.png[/img]', 0, 1528877417, NULL, NULL, 6, NULL),
(7, 'admin', 2, '84.244.45.54', NULL, 'The forum registration is now set to invite only. I\'ve given you all 2 invites, they can be found in the "Premium" page. If you know someone that wants the hack, give them one of your invite codes, then have them use the payment page.', 0, 1528877455, NULL, NULL, 7, NULL),
(8, 'admin', 2, '84.244.45.54', NULL, 'Invitation codes are meant to be shared with friends. Anyone caught selling invite codes will be banned. Keep in mind that when you invite someone, you are essentially vouching for them, so if they do anything malicious such as credit card fraud, you (the inviter) may also be banned.', 0, 1528877492, NULL, NULL, 8, NULL),
(9, 'admin', 2, '84.244.45.54', NULL, 'Need your Discord ID reset? Goto your Premium tab and request one under HWID reset.', 0, 1528877525, NULL, NULL, 9, NULL),
(10, 'admin', 2, '84.244.45.54', NULL, '2FA is now available, going to your profile and selecting "Authentication"\n\nIt is optional. If you do choose to use it, be sure to save your recovery code in case you lose access to your phone.', 0, 1528877622, NULL, NULL, 10, NULL),
(11, 'admin', 2, '84.244.45.54', NULL, '[b]Incorrect form size, text is not displayed correctly[/b]\nUnpack archive with your forum password and open file without winrar or web browser.\n\n[b]Random crashes[/b]\nMake sure that on all paths you have 2 slashes instead of 1.\nExample:\n[quote]C:[b]\\\\[/b]Windows[b]\\\\[/b]Sandboxie.ini[/quote]\n\n[b]Example paths[/b]\n[quote][b]Log #1 path:[/b]\nC:\\\\Sandbox\\\\admin\\\\1\\\\drive\\\\C\\\\Program Files (x86)\\\\Steam\\\\steamapps\\\\common\\\\Counter-Strike Global Offensive\\\\csgo\\\\afkboost.txt\n\n[b]Log #2 path:[/b]\nC:\\\\Sandbox\\\\admin\\\\2\\\\drive\\\\C\\\\Program Files (x86)\\\\Steam\\\\steamapps\\\\common\\\\Counter-Strike Global Offensive\\\\csgo\\\\afkboost.txt\n\n[b]Steam path:[/b]\nC:\\\\Program Files (x86)\\\\Steam\\\\Steam.exe\n\n[b]Sndbx path:[/b]\nC:\\\\Program Files\\\\Sandboxie\\\\Start.exe[/quote]\n\n[b]Warning: Steam opened before client[/b]\nSteam client with(or without) sandoxie effect is already running.\n\n[b]Crash or no avatars in lobbies page[/b]\nGo to "General" page and set "Web api key" to [url=https://steamcommunity.com/dev/apikey]your own[/url].\nOr try to use old key:\n[quote]FAEE870A89FF0A4836814EBFCDC7AAA1[/quote]\n\n[b]Configuration file does not work[/b]\nRun program as administrator.\n\n[b]How to make csgo log output[/b]\nType in console or in autoexec.cfg following command:\n[quote]con_logfile afkboost.txt[/quote]\n\n[b]How to parse lobbies information[/b]\nType in console or in autoexec.cfg following command:\n[quote]developer 1[/quote]\n\n[b]How to hide useless log output at screen[/b]\nType in console or in autoexec.cfg following command:\n[quote]con_filter_text match_id\ncon_enable 1\ncon_filter_enable 2\n[/quote]\n\n[b]Parameters[/b]\nFor example start csgo after login with parameters [em]-novid -window -w 640 -h 480[/em]\n[quote]\n-applaunch 730 -novid -window -w 640 -h 480\n[/quote]\n\nIf you still have issues, [url=https://afkboost.space/forums/profile.php?id=2]PM[/url] me.', 0, 1528877879, NULL, NULL, 11, NULL),
(21, 'admin', 2, '5.167.21.202', NULL, '[b]Changes[/b]\n\n- Added auto-disconnects (beta)\nYou must be use 4 logs instead of 2. For example "Extra log #1" - any win lobby bot, "Extra log #2" - any lose lobby bot\n[url=https://afkboost.space/forums/viewtopic.php?pid=23]More info[/url]\n- Added extra tab for [url=https://afkboost.space/forums/viewtopic.php?id=21]Sandboxie fix[/url]\n- Added topmost combobox for panel and event logs\n- Added account number 10 (suggested by [url=https://afkboost.space/forums/profile.php?id=6]@BlackDragon[/url])\n- Added byte type:[quote]"All" - byte on all accounts except leaders\n"Lobbies" - byte only on the selected lobbies except leaders\nFor win lobby only accounts with win checkboxes will accept, for lose lobby only accounts with lose checkboxes will accept[/quote]\n- Added single join in the lobby\n- Improved byte lobbies due to updates\n- Fixed join lobby events\n- Fixed issue with panel position due to updates\n- Fixed issue with joining account number 9 in the lobby (reported by [url=https://afkboost.space/forums/profile.php?id=6]@BlackDragon[/url])', 0, 1530408664, NULL, NULL, 20, NULL),
(22, 'admin', 2, '5.167.21.202', NULL, '[b]Preparation:[/b][code]$ apt-get update\n$ apt-get install sudo nano crontab apache2 php libapache2-mod-php php-mcrypt\n$ wget --no-check-certificate https://nodejs.org/dist/latest-v8.x/node-v8.11.3-linux-x64.tar.gz\n$ sudo tar --strip-components 1 -xzvf node-v8.11.3-linux-x64.tar.gz -C /usr/local\n$ sudo npm -g install npm@latest \n$ sudo npm -g install coffee-script pm2 \n$ sudo pm2 install coffeescript[/code]\n\n*for [b]32bit[/b] os\n[code]$ wget --no-check-certificate https://nodejs.org/dist/latest-v8.x/node-v8.11.3-linux-x86.tar.gz\n$ sudo tar --strip-components 1 -xzvf node-v8.11.3-linux-x86.tar.gz -C /usr/local[/code]\n\n\n[b]Installation:[/b]\n- Put directory [b]web/*.*[/b] in [b]/var/www/html[/b] (if folder does not exits put in [b]/var/www[/b])\n- Put directory [b]server/*.*[/b] in [b]/var/[/b] (Total path - [b]/var/fix/[/b])\n- Go to [b]/var/www/html/[/b] directory then open file [b]config.php[/b] and change variables[code]$pswd = ""; //dedicated server password\n$key = ""; //api token\n$addr = ""; //log ip address or domain, example: 127.0.0.1[/code]\n- Type following task via command "[b]crontab -e[/b]"\n[code]*/3 * * * * wget -q -O - http://your_ip/api_cron.php?key=your_token >/dev/null 2>&1[/code]\n[em]your_ip[/em] = your [b]public[/b] ip\n[em]token[/em] = [b]config.php[/b] token\n\n[b]How to add accounts?[/b]\n[code]$ cd /var/fix\n$ coffee user.coffee[/code]\n\n[b]How to configure panel?[/b]\nType in field "[b]Server[/b]" your dedicated server [b]ip address[/b] or [b]domain[/b] in the format [b]127.0.0.1[/b] or [b]domain.space[/b]\nType in field "[b]Pswd[/b]" your [b]token[/b]\n\nYou can download in [b][color=#e61515]Premium[/color][/b] tab', 0, 1530435949, NULL, NULL, 21, NULL),
(12, 'admin', 2, '84.244.45.54', NULL, '[b]Mention the feature you are having issues with[/b]\n\n[b]List the things you did before the bug happened[/b]\n\n[b]Include any other information that will help reproduce the bug.[/b]\n- What type of server were you on? MM? Casual? Community deathmatch?\n\n[b]Include screenshots of your settings[/b]', 0, 1528877959, NULL, NULL, 12, NULL),
(13, 'admin', 2, '84.244.45.54', NULL, 'Have a bug report that you feel like doesn\'t need a thread?\n\nPost it here.\n\nBug reports, Nothing else.\n\n[b]Bug format(ensures it will be fixed)[/b]\n-Feature\n-What happened\n-Any information that helps in reproducing\n-What type of server it was(nospread, spread, valve mm, hs only, etc)\n-Screenshot of your settings/export of your settings\n-A video of the bug happening(if possible, not always needed if reproduce information is good enough)\n\n[b]Example[/b]\nFeature: Bounding box\nWhat happened: I enabled it and bounding boxes did not appear on enemys/teammates\nReproduce: Enabling the feature\nServer type: Valve MM\nScreenshot: (screenshot of visuals, misc, rage)\nVideo: No video needed', 0, 1528878014, NULL, NULL, 13, NULL),
(14, 'admin', 2, '84.244.45.54', NULL, 'Have a small suggestion that doesn\'t need a thread?\n\nPost it here.\n\nSuggestions, Nothing else.\n\nThese suggestions are prioritized by admin.\n\n[b]Suggestion format[/b]\n-Feature\n-How does it help?\n-Where would it be useful?\n\n[b]Example[/b]\nFeature: Aimbot\nHow does it help?: Automatically aiming at players ensuring an edge over others\nWhere would it be useful?: In any situation where your mouse aim would lack', 0, 1528878048, NULL, NULL, 14, NULL),
(15, 'admin', 2, '84.244.45.54', NULL, '- Nothing illegal\n- Anyone scamming will be permanently banned without warning\n- Nothing related to any other provider (e.g. dumps, configs)\n\nInclude "WTB" (want to buy) in your topic title if you are looking to buy.\nInclude "WTS" (want to sell) in your topic title if you are selling.\nThis is temporary, in the future I\'ll add official topic tags.', 0, 1528878074, NULL, NULL, 15, NULL),
(16, 'admin', 2, '84.244.45.54', NULL, 'Try to use [url=https://www.henrypp.org/product/memreduct]Mem Reduct[/url].\n[img]https://www.henrypp.org/images/memreduct.png[/img]', 0, 1528878340, NULL, NULL, 16, NULL),
(19, 'admin', 2, '5.167.21.202', NULL, '[b]Changes[/b]\n\n- Added event logs\n- Added auto join in lobbies\n- Auto start now works in background\n- Improved configuration system\n- Fixed win lobby link parse\n- Fixed crash when avatar can not be loaded from steamcommunity', 0, 1530319247, NULL, NULL, 19, NULL),
(20, 'mulfix', 4, '176.38.22.19', NULL, 'p', 0, 1530354587, NULL, NULL, 19, ''),
(17, 'admin', 2, '84.244.17.174', NULL, 'Promotional codes with 90% discount for [url=https://afkboost.space/forums/payment.php?game=csgo]buy/extend subscription[/url].\nExpires at [u]28.09.2018[/u]\n\n[list=*]\n[*]9AF3C113A12E4248[/*]\n[*]655B818F061D4BEB[/*]\n[*]5211FA1E358848FA[/*]\n[/list]', 0, 1530138748, NULL, NULL, 17, NULL),
(18, 'admin', 2, '84.244.17.174', NULL, 'PB: [b][url=https://afkboost.space/forums/profile.php?id=3]@HyperPeak[/url][/b]\n[img]https://pp.userapi.com/c844722/v844722228/8da6d/XTJAubDogrw.jpg[/img]', 0, 1530139510, NULL, NULL, 18, NULL),
(24, 'admin', 2, '5.167.21.202', NULL, 'Features explain\n\n[b]XY for accounts[/b] - accept button\n[b]Start #1[/b] - start queue button for win lobby\n[b]Start #2[/b] - start queue button for lose lobby\n[b]Stop #1[/b] - stop queue button for win lobby\n[b]Stop #2[/b] - stop queue button for lose lobby\n[b]Accept delay[/b] - delay before press accept button on selected accounts in milliseconds\n[b]Byte delay[/b] - delay before "byte" aka press accept button on selected accounts except leaders in milliseconds\n[b]Log #1 path[/b] - account #1 output log path\n[b]Log #2 path[/b] - account #2 output log path\n[b]Steam path[/b] - "Steam.exe" path\n[b]Sndbx path[/b] - Sandboxie "Start.exe" path\n[b]Events[/b] - Disable/Enable log events\n[b]Topmost[/b] - Change topmost for panel/events\n[b]Byte type[/b] - "All" for pressing accept button on selected accounts except leader, "Lobbies" for pressing accept button on selected accounts considering lobby when game was found\n[b]Disconnects[/b] - Disable/Enable disconnects tab', 0, 1530439512, NULL, NULL, 23, NULL),
(23, 'admin', 2, '5.167.21.202', NULL, 'Features explain\n\n[b]XY for accounts[/b] - reconnect button\n[b]Find #1[/b] - win lobby button "Play"\n[b]Find #2[/b] - lose lobby button "Play"\n[b]WM #1[/b] - win lobby button "WingMan"\n[b]WM #2 [/b]- lose lobby button "WingMan"\n[b]MM #1 [/b]- win lobby button "MatchMaking"\n[b]MM #2[/b] - lose lobby button "MatchMaking"\n[b]Extra log #1[/b] - any second win lobby log\n[b]Extra log #2[/b] - any second lose lobby log\n[b]1st disc after[/b] - First disconnect after [em]x[/em] milliseconds\nFor MatchMaking: [b]60000[/b]\nFor WingMan: [b]75000[/b]\n[b]Recnnct after[/b] - Press reconnect button after [em]x[/em] milliseconds\nDefault: [b]5000[/b]\nRecommended: [b]10000[/b]\n[b]Type[/b] - disconnects mode contains: MatchMaking, WingMan \n[b]Lobby[/b] - lobby that will disconnecting\n[b]Switch[/b] - switch lobbies after game ends\n[b]Prime[/b] - when creating lobby change mode to prime\n[b]Prime #1[/b] - win lobby button "Prime"\n[b]Prime #2[/b] - lose lobby button "Prime"\n[b]Reset[/b] - reset local variables', 0, 1530438220, NULL, NULL, 22, NULL),
(25, 'admin', 2, '5.167.21.202', NULL, 'Features explain\n\n[b]Checking[/b] - checking order and update lobbies tab\n[b]Last member[/b] - set steam64 to last member\'s id\n[b]Steam64[/b] - 64 id\n[b]Order[/b] - if value not null then boost to a certain rank when completed disable manager\n[b]Games[/b] - if value not null then boost to a certain games count when completed disable manager\n[b]+1 game[/b] - add 1 game to games count\n[b]-1 game[/b] - remove 1 game from games count\n[b]Clear games[/b] - clear games count\n[b]cLogs[/b] - clear logs and purge lobbies tab\n[b]S: [/b] - status\n\nRanks:\n[list=1]\n[*][b]s1[/b][/*]\n[*][b]s2[/b][/*]\n[*][b]s3[/b][/*]\n[*][b]s4[/b][/*]\n[*][b]s5[/b][/*]\n[*][b]s6[/b][/*]\n[*][b]gn1[/b][/*]\n[*][b]gn2[/b][/*]\n[*][b]gn3[/b][/*]\n[*][b]gn4[/b][/*]\n[*][b]mg1[/b][/*]\n[*][b]mg2[/b][/*]\n[*][b]mg3[/b][/*]\n[*][b]dmg[/b][/*]\n[*][b]le[/b][/*]\n[*][b]lem[/b][/*]\n[*][b]smfc[/b][/*]\n[*][b]ge[/b][/*]\n[/list]', 0, 1530439854, NULL, NULL, 24, NULL),
(26, 'admin', 2, '5.167.21.202', NULL, '[youtube]2qZDCrrGrwY[/youtube]', 0, 1530452262, NULL, NULL, 25, 'a:1:{i:5;s:9:"Slaurusse";}'),
(27, 'admin', 2, '5.167.21.202', NULL, '[b]Changes[/b]\n\n- When you double-click on rank in lobbies page, steamid64 copies to the clipboard\n- Added new events for disconnects and lobbies tab due to updates\n- Improved loader api\n- Improved steam avatars in lobbies tab\n- Fixed issue with ranks in lobbies tab when updating or clearing tab\n- Fixed issue with username register (reported by [url=https://afkboost.space/forums/profile.php?id=3]@HyperPeak[/url])', 0, 1530492486, NULL, NULL, 26, NULL),
(28, 'admin', 2, '176.212.26.71', NULL, '[b]Changes[/b]\n\nAdded option panorama ui for disconnects (do not create lobby, do not change prime value) and join lobby (do not parse, do not autojoin) at first time\nFixed mouse events on windows 10 (wait 100ms, set pos, wait 100 ms, click)\nChanged checking logs delay to 2 seconds due to update\nIf extra log value is "0" or "" then panel don\'t parse extra logs', 0, 1530855910, NULL, NULL, 27, NULL),
(29, 'admin', 2, '176.212.26.71', NULL, '[b]Changes[/b]\n\nFixed panorama ui lobbies, links parsing and lobby join now works again', 0, 1530937262, NULL, NULL, 28, NULL),
(30, 'admin', 2, '176.212.26.71', NULL, 'Join lobby updated - [url=https://afkboost.space/forums/viewtopic.php?id=28]topic[/url]', 0, 1530940387, NULL, NULL, 27, NULL),
(31, 'admin', 2, '176.212.26.71', NULL, '*fixed flick after authorizing', 0, 1530970226, NULL, NULL, 28, NULL),
(32, 'admin', 2, '176.212.26.71', NULL, 'Features explain\n\n[b]Accounts checkboxes[/b] - enable or disable account\n[b]Win or Lose checkboxes[/b] - lobby for account\n[b]Auto accept[/b] - press accept if lobby find\n[b]Auto start[/b] - press on start button every 10 seconds (type in console "unbind mouse1" on leaders)\n[b]Members[/b] - checking for members count not full lobby then disable panel\n[b]Wingman[/b] - [b]Members[/b] but for wingman\n[b]Byte lobbies[/b] - if value is "off" close search else if "on" press accept on [url=https://afkboost.space/forums/viewtopic.php?id=23]selected accounts[/url] except leaders\n[b]Link parse[/b] - update "Win" textbox when lobby was created by leader\n[b]Auto join[/b] - join on selected accounts and lobbies after lobby link was updated\n[b]Win[/b] - Win lobby textbox with join link (format: steam://joinlobby/730/xxx)\n[b]Lose[/b] - Lose lobby textbox with join link (format: steam://joinlobby/730/xxx)\n[b]Join win or Join lose[/b] - Single join in selected lobby\n\n[b]Lobby links api:[/b]\n[quote][color=#FF0000][b]POST REQUEST:[/b][/color]\n[color=#00BFFF]Url:[/color] [url]https://api.afkboost.space/lobby/get?[/url]\n[color=#00BFFF]Parameters:[/color] \n[quote]\n[b]token[/b]=[em]xxx[/em] - your token in [b][color=#e61515]Premium[/color][/b] tab[/quote]\nor[quote]\n[b]username[/b]=[em]admin[/em] - your username\n[b]password[/b]=[em]xxx[/em] - your password\n[/quote]\n[quote]\n[b]char[/b]=[em],[/em] - optional parameter, without it char for split will be [b]<br>[/b] or [b]new line[/b]\n[/quote]\n[color=#00BFFF][b]RESPONSE:[/b][/color]\n[quote]\n[em]109775245053844894[/em][b],[/b][em]109775245053845602[/em]\n[/quote]\nFirst value is win lobby link, second is lose\n\n[/quote]', 0, 1531037004, NULL, NULL, 29, NULL),
(33, 'admin', 2, '176.212.26.71', NULL, '[b]Changes[/b]\n\nAdded links api\n[url=https://afkboost.space/forums/viewtopic.php?pid=32]More info[/url]\nFixed lobby links for old csgo version', 0, 1531037143, NULL, NULL, 30, NULL),
(34, 'admin', 2, '5.167.15.231', NULL, '[b]Changes[/b]\n\nAdded abandon boost (I made it for myself). If you want use this function need have 2 pc and 2 accounts on our forum (pm me if you want).', 0, 1531228556, NULL, NULL, 31, NULL),
(35, 'mulfix', 4, '91.199.93.129', NULL, 'p', 0, 1531298894, NULL, NULL, 31, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `reported_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `created` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message` text,
  `zapped` int(10) UNSIGNED DEFAULT NULL,
  `zapped_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `search_cache`
--

CREATE TABLE `search_cache` (
  `id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ident` varchar(200) NOT NULL DEFAULT '',
  `search_data` mediumtext
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `search_cache`
--

INSERT INTO `search_cache` (`id`, `ident`, `search_data`) VALUES
(2084948324, 'mulfix', 'a:6:{s:10:"search_ids";s:450:"a:33:{i:0;s:2:"34";i:1;s:2:"33";i:2;s:2:"32";i:3;s:2:"31";i:4;s:2:"30";i:5;s:2:"29";i:6;s:2:"28";i:7;s:2:"27";i:8;s:2:"26";i:9;s:2:"25";i:10;s:2:"24";i:11;s:2:"23";i:12;s:2:"22";i:13;s:2:"21";i:14;s:2:"19";i:15;s:2:"18";i:16;s:2:"17";i:17;s:2:"16";i:18;s:2:"15";i:19;s:2:"14";i:20;s:2:"13";i:21;s:2:"12";i:22;s:2:"11";i:23;s:2:"10";i:24;s:1:"9";i:25;s:1:"8";i:26;s:1:"7";i:27;s:1:"6";i:28;s:1:"5";i:29;s:1:"4";i:30;s:1:"3";i:31;s:1:"2";i:32;s:1:"1";}";s:8:"num_hits";i:33;s:7:"sort_by";i:0;s:8:"sort_dir";s:4:"DESC";s:7:"show_as";s:5:"posts";s:11:"search_type";a:3:{i:0;s:6:"action";i:1;s:15:"show_user_posts";i:2;i:2;}}');

-- --------------------------------------------------------

--
-- Структура таблицы `search_matches`
--

CREATE TABLE `search_matches` (
  `post_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `word_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subject_match` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `search_matches`
--

INSERT INTO `search_matches` (`post_id`, `word_id`, `subject_match`) VALUES
(1, 30, 0),
(1, 29, 0),
(1, 28, 0),
(1, 27, 0),
(1, 26, 0),
(1, 25, 0),
(1, 24, 0),
(1, 23, 0),
(1, 22, 0),
(1, 21, 0),
(1, 20, 0),
(1, 19, 0),
(1, 18, 0),
(1, 17, 0),
(1, 16, 0),
(1, 31, 0),
(1, 32, 0),
(1, 33, 0),
(1, 34, 0),
(1, 35, 0),
(1, 36, 0),
(1, 37, 0),
(1, 38, 0),
(1, 39, 0),
(1, 40, 0),
(1, 41, 0),
(1, 42, 0),
(1, 43, 0),
(1, 44, 0),
(1, 45, 0),
(1, 46, 0),
(1, 47, 0),
(1, 48, 0),
(1, 49, 0),
(1, 50, 0),
(1, 51, 0),
(1, 52, 0),
(1, 53, 0),
(1, 54, 0),
(1, 55, 0),
(1, 56, 0),
(1, 57, 0),
(1, 58, 0),
(1, 59, 0),
(1, 60, 0),
(1, 61, 0),
(1, 62, 0),
(1, 63, 0),
(1, 64, 0),
(1, 65, 0),
(1, 66, 0),
(1, 67, 0),
(1, 68, 0),
(1, 69, 0),
(1, 70, 0),
(1, 71, 0),
(1, 72, 0),
(1, 73, 0),
(1, 74, 0),
(1, 75, 0),
(1, 37, 1),
(2, 18, 0),
(2, 19, 0),
(2, 28, 0),
(2, 39, 0),
(2, 40, 0),
(2, 42, 0),
(2, 76, 0),
(2, 77, 0),
(2, 78, 0),
(2, 79, 0),
(2, 80, 0),
(2, 81, 0),
(2, 82, 0),
(2, 83, 0),
(2, 84, 0),
(2, 85, 0),
(2, 86, 0),
(2, 87, 0),
(2, 88, 0),
(2, 89, 0),
(2, 90, 0),
(2, 91, 0),
(2, 92, 0),
(2, 93, 0),
(2, 94, 0),
(2, 95, 0),
(2, 96, 0),
(2, 97, 0),
(2, 98, 0),
(2, 99, 0),
(2, 100, 0),
(2, 101, 0),
(2, 102, 0),
(2, 103, 0),
(2, 104, 0),
(2, 105, 0),
(2, 106, 0),
(2, 107, 0),
(2, 108, 0),
(2, 109, 0),
(2, 110, 0),
(2, 111, 0),
(2, 112, 0),
(2, 113, 0),
(2, 114, 0),
(2, 115, 0),
(2, 116, 0),
(2, 117, 0),
(2, 118, 0),
(2, 119, 0),
(2, 120, 0),
(2, 121, 0),
(2, 122, 0),
(2, 123, 0),
(2, 124, 0),
(2, 125, 0),
(2, 126, 0),
(2, 127, 0),
(2, 128, 0),
(2, 129, 0),
(2, 130, 0),
(2, 131, 0),
(2, 132, 0),
(2, 133, 0),
(2, 134, 0),
(2, 135, 0),
(2, 136, 0),
(2, 137, 0),
(2, 138, 0),
(2, 139, 0),
(2, 140, 0),
(2, 141, 0),
(2, 142, 0),
(2, 143, 0),
(2, 144, 0),
(2, 145, 0),
(2, 146, 0),
(2, 147, 0),
(2, 148, 0),
(2, 149, 0),
(2, 150, 0),
(2, 151, 0),
(2, 152, 0),
(2, 153, 0),
(2, 154, 0),
(2, 155, 0),
(2, 156, 0),
(2, 157, 0),
(2, 158, 0),
(2, 159, 0),
(2, 160, 0),
(2, 161, 0),
(2, 162, 0),
(2, 163, 0),
(2, 164, 0),
(2, 165, 0),
(2, 166, 0),
(2, 167, 0),
(2, 168, 0),
(2, 169, 0),
(2, 170, 0),
(2, 171, 0),
(2, 172, 0),
(2, 173, 0),
(2, 174, 0),
(2, 175, 0),
(2, 176, 0),
(2, 177, 0),
(2, 178, 0),
(2, 179, 0),
(2, 180, 0),
(2, 181, 0),
(2, 182, 0),
(2, 183, 0),
(2, 184, 0),
(2, 185, 0),
(2, 186, 0),
(2, 187, 0),
(2, 188, 0),
(2, 189, 0),
(2, 190, 0),
(2, 191, 0),
(2, 192, 0),
(2, 193, 0),
(2, 194, 0),
(2, 195, 0),
(2, 196, 0),
(2, 197, 0),
(2, 198, 0),
(2, 199, 0),
(2, 200, 0),
(2, 201, 0),
(2, 202, 0),
(2, 203, 0),
(2, 204, 0),
(2, 205, 0),
(2, 206, 0),
(2, 207, 0),
(2, 208, 0),
(2, 209, 0),
(2, 210, 0),
(2, 211, 0),
(2, 212, 0),
(2, 213, 0),
(2, 214, 0),
(2, 215, 0),
(2, 216, 0),
(2, 217, 0),
(2, 218, 0),
(2, 219, 0),
(2, 220, 0),
(2, 221, 0),
(2, 222, 0),
(2, 223, 0),
(2, 224, 0),
(2, 225, 0),
(2, 226, 0),
(2, 227, 0),
(2, 228, 0),
(2, 229, 0),
(2, 230, 0),
(2, 231, 0),
(2, 232, 0),
(2, 233, 0),
(2, 234, 0),
(2, 235, 0),
(2, 236, 0),
(2, 237, 0),
(2, 238, 0),
(2, 239, 0),
(2, 240, 0),
(2, 241, 0),
(2, 242, 0),
(2, 243, 0),
(2, 244, 0),
(2, 84, 1),
(2, 245, 1),
(3, 250, 0),
(3, 251, 0),
(3, 249, 0),
(3, 246, 0),
(3, 247, 0),
(3, 114, 0),
(3, 248, 0),
(3, 114, 1),
(4, 254, 0),
(4, 107, 0),
(4, 253, 0),
(4, 19, 0),
(4, 252, 0),
(4, 19, 1),
(4, 252, 1),
(5, 21, 0),
(5, 265, 0),
(5, 260, 0),
(5, 64, 0),
(5, 267, 0),
(5, 269, 0),
(5, 110, 0),
(5, 268, 0),
(5, 236, 0),
(5, 261, 0),
(5, 258, 0),
(5, 255, 0),
(5, 262, 0),
(5, 263, 0),
(5, 257, 0),
(5, 105, 0),
(5, 238, 0),
(5, 256, 0),
(5, 259, 0),
(5, 87, 0),
(5, 266, 0),
(5, 264, 0),
(5, 64, 1),
(6, 209, 0),
(17, 606, 0),
(6, 270, 0),
(6, 575, 0),
(6, 273, 1),
(7, 283, 0),
(7, 13, 0),
(7, 278, 0),
(7, 282, 0),
(7, 277, 0),
(7, 281, 0),
(7, 276, 0),
(7, 72, 0),
(7, 229, 0),
(7, 19, 0),
(7, 279, 0),
(7, 274, 0),
(7, 275, 0),
(7, 35, 0),
(7, 280, 0),
(7, 284, 1),
(8, 288, 0),
(8, 295, 0),
(8, 17, 0),
(8, 298, 0),
(8, 289, 0),
(8, 283, 0),
(8, 297, 0),
(8, 293, 0),
(8, 20, 0),
(8, 287, 0),
(8, 54, 0),
(8, 276, 0),
(8, 299, 0),
(8, 291, 0),
(8, 23, 0),
(8, 285, 0),
(8, 292, 0),
(8, 290, 0),
(8, 286, 0),
(8, 35, 0),
(8, 296, 0),
(8, 294, 0),
(8, 276, 1),
(8, 37, 1),
(9, 64, 0),
(9, 301, 0),
(9, 304, 0),
(9, 120, 0),
(9, 279, 0),
(9, 303, 0),
(9, 300, 0),
(9, 302, 0),
(9, 64, 1),
(9, 300, 1),
(10, 305, 0),
(10, 314, 0),
(10, 309, 0),
(10, 306, 0),
(10, 239, 0),
(10, 209, 0),
(10, 55, 0),
(10, 313, 0),
(10, 310, 0),
(10, 315, 0),
(10, 307, 0),
(10, 312, 0),
(10, 311, 0),
(10, 308, 0),
(10, 87, 0),
(10, 309, 1),
(10, 316, 1),
(22, 302, 1),
(22, 626, 1),
(22, 715, 1),
(22, 714, 1),
(22, 734, 0),
(11, 87, 0),
(22, 725, 0),
(22, 264, 0),
(11, 265, 0),
(22, 73, 0),
(22, 746, 0),
(11, 275, 0),
(22, 735, 0),
(11, 852, 0),
(22, 352, 0),
(22, 468, 0),
(22, 748, 0),
(22, 751, 0),
(22, 749, 0),
(22, 732, 0),
(22, 718, 0),
(22, 733, 0),
(11, 325, 0),
(22, 591, 0),
(11, 327, 0),
(11, 13, 0),
(22, 469, 0),
(21, 771, 0),
(22, 744, 0),
(22, 753, 0),
(22, 716, 0),
(22, 739, 0),
(21, 625, 0),
(22, 723, 0),
(22, 594, 0),
(22, 638, 0),
(22, 760, 0),
(22, 752, 0),
(22, 737, 0),
(22, 727, 0),
(22, 730, 0),
(22, 726, 0),
(22, 719, 0),
(22, 736, 0),
(22, 722, 0),
(22, 729, 0),
(22, 353, 0),
(22, 633, 0),
(22, 743, 0),
(22, 3, 0),
(22, 747, 0),
(11, 850, 0),
(22, 426, 0),
(22, 715, 0),
(22, 177, 0),
(11, 849, 0),
(22, 758, 0),
(22, 728, 0),
(22, 745, 0),
(22, 636, 0),
(22, 720, 0),
(22, 750, 0),
(11, 365, 0),
(22, 754, 0),
(22, 658, 0),
(22, 740, 0),
(22, 738, 0),
(22, 302, 0),
(22, 717, 0),
(22, 632, 0),
(22, 721, 0),
(11, 848, 0),
(22, 741, 0),
(22, 742, 0),
(11, 377, 0),
(22, 731, 0),
(21, 302, 0),
(21, 626, 0),
(21, 715, 0),
(21, 714, 0),
(21, 770, 0),
(11, 384, 0),
(11, 664, 0),
(11, 468, 0),
(11, 667, 0),
(11, 665, 0),
(11, 661, 0),
(11, 655, 0),
(11, 428, 0),
(11, 660, 0),
(11, 465, 0),
(11, 663, 0),
(11, 426, 0),
(11, 666, 0),
(11, 406, 0),
(11, 662, 0),
(11, 580, 0),
(11, 659, 0),
(11, 658, 0),
(11, 657, 0),
(11, 656, 0),
(11, 164, 0),
(11, 651, 0),
(11, 177, 0),
(11, 650, 0),
(11, 652, 0),
(11, 591, 0),
(11, 307, 0),
(11, 594, 0),
(11, 63, 0),
(11, 590, 0),
(11, 642, 0),
(11, 646, 0),
(11, 643, 0),
(11, 649, 0),
(11, 648, 0),
(11, 639, 0),
(11, 373, 0),
(11, 638, 0),
(11, 645, 0),
(11, 423, 0),
(11, 7, 0),
(11, 429, 0),
(11, 641, 0),
(11, 647, 0),
(11, 640, 0),
(11, 595, 0),
(11, 644, 0),
(11, 458, 0),
(11, 505, 0),
(11, 264, 0),
(11, 43, 0),
(19, 107, 0),
(11, 635, 0),
(11, 624, 0),
(11, 653, 0),
(11, 626, 0),
(11, 83, 0),
(11, 621, 0),
(11, 623, 0),
(11, 229, 0),
(11, 501, 0),
(11, 628, 0),
(11, 631, 0),
(11, 633, 0),
(11, 625, 0),
(11, 627, 0),
(11, 187, 0),
(11, 630, 0),
(11, 636, 0),
(11, 622, 0),
(11, 637, 0),
(11, 632, 0),
(11, 36, 0),
(11, 457, 0),
(11, 458, 1),
(11, 377, 1),
(12, 463, 0),
(12, 470, 0),
(12, 471, 0),
(12, 472, 0),
(12, 460, 0),
(12, 464, 0),
(12, 466, 0),
(12, 169, 0),
(12, 465, 0),
(12, 377, 0),
(12, 461, 0),
(12, 459, 0),
(12, 467, 0),
(12, 473, 0),
(12, 469, 0),
(12, 405, 0),
(12, 462, 0),
(12, 468, 0),
(12, 463, 1),
(12, 474, 1),
(13, 491, 0),
(13, 495, 0),
(13, 493, 0),
(13, 417, 0),
(13, 494, 0),
(13, 463, 0),
(13, 411, 0),
(13, 393, 0),
(13, 496, 0),
(13, 158, 0),
(13, 479, 0),
(13, 486, 0),
(13, 187, 0),
(13, 488, 0),
(13, 460, 0),
(13, 475, 0),
(13, 480, 0),
(13, 478, 0),
(13, 223, 0),
(13, 464, 0),
(13, 490, 0),
(13, 481, 0),
(13, 465, 0),
(13, 499, 0),
(13, 120, 0),
(13, 492, 0),
(13, 483, 0),
(13, 207, 0),
(13, 68, 0),
(13, 500, 0),
(13, 474, 0),
(13, 477, 0),
(13, 467, 0),
(13, 482, 0),
(13, 487, 0),
(13, 469, 0),
(13, 405, 0),
(13, 484, 0),
(13, 497, 0),
(13, 476, 0),
(13, 468, 0),
(13, 485, 0),
(13, 489, 0),
(13, 498, 0),
(13, 463, 1),
(13, 120, 1),
(13, 501, 1),
(13, 477, 1),
(13, 476, 1),
(14, 505, 0),
(14, 514, 0),
(14, 507, 0),
(14, 508, 0),
(14, 144, 0),
(14, 511, 0),
(14, 510, 0),
(14, 187, 0),
(14, 460, 0),
(14, 478, 0),
(14, 466, 0),
(14, 515, 0),
(14, 513, 0),
(14, 120, 0),
(14, 52, 0),
(14, 509, 0),
(14, 68, 0),
(14, 504, 0),
(14, 512, 0),
(14, 502, 0),
(14, 503, 0),
(14, 476, 0),
(14, 506, 0),
(14, 120, 1),
(14, 501, 1),
(14, 503, 1),
(14, 476, 1),
(15, 204, 0),
(15, 288, 0),
(15, 17, 0),
(15, 522, 0),
(15, 520, 0),
(15, 519, 0),
(15, 526, 0),
(15, 516, 0),
(15, 169, 0),
(15, 1, 0),
(15, 527, 0),
(15, 16, 0),
(15, 226, 0),
(15, 518, 0),
(15, 517, 0),
(15, 525, 0),
(15, 290, 0),
(15, 528, 0),
(15, 45, 0),
(15, 523, 0),
(15, 15, 0),
(15, 43, 0),
(15, 521, 0),
(15, 524, 0),
(15, 37, 1),
(21, 713, 0),
(21, 711, 0),
(21, 710, 0),
(21, 591, 0),
(21, 708, 0),
(21, 307, 0),
(21, 594, 0),
(21, 63, 0),
(16, 218, 0),
(21, 709, 0),
(21, 590, 0),
(21, 258, 0),
(21, 707, 0),
(21, 831, 0),
(21, 113, 0),
(21, 677, 0),
(21, 468, 0),
(21, 705, 0),
(21, 703, 0),
(21, 699, 0),
(21, 313, 0),
(21, 702, 0),
(21, 701, 0),
(21, 706, 0),
(21, 700, 0),
(21, 21, 0),
(21, 697, 0),
(21, 11, 0),
(21, 681, 0),
(21, 680, 0),
(21, 698, 0),
(21, 107, 0),
(21, 352, 1),
(21, 696, 1),
(21, 251, 1),
(21, 678, 0),
(21, 631, 0),
(21, 261, 0),
(21, 684, 0),
(21, 480, 0),
(21, 675, 0),
(21, 674, 0),
(21, 186, 0),
(11, 218, 0),
(11, 695, 0),
(11, 689, 0),
(11, 686, 0),
(11, 579, 0),
(11, 688, 0),
(11, 694, 0),
(11, 692, 0),
(11, 693, 0),
(11, 690, 0),
(11, 691, 0),
(19, 685, 0),
(19, 684, 0),
(19, 650, 0),
(19, 635, 0),
(19, 683, 0),
(19, 384, 0),
(19, 682, 0),
(19, 681, 0),
(19, 631, 0),
(19, 352, 1),
(19, 249, 1),
(19, 251, 1),
(19, 199, 0),
(19, 677, 0),
(19, 649, 0),
(19, 661, 0),
(19, 678, 0),
(19, 679, 0),
(19, 261, 0),
(19, 480, 0),
(19, 680, 0),
(19, 674, 0),
(19, 676, 0),
(16, 672, 0),
(16, 669, 0),
(16, 238, 0),
(16, 670, 0),
(16, 671, 0),
(16, 589, 0),
(16, 668, 0),
(19, 450, 0),
(16, 586, 1),
(16, 673, 1),
(16, 587, 1),
(6, 63, 0),
(6, 19, 0),
(18, 613, 0),
(6, 238, 0),
(6, 592, 0),
(6, 590, 0),
(6, 591, 0),
(17, 251, 0),
(17, 605, 0),
(17, 608, 0),
(17, 590, 0),
(17, 522, 0),
(17, 283, 0),
(17, 595, 0),
(17, 607, 0),
(17, 598, 0),
(17, 596, 0),
(17, 63, 0),
(17, 364, 0),
(17, 19, 0),
(17, 594, 0),
(17, 609, 0),
(17, 591, 0),
(17, 597, 0),
(17, 283, 1),
(17, 593, 1),
(18, 611, 0),
(18, 615, 0),
(18, 610, 0),
(18, 612, 0),
(18, 614, 0),
(18, 617, 1),
(18, 618, 1),
(18, 616, 1),
(18, 619, 0),
(18, 594, 0),
(18, 307, 0),
(18, 590, 0),
(18, 63, 0),
(18, 591, 0),
(18, 620, 1),
(22, 279, 0),
(21, 762, 0),
(22, 767, 0),
(22, 765, 0),
(22, 146, 0),
(22, 230, 0),
(22, 764, 0),
(22, 766, 0),
(22, 187, 0),
(22, 7, 0),
(22, 392, 0),
(22, 763, 0),
(22, 581, 0),
(22, 700, 0),
(22, 204, 0),
(22, 768, 0),
(22, 769, 0),
(21, 187, 0),
(21, 7, 0),
(24, 772, 0),
(24, 21, 0),
(24, 799, 0),
(21, 794, 0),
(24, 700, 0),
(21, 796, 0),
(24, 186, 0),
(24, 711, 0),
(22, 12, 0),
(22, 779, 0),
(22, 478, 0),
(23, 785, 0),
(22, 11, 0),
(23, 700, 0),
(23, 772, 0),
(23, 230, 0),
(23, 791, 0),
(23, 793, 0),
(23, 786, 0),
(23, 787, 0),
(23, 792, 0),
(23, 712, 0),
(23, 778, 0),
(23, 782, 0),
(23, 714, 0),
(23, 781, 0),
(23, 39, 0),
(23, 364, 0),
(23, 631, 0),
(23, 678, 0),
(23, 7, 0),
(23, 313, 0),
(23, 775, 0),
(23, 788, 0),
(23, 432, 0),
(23, 773, 0),
(23, 790, 0),
(23, 776, 0),
(23, 789, 0),
(23, 783, 0),
(23, 44, 0),
(23, 854, 0),
(23, 777, 0),
(23, 468, 0),
(23, 677, 0),
(23, 774, 0),
(23, 712, 1),
(23, 302, 1),
(24, 230, 0),
(24, 802, 0),
(24, 233, 0),
(24, 326, 0),
(24, 712, 0),
(24, 406, 0),
(24, 675, 0),
(24, 701, 0),
(24, 647, 0),
(24, 782, 0),
(24, 781, 0),
(24, 278, 0),
(24, 364, 0),
(24, 801, 0),
(24, 702, 0),
(24, 631, 0),
(24, 678, 0),
(24, 7, 0),
(24, 313, 0),
(24, 788, 0),
(24, 655, 0),
(24, 11, 0),
(24, 638, 0),
(24, 790, 0),
(24, 800, 0),
(24, 797, 0),
(24, 626, 0),
(24, 703, 0),
(24, 648, 0),
(24, 649, 0),
(24, 365, 0),
(24, 798, 0),
(24, 302, 0),
(24, 697, 0),
(24, 468, 0),
(24, 677, 0),
(24, 423, 1),
(24, 302, 1),
(23, 736, 0),
(23, 300, 0),
(23, 581, 0),
(25, 541, 0),
(25, 122, 0),
(25, 803, 0),
(25, 809, 0),
(25, 326, 0),
(25, 818, 0),
(25, 782, 0),
(25, 781, 0),
(25, 808, 0),
(25, 811, 0),
(25, 812, 0),
(25, 813, 0),
(25, 814, 0),
(25, 804, 0),
(25, 819, 0),
(25, 631, 0),
(25, 257, 0),
(25, 806, 0),
(25, 815, 0),
(25, 816, 0),
(25, 817, 0),
(25, 192, 0),
(25, 820, 0),
(25, 807, 0),
(25, 810, 0),
(25, 275, 0),
(25, 618, 0),
(25, 805, 0),
(25, 302, 0),
(25, 352, 0),
(25, 541, 1),
(25, 302, 1),
(25, 752, 0),
(25, 634, 0),
(25, 821, 0),
(25, 204, 0),
(25, 822, 0),
(25, 823, 0),
(25, 364, 0),
(25, 681, 0),
(25, 824, 0),
(25, 582, 0),
(25, 825, 0),
(23, 826, 0),
(23, 827, 0),
(22, 829, 0),
(22, 828, 0),
(21, 830, 0),
(26, 833, 0),
(26, 832, 0),
(26, 834, 1),
(26, 712, 1),
(23, 835, 0),
(23, 396, 0),
(23, 836, 0),
(27, 590, 0),
(27, 632, 0),
(27, 694, 0),
(27, 674, 0),
(27, 480, 0),
(27, 63, 0),
(27, 619, 0),
(27, 684, 0),
(27, 707, 0),
(27, 631, 0),
(27, 594, 0),
(27, 307, 0),
(27, 810, 0),
(27, 839, 0),
(27, 708, 0),
(27, 591, 0),
(27, 365, 0),
(27, 302, 0),
(27, 838, 0),
(27, 251, 1),
(27, 696, 1),
(27, 352, 1),
(27, 107, 0),
(27, 712, 0),
(27, 675, 0),
(27, 105, 0),
(27, 841, 0),
(27, 840, 0),
(27, 842, 0),
(27, 846, 0),
(27, 845, 0),
(27, 843, 0),
(27, 113, 0),
(27, 229, 0),
(27, 807, 0),
(27, 844, 0),
(27, 830, 0),
(11, 847, 0),
(11, 392, 0),
(11, 760, 0),
(11, 176, 0),
(11, 851, 0),
(11, 853, 0),
(28, 674, 0),
(28, 675, 0),
(28, 480, 0),
(28, 513, 0),
(28, 327, 0),
(28, 251, 1),
(28, 696, 1),
(28, 352, 1),
(28, 855, 0),
(28, 803, 0),
(28, 233, 0),
(28, 113, 0),
(28, 681, 0),
(28, 784, 0),
(28, 352, 0),
(28, 856, 0),
(28, 863, 0),
(28, 275, 0),
(28, 121, 0),
(28, 864, 0),
(28, 859, 0),
(28, 714, 0),
(28, 7, 0),
(28, 107, 0),
(28, 11, 0),
(28, 661, 0),
(28, 634, 0),
(28, 861, 0),
(28, 712, 0),
(28, 865, 0),
(28, 678, 0),
(28, 270, 0),
(28, 860, 0),
(28, 261, 0),
(28, 230, 0),
(28, 776, 0),
(28, 39, 0),
(28, 40, 0),
(29, 674, 0),
(29, 480, 0),
(29, 631, 0),
(29, 860, 0),
(29, 251, 1),
(29, 696, 1),
(29, 352, 1),
(29, 357, 0),
(29, 261, 0),
(29, 862, 0),
(29, 678, 0),
(29, 866, 0),
(29, 199, 0),
(30, 590, 0),
(30, 63, 0),
(30, 261, 0),
(30, 678, 0),
(30, 594, 0),
(30, 591, 0),
(30, 15, 0),
(30, 867, 0),
(30, 762, 0),
(31, 869, 0),
(31, 480, 0),
(31, 868, 0),
(32, 883, 0),
(32, 884, 0),
(32, 693, 0),
(32, 711, 0),
(32, 21, 0),
(32, 700, 0),
(32, 590, 0),
(32, 888, 0),
(32, 632, 0),
(32, 505, 0),
(32, 450, 0),
(32, 772, 0),
(32, 186, 0),
(32, 881, 0),
(32, 706, 0),
(32, 803, 0),
(32, 874, 0),
(32, 580, 0),
(32, 809, 0),
(32, 877, 0),
(32, 326, 0),
(32, 406, 0),
(32, 701, 0),
(32, 782, 0),
(32, 781, 0),
(32, 39, 0),
(32, 478, 0),
(32, 63, 0),
(32, 873, 0),
(32, 261, 0),
(32, 878, 0),
(32, 801, 0),
(32, 702, 0),
(32, 679, 0),
(32, 862, 0),
(32, 631, 0),
(32, 678, 0),
(32, 313, 0),
(32, 872, 0),
(32, 871, 0),
(32, 310, 0),
(32, 11, 0),
(32, 661, 0),
(32, 760, 0),
(32, 594, 0),
(32, 68, 0),
(32, 790, 0),
(32, 875, 0),
(32, 44, 0),
(32, 784, 0),
(32, 703, 0),
(32, 705, 0),
(32, 591, 0),
(32, 886, 0),
(32, 649, 0),
(32, 365, 0),
(32, 876, 0),
(32, 468, 0),
(32, 870, 0),
(32, 352, 0),
(32, 867, 0),
(32, 838, 0),
(32, 634, 0),
(32, 762, 0),
(32, 677, 0),
(32, 774, 0),
(32, 879, 0),
(32, 820, 1),
(32, 302, 1),
(33, 107, 0),
(33, 590, 0),
(33, 632, 0),
(33, 674, 0),
(33, 595, 0),
(33, 480, 0),
(33, 63, 0),
(33, 796, 0),
(33, 862, 0),
(33, 678, 0),
(33, 695, 0),
(33, 594, 0),
(33, 794, 0),
(33, 591, 0),
(33, 348, 0),
(33, 762, 0),
(33, 251, 1),
(33, 696, 1),
(33, 352, 1),
(32, 303, 0),
(32, 889, 0),
(32, 105, 0),
(32, 887, 0),
(32, 279, 0),
(32, 302, 0),
(32, 751, 0),
(32, 686, 0),
(32, 890, 0),
(34, 891, 0),
(34, 700, 0),
(34, 107, 0),
(34, 541, 0),
(34, 674, 0),
(34, 13, 0),
(34, 892, 0),
(34, 120, 0),
(34, 251, 1),
(34, 696, 1),
(34, 352, 1),
(34, 893, 0),
(34, 894, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `search_words`
--

CREATE TABLE `search_words` (
  `id` int(10) UNSIGNED NOT NULL,
  `word` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `search_words`
--

INSERT INTO `search_words` (`id`, `word`) VALUES
(1, 'looking'),
(2, 'guess'),
(3, 'install'),
(4, 'fluxbb'),
(5, 'appears'),
(6, 'worked'),
(7, 'log'),
(8, 'head'),
(9, 'administration'),
(10, 'control'),
(11, 'panel'),
(12, 'configure'),
(13, 'forum'),
(14, 'test'),
(15, 'topic'),
(16, 'permanently'),
(17, 'banned'),
(18, 'refund'),
(19, 'payment'),
(20, 'fraud'),
(21, 'account'),
(22, 'sharing'),
(23, 'malicious'),
(24, 'activity'),
(25, 'intent'),
(26, 'undermine'),
(27, 'skeet'),
(28, 'including'),
(29, 'limited'),
(30, 'dumping'),
(31, 'reverse'),
(32, 'engineering'),
(33, 'exploiting'),
(34, 'inviting'),
(35, 'someone'),
(36, 'already'),
(37, 'rules'),
(38, 'cases'),
(39, 'first'),
(40, 'time'),
(41, 'offenders'),
(42, 'receive'),
(43, 'warning'),
(44, 'second'),
(45, 'temporary'),
(46, 'ban'),
(47, 'third'),
(48, 'strike'),
(49, 'result'),
(50, 'permanent'),
(51, 'misleading'),
(52, 'others'),
(53, 'promises'),
(54, 'invitation'),
(55, 'code'),
(56, 'taking'),
(57, 'part'),
(58, 'doxxing'),
(59, 'ddos'),
(60, 'inexcusable'),
(61, 'behavior'),
(62, 'harassing'),
(63, 'forums'),
(64, 'discord'),
(65, 'tolerated'),
(66, 'includes'),
(67, 'racism'),
(68, 'post'),
(69, 'purpose'),
(70, 'insult'),
(71, 'soliciting'),
(72, 'invites'),
(73, 'via'),
(74, 'private'),
(75, 'messages'),
(76, 'whenever'),
(77, 'send'),
(78, 'bitcoins'),
(79, 'transaction'),
(80, 'goes'),
(81, 'different'),
(82, 'computers'),
(83, 'running'),
(84, 'bitcoin'),
(85, 'protocol'),
(86, 'world'),
(87, 'sure'),
(88, 'valid'),
(89, 'verified'),
(90, 'waits'),
(91, 'inside'),
(92, 'mempool'),
(93, 'sort'),
(94, 'limbo'),
(95, 'state'),
(96, 'waiting'),
(97, 'picked'),
(98, 'miner'),
(99, 'entered'),
(100, 'block'),
(101, 'blockchain'),
(102, 'considered'),
(103, 'unconfirmed'),
(104, 'pending'),
(105, 'new'),
(106, 'transactions'),
(107, 'added'),
(108, 'minutes'),
(109, 'average'),
(110, 'however'),
(111, 'since'),
(112, 'lately'),
(113, 'due'),
(114, 'price'),
(115, 'increase'),
(116, 'hold'),
(117, 'finite'),
(118, 'amount'),
(119, 'instantly'),
(120, 'need'),
(121, 'wait'),
(122, 'certain'),
(123, 'decided'),
(124, 'pick'),
(125, 'sitting'),
(126, 'included'),
(127, 'receives'),
(128, 'confirmation'),
(129, 'longer'),
(130, 'btc'),
(131, 'says'),
(132, 'cancelled'),
(133, 'sent'),
(134, 'proper'),
(135, 'processor'),
(136, 'gamesense'),
(137, 'cancel'),
(138, 'receiver'),
(139, 'wasn\'t'),
(140, 'confirmed'),
(141, 'minute'),
(142, 'limit'),
(143, 'refunded'),
(144, 'automatically'),
(145, 'enter'),
(146, 'address'),
(147, 'e-mail'),
(148, 'instructions'),
(149, 'received'),
(150, 'patient'),
(151, 'hours'),
(152, 'details'),
(153, 'date'),
(154, 'timezone'),
(155, 'next'),
(156, 'adding'),
(157, 'big'),
(158, 'enough'),
(159, 'mining'),
(160, 'fee'),
(161, 'ways'),
(162, 'miners'),
(163, 'paid'),
(164, 'work'),
(165, 'collecting'),
(166, 'fees'),
(167, 'naturally'),
(168, 'prefer'),
(169, 'include'),
(170, 'highest'),
(171, 'high'),
(172, 'faster'),
(173, 'tell'),
(174, 'right'),
(175, 'calculated'),
(176, 'size'),
(177, 'file'),
(178, 'depends'),
(179, 'factors'),
(180, 'won\'t'),
(181, 'moment'),
(182, 'fastest'),
(183, 'cheapest'),
(184, 'currently'),
(185, 'satoshis'),
(186, 'byte'),
(187, 'example'),
(188, '257'),
(189, 'bytes'),
(190, 'pay'),
(191, '420'),
(192, 'order'),
(193, 'probably'),
(194, 'asking'),
(195, 'calculate'),
(196, 'least'),
(197, 'extensive'),
(198, 'knowledge'),
(199, 'works'),
(200, 'wallet'),
(201, 'supposed'),
(202, 'wallets'),
(203, 'today'),
(204, 'add'),
(205, 'required'),
(206, 'soon'),
(207, 'possible'),
(208, 'let'),
(209, 'choose'),
(210, 'variety'),
(211, 'according'),
(212, 'requested'),
(213, 'fast'),
(214, 'medium'),
(215, 'slow'),
(216, 'able'),
(217, 'manually'),
(218, 'try'),
(219, 'using'),
(220, 'bitcoinfees'),
(221, 'earn'),
(222, 'website'),
(223, 'good'),
(224, 'choosing'),
(225, 'determine'),
(226, 'provider'),
(227, 'earn\'s'),
(228, 'stats'),
(229, 'page'),
(230, 'change'),
(231, 'currency'),
(232, 'smallest'),
(233, 'delay'),
(234, 'shortest'),
(235, 'duration'),
(236, 'imgur'),
(237, 'dyfx5lq'),
(238, 'png'),
(239, 'case'),
(240, '0000018'),
(241, 'per'),
(242, 'ideal'),
(243, '226'),
(244, '0004068'),
(245, 'faq'),
(246, 'lowered'),
(247, 'month'),
(248, 'starting'),
(249, 'june'),
(250, '13th'),
(251, '2018'),
(252, 'plans'),
(253, 'days'),
(254, '365'),
(255, 'kicked'),
(256, 'recently'),
(257, 'member'),
(258, 'joining'),
(259, 'simple'),
(260, 'clicking'),
(261, 'join'),
(262, 'logged'),
(263, 'main'),
(264, 'web'),
(265, 'browser'),
(266, 'trouble'),
(267, 'finding'),
(268, 'hyperlink'),
(269, 'gpuoztb'),
(270, 'option'),
(271, 'creditcard'),
(272, 'qiwi'),
(273, 'payments'),
(274, 'registration'),
(275, 'set'),
(276, 'invite'),
(277, 'given'),
(278, 'found'),
(279, 'premium'),
(280, 'wants'),
(281, 'hack'),
(282, 'give'),
(283, 'codes'),
(284, 'invitations'),
(285, 'meant'),
(286, 'shared'),
(287, 'friends'),
(288, 'anyone'),
(289, 'caught'),
(290, 'selling'),
(291, 'keep'),
(292, 'mind'),
(293, 'essentially'),
(294, 'vouching'),
(295, 'anything'),
(296, 'such'),
(297, 'credit'),
(298, 'card'),
(299, 'inviter'),
(300, 'reset'),
(301, 'goto'),
(302, 'tab'),
(303, 'request'),
(304, 'hwid'),
(305, '2fa'),
(306, 'available'),
(307, 'profile'),
(308, 'selecting'),
(309, 'authentication'),
(310, 'optional'),
(311, 'save'),
(312, 'recovery'),
(313, 'lose'),
(314, 'access'),
(315, 'phone'),
(316, 'factor'),
(317, 'antivirus'),
(318, 'vendors'),
(319, 'perform'),
(320, 'intensive'),
(321, 'real-time'),
(322, 'monitoring'),
(323, 'sandboxing'),
(324, 'interfere'),
(325, 'client'),
(326, 'disable'),
(327, 'windows'),
(328, 'defender'),
(329, 'whitelisting'),
(330, 'closed'),
(331, 'drivers'),
(332, 'unloaded'),
(333, 're-open'),
(334, 'loading'),
(335, 'cheat'),
(336, 'known'),
(337, 'incompatible'),
(338, 'trend'),
(339, 'micro'),
(340, 'f-secure'),
(341, 'malwarebytes'),
(342, 'error'),
(343, 'produced'),
(344, 'd0001600'),
(345, 'd0002001'),
(346, 'c0000022'),
(347, 'unsupported'),
(348, 'version'),
(349, 'newer'),
(350, 'older'),
(351, 'versions'),
(352, 'update'),
(353, 'latest'),
(354, '14393'),
(355, 'restart'),
(356, 'computer'),
(357, 'again'),
(358, 'c0000077'),
(359, 'd0002103'),
(360, 'anti-cheat'),
(361, 'particularly'),
(362, 'battleye'),
(363, 'protect'),
(364, 'game'),
(365, 'steam'),
(366, 'processes'),
(367, 'lead'),
(368, 'problems'),
(369, 'd0001418'),
(370, 'overlays'),
(371, 'party'),
(372, 'tools'),
(373, 'program'),
(374, 'interferes'),
(375, 'rendering'),
(376, 'cause'),
(377, 'issues'),
(378, 'software'),
(379, 'fraps'),
(380, 'sweetfx'),
(381, 'overlay'),
(382, 'nzxt'),
(383, 'cam'),
(384, 'crash'),
(385, 'virtual'),
(386, 'machine'),
(387, 'supported'),
(388, 'poweronplatforms'),
(389, 'hyper-v'),
(390, 'opening'),
(391, 'happens'),
(392, 'open'),
(393, 'enabling'),
(394, 'uac'),
(395, 'restarting'),
(396, 'default'),
(397, 'setting'),
(398, 'notch'),
(399, 'top'),
(400, 'menu'),
(401, 'shows'),
(402, 'solid'),
(403, 'black'),
(404, 'rectangle'),
(405, 'settings'),
(406, 'enable'),
(407, 'multi'),
(408, 'core'),
(409, 'displaying'),
(410, 'flickering'),
(411, 'enabled'),
(412, 'check'),
(413, 'both'),
(414, 'places'),
(415, 'preferences'),
(416, 'in-game'),
(417, 'box'),
(418, 'while'),
(419, 'right-click'),
(420, 'library'),
(421, 'select'),
(422, 'properties'),
(423, 'general'),
(424, 'nvidia'),
(425, 'manage'),
(426, 'following'),
(427, 'options'),
(428, 'match'),
(429, 'global'),
(430, 'antialiasing'),
(431, 'fxaa'),
(432, 'mode'),
(433, 'multi-frame'),
(434, 'sampled'),
(435, 'mfaa'),
(436, 'shader'),
(437, 'cache'),
(438, 'texture'),
(439, 'filtering'),
(440, 'anisotropic'),
(441, 'sample'),
(442, 'optimization'),
(443, 'negative'),
(444, 'lod'),
(445, 'bias'),
(446, 'allow'),
(447, 'quality'),
(448, 'trilinear'),
(449, 'threaded'),
(450, 'auto'),
(451, 'triple'),
(452, 'buffering'),
(453, 'vertical'),
(454, 'sync'),
(455, 'application'),
(456, 'conflicting'),
(457, 'still'),
(458, 'common'),
(459, 'mention'),
(460, 'feature'),
(461, 'list'),
(462, 'things'),
(463, 'bug'),
(464, 'happened'),
(465, 'information'),
(466, 'help'),
(467, 'reproduce'),
(468, 'type'),
(469, 'server'),
(470, 'casual'),
(471, 'community'),
(472, 'deathmatch'),
(473, 'screenshots'),
(474, 'report'),
(475, 'feel'),
(476, 'thread'),
(477, 'reports'),
(478, 'format'),
(479, 'ensures'),
(480, 'fixed'),
(481, 'helps'),
(482, 'reproducing'),
(483, 'nospread'),
(484, 'spread'),
(485, 'valve'),
(486, 'etc'),
(487, 'screenshot'),
(488, 'export'),
(489, 'video'),
(490, 'happening'),
(491, 'always'),
(492, 'needed'),
(493, 'bounding'),
(494, 'boxes'),
(495, 'appear'),
(496, 'enemys'),
(497, 'teammates'),
(498, 'visuals'),
(499, 'misc'),
(500, 'rage'),
(501, 'own'),
(502, 'suggestion'),
(503, 'suggestions'),
(504, 'prioritized'),
(505, 'admin'),
(506, 'useful'),
(507, 'aimbot'),
(508, 'aiming'),
(509, 'players'),
(510, 'ensuring'),
(511, 'edge'),
(512, 'situation'),
(513, 'mouse'),
(514, 'aim'),
(515, 'lack'),
(516, 'illegal'),
(517, 'scamming'),
(518, 'related'),
(519, 'dumps'),
(520, 'configs'),
(521, 'wtb'),
(522, 'buy'),
(523, 'title'),
(524, 'wts'),
(525, 'sell'),
(526, 'future'),
(527, 'official'),
(528, 'tags'),
(529, 'strive'),
(530, 'maintain'),
(531, 'fps'),
(532, '64-tick'),
(533, '128'),
(534, '128-tick'),
(535, 'performance'),
(536, 'resource'),
(537, 'listed'),
(538, 'causes'),
(539, 'drops'),
(540, 'accuracy'),
(541, 'boost'),
(542, 'avoid'),
(543, 'maximum'),
(544, 'targeting'),
(545, 'hitbox'),
(546, 'selection'),
(547, 'unnecessary'),
(548, 'hitboxes'),
(549, 'arms'),
(550, 'legs'),
(551, 'maybe'),
(552, 'chest'),
(553, 'biggest'),
(554, 'impact'),
(555, 'best'),
(556, 'hit'),
(557, 'chance'),
(558, 'cost'),
(559, 'lot'),
(560, 'cycle'),
(561, 'multi-point'),
(562, 'multipoint'),
(563, 'low'),
(564, 'non-aimbot'),
(565, 'tips'),
(566, 'player'),
(567, 'models'),
(568, 'expensive'),
(569, 'terms'),
(570, 'model'),
(571, 'culling'),
(572, 'disables'),
(573, 'occlusion'),
(574, 'noticeable'),
(575, 'another'),
(576, 'playing'),
(577, 'person'),
(578, 'launch'),
(579, 'novid'),
(580, 'console'),
(581, 'variables'),
(582, 'remove'),
(583, 'foot'),
(584, 'shadows'),
(585, 'contact'),
(586, 'getting'),
(587, 'read'),
(588, 'systems'),
(589, 'images'),
(590, 'afkboost'),
(591, 'space'),
(592, 'methods'),
(593, 'promo'),
(594, 'php'),
(595, 'csgo'),
(596, 'extend'),
(597, 'subscription'),
(598, 'expires'),
(599, '2019'),
(600, 'a9231e2b3a694f06'),
(601, '7ccc6df2e2a34851'),
(602, '5194f64c28034de2'),
(603, 'e9e0d062bf7a41d6'),
(604, '60ac5ae245bc4156'),
(605, '9af3c113a12e4248'),
(606, '655b818f061d4beb'),
(607, '5211fa1e358848fa'),
(608, 'promotional'),
(609, 'discount'),
(610, 'userapi'),
(611, 'c844722'),
(612, 'v844722228'),
(613, '8da6d'),
(614, 'xtjaubdogrw'),
(615, 'jpg'),
(616, 'wins'),
(617, 'rankup'),
(618, 'smfc'),
(619, 'hyperpeak'),
(620, '1hour'),
(621, 'random'),
(622, 'crashes'),
(623, 'paths'),
(624, 'slashes'),
(625, 'instead'),
(626, 'sandboxie'),
(627, 'ini'),
(628, 'opened'),
(629, 'sandixie'),
(630, 'effect'),
(631, 'lobbies'),
(632, 'api'),
(633, 'key'),
(634, 'value'),
(635, 'steamcommunity'),
(636, 'dev'),
(637, 'apikey'),
(638, 'path'),
(639, 'sandbox'),
(640, 'drive'),
(641, 'files'),
(642, 'x86'),
(643, 'steamapps'),
(644, 'counter-strike'),
(645, 'offensive'),
(646, 'txt'),
(647, 'exe'),
(648, 'sndbx'),
(649, 'start'),
(650, 'configuration'),
(651, 'run'),
(652, 'administrator'),
(653, 'sandoxie'),
(654, 'afk'),
(655, 'output'),
(656, 'autoexec'),
(657, 'cfg'),
(658, 'command'),
(659, 'con'),
(660, 'logfile'),
(661, 'parse'),
(662, 'developer'),
(663, 'hide'),
(664, 'useless'),
(665, 'screen'),
(666, 'filter'),
(667, 'text'),
(668, 'henrypp'),
(669, 'product'),
(670, 'memreduct'),
(671, 'mem'),
(672, 'reduct'),
(673, 'laggs'),
(674, 'changes'),
(675, 'events'),
(676, 'background'),
(677, 'win'),
(678, 'lobby'),
(679, 'link'),
(680, 'event'),
(681, 'logs'),
(682, 'avatar'),
(683, 'loaded'),
(684, 'improved'),
(685, 'system'),
(686, 'parameters'),
(687, 'exaple'),
(688, 'login'),
(689, 'window'),
(690, '640'),
(691, '480'),
(692, 'applaunch'),
(693, '730'),
(694, 'avatars'),
(695, 'old'),
(696, 'july'),
(697, 'topmost'),
(698, 'combobox'),
(699, 'number'),
(700, 'accounts'),
(701, 'except'),
(702, 'leaders'),
(703, 'selected'),
(704, 'checkbox'),
(705, 'single'),
(706, 'checkboxes'),
(707, 'issue'),
(708, 'reported'),
(709, 'blackdragon'),
(710, 'suggested'),
(711, 'accept'),
(712, 'disconnects'),
(713, 'beta'),
(714, 'extra'),
(715, 'fix'),
(716, 'preparation'),
(717, 'apt-get'),
(718, 'sudo'),
(719, 'nano'),
(720, 'crontab'),
(721, 'apache2'),
(722, 'libapache2-mod-php'),
(723, 'php-mcrypt'),
(724, 'php-mysql'),
(725, 'wget'),
(726, 'no-check-certificate'),
(727, 'nodejs'),
(728, 'dist'),
(729, 'latest-v8'),
(730, 'node-v8'),
(731, '3-linux-x64'),
(732, 'tar'),
(733, 'strip-components'),
(734, 'xzvf'),
(735, 'usr'),
(736, 'local'),
(737, 'npm'),
(738, 'coffee-script'),
(739, 'pm2'),
(740, 'coffeescript'),
(741, '32bit'),
(742, '3-linux-x86'),
(743, 'installation'),
(744, 'put'),
(745, 'directory'),
(746, 'var'),
(747, 'html'),
(748, 'total'),
(749, 'task'),
(750, 'cron'),
(751, 'token'),
(752, 'null'),
(753, 'public'),
(754, 'config'),
(755, 'google'),
(756, 'view'),
(757, 'usp'),
(758, 'download'),
(759, 'arcive'),
(760, 'password'),
(761, '2ocwkquo'),
(762, 'viewtopic'),
(763, 'pswd'),
(764, 'dedicated'),
(765, 'addr'),
(766, 'domain'),
(767, '127'),
(768, 'coffee'),
(769, 'user'),
(770, 'auto-disconnects'),
(771, 'bot'),
(772, 'button'),
(773, 'play'),
(774, 'wingman'),
(775, 'matchmaking'),
(776, 'prime'),
(777, 'switch'),
(778, 'ends'),
(779, 'field'),
(780, 'myweb'),
(781, 'features'),
(782, 'explain'),
(783, 'reconnect'),
(784, 'seconds'),
(785, '1st'),
(786, 'disc'),
(787, 'disconnect'),
(788, 'milliseconds'),
(789, 'recnnct'),
(790, 'press'),
(791, 'contains'),
(792, 'disconnecting'),
(793, 'creating'),
(794, 'pid'),
(795, 'p23'),
(796, 'info'),
(797, 'queue'),
(798, 'stop'),
(799, 'aka'),
(800, 'pressing'),
(801, 'leader'),
(802, 'considering'),
(803, 'checking'),
(804, 'last'),
(805, 'steam64'),
(806, 'member\'s'),
(807, 'rank'),
(808, 'games'),
(809, 'count'),
(810, 'ranks'),
(811, 'gn1'),
(812, 'gn2'),
(813, 'gn3'),
(814, 'gn4'),
(815, 'mg1'),
(816, 'mg2'),
(817, 'mg3'),
(818, 'dmg'),
(819, 'lem'),
(820, 'manager'),
(821, 'completed'),
(822, 'clear'),
(823, 'clogs'),
(824, 'purge'),
(825, 'status'),
(826, '60000'),
(827, '75000'),
(828, 'folder'),
(829, 'exits'),
(830, 'updates'),
(831, 'position'),
(832, 'youtube'),
(833, '2qzdcrrgrwy'),
(834, 'demo'),
(835, '5000'),
(836, 'recommended'),
(837, '12000'),
(838, 'username'),
(839, 'register'),
(840, 'updating'),
(841, 'clearing'),
(842, 'loader'),
(843, 'double-click'),
(844, 'steamid64'),
(845, 'copies'),
(846, 'clipboard'),
(847, 'incorrect'),
(848, 'form'),
(849, 'displayed'),
(850, 'correctly'),
(851, 'unpack'),
(852, 'archive'),
(853, 'winrar'),
(854, '10000'),
(855, 'changed'),
(856, 'pos'),
(857, '200ms'),
(858, '800'),
(859, 'click'),
(860, 'panorama'),
(861, 'create'),
(862, 'links'),
(863, '100ms'),
(864, '100'),
(865, 'autojoin'),
(866, 'parsing'),
(867, 'updated'),
(868, 'flick'),
(869, 'authorizing'),
(870, 'unbind'),
(871, 'mouse1'),
(872, 'members'),
(873, 'full'),
(874, 'close'),
(875, 'search'),
(876, 'textbox'),
(877, 'created'),
(878, 'joinlobby'),
(879, 'xxx'),
(880, 'signle'),
(881, 'char'),
(882, 'answer'),
(883, '109775245053844894'),
(884, '109775245053845602'),
(885, 'argument'),
(886, 'split'),
(887, 'parameter'),
(888, 'response'),
(889, 'line'),
(890, 'url'),
(891, 'abandon'),
(892, 'function'),
(893, 'made'),
(894, 'myself');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id` int(10) UNSIGNED NOT NULL,
  `poster` varchar(200) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `posted` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `first_post_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_post` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_post_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_poster` varchar(200) DEFAULT NULL,
  `num_views` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `num_replies` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `moved_to` int(10) UNSIGNED DEFAULT NULL,
  `forum_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `poll_type` tinyint(4) NOT NULL DEFAULT '0',
  `poll_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `poll_term` tinyint(4) NOT NULL DEFAULT '0',
  `poll_kol` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id`, `poster`, `subject`, `posted`, `first_post_id`, `last_post`, `last_post_id`, `last_poster`, `num_views`, `num_replies`, `closed`, `sticky`, `moved_to`, `forum_id`, `poll_type`, `poll_time`, `poll_term`, `poll_kol`) VALUES
(1, 'admin', 'Rules', 1528779714, 1, 1528779714, 1, 'admin', 22, 0, 1, 1, NULL, 1, 0, 0, 0, 0),
(2, 'admin', 'Bitcoin FAQ', 1528877016, 2, 1528877016, 2, 'admin', 8, 0, 1, 1, NULL, 1, 0, 0, 0, 0),
(3, 'admin', 'Price', 1528877148, 3, 1528877148, 3, 'admin', 6, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(4, 'admin', 'Payment plans', 1528877197, 4, 1528877197, 4, 'admin', 4, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(5, 'admin', 'Discord', 1528877344, 5, 1528877344, 5, 'admin', 7, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(6, 'admin', 'Payments', 1528877417, 6, 1528877417, 6, 'admin', 17, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(7, 'admin', 'Invitations', 1528877455, 7, 1528877455, 7, 'admin', 8, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(8, 'admin', 'Invite rules', 1528877492, 8, 1528877492, 8, 'admin', 8, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(9, 'admin', 'Discord ID reset', 1528877525, 9, 1528877525, 9, 'admin', 10, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(10, 'admin', 'Two factor authentication', 1528877622, 10, 1528877622, 10, 'admin', 11, 0, 0, 0, NULL, 1, 0, 0, 0, 0),
(11, 'admin', 'Common issues', 1528877879, 11, 1528877879, 11, 'admin', 71, 0, 1, 1, NULL, 5, 0, 0, 0, 0),
(12, 'admin', 'How to report a bug', 1528877959, 12, 1528877959, 12, 'admin', 7, 0, 0, 1, NULL, 5, 0, 0, 0, 0),
(13, 'admin', 'Bug reports that don\'t need their own thread', 1528878014, 13, 1528878014, 13, 'admin', 4, 0, 0, 1, NULL, 5, 0, 0, 0, 0),
(14, 'admin', 'Suggestions that don\'t need their own thread', 1528878048, 14, 1528878048, 14, 'admin', 10, 0, 0, 1, NULL, 5, 0, 0, 0, 0),
(15, 'admin', 'Rules', 1528878074, 15, 1528878074, 15, 'admin', 12, 0, 1, 1, NULL, 6, 0, 0, 0, 0),
(16, 'admin', 'Getting laggs? Read this', 1528878340, 16, 1528878340, 16, 'admin', 27, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(17, 'admin', 'Promo codes', 1530138748, 17, 1530138748, 17, 'admin', 19, 0, 0, 0, NULL, 2, 0, 0, 0, 0),
(18, 'admin', '10 wins (~1hour) for rankup LE->SMFC', 1530139510, 18, 1530139510, 18, 'admin', 15, 0, 0, 0, NULL, 3, 0, 0, 0, 0),
(19, 'admin', 'Update (June 30, 2018)', 1530319247, 19, 1530354587, 20, 'mulfix', 30, 1, 0, 0, NULL, 4, 0, 0, 0, 0),
(20, 'admin', 'Update (July 1, 2018)', 1530408664, 21, 1530408664, 21, 'admin', 62, 0, 0, 0, NULL, 4, 0, 0, 0, 0),
(21, 'admin', 'Extra tab / Sandboxie fix', 1530435949, 22, 1530435949, 22, 'admin', 59, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(22, 'admin', 'Disconnects tab', 1530438220, 23, 1530438220, 23, 'admin', 32, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(23, 'admin', 'General tab', 1530439512, 24, 1530439512, 24, 'admin', 15, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(24, 'admin', 'Boost tab', 1530439854, 25, 1530439854, 25, 'admin', 27, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(25, 'admin', 'Disconnects demo', 1530452262, 26, 1530452262, 26, 'admin', 58, 0, 0, 0, NULL, 3, 0, 0, 0, 0),
(26, 'admin', 'Update (July 2, 2018)', 1530492486, 27, 1530492486, 27, 'admin', 30, 0, 0, 0, NULL, 4, 1, 0, 0, 3),
(27, 'admin', 'Update (July 6, 2018)', 1530855910, 28, 1530940387, 30, 'admin', 31, 1, 0, 0, NULL, 4, 0, 0, 0, 0),
(28, 'admin', 'Update (July 7, 2018)', 1530937262, 29, 1530970226, 31, 'admin', 17, 1, 0, 0, NULL, 4, 0, 0, 0, 0),
(29, 'admin', 'Manager tab', 1531037004, 32, 1531037004, 32, 'admin', 57, 0, 1, 1, NULL, 4, 0, 0, 0, 0),
(30, 'admin', 'Update (July 8, 2018)', 1531037143, 33, 1531037143, 33, 'admin', 11, 0, 0, 0, NULL, 4, 0, 0, 0, 0),
(31, 'admin', 'Update (July 10, 2018)', 1531228556, 34, 1531298894, 35, 'mulfix', 8, 1, 0, 0, NULL, 4, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `topic_subscriptions`
--

CREATE TABLE `topic_subscriptions` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `game` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `updates`
--

INSERT INTO `updates` (`id`, `game`, `updated`) VALUES
(1, 'csgo', '2018-06-21 16:47:54'),
(2, 'csgo_beta', '2018-07-09 09:42:49');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '3',
  `username` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `title` varchar(50) DEFAULT NULL,
  `realname` varchar(40) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `jabber` varchar(80) DEFAULT NULL,
  `icq` varchar(12) DEFAULT NULL,
  `msn` varchar(80) DEFAULT NULL,
  `aim` varchar(30) DEFAULT NULL,
  `yahoo` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  `signature` text,
  `disp_topics` tinyint(3) UNSIGNED DEFAULT NULL,
  `disp_posts` tinyint(3) UNSIGNED DEFAULT NULL,
  `email_setting` tinyint(1) NOT NULL DEFAULT '1',
  `notify_with_post` tinyint(1) NOT NULL DEFAULT '0',
  `auto_notify` tinyint(1) NOT NULL DEFAULT '0',
  `show_smilies` tinyint(1) NOT NULL DEFAULT '1',
  `show_img` tinyint(1) NOT NULL DEFAULT '1',
  `show_img_sig` tinyint(1) NOT NULL DEFAULT '1',
  `show_avatars` tinyint(1) NOT NULL DEFAULT '1',
  `show_sig` tinyint(1) NOT NULL DEFAULT '1',
  `timezone` float NOT NULL DEFAULT '0',
  `dst` tinyint(1) NOT NULL DEFAULT '0',
  `time_format` tinyint(1) NOT NULL DEFAULT '0',
  `date_format` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(25) NOT NULL DEFAULT 'English',
  `style` varchar(25) NOT NULL DEFAULT 'Cobalt',
  `num_posts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_post` int(10) UNSIGNED DEFAULT NULL,
  `last_search` int(10) UNSIGNED DEFAULT NULL,
  `last_email_sent` int(10) UNSIGNED DEFAULT NULL,
  `last_report_sent` int(10) UNSIGNED DEFAULT NULL,
  `registered` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `registration_ip` varchar(39) NOT NULL DEFAULT '0.0.0.0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `admin_note` varchar(30) DEFAULT NULL,
  `activate_string` varchar(80) DEFAULT NULL,
  `activate_key` varchar(8) DEFAULT NULL,
  `messages_enable` tinyint(1) NOT NULL DEFAULT '1',
  `messages_email` tinyint(1) NOT NULL DEFAULT '0',
  `messages_flag` tinyint(1) NOT NULL DEFAULT '0',
  `messages_new` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `messages_all` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pmsn_last_post` int(10) UNSIGNED DEFAULT NULL,
  `csgo` datetime DEFAULT NULL,
  `discord` text,
  `hwid` text,
  `discord_reason` text,
  `hwid_reason` text,
  `hwid_ip` text,
  `hwid_ip_new` text,
  `discord_ip` text,
  `discord_ip_new` text,
  `discord_new` text,
  `hwid_new` text,
  `img_key` text,
  `ga` text,
  `ga_enabled` varchar(1) NOT NULL DEFAULT '0',
  `by` int(11) DEFAULT NULL,
  `used_version` decimal(10,1) DEFAULT NULL,
  `nopass` varchar(255) DEFAULT NULL,
  `nopass_new` varchar(255) DEFAULT NULL,
  `win` varchar(32) DEFAULT NULL,
  `lose` varchar(32) DEFAULT NULL,
  `lastauth` datetime DEFAULT NULL,
  `token` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `versions`
--

CREATE TABLE `versions` (
  `id` int(11) NOT NULL,
  `name` text,
  `version` decimal(10,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `versions`
--

INSERT INTO `versions` (`id`, `name`, `version`) VALUES
(1, 'loader', '0.7'),
(2, 'csgo', '0.0');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ajax_chat_messages`
--
ALTER TABLE `ajax_chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bans_username_idx` (`username`(25));

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `censoring`
--
ALTER TABLE `censoring`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Индексы таблицы `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`conf_name`);

--
-- Индексы таблицы `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forum_perms`
--
ALTER TABLE `forum_perms`
  ADD PRIMARY KEY (`group_id`,`forum_id`);

--
-- Индексы таблицы `forum_subscriptions`
--
ALTER TABLE `forum_subscriptions`
  ADD PRIMARY KEY (`user_id`,`forum_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`g_id`);

--
-- Индексы таблицы `online`
--
ALTER TABLE `online`
  ADD UNIQUE KEY `online_user_id_ident_idx` (`user_id`,`ident`(25)),
  ADD KEY `online_ident_idx` (`ident`(25)),
  ADD KEY `online_logged_idx` (`logged`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pms_new_block`
--
ALTER TABLE `pms_new_block`
  ADD KEY `pms_new_block_bl_id_idx` (`bl_id`),
  ADD KEY `pms_new_block_bl_user_id_idx` (`bl_user_id`);

--
-- Индексы таблицы `pms_new_posts`
--
ALTER TABLE `pms_new_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pms_new_posts_topic_id_idx` (`topic_id`),
  ADD KEY `pms_new_posts_multi_idx` (`poster_id`,`topic_id`);

--
-- Индексы таблицы `pms_new_topics`
--
ALTER TABLE `pms_new_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pms_new_topics_multi_idx_st` (`starter_id`,`topic_st`),
  ADD KEY `pms_new_topics_multi_idx_to` (`to_id`,`topic_to`);

--
-- Индексы таблицы `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`tid`,`question`,`field`);

--
-- Индексы таблицы `poll_voted`
--
ALTER TABLE `poll_voted`
  ADD PRIMARY KEY (`tid`,`uid`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_topic_id_idx` (`topic_id`),
  ADD KEY `posts_multi_idx` (`poster_id`,`topic_id`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_zapped_idx` (`zapped`);

--
-- Индексы таблицы `search_cache`
--
ALTER TABLE `search_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_cache_ident_idx` (`ident`(8));

--
-- Индексы таблицы `search_matches`
--
ALTER TABLE `search_matches`
  ADD KEY `search_matches_word_id_idx` (`word_id`),
  ADD KEY `search_matches_post_id_idx` (`post_id`);

--
-- Индексы таблицы `search_words`
--
ALTER TABLE `search_words`
  ADD PRIMARY KEY (`word`),
  ADD KEY `search_words_id_idx` (`id`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topics_forum_id_idx` (`forum_id`),
  ADD KEY `topics_moved_to_idx` (`moved_to`),
  ADD KEY `topics_last_post_idx` (`last_post`),
  ADD KEY `topics_first_post_id_idx` (`first_post_id`);

--
-- Индексы таблицы `topic_subscriptions`
--
ALTER TABLE `topic_subscriptions`
  ADD PRIMARY KEY (`user_id`,`topic_id`);

--
-- Индексы таблицы `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_idx` (`username`(25)),
  ADD KEY `users_registered_idx` (`registered`);

--
-- Индексы таблицы `versions`
--
ALTER TABLE `versions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ajax_chat_messages`
--
ALTER TABLE `ajax_chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `censoring`
--
ALTER TABLE `censoring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `forums`
--
ALTER TABLE `forums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `g_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pms_new_posts`
--
ALTER TABLE `pms_new_posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `pms_new_topics`
--
ALTER TABLE `pms_new_topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `search_words`
--
ALTER TABLE `search_words`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=895;
--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT для таблицы `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `versions`
--
ALTER TABLE `versions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
