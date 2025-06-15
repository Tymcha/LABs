-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Дек 04 2024 г., 00:33
-- Версия сервера: 5.7.24
-- Версия PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lab3(4)`
--

-- --------------------------------------------------------

--
-- Структура таблицы `base_params`
--

CREATE TABLE `base_params` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `local_realty_id` int(11) DEFAULT NULL,
  `advert_type` varchar(50) DEFAULT NULL,
  `realty_type` varchar(50) DEFAULT NULL,
  `realty_sale_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `base_params`
--

INSERT INTO `base_params` (`id`, `email`, `phone`, `local_realty_id`, `advert_type`, `realty_type`, `realty_sale_type`) VALUES
(1, 'user1@example.com', '+380501234567', 101, 'Продажа', 'Квартира', 1),
(2, 'user2@example.com', '+380671234567', 102, 'Продажа', 'Квартира', 2),
(3, 'user3@example.com', '+380631234567', 103, 'Продажа', 'Квартира', 1),
(4, 'user4@example.com', '+380931234567', 104, 'Продажа', 'Квартира', 2),
(5, 'user5@example.com', '+380991234567', 105, 'Продажа', 'Квартира', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `metro` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `street_type` varchar(50) DEFAULT NULL,
  `building_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `location`
--

INSERT INTO `location` (`id`, `state`, `city`, `district`, `metro`, `street`, `street_type`, `building_number`) VALUES
(1, 'Київська', 'Київ', 'Шевченківський', 'Золоті ворота', 'Володимирська', 'вулиця', '23А'),
(2, 'Львівська', 'Львів', 'Галицький', NULL, 'Городоцька', 'вулиця', '47'),
(3, 'Одеська', 'Одеса', 'Приморський', 'Аркадія', 'Дерибасівська', 'вулиця', '15Б'),
(4, 'Дніпропетровська', 'Дніпро', 'Центральний', NULL, 'Калініна', 'проспект', '120'),
(5, 'Харківська', 'Харків', 'Індустріальний', 'Історичний музей', 'Сумська', 'вулиця', '36А');

-- --------------------------------------------------------

--
-- Структура таблицы `main_params`
--

CREATE TABLE `main_params` (
  `id` int(11) NOT NULL,
  `rooms_count` int(11) DEFAULT NULL,
  `total_area` float DEFAULT NULL,
  `living_area` float DEFAULT NULL,
  `kitchen_area` float DEFAULT NULL,
  `floors` varchar(10) DEFAULT NULL,
  `no_elevator` varchar(10) DEFAULT NULL,
  `freight_elevator` varchar(10) DEFAULT NULL,
  `passenger_elevator` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `main_params`
--

INSERT INTO `main_params` (`id`, `rooms_count`, `total_area`, `living_area`, `kitchen_area`, `floors`, `no_elevator`, `freight_elevator`, `passenger_elevator`, `floor`) VALUES
(1, 1, 35.5, 20, 10, '5', 'ні', 'ні', 'так', '3'),
(2, 2, 45, 30, 8, '9', 'так', 'ні', 'так', '7'),
(3, 3, 60, 40, 12, '12', 'ні', 'так', 'так', '5'),
(4, 4, 80.5, 50, 15, '16', 'ні', 'так', 'так', '9'),
(5, 1, 25, 15, 5, '2', 'так', 'ні', 'ні', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `price_type` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `offer_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `price`
--

INSERT INTO `price` (`id`, `price_type`, `price`, `currency`, `offer_type`) VALUES
(1, 'за об’єкт', 50000, 'грн', 'від власника'),
(2, 'за кв.м.', 1500, '$', 'від посередника'),
(3, 'за об’єкт', 75000, 'грн', 'від забудовника'),
(4, 'за кв.м.', 1200, '€', 'від представника забудовника'),
(5, 'за об’єкт', 60000, 'грн', 'від власника');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `base_params`
--
ALTER TABLE `base_params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `main_params`
--
ALTER TABLE `main_params`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `base_params`
--
ALTER TABLE `base_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `main_params`
--
ALTER TABLE `main_params`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
