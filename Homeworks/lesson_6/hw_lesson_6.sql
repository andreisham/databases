-- Из всех друзей этого пользователя найдите человека, который больше всех общался с первым пользователем.

select 
	(select concat(name, ' ', surname) from users where id = from_user_id) 'name' ,	
	count(from_user_id) as `number of messages`
from messages
where to_user_id = 1 group by from_user_id order by `number of messages` desc limit 1;

-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

-- первый вариант (не работает)
select 
	(select birthday from users where id = profile_id order by birthday desc limit 10) as `youngers`, -- 10 самых молодых
	post_id as `number of likes`
from likes_posts 
where profile_id in (select birthday from users where id = profile_id);
-- ---------------
-- второй вариант (вроде как работает,но не уверен что правильно)
select 
	(select birthday from users where id = profile_id order by birthday desc limit 10) 'name' ,	
	count(post_id) as `number of likes` 
from likes_posts
order by `number of likes` ; 

-- ИСПРАВЛЕННОЕ (сначала найти сколько у кого лайков, а потом выбрать 10 самых молодых)

select
	u.id,
	u.name,
	u.surname,
	timestampdiff(year, u.birthday, now()) as 'age',
	count(*) as total_likes
from users u 
join posts p 
	on u.id = p.user_id 
join likes_posts lp  
	on p.id = lp.post_id 
group by u.id 
order by age, total_likes desc 
limit 10;

-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

select 
	(select case(gender)
		when 'f' then 'Женщина'
		when 'm' then 'Мужчина'
		end as 'gender'
	from users 	where id = profile_id) as `gender of likers`,	
	count(profile_id) as `number of likers` 
from likes_posts
group by `gender of likers` order by `number of likers` desc limit 1;

-- Найти 10 пользователей, которые меньше всех лайкают. 

select 
	(select concat(name, ' ', surname) from users where id = profile_id) 'name' ,	
	count(profile_id) as `number of likes` 
from likes_posts
group by `name` order by `number of likes` limit 10;