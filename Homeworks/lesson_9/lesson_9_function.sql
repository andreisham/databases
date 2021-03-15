-- функции

	-- соотношение отправленных и полученныйх приглашений в друзья

drop function if exists friendship_direction;
delimiter //

create function friendship_direction(check_user_id int)
returns float reads sql data
begin
	declare requests_to_user int;
	declare requests_from_user int;
	-- получить из запроса значение в переменную (способ 1)
	set requests_to_user = (select count(*) from friend_requests where target_user_id = check_user_id);
	-- получить из запроса значение в переменную (способ 2)
	select count(*) into requests_from_user from friend_requests where initiator_user_id = check_user_id;
	return requests_to_user / requests_from_user;
	
end //

delimiter ;

select friendship_direction(1);