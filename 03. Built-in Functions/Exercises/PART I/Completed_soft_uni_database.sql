USE `soft_uni`;

# 1. Find Names of All Employees by First Name
SELECT `first_name`, `last_name` 
FROM `employees`
WHERE `first_name` LIKE 'Sa%';

SELECT `first_name`, `last_name` 
FROM `employees`
WHERE SUBSTRING(`first_name`, 1, 2) = 'Sa';

# 2. Find Names of All Employees by Last Name
SELECT `first_name`, `last_name`
FROM `employees`
WHERE `last_name` LIKE '%ei%';

# 3. Find First Names of All Employees
SELECT `first_name` 
FROM `employees`
WHERE `department_id` IN (3, 10) AND (EXTRACT(year FROM `hire_date`) BETWEEN 1995 AND 2005)
ORDER BY `employee_id`;

# 4. Find All Employees Except Engineers
SELECT `first_name`, `last_name`
FROM `employees`
WHERE `job_title` NOT LIKE '%engineer%'; 

# 5. Find Towns with Name Length
SELECT `name` FROM `towns`
WHERE LENGTH(`name`) IN (5, 6)
ORDER BY `name` ASC; 

# 6. Find Towns Starting With
SELECT `town_id`, `name` FROM `towns`
WHERE SUBSTRING(`name`, 1, 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name` ASC;

# 7. Find Towns Not Starting With
SELECT `town_id`, `name` FROM `towns`
WHERE SUBSTRING(`name`, 1, 1) NOT IN ("B", "R", "D")
ORDER BY `name` ASC;

# 8. Create View Employees Hired After 2000 Year
CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`, `last_name` FROM `employees`
WHERE EXTRACT(year FROM `hire_date`) > 2000;
SELECT * FROM `v_employees_hired_after_2000`;

# 9. Length of Last Name
SELECT `first_name`, `last_name`
FROM `employees`
WHERE LENGTH(`last_name`) = 5;
