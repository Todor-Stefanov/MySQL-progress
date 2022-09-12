CREATE DATABASE gamebar;
USE gamebar;

CREATE TABLE  employees(
	id INT AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
); 

CREATE TABLE  categories(
	id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
); 

CREATE TABLE  products(
	id INT AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	category_id INT NOT NULL,
	PRIMARY KEY(id)
); 

INSERT INTO employees(id, first_name, last_name) VALUES (1, 'Test1', 'Test1');
INSERT INTO employees(id, first_name, last_name) VALUES (2, 'Test2', 'Test2');
INSERT INTO employees(id, first_name, last_name) VALUES (3, 'Test3', 'Test3');

ALTER TABLE employees ADD COLUMN middle_name VARCHAR(50) NOT NULL AFTER first_name;
ALTER TABLE products ADD FOREIGN KEY (category_id) REFERENCES categories(id);
ALTER TABLE employees MODIFY COLUMN middle_name VARCHAR(100);CREATE DATABASE gamebar;

