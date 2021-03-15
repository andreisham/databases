-- хранимые процедуры

	-- рекомендации в друзья

drop procedure if exists friendship_offers;
delimiter //

create procedure friendship_offers(in for_user_id int )
begin
	-- общий город
	select u2.id
	from users u1
	join users u2
		on u1.hometown = u2.hometown
	where u1.id = for_user_id
	and u2.id <> for_user_id
	union
	-- общие группы
	select distinct uc2.user_id
	from users_communities uc1
	join users_communities uc2
		on uc1.community_id = uc2.community_id 
	where uc1.user_id = for_user_id
	and uc1.user_id <> uc2.user_id 
	union 
	-- друзья друзей
	select target_user_id from friend_requests fr1
	right join
	(select * from (select
		case
			when initiator_user_id = for_user_id and status = 'approved' then target_user_id
			when target_user_id = for_user_id and status = 'approved' then initiator_user_id
		end as friend_id
		from friend_requests) friends_ids where friend_id  is not null) fr2
		on fr1.initiator_user_id = fr2.friend_id
		where target_user_id <> for_user_id
		union
	select initiator_user_id from friend_requests fr3
	right join
	(select * from (select
		case
			when initiator_user_id = for_user_id and status = 'approved' then target_user_id
			when target_user_id = for_user_id and status = 'approved' then initiator_user_id
		end as friend_id
		from friend_requests) friends_ids where friend_id  is not null) fr4
		on target_user_id = friend_id
		where initiator_user_id <> for_user_id
	order by rand()
	limit 5;
	
end //
delimiter ;

call friendship_offers(1);	
	
	
	
	
	
	
	
	
	
	
	
	