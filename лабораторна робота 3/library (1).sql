-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 14 2022 г., 18:45
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
-- Структура таблицы `book`
--

CREATE TABLE `book` (
  `id_book` int(20) NOT NULL,
  `code_book` int(10) NOT NULL DEFAULT 0,
  `is_new` varchar(3) NOT NULL DEFAULT 'No',
  `name_book` varchar(50) NOT NULL DEFAULT '',
  `price_book` float(5,2) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `pages` int(11) DEFAULT NULL,
  `book_format` varchar(10) DEFAULT NULL,
  `date_book` date DEFAULT NULL,
  `tirage` int(11) DEFAULT NULL,
  `book_topic` varchar(15) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `book`
--

INSERT INTO `book` (`id_book`, `code_book`, `is_new`, `name_book`, `price_book`, `publisher`, `pages`, `book_format`, `date_book`, `tirage`, `book_topic`, `category`) VALUES
(1, 452, 'Yes', 'Математична статистика та теорія ймовірностей', 14.00, 'Україна', NULL, NULL, '2022-03-14', NULL, NULL, NULL),
(2, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 'BHV С.-Петербург', 400, '70x100/16', '2000-07-24', 5000, 'Використання ПК', 'Підручники'),
(8, 4985, 'No', 'Засвой самостійно модернізацію та ремонт ПК за 24 ', 18.90, 'Вильямс', 288, '70x100/16', '2000-07-07', 5000, 'Використання ПК', 'Підручники'),
(9, 5141, 'No', 'Структури даних та алгоритми', 37.80, 'Вильямс', 384, '70x100/16', '2000-09-29', 5000, 'Використання ПК', 'Підручники'),
(20, 5127, 'Yes', 'Автоматизація інженерно-графічних робіт', 11.58, 'Питер', 256, '70x100/16', '2000-06-15', 5000, 'Використання ПК', 'Підручники'),
(31, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 'BNV С.-Петербург', 400, '70x100/16', '2000-07-24', 5000, 'Використання ПК', 'Апаратні засоби ПК'),
(46, 5199, 'No', 'Залізо IBM 2001', 30.07, 'МикроАрт', 368, '70x100/16', '2000-02-12', 5000, '5000', 'Апаратні засоби ПК'),
(50, 3851, 'Yes', 'Захист інформації та безпека комп`ютерних систем', 26.00, 'DiaSoft', 480, '84x108/16', '2022-03-14', 5000, 'Використання ПК', 'Захист і безпека ПК'),
(58, 3932, 'No', 'Як перетворити персональний комп`ютер на вимірювал', 7.65, 'ДМК', 144, '60x88/16', '1999-09-06', 5000, 'Використання ПК', 'Інші книги'),
(59, 4713, 'No', 'Plug-ins. Додаткові програми для музичних програм', 11.41, 'ДМК', 144, '70x100/16', '2000-02-22', 5000, 'Використання ПК', 'Інші книги'),
(175, 5217, 'No', 'Windows МЕ. Найновіші версії програм', 16.57, 'Триумф', 320, '70x100/16', '2000-08-25', 5000, 'Операційні сист', 'Windows 2000'),
(176, 4829, 'No', 'Windows 2000 Professional крок за кроком з CD', 27.25, 'Эком', 320, '70x100/16', '2000-04-28', 5000, 'Операційні сист', 'Windows 2000'),
(188, 5170, 'No', 'Linux версії', 24.43, 'ДМК', 346, '70x100/16', '2000-09-29', 5000, 'Операційні сист', 'Linux'),
(191, 860, 'No', 'Операційна система UNIX', 3.50, 'BHV С.-Петербург', 395, '84x100/16', '1997-05-05', 5000, 'Операційні сист', 'Unix'),
(203, 44, 'No', 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 'DiaSoft', 352, '60x84/16', '1996-03-20', 5000, 'Операційні сист', 'Інші операційні сист'),
(206, 5176, 'No', 'Windows Ме. Супутник користувача', 12.79, 'Видавнича група BHV', 306, NULL, '2000-10-10', 5000, 'Операційні сист', 'Інші операційні сист'),
(209, 5462, 'No', 'Мова програмування С++. Лекції та вправи', 29.00, 'DiaSoft', 656, '84x108/16', '2000-12-12', 5000, 'Програмування', 'С&C++'),
(210, 4982, 'No', 'Мова програмування С. Лекції та вправи', 29.00, 'DiaSoft', 432, '84x108/16', '2000-12-07', 5000, 'Програмування', 'С&C++'),
(220, 4687, 'No', 'Ефективне використання C++ .50 рекомендацій щодо п', 17.60, 'ДМК', 240, '70x100/16', '2000-03-02', 5000, 'Програмування', 'С&C++'),
(222, 235, 'Yes', 'Інформаційні системи і структури даних', 0.00, 'Києво-Могилянська ак', 418, '60x9016', '2022-03-14', 5000, 'Використання ПК', 'SQL'),
(225, 8746, 'Yes', 'Бази даних в інформаційних системах', 0.00, 'Університет `Україна', 418, '60x84/16', '2018-07-25', 5000, 'Програмування', 'Інші книги'),
(226, 2154, 'Yes', 'Сервер на основі операційної системи FreeBSD 6.1', 0.00, 'Університет `Україна', 216, '60x84/16', '2015-11-03', 5000, 'Програмування', 'SQL'),
(245, 2662, 'No', 'Організація баз даних та знань', 0.00, 'Вінниця: ВДТУ', 208, '60x90/16', '2001-10-10', 5000, 'Програмування', 'SQL'),
(247, 5641, 'Yes', 'Організація баз даних та знань', 0.00, 'Видавнича група BHV', 384, '70x100/16', '2021-12-15', 5000, 'Програмування', 'SQL'),
(7851, 502, 'Yes', 'Нейронні мережі', 26.14, 'Київський унівестите', 159, '70x100/16', '2022-01-01', 0, '', 'Програмування');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `idx_title` (`name_book`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
