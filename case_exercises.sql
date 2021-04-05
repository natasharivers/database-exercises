-- #1 Write a query that returns all employees (emp_no), their department number, 
-- their start date, their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company and 0 if not.
SELECT *,
	to_date = '9999-01-01' AS is_current_employee
FROM dept_emp;

--OR--

SELECT *,
	CASE to_date
		WHEN '9999-01-01' THEN 1
		ELSE 0
		END AS is_current_employee
FROM dept_emp;

--#2 Write a query that returns all employee names (previous and current), 
--and a new column 'alpha_group' that returns 'A-H', 'I-Q', 
--or 'R-Z' depending on the first letter of their last name.

  SELECT last_name,
 	CASE
 		WHEN last_name BETWEEN 'a%' AND 'i%' THEN 'A_H_last_name'
 		WHEN last_name BETWEEN 'i%'AND 'r%' THEN 'I_Q_last_name'
 		WHEN last_name BETWEEN 'r%' AND 'za%' THEN 'R-Z_last_name'
 		ELSE 'other'
 		END AS alpha_group
 	FROM employees;
 		
-- #3 How many employees (current or previous) were born in each decade? 		
SELECT 
 	CASE
 		WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN 'born_in_1950s'
 		WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN 'born_in_1960s'
 		WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' THEN 'born_in_1970s'
 		ELSE 'other'
 		END AS employees_born_per_decade,
 	count(*) AS count_per_decade
 	FROM employees
 	GROUP BY employees_born_per_decade
 	ORDER BY count_per_decade;
     -- 117,138 born in 1960s
     -- 182,886 born in 1950s
		


