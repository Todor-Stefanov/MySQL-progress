USE `soft_uni`;
# 1. Employee Address
SELECT `e`.`employee_id`, `e`.`job_title`,
`e`.`address_id`, `a`.`address_text`
FROM `employees` AS `e`
JOIN `addresses` AS `a`
ON `e`.`address_id` = `a`.`address_id`
ORDER BY `address_id` LIMIT 5;

# 2. Addresses with Towns
SELECT `e`.`first_name`, `e`.`last_name`,
`t`.`name` AS `town`, `a`.`address_text`
FROM `employees` AS `e`, `addresses`AS `a`
JOIN `towns` AS `t`
ON `a`.`town_id` = `t`.`town_id`
WHERE `e`.`address_id` = `a`.`address_id`
ORDER BY `first_name`, `last_name` LIMIT 5;

# 3. Sales Employee
SELECT `e`.`employee_id`, `e`.`first_name`, `e`.`last_name`,
`d`.`name` AS `department_name`
FROM `employees` AS `e`
JOIN `departments` AS `d`
ON `e`.`department_id` = `d`.`department_id`
WHERE `d`.`name` = 'Sales'
ORDER BY `employee_id` DESC;

# 4. Employee Departments
SELECT `employee_id`, `first_name`,
`salary`, `d`.`name`AS `department_name`
FROM `employees` AS `e`
JOIN `departments` AS `d`
ON `e`.`department_id` = `d`.`department_id`
WHERE `e`.`salary` > 15000
ORDER BY `e`.`department_id` DESC LIMIT 5;

# 5. Employees Without Project
SELECT `e`.`employee_id`, `e`.`first_name`
FROM `employees` AS `e`
LEFT JOIN `employees_projects` AS `e_p`
ON `e`.`employee_id` = `e_p`.`employee_id`
WHERE `e_p`.`employee_id` IS NULL
ORDER BY `e`.`employee_id` DESC LIMIT 3;

# 6. Employees Hired After
SELECT `e`.`first_name`, `e`.`last_name`,
`e`.`hire_date`, `d`.`name` AS `dept_name`
 FROM `employees` AS `e`
 JOIN `departments` AS `d`
 ON `e`.`department_id` = `d`.`department_id`
 WHERE DATE(`e`.`hire_date`) > '1999-01-01'
 AND `d`.`name` IN ('Sales', 'Finance')
 ORDER BY `hire_date`; 
 
 # 7. Employees with project
 SELECT `e`.`employee_id`, `e`.`first_name`,
 `p`.`name` AS `project_name`
 FROM `employees` AS `e`, `projects` AS `p`
 JOIN `employees_projects` AS `e_p`
 ON `e_p`.`project_id` = `p`.`project_id`
 WHERE `e_p`.`employee_id` = `e`.`employee_id`
 AND DATE(`p`.`start_date`) > '2002-08-13'
 AND `p`.`end_date` IS NULL
 ORDER BY `e`.`first_name`, `project_name` LIMIT 5;
 
 # 8. Employee 24
 SELECT `e`.`employee_id`,
 `e`.`first_name`, IF(YEAR(`p`.`start_date`)>=2005, `p`.`name` = NULL, `p`.`name`)  AS `project_name`
 FROM `employees` AS `e`, `projects` AS `p`
 JOIN `employees_projects` AS `e_p`
 ON `p`.`project_id` = `e_p`.`project_id`
 WHERE `e`.`employee_id` = `e_p`.`employee_id`
 AND `e`.`employee_id` = 24
 ORDER BY `project_name`;
 
 # 9. Employee Manager
 SELECT `e`.`employee_id`,`e`.`first_name`,
 `e`.`manager_id`, `m`.`first_name` AS `manager_name`
 FROM `employees` AS `e`
JOIN `employees` AS `m`
 ON `m`.`employee_id` = `e`. `manager_id`
WHERE `e`.`manager_id` IN (3, 7)
ORDER BY `e`.`first_name`;
 
# 10. Employee Summary
SELECT `e`.`employee_id`,
CONCAT(`e`.`first_name`, ' ', `e`.`last_name`) AS `employee_name`,
CONCAT(`m`.`first_name`, ' ', `m`.`last_name`) AS `manager_name`,
`d`.`name` AS `department_name`  
FROM `employees` AS `e`
JOIN `employees` AS `m`
ON `e`.`manager_id` = `m`.`employee_id`

JOIN `departments` AS `d`
ON `e`.`department_id` = `d`.`department_id`	

WHERE `e`.`manager_id` IS NOT NULL
ORDER BY `e`.`employee_id` LIMIT 5;

# 11. Min Average Salary
SELECT MIN(`avg_sal`) AS `min_average_salary`
FROM (SELECT AVG(`salary`) AS `avg_sal`
		FROM `employees` 
		GROUP BY `department_id`
		) `x`;


USE geography;

# 12. Highest Peaks in Bulgaria
SELECT `m_c`.`country_code`, `m`.`mountain_range`, 
`p`.`peak_name`, `p`.`elevation`
FROM `peaks` AS `p`
JOIN `mountains` AS `m`
ON `m`.`id` = `p`.`mountain_id`

JOIN `mountains_countries` AS `m_c`
ON `m_c`.`mountain_id` = `m`.`id`
WHERE `p`.`elevation` > 2835 
AND `m_c`.`country_code` = 'BG'
ORDER BY `p`.`elevation` DESC; 

# 13. Count Mountain Ranges
SELECT `m_c`.`country_code`,
		COUNT(`m`.`mountain_range`) AS `mountain_range`
FROM `mountains_countries` AS `m_c`
JOIN `mountains` AS `m`
ON `m`.`id` = `m_c`.`mountain_id`
WHERE `m_c`.`country_code` IN ('BG', 'RU', 'US')
GROUP BY `m_c`.`country_code`		
ORDER BY `mountain_range` DESC;

# 14. Countires with rivers
SELECT `c`.`country_name`, `r`.`river_name`
FROM `countries` AS `c`

LEFT JOIN `countries_rivers` AS `c_r`
ON `c_r`.`country_code` = `c`.`country_code`

LEFT JOIN `rivers` AS `r` 
ON `c_r`.`river_id` = `r`.`id` 

JOIN `continents` AS `con`
ON `con`.`continent_code` = `c`.`continent_code`

WHERE `con`.`continent_name` = 'Africa' 

ORDER BY `c`.`country_name` LIMIT 5;

# 16. Countries without any mountains
SELECT COUNT(`c`.`country_code`) AS `country_count`
FROM `countries` AS `c`
LEFT JOIN `mountains_countries` AS `m_c`
ON `m_c`.`country_code` = `c`.`country_code`
WHERE `m_c`.`country_code` IS NULL;

# 17. Highest Peak and Longest River by Countnry
SELECT `c`.`country_name`, MAX(`p`.`elevation`) AS `highest_peak_elevation`,
MAX(`r`.`length`) AS `longest_river_length`
FROM `countries` AS `c`

LEFT JOIN `mountains_countries` AS `m_c`
ON `m_c`.`country_code` = `c`.`country_code`

LEFT JOIN `peaks` AS `p`
ON 	`m_c`.`mountain_id` = `p`.`mountain_id`
 
LEFT JOIN `countries_rivers` AS `c_r`
ON `c_r`.`country_code` = `c`.`country_code`

LEFT JOIN `rivers` AS `r`
ON `c_r`.`river_id` = `r`.`id`

GROUP BY `c`.`country_name`
ORDER BY `highest_peak_elevation` DESC, `longest_river_length` DESC
 LIMIT 5;
