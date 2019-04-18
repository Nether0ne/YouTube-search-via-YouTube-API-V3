-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 18 2019 г., 20:46
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `videosite`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_liked`
--

CREATE TABLE `admin_liked` (
  `id` int(11) NOT NULL,
  `videoid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `admin_liked`
--

INSERT INTO `admin_liked` (`id`, `videoid`) VALUES
(4, 'XptslJml1do'),
(5, 'HIRNdveLnJI'),
(6, 'fBYVlFXsEME');

-- --------------------------------------------------------

--
-- Структура таблицы `search`
--

CREATE TABLE `search` (
  `id` int(11) NOT NULL COMMENT 'id запроса',
  `query` text NOT NULL,
  `date` date NOT NULL COMMENT 'дата данного запроса',
  `videoid` text NOT NULL COMMENT 'id видео',
  `title` text NOT NULL COMMENT 'название видео',
  `published` date NOT NULL COMMENT 'дата публикации видео',
  `img` text NOT NULL COMMENT 'ссылка на превью видео'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `search`
--

INSERT INTO `search` (`id`, `query`, `date`, `videoid`, `title`, `published`, `img`) VALUES
(1, 'queen', '2019-04-18', 'ktYlzVYQbwY', 'Queen - Live AID 1985 Full Concert (Best Version) (HD)', '2017-11-15', 'https://i.ytimg.com/vi/ktYlzVYQbwY/default.jpg'),
(2, 'queen', '2019-04-18', 'f4Mc-NYPHaQ', 'Queen - I Want To Break Free (Official Video)', '2008-09-01', 'https://i.ytimg.com/vi/f4Mc-NYPHaQ/default.jpg'),
(3, 'queen', '2019-04-18', 'fJ9rUzIMcZQ', 'Queen - Bohemian Rhapsody (Official Video)', '2008-08-01', 'https://i.ytimg.com/vi/fJ9rUzIMcZQ/default.jpg'),
(4, 'queen', '2019-04-18', 'NVIbCvfkO3E', 'Queen - Another One Bites The Dust (Live)', '2017-01-24', 'https://i.ytimg.com/vi/NVIbCvfkO3E/default.jpg'),
(5, 'queen', '2019-04-18', 't99KH0TR-J4', 'Queen - The Show Must Go On (Official Video)', '2013-10-15', 'https://i.ytimg.com/vi/t99KH0TR-J4/default.jpg'),
(6, 'muse', '2019-04-18', 'w8KQmps-Sog', 'Muse - Uprising [Official Video]', '2009-10-09', 'https://i.ytimg.com/vi/w8KQmps-Sog/default.jpg'),
(7, 'muse', '2019-04-18', 'X8f5RgwY8CI', 'MUSE - Algorithm [Official Music Video]', '2018-11-09', 'https://i.ytimg.com/vi/X8f5RgwY8CI/default.jpg'),
(8, 'muse', '2019-04-18', 'UqLRqzTp6Rk', 'Muse - Psycho [Official Lyric Video]', '2015-03-12', 'https://i.ytimg.com/vi/UqLRqzTp6Rk/default.jpg'),
(9, 'muse', '2019-04-18', 'QQ_3S-IQm38', 'MUSE - Thought Contagion [Official Music Video]', '2018-02-15', 'https://i.ytimg.com/vi/QQ_3S-IQm38/default.jpg'),
(10, 'muse', '2019-04-18', 'h2eKImKZviw', 'MUSE - Pressure [Official Music Video]', '2018-09-27', 'https://i.ytimg.com/vi/h2eKImKZviw/default.jpg'),
(11, 'avenged sevenfold', '2019-04-18', '94bGzWyHbu0', 'Avenged Sevenfold - Nightmare [Official Music Video]', '2010-07-18', 'https://i.ytimg.com/vi/94bGzWyHbu0/default.jpg'),
(12, 'avenged sevenfold', '2019-04-18', 'DelhLppPSxY', 'Avenged Sevenfold - Hail To The King [Official Music Video]', '2013-08-16', 'https://i.ytimg.com/vi/DelhLppPSxY/default.jpg'),
(13, 'avenged sevenfold', '2019-04-18', 'HIRNdveLnJI', 'Avenged Sevenfold - Afterlife (Official Music Video)', '2008-03-12', 'https://i.ytimg.com/vi/HIRNdveLnJI/default.jpg'),
(14, 'avenged sevenfold', '2019-04-18', 'fBYVlFXsEME', 'Avenged Sevenfold - The Stage', '2016-10-13', 'https://i.ytimg.com/vi/fBYVlFXsEME/default.jpg'),
(15, 'avenged sevenfold', '2019-04-18', 'A7ry4cx6HfY', 'Avenged Sevenfold - So Far Away [Official Music Video]', '2011-05-06', 'https://i.ytimg.com/vi/A7ry4cx6HfY/default.jpg'),
(16, 'radiohead', '2019-04-18', 'XFkzRNyygfk', 'Radiohead - Creep', '2008-07-18', 'https://i.ytimg.com/vi/XFkzRNyygfk/default.jpg'),
(17, 'radiohead', '2019-04-18', 'u5CVsCnxyXg', 'Radiohead - No Surprises', '2009-04-22', 'https://i.ytimg.com/vi/u5CVsCnxyXg/default.jpg'),
(18, 'radiohead', '2019-04-18', '1uYWYWPc9HU', 'Radiohead - Karma Police', '2015-01-23', 'https://i.ytimg.com/vi/1uYWYWPc9HU/default.jpg'),
(19, 'radiohead', '2019-04-18', 'TTAU7lLDZYU', 'Radiohead - Daydreaming', '2016-05-06', 'https://i.ytimg.com/vi/TTAU7lLDZYU/default.jpg'),
(20, 'radiohead', '2019-04-18', 'LCJblaUkkfc', 'Radiohead - Street Spirit (Fade Out)', '2015-01-23', 'https://i.ytimg.com/vi/LCJblaUkkfc/default.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `testuser_liked`
--

CREATE TABLE `testuser_liked` (
  `id` int(11) NOT NULL,
  `videoid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `testuser_liked`
--

INSERT INTO `testuser_liked` (`id`, `videoid`) VALUES
(1, 'ktYlzVYQbwY'),
(2, 'f4Mc-NYPHaQ'),
(3, 'fJ9rUzIMcZQ'),
(4, 't99KH0TR-J4'),
(5, 'h2eKImKZviw'),
(6, 'UqLRqzTp6Rk'),
(7, 'TPE9uSFFxrI');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `login`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'testuser', '1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_liked`
--
ALTER TABLE `admin_liked`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `testuser_liked`
--
ALTER TABLE `testuser_liked`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_liked`
--
ALTER TABLE `admin_liked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id запроса', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `testuser_liked`
--
ALTER TABLE `testuser_liked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
