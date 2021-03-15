-- �� ���� ������ ����� ������������ ������� ��������, ������� ������ ���� ������� � ������ �������������.

select 
	(select concat(name, ' ', surname) from users where id = from_user_id) 'name' ,	
	count(from_user_id) as `number of messages`
from messages
where to_user_id = 1 group by from_user_id order by `number of messages` desc limit 1;

-- ���������� ����� ���������� ������, ������� �������� 10 ����� ������� �������������.

-- ������ ������� (�� ��������)
select 
	(select birthday from users where id = profile_id order by birthday desc limit 10) as `youngers`, -- 10 ����� �������
	post_id as `number of likes`
from likes_posts 
where profile_id in (select birthday from users where id = profile_id);
-- ---------------
-- ������ ������� (����� ��� ��������,�� �� ������ ��� ���������)
select 
	(select birthday from users where id = profile_id order by birthday desc limit 10) 'name' ,	
	count(post_id) as `number of likes` 
from likes_posts
order by `number of likes` ; 

-- ������������ (������� ����� ������� � ���� ������, � ����� ������� 10 ����� �������)

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

-- ���������� ��� ������ �������� ������ (�����) - ������� ��� �������?

select 
	(select case(gender)
		when 'f' then '�������'
		when 'm' then '�������'
		end as 'gender'
	from users 	where id = profile_id) as `gender of likers`,	
	count(profile_id) as `number of likers` 
from likes_posts
group by `gender of likers` order by `number of likers` desc limit 1;

-- ����� 10 �������������, ������� ������ ���� �������. 

select 
	(select concat(name, ' ', surname) from users where id = profile_id) 'name' ,	
	count(profile_id) as `number of likes` 
from likes_posts
group by `name` order by `number of likes` limit 10;