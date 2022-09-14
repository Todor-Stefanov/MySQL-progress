USE diablo;

# 12. Games from 2011 and 2012 Year
SELECT `name`, DATE(`start`) FROM `games`
WHERE EXTRACT(year FROM `start`) IN (2011, 2012)
ORDER BY `start`, `name` LIMIT 50;

# 13. User Email Providers
SELECT `user_name`, SUBSTRING(`email`, POSITION('@' IN `email`)+1, LENGTH(`email`)) AS `email provider`
FROM `users`
ORDER BY `email provider` ASC, `user_name` ASC;

# 14. Get Users with IP Address Like Pattern
SELECT `user_name`, `ip_address` FROM `users`
WHERE `ip_address` LIKE "___.1%.%.___"
ORDER BY `user_name` ASC;


