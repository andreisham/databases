/* 	
 * 	�������� ������� logs ���� Archive. 
	����� ��� ������ �������� ������ � �������� users, catalogs � products � ������� logs ���������� 
 	����� � ���� �������� ������, �������� �������, ������������� ���������� ����� � ���������� ���� name.
*/

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (  
  created_from VARCHAR(255) COMMENT '�������� �������',
  name VARCHAR(255) COMMENT '��������',
  created_id INT unsigned,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=ARCHIVE;

DELIMITER //

DELIMITER $$
$$
CREATE TRIGGER `user_add` AFTER INSERT ON `users` FOR EACH ROW begin 
	insert into logs (created_from, name, created_id) VALUES ('users', NEW.name, NEW.id);
end $$

CREATE TRIGGER `catalog_add` AFTER INSERT ON `catalogs` FOR EACH ROW begin 
	insert into logs (created_from, name, created_id) VALUES ('catalogs', NEW.name, NEW.id);
end $$

CREATE TRIGGER `product_add` AFTER INSERT ON `products` FOR EACH ROW begin 
	insert into logs (created_from, name, created_id) VALUES ('products', NEW.name, NEW.id);
end $$
DELIMITER ;

