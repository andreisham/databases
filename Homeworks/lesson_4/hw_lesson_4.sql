-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
-- 1. обновил даты создания и обновления пользователей текущей датой

update users 
	set created_at = now(),
	updated_at = now(); 
	
-- 2. поменять тип данных с varchar на datetime с сохранением данных

-- 2.1 привел таблицу к условиям дз

alter table users modify created_at varchar(100) not null;
alter table users modify updated_at varchar(100) not null;

-- 2.2 поменял тип данных с varchar на datetime с сохранением данных

alter table users modify created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
alter table users modify updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 3. Сортировка значений остатков по возрастанию, но чтоб 0 всегда был внизу

select value from storehouses_products
	order by if (value > 0, 1, 0) desc, -- не совсем понял как работает это выражение, но оно работает.. В разборе дз сделали путем ввода еще одного столбца
	value asc;

-- Практическое задание теме «Агрегация данных»
-- 1. Средний возраст пользователей в таблице users

select avg(TIMESTAMPDIFF(year, birthday_at, now())) as average_age from users;

-- 2.Количество дней рождения, проходящихся на каждый из дней недели

select 
	count(*) AS total,  
	dayname(birthday_at) as daynames from  users
	group by daynames;
