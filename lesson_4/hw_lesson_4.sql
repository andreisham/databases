-- ������������ ������� �� ���� ����������, ����������, ���������� � �����������
-- 1. ������� ���� �������� � ���������� ������������� ������� �����

update users 
	set created_at = now(),
	updated_at = now(); 
	
-- 2. �������� ��� ������ � varchar �� datetime � ����������� ������

-- 2.1 ������ ������� � �������� ��

alter table users modify created_at varchar(100) not null;
alter table users modify updated_at varchar(100) not null;

-- 2.2 ������� ��� ������ � varchar �� datetime � ����������� ������

alter table users modify created_at DATETIME DEFAULT CURRENT_TIMESTAMP;
alter table users modify updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 3. ���������� �������� �������� �� �����������, �� ���� 0 ������ ��� �����

select value from storehouses_products
	order by if (value > 0, 1, 0) desc, -- �� ������ ����� ��� �������� ��� ���������, �� ��� ��������.. � ������� �� ������� ����� ����� ��� ������ �������
	value asc;

-- ������������ ������� ���� ���������� �������
-- 1. ������� ������� ������������� � ������� users

select avg(TIMESTAMPDIFF(year, birthday_at, now())) as average_age from users;

-- 2.���������� ���� ��������, ������������ �� ������ �� ���� ������

select 
	count(*) AS total,  
	dayname(birthday_at) as daynames from  users
	group by daynames;
