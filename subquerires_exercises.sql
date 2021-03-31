-- #1 Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT *
FROM employees
WHERE hire_date = (
	SELECT hire_date
	FROM employees
	WHERE emp_no = '101010');
-- 69 returns

-- #2 Find all the titles ever held by all current employees with the first name Aamod.
SELECT * 
FROM titles
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod' AND to_date > now()); 
-- 168 returns

-- #3 How many people in the employees table are no longer working for the company? 
SELECT * 
FROM dept_emp
WHERE emp_no IN(
	SELECT emp_no
	FROM employees
	WHERE to_date < now());
-- 91479 employees no longer working for the company

-- #4 Find all the current department managers that are female. 
-- List their names in a comment in your code.
SELECT *
FROM employees
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > now() AND gender = 'F');
-- 4 current Female managers
-- Names: Hilary Kambil, Isamu Legleitner, Karsten Sigstam, Leon DasSarma

-- #5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.
-- historical average
	SELECT AVG(salary)
	FROM salaries
	WHERE to_date != '9999-01-01'

SELECT count(emp_no)
FROM salaries
WHERE salary >
	(SELECT AVG(salary)
	FROM salaries
	WHERE to_date != '9999-01-01')
	AND to_date = '9999-01-01';
-- 158675 employees with a salary greater then the historical average

-- #6 How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?
SELECT MAX(salary) 
FROM salaries
WHERE to_date = '9999-01-01'; -- finds current max salary

SELECT count(emp_no) AS employees_within_one_SD
FROM salaries
WHERE salary > (
	SELECT max(salary) - stddev(salary)
	FROM salaries
	WHERE to_date = '9999-01-01')
		AND  to_date = '9999-01-01' 
-- 83 employees within one Standard Dev of max salary
