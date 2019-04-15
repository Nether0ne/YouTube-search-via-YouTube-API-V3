-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 15 2019 г., 19:55
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
(1, 'queen', '2019-04-15', 'ktYlzVYQbwY', 'Queen - Live AID 1985 Full Concert (Best Version) (HD)', '2017-11-15', 'https://i.ytimg.com/vi/ktYlzVYQbwY/default.jpg'),
(2, 'queen', '2019-04-15', 'f4Mc-NYPHaQ', 'Queen - I Want To Break Free (Official Video)', '2008-09-01', 'https://i.ytimg.com/vi/f4Mc-NYPHaQ/default.jpg'),
(3, 'queen', '2019-04-15', 'fJ9rUzIMcZQ', 'Queen - Bohemian Rhapsody (Official Video)', '2008-08-01', 'https://i.ytimg.com/vi/fJ9rUzIMcZQ/default.jpg'),
(4, 'queen', '2019-04-15', 't99KH0TR-J4', 'Queen - The Show Must Go On (Official Video)', '2013-10-15', 'https://i.ytimg.com/vi/t99KH0TR-J4/default.jpg'),
(5, 'queen', '2019-04-15', '_Uu12zY01ts', 'Queen - Greatest Hits (1) [1 hour long]', '2015-12-14', 'https://i.ytimg.com/vi/_Uu12zY01ts/default.jpg'),
(31, 'avenged sevenfold', '2019-04-15', 'XptslJml1do', 'AVENGED SEVENFOLD - Nightmare', '2010-08-05', 'https://https://i.ytimg.com/vi/XptslJml1do/default.jpg'),
(32, 'avenged sevenfold', '2019-04-15', 'DelhLppPSxY', 'Avenged Sevenfold - Hail To The King [Official Music Video]', '2013-08-16', 'https://https://i.ytimg.com/vi/DelhLppPSxY/default.jpg'),
(33, 'avenged sevenfold', '2019-04-15', 'HIRNdveLnJI', 'Avenged Sevenfold - Afterlife (Official Music Video)', '2008-03-12', 'https://https://i.ytimg.com/vi/HIRNdveLnJI/default.jpg'),
(34, 'avenged sevenfold', '2019-04-15', 'fBYVlFXsEME', 'Avenged Sevenfold - The Stage', '2016-10-13', 'https://https://i.ytimg.com/vi/fBYVlFXsEME/default.jpg'),
(35, 'avenged sevenfold', '2019-04-15', 'KVjBCT2Lc94', 'Avenged Sevenfold - A Little Piece Of Heaven (Video)', '2009-10-27', 'https://https://i.ytimg.com/vi/KVjBCT2Lc94/default.jpg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id запроса', AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
