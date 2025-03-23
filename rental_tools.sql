-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 23 2025 г., 23:01
-- Версия сервера: 8.0.24
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `rental_tools`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL COMMENT 'id категории',
  `name` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'имя категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Шуруповерты'),
(2, 'Болгарки'),
(3, 'Пилы'),
(4, 'Перфораторы\r\n'),
(5, 'Дрели');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int NOT NULL COMMENT 'id клиента',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'имя',
  `password` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'пароль',
  `phone` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'телефон'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `user_name`, `password`, `phone`) VALUES
(1, 'Дюгаев Денис Георгиевич', 'pass1', '88004443636'),
(2, 'Щеглов Леонид Сергеевич', 'pass2', '88004443637'),
(3, 'Шипулин Александр Петрович', 'pass3', '88003336262'),
(4, 'Иволгин Марк Ефремович', 'pass4', '88003336264'),
(5, 'Никитенко Евгений Захарович', 'pass5', '88004646462');

-- --------------------------------------------------------

--
-- Структура таблицы `rental`
--

CREATE TABLE `rental` (
  `id` int NOT NULL COMMENT 'id аренды',
  `id_tool` int NOT NULL COMMENT 'id инструмента',
  `id_client` int NOT NULL COMMENT 'id клиента',
  `date_rental` date NOT NULL COMMENT 'дата начала аренды',
  `date_return` date NOT NULL COMMENT 'дата окончания аренды'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `rental`
--

INSERT INTO `rental` (`id`, `id_tool`, `id_client`, `date_rental`, `date_return`) VALUES
(1, 1, 1, '2025-03-24', '2025-03-27'),
(2, 4, 2, '2025-03-24', '2025-03-25'),
(3, 5, 3, '2025-03-26', '2025-03-31'),
(4, 6, 4, '2025-03-23', '2025-03-26'),
(5, 6, 5, '2025-03-20', '2025-03-24'),
(6, 8, 1, '2025-03-24', '2025-03-27'),
(7, 9, 2, '2025-03-24', '2025-03-25'),
(8, 10, 3, '2025-03-26', '2025-03-31'),
(9, 11, 4, '2025-03-23', '2025-03-26'),
(10, 12, 5, '2025-03-20', '2025-03-24'),
(11, 13, 1, '2025-03-24', '2025-03-27'),
(12, 14, 2, '2025-03-24', '2025-03-25'),
(13, 15, 3, '2025-03-26', '2025-03-31'),
(14, 16, 4, '2025-03-23', '2025-03-26'),
(15, 17, 5, '2025-03-20', '2025-03-24');

-- --------------------------------------------------------

--
-- Структура таблицы `tool`
--

CREATE TABLE `tool` (
  `id` int NOT NULL COMMENT 'id инструмента',
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'наименование',
  `price` decimal(65,2) NOT NULL COMMENT 'цена',
  `quantity` int NOT NULL COMMENT 'количество',
  `category_id` int NOT NULL COMMENT 'id категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tool`
--

INSERT INTO `tool` (`id`, `name`, `price`, `quantity`, `category_id`) VALUES
(1, 'Шуруповерт KEYANG', '550.00', 10, 1),
(4, 'Болгарка AEG', '500.00', 10, 2),
(5, 'Пила ATLET', '600.00', 10, 3),
(6, 'Перфоратор Makita', '580.00', 10, 4),
(7, 'Дрель DCA', '540.00', 10, 5),
(8, 'Шуруповерт Bosh', '700.00', 10, 1),
(9, 'Шуруповерт Вихрь', '400.00', 10, 1),
(10, 'Шуруповерт DECO', '500.00', 10, 1),
(11, 'Болгарка Ресанта', '600.00', 10, 2),
(12, 'Болгарка Ryobi', '300.00', 10, 2),
(13, 'Пила WORTEX', '490.00', 10, 3),
(14, 'Пила DCA', '500.00', 10, 3),
(15, 'Перфоратор Калибр', '570.00', 10, 4),
(16, 'Перфоратор SDS', '600.00', 10, 4),
(17, 'Дрель Зубр', '300.00', 10, 5),
(18, 'Дрель Rebir IE', '450.00', 10, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rental_ibfk_1` (`id_client`),
  ADD KEY `rental_ibfk_2` (`id_tool`);

--
-- Индексы таблицы `tool`
--
ALTER TABLE `tool`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tool_ibfk_1` (`category_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id категории', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id клиента', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `rental`
--
ALTER TABLE `rental`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id аренды', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `tool`
--
ALTER TABLE `tool`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'id инструмента', AUTO_INCREMENT=19;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`id_tool`) REFERENCES `tool` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tool`
--
ALTER TABLE `tool`
  ADD CONSTRAINT `tool_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
