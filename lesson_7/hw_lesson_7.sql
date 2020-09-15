-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине

select
	(select name from users where id = user_id) as 'at_least_1_order'
from orders group by user_id;
	
-- Выведите список товаров products и разделов catalogs, который соответствует товару

select 
		name, 
		price, 
		(select name from catalogs c where id = catalog_id) as 'category'
from products p;

