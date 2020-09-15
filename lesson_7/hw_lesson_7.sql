-- ��������� ������ ������������� users, ������� ����������� ���� �� ���� ����� orders � �������� ��������

select
	(select name from users where id = user_id) as 'at_least_1_order'
from orders group by user_id;
	
-- �������� ������ ������� products � �������� catalogs, ������� ������������� ������

select 
		name, 
		price, 
		(select name from catalogs c where id = catalog_id) as 'category'
from products p;

