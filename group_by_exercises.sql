-- #2 In your script, use DISTINCT to find the unique titles in the titles table. 
SELECT DISTINCT title
FROM titles;
-- 7 distinct titles

-- #3 Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY last_name;

-- #4 Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%e'
GROUP BY first_name, last_name;

-- #5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name;
-- Chleq
-- Lindqvist
-- Qiwen

-- #6 Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, count(*)
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
GROUP BY last_name
ORDER BY count(*);

-- #7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY first_name, gender;

-- #8 Using your query that generates a username for all of the employees, generate a count employees for each unique username. 
SELECT count(*) AS total_count, lower(
concat(
substr(first_name, 1, 1), 
substr(last_name, 1,4), 
'_', 
substr(birth_date, 6,2), 
substr(birth_date, 3,2))) 
AS username
FROM employees
GROUP BY username
HAVING total_count > 1;

-- Are there any duplicate usernames? 
-- YES 

--BONUS: How many duplicate usernames are there?
-- 13251