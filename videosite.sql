-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 22 2019 г., 17:11
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
(1, 'ktYlzVYQbwY'),
(2, 'f4Mc-NYPHaQ');

-- --------------------------------------------------------

--
-- Структура таблицы `lasttestreg_liked`
--

CREATE TABLE `lasttestreg_liked` (
  `id` int(11) NOT NULL,
  `videoid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'queen', '2019-04-20', 'ktYlzVYQbwY', 'Queen - Live AID 1985 Full Concert (Best Version) (HD)', '2017-11-15', 'https://i.ytimg.com/vi/ktYlzVYQbwY/default.jpg'),
(2, 'queen', '2019-04-20', 'f4Mc-NYPHaQ', 'Queen - I Want To Break Free (Official Video)', '2008-09-01', 'https://i.ytimg.com/vi/f4Mc-NYPHaQ/default.jpg'),
(3, 'queen', '2019-04-20', 'fJ9rUzIMcZQ', 'Queen - Bohemian Rhapsody (Official Video)', '2008-08-01', 'https://i.ytimg.com/vi/fJ9rUzIMcZQ/default.jpg'),
(4, 'queen', '2019-04-20', 't99KH0TR-J4', 'Queen - The Show Must Go On (Official Video)', '2013-10-15', 'https://i.ytimg.com/vi/t99KH0TR-J4/default.jpg'),
(5, 'queen', '2019-04-20', '_Uu12zY01ts', 'Queen - Greatest Hits (1) [1 hour long]', '2015-12-14', 'https://i.ytimg.com/vi/_Uu12zY01ts/default.jpg'),
(6, 'avenged sevenfold', '2019-04-20', '94bGzWyHbu0', 'Avenged Sevenfold - Nightmare [Official Music Video]', '2010-07-18', 'https://i.ytimg.com/vi/94bGzWyHbu0/default.jpg'),
(7, 'avenged sevenfold', '2019-04-20', 'DelhLppPSxY', 'Avenged Sevenfold - Hail To The King [Official Music Video]', '2013-08-16', 'https://i.ytimg.com/vi/DelhLppPSxY/default.jpg'),
(8, 'avenged sevenfold', '2019-04-20', 'fBYVlFXsEME', 'Avenged Sevenfold - The Stage', '2016-10-13', 'https://i.ytimg.com/vi/fBYVlFXsEME/default.jpg'),
(9, 'avenged sevenfold', '2019-04-20', 'HIRNdveLnJI', 'Avenged Sevenfold - Afterlife (Official Music Video)', '2008-03-12', 'https://i.ytimg.com/vi/HIRNdveLnJI/default.jpg'),
(10, 'avenged sevenfold', '2019-04-20', 'KVjBCT2Lc94', 'Avenged Sevenfold - A Little Piece Of Heaven (Video)', '2009-10-27', 'https://i.ytimg.com/vi/KVjBCT2Lc94/default.jpg'),
(11, 'muse', '2019-04-20', 'w8KQmps-Sog', 'Muse - Uprising [Official Video]', '2009-10-09', 'https://i.ytimg.com/vi/w8KQmps-Sog/default.jpg'),
(12, 'muse', '2019-04-20', 'X8f5RgwY8CI', 'MUSE - Algorithm [Official Music Video]', '2018-11-09', 'https://i.ytimg.com/vi/X8f5RgwY8CI/default.jpg'),
(13, 'muse', '2019-04-20', 'UqLRqzTp6Rk', 'Muse - Psycho [Official Lyric Video]', '2015-03-12', 'https://i.ytimg.com/vi/UqLRqzTp6Rk/default.jpg'),
(14, 'muse', '2019-04-20', 'h2eKImKZviw', 'MUSE - Pressure [Official Music Video]', '2018-09-27', 'https://i.ytimg.com/vi/h2eKImKZviw/default.jpg'),
(15, 'muse', '2019-04-20', 'QQ_3S-IQm38', 'MUSE - Thought Contagion [Official Music Video]', '2018-02-15', 'https://i.ytimg.com/vi/QQ_3S-IQm38/default.jpg'),
(16, 'queens of the stone age', '2019-04-20', 'DcHKOC64KnE', 'Queens Of The Stone Age - Go With The Flow', '2009-10-05', 'https://i.ytimg.com/vi/DcHKOC64KnE/default.jpg'),
(17, 'queens of the stone age', '2019-04-20', 's88r_q7oufE', 'Queens Of The Stone Age - No One Knows', '2009-10-07', 'https://i.ytimg.com/vi/s88r_q7oufE/default.jpg'),
(18, 'queens of the stone age', '2019-04-20', 'hg14Ocs03xA', 'Queens Of The Stone Age – Make It Wit Chu (Virgin Magnetic Material Remix)', '2015-03-06', 'https://i.ytimg.com/vi/hg14Ocs03xA/default.jpg'),
(19, 'queens of the stone age', '2019-04-20', 'hGRqnNEOpe0', 'Queens Of The Stone Age - Little Sister', '2009-10-07', 'https://i.ytimg.com/vi/hGRqnNEOpe0/default.jpg'),
(20, 'queens of the stone age', '2019-04-20', '69e8oa85F3g', 'Queens Of The Stone Age - In My Head', '2009-10-07', 'https://i.ytimg.com/vi/69e8oa85F3g/default.jpg'),
(21, 'system of a down', '2019-04-22', 'CSvFpBOe8eY', 'System Of A Down - Chop Suey!', '2009-10-03', 'https://i.ytimg.com/vi/CSvFpBOe8eY/default.jpg'),
(22, 'system of a down', '2019-04-22', 'iywaBOMvYLI', 'System Of A Down - Toxicity', '2009-10-02', 'https://i.ytimg.com/vi/iywaBOMvYLI/default.jpg'),
(23, 'system of a down', '2019-04-22', 'L-iepu3EtyE', 'System Of A Down - Aerials', '2009-10-03', 'https://i.ytimg.com/vi/L-iepu3EtyE/default.jpg'),
(24, 'system of a down', '2019-04-22', 'zUzd9KyIDrM', 'System Of A Down - B.Y.O.B. (Video)', '2009-10-03', 'https://i.ytimg.com/vi/zUzd9KyIDrM/default.jpg'),
(25, 'system of a down', '2019-04-22', 'DnGdoEa1tPg', 'System Of A Down - Lonely Day (Video)', '2009-10-03', 'https://i.ytimg.com/vi/DnGdoEa1tPg/default.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `testUser_liked`
--

CREATE TABLE `testUser_liked` (
  `id` int(11) NOT NULL,
  `videoid` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `testUser_liked`
--

INSERT INTO `testUser_liked` (`id`, `videoid`) VALUES
(2, 'f4Mc-NYPHaQ'),
(3, 'fJ9rUzIMcZQ'),
(4, 't99KH0TR-J4'),
(5, '_Uu12zY01ts'),
(7, 'X8f5RgwY8CI'),
(8, 'UqLRqzTp6Rk'),
(9, 'h2eKImKZviw'),
(10, 'QQ_3S-IQm38'),
(11, '94bGzWyHbu0'),
(12, 'DelhLppPSxY'),
(13, 'fBYVlFXsEME'),
(14, 'HIRNdveLnJI'),
(15, 'KVjBCT2Lc94'),
(16, 'CSvFpBOe8eY'),
(17, 'iywaBOMvYLI'),
(18, 'L-iepu3EtyE'),
(19, 'zUzd9KyIDrM'),
(20, 'DnGdoEa1tPg'),
(21, 'DcHKOC64KnE'),
(22, 's88r_q7oufE'),
(23, 'hg14Ocs03xA'),
(24, 'hGRqnNEOpe0'),
(25, '69e8oa85F3g'),
(26, 'ktYlzVYQbwY'),
(28, 'w8KQmps-Sog');

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
(2, 'testUser', '12345'),
(3, 'lasttestreg', '1');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_liked`
--
ALTER TABLE `admin_liked`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `lasttestreg_liked`
--
ALTER TABLE `lasttestreg_liked`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `testUser_liked`
--
ALTER TABLE `testUser_liked`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `lasttestreg_liked`
--
ALTER TABLE `lasttestreg_liked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id запроса', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `testUser_liked`
--
ALTER TABLE `testUser_liked`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
