USE `geography`;

# 10. Countries Holding 'A' 3 or More Times
SELECT `country_name`, `iso_code`
FROM `countries`
WHERE (LENGTH(`country_name`) - LENGTH(REPLACE(`country_name`, 'a', ''))) + 
 (LENGTH(`country_name`) - LENGTH(REPLACE(`country_name`, 'A', ''))) >= 3
ORDER BY `iso_code` ASC;

# 11. Mix of Peak and River Names
SELECT `peak_name`, `river_name`,
CONCAT(LOWER( SUBSTRING( `peak_name`,1, (LENGTH(`peak_name`)-1) ) ), LOWER(`river_name`)) AS `mix` 
FROM `peaks`, `rivers`
WHERE RIGHT(`peak_name`, 1) = LEFT(`river_name`, 1)
ORDER BY `mix` ASC;