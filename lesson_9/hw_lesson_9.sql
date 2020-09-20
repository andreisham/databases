-- � ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. ����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.

start transaction;
insert into sample.users  select id, name from users where id = 1;
delete from users where id = 1 limit 1;
commit;

-- �������� �������������, ������� ������� �������� name �������� ������� �� ������� products � ��������������� �������� �������� name �� ������� catalogs.

create view names as select 
	p.name as product_name, 
	c.name as category_name
from products p 
	join catalogs c 
	on p.catalog_id = c.id;

select * from names;
	
-- �������� �������� ������� hello(), ������� ����� ���������� �����������, � ����������� �� �������� ������� �����. 

DELIMITER //
DROP FUNCTION IF EXISTS hello//
create function hello ()
returns text deterministic
begin
	case 
		when curtime() between str_to_date('6:00:00', '%H:%i:%s') and str_to_date('11:59:59', '%H:%i:%s')  then return '������ ����!';
		when  curtime()  between str_to_date('12:00:00', '%H:%i:%s')  and str_to_date('17:59:59', '%H:%i:%s')  then return '������ ����!';
		when  curtime()  between str_to_date('18:00:00', '%H:%i:%s')  and str_to_date('23:59:59', '%H:%i:%s')  then return '������ �����!';
		when  curtime()  between str_to_date('00:00:00', '%H:%i:%s')  and str_to_date('05:59:59', '%H:%i:%s')  then return '������ ����!';
	end case;
end//

select hello ();