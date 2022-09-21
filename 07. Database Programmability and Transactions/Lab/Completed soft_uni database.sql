USE soft_uni;

# 1. Count Employees By town
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT 
DETERMINISTIC
BEGIN
	DECLARE e_count INT;
	SET e_count := (SELECT COUNT(employee_id) FROM employees AS e
	 JOIN addresses AS a ON a.address_id = e.address_id
	 JOIN towns AS t ON t.town_id = a.town_id
	WHERE t.name = town_name);
	RETURN e_count;
END

# 2. Employee_promotion
DELIMITER $$
CREATE PROCEDURE `usp_raise_salaries`(`department_name` varchar(50))
BEGIN
		SELECT `first_name`, `salary` * 1.05 AS `salary`
        FROM `employees` AS `e`
        JOIN `departments` AS `d` ON `d`.`department_id` = `e`.`department_id`
        WHERE `d`.`name` = `department_name`;
END $$

CALL `usp_raise_salaries`("Finance");

drop procedure `usp_raise_salaries`;

# 3. Employees Promotion
CREATE PROCEDURE `usp_raise_salary_by_id`(`id` INT)
BEGIN 
		START TRANSACTION;
        IF ((SELECT count(`employee_id`) FROM `employees` WHERE `employee_id` like `id`) <> 1 )THEN
        ROLLBACK;
        ELSE
				UPDATE `employees` AS `e`
                SET `salary` = `salary` + `salary` * 0.05
                WHERE `e`.`employee_id` = `id`;
		END IF;
END

# 4. Triggered

CREATE TABLE `deleted_employees`(
	`employee_id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `middle_name` VARCHAR(50),
    `job_title` VARCHAR(50),
    `department_id` INT UNSIGNED,
    `salary` DECIMAL(10, 2)
);

CREATE TRIGGER `tr_deleted_employees`
AFTER DELETE
ON `employees`
FOR EACH ROW
BEGIN
	INSERT INTO `deleted_employees`(`first_name`,`last_name`,`middle_name`, `job_title` , 
    `department_id`,`salary`)
    VALUES(OLD.`first_name`,OLD.`last_name`,OLD.`middle_name`, OLD.`job_title` , 
    OLD.`department_id`,OLD.`salary`);
	
END;
