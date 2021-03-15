-- insert

insert into likes_posts(post_id, user_id) values (2, 41); 
-- select

select * from users limit 5; -- выбрать все записи ИЗ таблицы users и вывести только первые 5
select * from users limit 3 offset 8; -- выбрать 3 начиная с 8го
select surname, name, phone from users; -- вывести фамилию имя и телефон
select concat(surname, ' ', name) as list, phone from users; -- объединение 2х столбцов в один
select surname, name, phone from users where name = 'aut'; -- фильтр по имени

select * from users where id between 38 and 50; -- тоже самое что и select * from users where id >= 38 and id <=50;
select surname, name, hometown from users 
	where hometown in ('Lake Bud', 'Lake Germaine', 'Port Gustaveside'); 

select surname, name from users where surname like 'a%'; -- все фамилии на "А"

select surname, name, hometown from users where hometown like '%o%'; -- все города в которых есть буква "о"

select surname, name from users where surname like 'a__'; -- имена начинающиеся на "а" и состоящие из 3х символов

select distinct name from users; -- убраны повторяющиеся имена

select surname from users order by surname; -- сортировка по фамилиям

select count(*) from users where gender = 'f';  -- сколько женщин в таблице users

select count(*) from users where gender is null;  -- у скольких не указан пол
select count(*) from users where gender is not null;  -- у скольких указан пол

select gender, count(*) from users group by gender; -- сколько женщин, мужчин и null

-- update

update friend_requests 
set status = 'approved',
	confirmed_at = now()
where initiator_user_id = 1 and target_user_id = 2;

update users set gender = 'm' -- можно ли как то сделать так, чтоб поле gender заполнилось рандомно или значением m или значенимем f (как set gender = 'm' or 'f')?
where id > 4;

update users set gender = 'f'
where id > 38 and id < 81;

-- delete 

delete from users where id > 50; -- выдает ошибку SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails (`snet2008_shamarin`.`comments`, CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))
 
-- таблица с лайками

create table `likes_posts` (
	`id` bigint unsigned not null auto_increment,	
	`post_id` bigint unsigned not null,
	`user_id` bigint unsigned not null,
	primary key (`id`), 
	unique key `id` (`id`),
	key `user_id` (`user_id`),
	key `post_id` (`post_id`),
	foreign key (`user_id`) references `users` (`id`),
	foreign key (`post_id`) references `posts` (`id`)
)

