# 0. Create Database
CREATE SCHEMA minions;

# 1. Create Tables
USE minions;

CREATE TABLE minions(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
age INT(3)
);

CREATE TABLE towns(
town_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50)
);

# 2. Alter Minions Table
ALTER TABLE minions ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY minions(town_id)
REFERENCES towns(id);

# 3. Insert Records in Both Tables
INSERT INTO towns(id, name) VALUES (1, "Sofia"), (2, "Plovdiv"), (3, "Varna");  

INSERT INTO minions(id, name, age, town_id) VALUES (1, "Kevin", 22, 1);
INSERT INTO minions(id, name, age, town_id) VALUES (2, "Bob", 15, 3);
INSERT INTO minions(id, name, age, town_id) VALUES(3, "Steward", NULL, 2);

# 4. Truncate Table Minions
TRUNCATE TABLE minions;

# 5. Drop All Tables 
DROP TABLE minions;
DROP TABLE towns;

# 6. Create Table People

CREATE TABLE people(
id INT AUTO_INCREMENT, 
name VARCHAR(200) NOT NULL,
picture BLOB,
height DOUBLE(10, 2),
weight DOUBLE(10, 2),
gender CHAR(1) NOT NULL,
birthdate DATE NOT NULL,
biography TEXT,
PRIMARY KEY(id)
);

INSERT INTO people(name, gender, birthdate) 
VALUES
('Peter', 'm', DATE(NOW())),
('Mark', 'm', DATE(NOW())),
('Diana', 'f', DATE(NOW())),
('Marta', 'f', DATE(NOW())),
('Ivan', 'f', DATE(NOW()));

# 7. Create Table Users

CREATE TABLE users(
id BIGINT AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture BLOB,
last_login_time TIME,
is_deleted BOOLEAN,
CONSTRAINT pk_users
PRIMARY KEY users(id)
);

INSERT INTO users(username, password)
VALUES
('Test1', 'Pass1'),
('Test2', 'Pass2'),
('Test3', 'Pass3'),
('Test4', 'Pass4'),
('Test5', 'Pass5');

# 8. Change Primary Key
ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users2
PRIMARY KEY users (id, username);

# 9. Set Default Value of a Field
ALTER TABLE users
CHANGE COLUMN last_login_time 
last_login_time DATETIME DEFAULT NOW();

# 10. Set Unique Field
ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY users(id);

ALTER TABLE users
CHANGE COLUMN username
username VARCHAR(50) UNIQUE;

# 11. Movies Database
CREATE SCHEMA movies;
USE movies;

CREATE TABLE directors(
id INT AUTO_INCREMENT PRIMARY KEY,
director_name VARCHAR(50) NOT NULL,
notes TEXT
);

INSERT INTO directors (director_name, notes)
VALUES
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');


CREATE TABLE genres(
id INT AUTO_INCREMENT PRIMARY KEY,
genre_name VARCHAR(50) NOT NULL,
notes TEXT
);

INSERT INTO genres(genre_name, notes)
VALUES
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
notes TEXT
);

INSERT INTO categories(category_name, notes)
VALUES
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');

CREATE TABLE movies(
id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(50) NOT NULL,
director_id INT,
copyright_year INT,
length INT,
genre_id INT,
category_id INT,
rating DOUBLE,
notes TEXT
);

INSERT INTO movies(title)
VALUES
('TestName1'),
('TestName2'),
('TestName3'),
('TestName4'),
('TestName5');

# 12. Car Rental Database
CREATE SCHEMA car_rental;
USE car_rental;

CREATE TABLE categories(
id INT AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(20),
daily_rate DOUBLE,
weekly_rate DOUBLE,
monthly_rate DOUBLE,
weekend_rate DOUBLE
);

INSERT INTO categories(category)
VALUES
('TestCateg1'),
('TestCateg2'),
('TestCateg3');

CREATE TABLE cars(
id INT AUTO_INCREMENT PRIMARY KEY,
plate_number VARCHAR(20),
make VARCHAR(20),
model VARCHAR(20),
car_year INT,
category_id INT,
doors INT,
picture BLOB,
car_condition VARCHAR(20),
available BOOLEAN
);
INSERT INTO cars(make)
VALUES
('Make1'),
('Make2'),
('Make3');

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
title VARCHAR(50),
notes TEXT
);

INSERT INTO employees(first_name)
VALUES
('Name1'),
('Name2'),
('Name3');

CREATE TABLE customers(
id INT AUTO_INCREMENT PRIMARY KEY,
driver_licence VARCHAR(20),
full_name VARCHAR(50),
address VARCHAR(50),
city VARCHAR(20),
zip_code VARCHAR(10),
notes TEXT
);

INSERT INTO customers(full_name)
VALUES
('Name1'),
('Name2'),
('Name3');

CREATE TABLE rental_orders(
id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT,
customer_id INT,
car_id INT,
car_condition VARCHAR(50),
tank_level VARCHAR(20),
kilometrage_start INT,
kilometrage_end INT, 
total_kilometrage INT,
start_date DATE,
end_date DATE,
total_days INT,
rate_applied DOUBLE,
tax_rate DOUBLE,
order_status VARCHAR(100),
notes TEXT
);

INSERT INTO rental_orders(car_condition)
VALUES
("GOOD1"),
("GOOD2"),
("GOOD3");

# 13.	Basic Insert

CREATE SCHEMA soft_uni;
USE soft_uni;

CREATE TABLE towns(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE addresses(
id INT AUTO_INCREMENT PRIMARY KEY,
address_text VARCHAR(100) NOT NULL,
town_id INT
);

CREATE TABLE departments(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE employees(
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
middle_name VARCHAR(50),
last_name VARCHAR(50) NOT NULL,
job_title VARCHAR(45),
department_id INT NOT NULL,
hire_date DATE,
salary DECIMAL(19,2),
address_id INT,
CONSTRAINT fk_employees_departments
FOREIGN KEY employees(department_id)
REFERENCES departments(id),

CONSTRAINT fk_employees_addresses
FOREIGN KEY employees(address_id)
REFERENCES addresses(id)
);

INSERT INTO towns(name)
VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');

INSERT INTO departments(name)
VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT employees(first_name, middle_name, last_name, job_title,department_id, hire_date, salary)
VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);


# 14. Basic Select All Fields
SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;

# 15. Basic Select All Fields and Order Them
SELECT * FROM towns
ORDER BY name;
SELECT * FROM departments
ORDER BY name;
SELECT * FROM employees
ORDER BY salary DESC;

# 16. Basic Select Some Fields 
SELECT name FROM towns;
SELECT name FROM departmetns;
SELECT first_name, last_name, job_title, salary 
FROM employees;

# 17. Increase Employees Salary
UPDATE employees
SET salary = salary * 1.1;
SELECT salary FROM employees;

# 18. Delete All Records
TRUNCATE TABLE occupancies;
