-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 17 2022 г., 11:15
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

DELIMITER $$
--
-- Процедуры
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1` ()  SELECT newbook.name_book AS 'Назва книги',newbook.price_book AS 'Ціна',newbook.publisher AS 'Видавництво',newbook.book_format AS 'Формат' FROM newbook$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc10` ()  SELECT publishers.publisher_name AS 'Видавництво' FROM publishers WHERE newbook.pages>=400$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc10_` ()  SELECT publishers.publisher_name AS 'Видавництво' FROM newbook,publishers WHERE newbook.pages>=400$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc11` (IN `num_books` INT)  SELECT categories.id_category AS 'ID',categories.category_name AS 'Категорія' FROM categories WHERE (SELECT COUNT(*) FROM newbook WHERE newbook.category = categories.id_category) > num_books$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc12` (IN `name_publisher` VARCHAR(200))  SELECT newbook.id_book AS 'ID',newbook.code_book AS 'Код',newbook.is_new AS 'Новинка',newbook.name_book AS 'Назва книги',newbook.price_book AS 'Ціна', newbook.pages AS 'Кількість сторінок' FROM newbook WHERE EXISTS (SELECT publishers.id_publisher,publishers.publisher_name FROM publishers WHERE publishers.publisher_name = name_publisher AND publishers.id_publisher = newbook.publisher)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc13` (IN `name_publisher` VARCHAR(200))  SELECT newbook.id_book AS 'ID',newbook.code_book AS 'Код',newbook.is_new AS 'Новинка',newbook.name_book AS 'Назва книги',newbook.price_book AS 'Ціна', newbook.pages AS 'Кількість сторінок' FROM newbook WHERE NOT EXISTS (SELECT publishers.id_publisher,publishers.publisher_name FROM publishers WHERE publishers.publisher_name = name_publisher AND publishers.id_publisher = newbook.publisher)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc1_` ()  SELECT newbook.name_book AS 'Назва книги',newbook.price_book AS 'Ціна',publishers.publisher_name AS 'Видавництво',formats.format_name AS 'Формат' FROM newbook JOIN publishers ON newbook.publisher=publishers.id_publisher JOIN formats ON newbook.book_format=formats.id_format$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2` ()  SELECT newbook.book_topic AS 'Тема книги',newbook.category AS 'Категорія',newbook.name_book AS 'Назва книги',newbook.publisher AS 'Видавництво' FROM newbook$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2_` ()  SELECT topics.topic_name AS 'Тема книги',categories.category_name AS 'Категорія',newbook.name_book AS 'Назва книги',publishers.publisher_name AS 'Видавництво' FROM newbook JOIN topics ON newbook.book_topic=topics.id_topic JOIN categories ON newbook.category=categories.id_category JOIN publishers ON newbook.publisher=publishers.id_publisher$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc3` (IN `pub` TEXT(100), IN `year` INT)  SELECT newbook.code_book AS 'Код книги',newbook.name_book AS 'Назва книги',publishers.publisher_name AS 'Видавництво',newbook.date_book AS 'Рік видання',newbook.price_book AS 'Ціна' FROM newbook JOIN publishers ON newbook.publisher=publishers.id_publisher
WHERE YEAR(newbook.date_book)>2000 AND publishers.publisher_name LIKE pub
ORDER BY newbook.code_book ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc4__` ()  SELECT newbook.name_book AS 'Назва',SUM(newbook.pages) AS 'Загальна кількість сторінок',newbook.category AS 'Категорія' FROM newbook JOIN categories ON newbook.category=categories.id_category GROUP BY newbook.category ORDER BY newbook.pages ASC$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc5` (IN `topic` INT, IN `categori` INT, OUT `avg_price` INT)  SET avg_price=(SELECT AVG(newbook.price_book) FROM newbook WHERE newbook.book_topic LIKE topic AND newbook.category LIKE categori)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc5_` (IN `topic` INT, IN `categori` INT, OUT `avg_price` INT)  SET avg_price=(SELECT AVG(newbook.price_book) FROM newbook WHERE newbook.book_topic LIKE topic AND newbook.category LIKE categori)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc6` ()  SELECT * FROM newbook$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc6_` ()  SELECT newbook.id_book 'ID',newbook.code_book 'Код книги',newbook.is_new 'Новинка',newbook.name_book 'Назва книги',newbook.price_book 'Ціна',publishers.publisher_name 'Видавництво',newbook.pages 'Сторінки',formats.format_name 'Формат',newbook.date_book,newbook.tirage,topics.topic_name,categories.category_name FROM newbook JOIN publishers ON newbook.publisher=publishers.id_publisher JOIN topics ON newbook.book_topic=topics.id_topic JOIN categories ON newbook.category=categories.id_category JOIN formats ON newbook.book_format=formats.id_format$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc7` ()  SELECT DISTINCT book1.name_book AS 'Книга 1',book2.name_book AS 'Книга 2' FROM newbook book1 JOIN newbook book2 ON book1.pages=book2.pages AND book1.id_book!=book2.id_book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc8` ()  SELECT DISTINCT book1.name_book AS 'Книга 1',book2.name_book AS 'Книга 2',book3.name_book AS 'Книга 3' FROM newbook book1 JOIN newbook book2 ON book1.price_book=book2.price_book AND book1.id_book!=book2.id_book JOIN newbook book3 ON book2.price_book=book3.price_book AND book2.id_book!=book3.id_book$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc9` ()  SELECT newbook.name_book AS 'Назва Книги',newbook.price_book AS 'Ціна',newbook.pages AS 'Кількість сторінок',newbook.book_format AS 'Формат',newbook.date_book AS 'Дата видавництва',publishers.publisher_name AS 'Видавництво',topics.topic_name AS 'Тема',categories.category_name AS 'Категорія' FROM newbook JOIN publishers ON newbook.publisher=publishers.id_publisher JOIN topics ON newbook.book_topic=topics.id_topic JOIN categories ON newbook.category=categories.id_category WHERE categories.category_name="%C++%"$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc9_` (IN `categori` VARCHAR(200))  SELECT newbook.name_book AS 'Назва Книги',newbook.price_book AS 'Ціна',newbook.pages AS 'Кількість сторінок',newbook.book_format AS 'Формат',newbook.date_book AS 'Дата видавництва',publishers.publisher_name AS 'Видавництво',topics.topic_name AS 'Тема',categories.category_name AS 'Категорія' FROM newbook JOIN publishers ON newbook.publisher=publishers.id_publisher JOIN topics ON newbook.book_topic=topics.id_topic JOIN categories ON newbook.category=categories.id_category WHERE categories.category_name=categori$$

DELIMITER ;

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
(2, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 9, 400, 2, '2000-07-24', 5000, 1, 2),
(8, 4985, 'No', 'Засвой самостійно модернізацію та ремонт ПК за 24 ', 18.90, 2, 288, 2, '2000-07-07', 5000, 1, 2),
(9, 5141, 'No', 'Структури даних та алгоритми', 37.80, 2, 384, 2, '2000-09-29', 5000, 1, 2),
(20, 5127, 'Yes', 'Автоматизація інженерно-графічних робіт', 11.58, 3, 256, 2, '2000-06-15', 5000, 1, 2),
(31, 5110, 'No', 'Апаратні засоби мультимедіа. Відеосистема РС', 15.51, 9, 400, 2, '2000-07-24', 5000, 1, 3),
(46, 5199, 'No', 'Залізо IBM 2001', 30.07, 4, 368, 2, '2000-02-12', 5000, 1, 3),
(50, 3851, 'Yes', 'Захист інформації та безпека комп`ютерних систем', 26.00, 5, 480, 3, NULL, 5000, 1, 4),
(58, 3932, 'No', 'Як перетворити персональний комп`ютер на вимірювал', 7.65, 6, 144, 4, '1999-09-06', 5000, 1, 5),
(59, 4713, 'No', 'Plug-ins. Додаткові програми для музичних програм', 11.41, 6, 144, 2, '2000-02-22', 5000, 1, 5),
(175, 5217, 'No', 'Windows МЕ. Найновіші версії програм', 16.57, 7, 320, 2, '2000-08-25', 5000, 2, 6),
(176, 4829, 'No', 'Windows 2000 Professional крок за кроком з CD', 27.25, 8, 320, 2, '2000-04-28', 5000, 2, 6),
(188, 5170, 'No', 'Linux версії', 24.43, 6, 346, 2, '2000-09-29', 5000, 2, 7),
(191, 860, 'No', 'Операційна система UNIX', 3.50, 9, 395, 5, '1997-05-05', 5000, 2, 8),
(203, 44, 'No', 'Відповіді на актуальні запитання щодо OS/2 Warp', 5.00, 5, 352, 4, '1996-03-20', 5000, 2, 9),
(206, 5176, 'No', 'Windows Ме. Супутник користувача', 12.79, 9, 306, 1, '2000-10-10', 5000, 2, 9),
(209, 5462, 'No', 'Мова програмування С++. Лекції та вправи', 29.00, 5, 656, 3, '2000-12-12', 5000, 3, 10),
(210, 4982, 'No', 'Мова програмування С. Лекції та вправи', 29.00, 5, 432, 3, '2000-12-07', 5000, 3, 10),
(220, 4687, 'No', 'Ефективне використання C++ .50 рекомендацій щодо п', 17.60, 6, 240, 2, '2000-03-02', 5000, 3, 10),
(222, 235, 'No', 'Інформаційні системи і структури даних', 0.00, 10, 418, 6, NULL, 100, 1, 11),
(225, 8746, 'YES', 'Бази даних в інформаційних системах', 0.00, 11, 418, 7, '2018-07-25', 500, 3, 5),
(226, 2154, 'Yes', 'Сервер на основі операційної системи FreeBSD 6.1', 0.00, 11, 216, 7, '2015-11-03', 500, 3, 11),
(245, 2662, 'No', 'Організація баз даних та знань', 0.00, 12, 208, 6, '2001-10-10', 1000, 3, 11),
(247, 5641, 'Yes', 'Організація баз даних та знань', 0.00, 9, 384, 2, '2021-12-15', 5000, 3, 11);

--
-- Триггеры `newbook`
--
DELIMITER $$
CREATE TRIGGER `trig1` AFTER INSERT ON `newbook` FOR EACH ROW BEGIN
IF (SELECT COUNT(newbook.book_topic) FROM newbook WHERE NEW.book_topic=newbook.book_topic) NOT BETWEEN 5 AND 10
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Кількість тем може бути в діапазоні від 5 до 10';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig10` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	IF (NEW.publisher=9) AND (NEW.book_format=4) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво BHV не випускає книги формату 60х88 / 16';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig2` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	IF (NEW.is_new='Yes' AND YEAR(NEW.date_book)!=YEAR(CURRENT_DATE)) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Новинкою може бути тільки книга видана в поточному році';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig3` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	IF (NEW.pages<100 AND NEW.price_book)>10 THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Книга з кількістю сторінок до 100 не може коштувати більше 10 $';
	ELSEIF( NEW.pages<200 AND NEW.price_book)>20 THEN SET @err2='Книга з кількістю сторінок до 200 не може коштувати більше 20 $';
	ELSEIF(NEW.pages<300 AND NEW.price_book)>30 THEN SET @err3='Книга з кількістю сторінок до 300 не може коштувати більше 30 $';
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig4` BEFORE INSERT ON `newbook` FOR EACH ROW IF((newbook.publisher=9 AND newbook.tirage<5000) OR (newbook.publisher=5 AND newbook.tirage<10000))
THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво "BHV" не випускає книги накладом меншим 5000, а видавництво Diasoft - 10000.';
END IF
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig5` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	SET @count_books=0;
	SELECT COUNT(*) INTO @count_books FROM newbook WHERE code_book=NEW.code_book AND(
		is_new!=NEW.is_new OR
		name_book!=NEW.name_book OR
		price_book!=NEW.price_book OR
		publisher!=NEW.publisher OR
		pages!=NEW.pages OR
		book_format!=NEW.book_format OR
		date_book!=NEW.date_book OR
		tirage!=NEW.tirage OR
		book_topic!=NEW.book_topic OR
		category!=NEW.category);
  IF @count_books!=0 THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Книги з однаковим кодом повинні мати однакові дані';
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig6` BEFORE DELETE ON `newbook` FOR EACH ROW BEGIN
	IF ((CURRENT_USER != 'dbo') AND (COLUMNS_UPDATED() & 1)!=0)
	THEN 
	SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Ви не користувач dbo.Лише цей користувач може видаляти книги. ';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig7` BEFORE UPDATE ON `newbook` FOR EACH ROW BEGIN
	IF ((CURRENT_USER != 'dbo') AND OLD.price_book!=NEW.price_book) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Користувач "dbo" не має права змінювати ціну книги';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig8` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	IF (NEW.publisher IN (6,8)) AND (NEW.category=2) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництва ДМК і Еком підручники не видають';
	END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig9` BEFORE INSERT ON `newbook` FOR EACH ROW BEGIN
	SET @book_is_new_from_publisher=0;
	SELECT COUNT(*) INTO @book_is_new_from_publisher FROM newbook WHERE newbook.publisher=NEW.publisher AND newbook.is_new='Yes'AND
    YEAR(CURRENT_DATE())=YEAR(newbook.date_book) AND MONTH(newbook.date_book);
    IF (NEW.is_new='Yes' AND @book_is_new_from_publisher>10) THEN SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='Видавництво не може випустити більше 10 новинок протягом одного місяця поточного року';
    END IF;
END
$$
DELIMITER ;

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
(5, 'DiaSoft'),
(1, 'n/m'),
(12, 'Вінниця: ВДТУ'),
(9, 'Видавнича група BHV'),
(2, 'Вильямс'),
(6, 'ДМК'),
(10, 'Києво-Могилянська ак'),
(4, 'МикроАрт'),
(3, 'Питер'),
(7, 'Триумф'),
(11, 'Університет `Україна'),
(8, 'Эком');

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
  ADD KEY `idx_title` (`name_book`),
  ADD KEY `publisher` (`publisher`),
  ADD KEY `book_format` (`book_format`),
  ADD KEY `book_topic` (`book_topic`),
  ADD KEY `category` (`category`);

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
  MODIFY `id_publisher` smallint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
