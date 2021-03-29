-- #2 Write a query to to find all employees whose last name starts and ends with 'E'. 
USE employees;
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e';

-- Use concat() to combine their first and last name together as a single column named full_name.
SELECT concat(first_name, last_name) AS full_name FROM employees;

-- #3 Convert the names produced in your last query to all uppercase.
SELECT upper(
concat(first_name, last_name))
AS 'full_name'
FROM employees
where last_name like 'e%e';

--#4 Find all employees hired in the 90s and born on Christmas. 
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25';

--Use datediff() function to find how many days they have been working at the company 
SELECT datediff(now(), hire_date) 
FROM employees

--or 
SELECT datediff(now(), hire_date) 
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'

-- #5 Find the smallest and largest current salary from the salaries table.
SELECT MAX(salary) FROM salaries; --(158220)
SELECT MIN(salary) FROM salaries; --(38623)

--or 

SELECT MAX(salary), min(salary) FROM salaries;

-- #6  Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, 
-- the month the employee was born, and the last two digits of the year that they were born.
select concat(lower(substr(first_name, 1, 1)), lower(substr(last_name, 1,4)), '_', substr(birth_date, 6,2), substr(birth_date, 3,2)) 
as username , first_name, last_name, birth_date
from employees
limit 10;