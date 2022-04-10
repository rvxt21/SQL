-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 10 2022 г., 19:33
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `library`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_category` smallint(3) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`) VALUES
(10, 'C&C++'),
(7, 'Linux'),
(1, 'n/m'),
(11, 'SQL'),
(8, 'Unix'),
(6, 'Windows 2000'),
(5, 'Інші книги'),
(9, 'Інші операційні системи'),
(3, 'Апаратні засоби ПК'),
(4, 'Захист і безпека ПК'),
(2, 'Підручники');

-- --------------------------------------------------------

--
-- Структура таблицы `formats`
--

CREATE TABLE `formats` (
  `id_format` smallint(2) NOT NULL,
  `format_name` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `formats`
--

INSERT INTO `formats` (`id_format`, `format_name`) VALUES
(7, '60x84/16'),
(6, '60x9016'),
(4, '60х88/16'),
(2, '70х100/16'),
(5, '84x100/16'),
(3, '84х108/16'),
(1, 'n/m');

-- --------------------------------------------------------

--
-- Структура таблицы `newbook`
--

CREATE TABLE `newbook` (
  `id_book` int(20) NOT NULL,
  `code_book` int(10) NOT NULL DEFAULT 0,
  `is_new` varchar(3) NOT NULL DEFAULT 'No',
  `name_book` varchar(50) NOT NULL DEFAULT ' ',
  `price_book` float(5,2) NOT NULL,
  `publisher` smallint(2) NOT NULL DEFAULT 0,
  `pages` int(11) DEFAULT NULL,
  `book_format` smallint(2) DEFAULT NULL,
  `date_book` date DEFAULT NULL,
  `tirage` int(11) DEFAULT NULL,
  `book_topic` smallint(3) DEFAULT NULL,
  `category` smallint(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `newbook`
--

INSERT INTO `newbook` (`id_book`, `code_book`, `is_new`, `name_book`, `price_book`, `publisher`, `pages`, `book_format`, `date_book`, `tirage`, `book_topic`, `category`) VALUES
(2, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 2, 400, 2, '2000-07-24', 5000, 1, 2),
(8, 4985, 'No', 'Засвой самостійно модернізацію та ремонт ПК за 24 ', 18.90, 3, 288, 2, '2000-07-07', 5000, 1, 2),
(9, 5141, 'No', 'Структури даних та алгоритми', 37.80, 3, 384, 2, '2000-09-29', 5000, 1, 2),
(20, 5127, 'Yes', 'Автоматизація інженерно-графічних робіт', 11.58, 4, 256, 2, '2000-06-15', 5000, 1, 2),
(31, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 2, 400, 2, '2000-07-24', 5000, 1, 3),
(46, 5199, 'No', 'Залізо IBM 2001', 30.07, 5, 368, 2, '2000-02-12', 5000, 1, 3),
(50, 3851, 'Yes', 'Захист інформації та безпека комп`ютерних систем', 26.00, 6, 480, 3, NULL, 5000, 1, 4),
(58, 3932, 'No', 'Як перетворити персональний комп`ютер на вимірювал', 7.65, 7, 144, 4, '1999-09-06', 5000, 1, 5),
(59, 4713, 'No', 'Plug-ins. Додаткові програми для музичних програм', 11.41, 7, 144, 2, '2000-02-22', 5000, 1, 5),
(175, 5217, 'No', 'Windows МЕ. Найновіші версії програм', 16.57, 8, 320, 2, '2000-08-25', 5000, 2, 6),
(176, 4829, 'No', 'Windows 2000 Professional крок за кроком з CD', 27.25, 9, 320, 2, '2000-04-28', 5000, 2, 6),
(188, 5170, 'No', 'Linux версії', 24.43, 7, 346, 2, '2000-09-29', 5000, 2, 7),
(191, 860, 'No', 'Операційна система UNIX', 3.50, 2, 395, 5, '1997-05-05', 5000, 2, 8),
(203, 44, 'No', 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 6, 352, 4, '1996-03-20', 5000, 2, 9),
(206, 5176, 'No', 'Windows Ме. Супутник користувача', 12.79, 10, 306, 1, '2000-10-10', 5000, 2, 9),
(209, 5462, 'No', 'Мова програмування С++. Лекції та вправи', 29.00, 6, 656, 3, '2000-12-12', 5000, 3, 10),
(210, 4982, 'No', 'Мова програмування С. Лекції та вправи', 29.00, 6, 432, 3, '2000-12-07', 5000, 3, 10),
(220, 4687, 'No', 'Ефективне використання C++ .50 рекомендацій щодо п', 17.60, 7, 240, 2, '2000-03-02', 5000, 3, 10),
(222, 235, 'No', 'Інформаційні системи і структури даних', 0.00, 11, 418, 6, NULL, 100, 1, 11),
(225, 8746, 'YES', 'Бази даних в інформаційних системах', 0.00, 12, 418, 7, '2018-07-25', 500, 3, 5),
(226, 2154, 'Yes', 'Сервер на основі операційної системи FreeBSD 6.1', 0.00, 12, 216, 7, '2015-11-03', 500, 3, 11),
(245, 2662, 'No', 'Організація баз даних та знань', 0.00, 13, 208, 6, '2001-10-10', 1000, 3, 11),
(247, 5641, 'Yes', 'Організація баз даних та знань', 0.00, 10, 384, 2, '2021-12-15', 5000, 3, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `publishers`
--

CREATE TABLE `publishers` (
  `id_publisher` smallint(2) NOT NULL,
  `publisher_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `publishers`
--

INSERT INTO `publishers` (`id_publisher`, `publisher_name`) VALUES
(2, 'BHV С.-Петербург'),
(6, 'DiaSoft'),
(1, 'n/m'),
(13, 'Вінниця: ВДТУ'),
(10, 'Видавнича група BHV'),
(3, 'Вильямс'),
(7, 'ДМК'),
(11, 'Києво-Могилянська ак'),
(5, 'МикроАрт'),
(4, 'Питер'),
(8, 'Триумф'),
(12, 'Університет `Україна'),
(9, 'Эком');

-- --------------------------------------------------------

--
-- Структура таблицы `topics`
--

CREATE TABLE `topics` (
  `id_topic` smallint(3) NOT NULL,
  `topic_name` varchar(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `topics`
--

INSERT INTO `topics` (`id_topic`, `topic_name`) VALUES
(1, 'Використання ПК в цілому'),
(2, 'Операційні системи'),
(3, 'Програмування');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Индексы таблицы `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`id_format`),
  ADD UNIQUE KEY `format_name` (`format_name`);

--
-- Индексы таблицы `newbook`
--
ALTER TABLE `newbook`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `publisher` (`publisher`),
  ADD KEY `book_format` (`book_format`),
  ADD KEY `book_topic` (`book_topic`),
  ADD KEY `category` (`category`),
  ADD KEY `idx_title` (`name_book`);

--
-- Индексы таблицы `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id_publisher`),
  ADD UNIQUE KEY `publisher_name` (`publisher_name`);

--
-- Индексы таблицы `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id_topic`),
  ADD UNIQUE KEY `topic_name` (`topic_name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `formats`
--
ALTER TABLE `formats`
  MODIFY `id_format` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id_publisher` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `topics`
--
ALTER TABLE `topics`
  MODIFY `id_topic` smallint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `newbook`
--
ALTER TABLE `newbook`
  ADD CONSTRAINT `newbook_ibfk_1` FOREIGN KEY (`publisher`) REFERENCES `publishers` (`id_publisher`),
  ADD CONSTRAINT `newbook_ibfk_2` FOREIGN KEY (`book_format`) REFERENCES `formats` (`id_format`),
  ADD CONSTRAINT `newbook_ibfk_3` FOREIGN KEY (`book_topic`) REFERENCES `topics` (`id_topic`),
  ADD CONSTRAINT `newbook_ibfk_4` FOREIGN KEY (`category`) REFERENCES `categories` (`id_category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
