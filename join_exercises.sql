-- JOIN EXAMPLE DATABASE

-- #2 Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
-- Before you run each query, guess the expected number of results.
SELECT *
FROM users
JOIN roles ON users.role_id = roles.id

SELECT *
FROM users
left JOIN roles ON users.role_id = roles.id

SELECT *
FROM users
right JOIN roles ON users.role_id = roles.id

-- #3 Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role. 
-- Hint: You will also need to use group by in the query.
SELECT count(*), roles.name
FROM users
JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

-- EMPLOYEES DATABASE

-- #2 Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name AS Department_Name, CONCAT(first_name, ' ', last_name) AS Deptarment_Manager 
FROM departments
    JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
    JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date LIKE '9999%'
ORDER BY dept_name;


-- #3 Find the name of all departments currently managed by women.
SELECT dept_name AS Department_Name, CONCAT(first_name, ' ', last_name) AS Manager_Name
FROM departments
	JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
	JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date LIKE '9999%' AND gender LIKE 'F'
ORDER BY Department_Name;

-- #4 Find the current titles of employees currently working in the Customer Service department.
SELECT title AS Title, count(*) AS Count
FROM departments
    JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
    JOIN employees ON dept_emp.emp_no = employees.emp_no
    OIN titles ON employees.emp_no = titles.emp_no
WHERE dept_name LIKE 'Customer Service' AND dept_emp.to_date LIKE '9999%' AND titles.to_date LIKE '9999%'
GROUP BY title;

-- #5 Find the current salary of all current managers
SELECT dept_name AS Department_Name, CONCAT(first_name, ' ', last_name) AS Manager_Name, salary AS Salary
FROM departments
    JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
    JOIN employees ON dept_manager.emp_no = employees.emp_no
    JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
ORDER BY dept_name;

-- #6 Find the number of current employees in each department.
SELECT dept_emp.dept_no,dept_name, count(*) AS num_employees
FROM dept_emp
    JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date LIKE '9999%' 
GROUP BY dept_emp.dept_no, dept_name

-- #7 Which department has the highest average salary? 
-- Hint: Use current not historic information.
SELECT dept_name, AVG(salary) AS average_salary
FROM departments
	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
	JOIN employees ON dept_emp.emp_no = employees.emp_no
	JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE dept_emp.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- #8 Who is the highest paid employee in the Marketing department?
SELECT first_name, last_name
FROM salaries
	JOIN employees ON salaries.emp_no = employees.emp_no
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name LIKE 'Marketing'
ORDER BY salary DESC
LIMIT 1;

-- #9 Which current department manager has the highest salary?
SELECT first_name, last_name, salary, dept_name
FROM salaries
	JOIN employees ON salaries.emp_no = employees.emp_no
	JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
	JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date LIKE '9999%' AND salaries.to_date LIKE '9999%'
ORDER BY salary DESC
LIMIT 1;

-- #10 Bonus Find the names of all current employees, 
-- their department name, and their current manager's name.
/*  SELECT concat(first_name, ' ', last_name) AS Employee_Name, dept_name AS Department_Name, dept_manager AS Manager_Name
FROM employees
    JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN departments ON dept_emp.dept_no = departments.dept_no
	JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
WHERE dept_emp.to_date LIKE '9999%' 
GROUP BY Employee_Name, dept_name, Manager_Name
/*

