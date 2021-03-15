-- КОД СОЗДАНИЯ БД И ТАБЛИЦ
create database if not exists kinopoisk_by_me;

use kinopoisk_by_me;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT null,
  `pass` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `films_watched` int unsigned DEFAULT null COMMENT 'Количество просмотренных фильмов',
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `name` (`name`,`surname`)
);


DROP TABLE IF EXISTS `films`;
CREATE TABLE `films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COMMENT 'Название фильма',
  `genre` varchar(50) COMMENT 'Жанр',
  `year` smallint COMMENT 'Год выхода',
  `rating` tinyint DEFAULT null COMMENT 'Рейтинг',
  `is_in_cinema` bit NOT null COMMENT 'Идет в кино',
  `price` decimal(10,2) NOT null COMMENT 'Цена фильма',
  PRIMARY KEY (`id`)
); 



DROP TABLE IF EXISTS `rated_films`;
CREATE TABLE `rated_films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint unsigned NOT null,
  `user_id` bigint unsigned NOT null,
  `rating` tinyint COMMENT 'Поставленная оценка',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rating_index` (`rating`),
  FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);


DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COMMENT 'Заголовок новости',
  `body` text COMMENT 'Текст новости',
  `film_id` bigint unsigned NOT null,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
);

DROP TABLE IF EXISTS `cinemas`;
CREATE TABLE `cinemas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COMMENT 'Название кинотеатра',
  `adress` varchar(50) COMMENT 'Адрес',
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


DROP TABLE IF EXISTS `afisha`;
CREATE TABLE `afisha` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint unsigned NOT null,
  `in_cinema_untill` date COMMENT 'В кино до',
  `cinema_id` bigint unsigned NOT null,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`)
);

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT null,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`phone`) REFERENCES `users` (`phone`)
);

DROP TABLE IF EXISTS `order_films`;
CREATE TABLE `order_films` (
  `order_id` bigint unsigned NOT NULL,
  `film_id` bigint unsigned NOT null,
  PRIMARY KEY (`order_id`, `film_id`),
  FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
);

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `film_id` bigint unsigned NOT NULL,
  `body` text COMMENT 'Текст рецензии',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
);

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `is_read` bit DEFAULT 0,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
);


-- ТИПОВЫЕ ЗАПРОСЫ

-- Получить комедии
select 
	title, 
	genre, 
	`year`, 
	rating 
from films where genre = 'Комедия' 
order by rating desc;

-- Получить фильмы 1994 года
select 
	title, 
	genre, 
	`year`, 
	rating 
from films where `year` = 1994 
order by rating desc;

-- вывести содержимое 10го заказа
select of2.order_id, 
	f.title,
	f.price,
	(select concat(name, ' ', surname) from users where id = o2.user_id) 'name',  
	o2.phone 
from order_films of2
	join films f 
	on film_id = id
	join orders o2  
	on of2.order_id = o2.id
	join users u  
	on o2.user_id = u.id
where order_id = 10;

-- вывести сумму 3го заказа
select of2.order_id, 
	sum(f.price) as total_price,
	(select concat(name, ' ', surname) from users where id = o2.user_id) 'name', 
	o2.phone 
from order_films of2
	join films f 
	on film_id = id
	join orders o2  
	on of2.order_id = o2.id
	join users u  
	on o2.user_id = u.id
where order_id = 10;

-- вывести фильмы, которые идут в кино
select 
	f.title, 
	f.genre, 
	f.`year`, 
	f.rating,
	c.name,
	c.adress,
	c.phone 
from films f 
	join afisha a
	on a.film_id = f.id 
	join cinemas c 
	on c.id = a.cinema_id 
where is_in_cinema = 1
order by f.title ;

-- ФУНКЦИИ, ПРОЦЕДУРЫ, ТРИГГЕРЫ И ПРЕДСТАВЛЕНИЯ

-- функция расчета рейтинга фильма
drop function if exists rate_film
DELIMITER //

create function rate_film(id_film int)
RETURNS float reads sql data
begin
	declare rate float;
	set rate = (select avg(rating) from rated_films rf where rf.film_id = id_film);
	return rate;
end //

delimiter ;
update films set rating = rate_film(2) where id = 2;

-- триггер пересчитывающий рейтинг у фильма при появлении новой оценки
drop trigger if exists update_rating;
delimiter //

create trigger update_rating
after insert on rated_films
for each row 
begin 
	update films set rating = rate_film(new.film_id) where id = new.film_id;
end //

delimiter ;

-- процедура обновления рейтинга на всех фильмах
drop procedure if exists rate_all_films;
delimiter //

CREATE PROCEDURE rate_all_films (in num int)
BEGIN
  DECLARE i INT DEFAULT 1;
 if (num > 0) then
 	cycle: WHILE i <= num DO
 	IF i > num THEN LEAVE cycle;
  	END IF;
	-- select rate_film(i);
	update films set rating = rate_film(i) where id = i;
	SET i = i + 1;
  END while cycle;
  ELSE
	SELECT 'Ошибочное значение параметра';
  END IF;
END//

delimiter ;

call rate_all_films(20) ;

-- Представление "Топ 10 фильмов"
drop view if exists top_10;
create view top_10 (Title, Genre, `Year`, Rating)
as select 
	title,
	genre,
	`year`,
	rating 
from films 
order by rating desc 
limit 10;

select * from top_10;

-- Представление "Фильмы, которых нет ни в одном заказе"
drop view if exists unordered_films;
create view unordered_films (Title, Price, Rating)
as select 
	f.title,
	f.price,
	f.rating 
from orders o 
	join order_films of3 
	on of3.order_id = o.id 
	right join films f 
	on of3.film_id = f.id
where of3.order_id is null;

select * from unordered_films;








