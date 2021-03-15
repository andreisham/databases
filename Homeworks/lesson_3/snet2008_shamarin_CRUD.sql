-- insert

insert into likes_posts(post_id, user_id) values (2, 41); 
-- select

select * from users limit 5; -- ������� ��� ������ �� ������� users � ������� ������ ������ 5
select * from users limit 3 offset 8; -- ������� 3 ������� � 8��
select surname, name, phone from users; -- ������� ������� ��� � �������
select concat(surname, ' ', name) as list, phone from users; -- ����������� 2� �������� � ����
select surname, name, phone from users where name = 'aut'; -- ������ �� �����

select * from users where id between 38 and 50; -- ���� ����� ��� � select * from users where id >= 38 and id <=50;
select surname, name, hometown from users 
	where hometown in ('Lake Bud', 'Lake Germaine', 'Port Gustaveside'); 

select surname, name from users where surname like 'a%'; -- ��� ������� �� "�"

select surname, name, hometown from users where hometown like '%o%'; -- ��� ������ � ������� ���� ����� "�"

select surname, name from users where surname like 'a__'; -- ����� ������������ �� "�" � ��������� �� 3� ��������

select distinct name from users; -- ������ ������������� �����

select surname from users order by surname; -- ���������� �� ��������

select count(*) from users where gender = 'f';  -- ������� ������ � ������� users

select count(*) from users where gender is null;  -- � �������� �� ������ ���
select count(*) from users where gender is not null;  -- � �������� ������ ���

select gender, count(*) from users group by gender; -- ������� ������, ������ � null

-- update

update friend_requests 
set status = 'approved',
	confirmed_at = now()
where initiator_user_id = 1 and target_user_id = 2;

update users set gender = 'm' -- ����� �� ��� �� ������� ���, ���� ���� gender ����������� �������� ��� ��������� m ��� ���������� f (��� set gender = 'm' or 'f')?
where id > 4;

update users set gender = 'f'
where id > 38 and id < 81;

-- delete 

delete from users where id > 50; -- ������ ������ SQL Error [1451] [23000]: Cannot delete or update a parent row: a foreign key constraint fails (`snet2008_shamarin`.`comments`, CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`))
 
-- ������� � �������

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

