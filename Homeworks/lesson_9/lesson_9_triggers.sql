-- триггеры

	-- автолайк при репосте
-- создали таблицу для репостов
create table `reposts` (
	`id` bigint unsigned not null auto_increment,
	`post_id` bigint unsigned not null,
	`from_user_id` bigint unsigned not null,
	`to_user_id` bigint unsigned not null,
	`reposted_at` datetime not null default current_timestamp,
	unique key `id` (`id`),
	key `post_id` (`post_id`),
	key `from_user_id` (`from_user_id`),
	key `to_user_id` (`to_user_id`),
	constraint `reposts_ibfk_1` foreign key (`post_id`) references `posts` (`id`),
	constraint `reposts_ibfk_2` foreign key (`from_user_id`) references `users` (`id`),
	constraint `reposts_ibfk_3` foreign key (`to_user_id`) references `users` (`id`)
);

drop trigger if exists like_from_repost;
delimiter //

create trigger like_from_repost
after insert on reposts
for each row 
begin 
	insert into likes_posts (post_id, profile_id, likepage)
	values (new.post_id, new.to_user_id, new.to_user_id);
end //

delimiter ;

	-- обновление пользователя
-- два варианта:
-- 1. вываем ошибку если дата рождения в будущем

drop trigger if exists check_user_age_before_update;
delimiter //

create trigger check_user_age_before_update
before update on users
for each row 
begin 
	if new.birthday >= current_date() then 
		signal sqlstate '45000' set message_text = 'update canseled. birthday in the future!';
	end if;
end //

delimiter ;

-- 2. устанавливаем значение по умолчанию

drop trigger if exists check_user_age_before_update;
delimiter //

create trigger check_user_age_before_update
before update on users
for each row 
begin 
	if new.birthday >= current_date() then 
		set new.birthday = current_date();
	end if;
end //

delimiter ;















