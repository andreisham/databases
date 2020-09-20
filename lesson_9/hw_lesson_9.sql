-- В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

start transaction;
insert into sample.users  select id, name from users where id = 1;
delete from users where id = 1 limit 1;
commit;

-- Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее название каталога name из таблицы catalogs.

create view names as select 
	p.name as product_name, 
	c.name as category_name
from products p 
	join catalogs c 
	on p.catalog_id = c.id;

select * from names;
	
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 

DELIMITER //
DROP FUNCTION IF EXISTS hello//
create function hello ()
returns text deterministic
begin
	case 
		when curtime() between str_to_date('6:00:00', '%H:%i:%s') and str_to_date('11:59:59', '%H:%i:%s')  then return 'Доброе утро!';
		when  curtime()  between str_to_date('12:00:00', '%H:%i:%s')  and str_to_date('17:59:59', '%H:%i:%s')  then return 'Добрый день!';
		when  curtime()  between str_to_date('18:00:00', '%H:%i:%s')  and str_to_date('23:59:59', '%H:%i:%s')  then return 'Добрый вечер!';
		when  curtime()  between str_to_date('00:00:00', '%H:%i:%s')  and str_to_date('05:59:59', '%H:%i:%s')  then return 'Доброй ночи!';
	end case;
end//

select hello ();