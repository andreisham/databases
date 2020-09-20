-- вывод результатов поиска пользователей

select 
	name,
	surname,
	hometown,
	file
from users u 
	join photos p 
	on u.photo_id = p.id;
	
-- пользователи которые состоят в группе

select 
	u.name,
	u.surname,
	c.name as community_name
from users_communities uc 
	join communities c 
	on uc.community_id = c.id 
	join users u 
	on uc.user_id = u.id
where c.name = 'Московская олимпиада по информатике';

-- заявки в друзья (входящие/исходящие/чс)

select 
	initiator_user_id,
	name,
	surname
from friend_requests fr
	join users u 
	on fr.initiator_user_id = u.id 
where target_user_id = 1 and status = 'requested'; -- входящие

select 
	target_user_id,
	name,
	surname
from friend_requests fr
	join users u 
	on fr.target_user_id = u.id 
where initiator_user_id = 1 and status = 'requested'; -- исходящие

select 
	initiator_user_id,
	name,
	surname
from friend_requests fr
	join users u 
	on fr.initiator_user_id = u.id 
where target_user_id = 1 and status = 'declined'; -- чс

-- выборка постов пользователя с комментариями и комментаторами

select 
	p.body as posts,
	p.created_at as post_created,
	c.body as comment,
	c.created_at as comment_created,
	u.name,
	u.surname 
from posts p
	left join comments c 
	on p.id = c.post_id 
	join users u 
	on c.user_id = u.id 
where p.user_id = 1
order by post_created, comment_created;

-- переписка пользователя 1 c 17

select 
	m.id,
	u1.name,
	u1.surname,
	m.body as message,
	m.created_at,
	u2.name,
	u2.surname
	
from messages m 
	join users u1 
	on m.from_user_id = u1.id
	join users u2
	on m.to_user_id = u2.id 
where from_user_id in (1, 17) and to_user_id in (1, 17); 

-- непрочитанные сообщения, адресованные пользователю 1

select 
	concat(name, ' ', surname) as message_from,
	count(*) as unread_msg
from messages m 
	join users u 
	on m.from_user_id = u.id
where m.to_user_id = 1 and m.is_read = 0
group by m.from_user_id order by unread_msg desc ;

--  друзья пользователя 

select 
	name,
	surname
from (select
	case 
		when initiator_user_id = 1 and status = 'approved' then target_user_id
		when target_user_id = 1 and status = 'approved' then initiator_user_id
	end 
	as friend_id
from friend_requests) as friends
	join users u 
	on friends.friend_id = u.id;

-- количество друзей у пользователя с сортировкой

select 
	u.name,
	u.surname,
	count(*) total_friends
from friend_requests fr 
	join users u 
	on (fr.initiator_user_id = u.id or fr.target_user_id = u.id)
where fr.status = 'approved'
group by u.id
order by total_friends desc ;
























