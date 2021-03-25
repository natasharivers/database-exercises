-- #2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. (709 returns)
-- What was the first and last name in the first row of the results? Irena Reutenauer
-- What was the first and last name of the last person in the table? Vidya Simmen
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
	order by first_name,

-- #3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. (709 returns) 
-- What was the first and last name in the first row of the results? Irena Acton
-- What was the first and last name of the last person in the table? Vidya Zweizig
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
	order by first_name, last_name;

-- #4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name.  (709 Returns)
-- What was the first and last name in the first row of the results? Acton, Irene
-- What was the first and last name of the last person in the table? Zweizig, Vidya
select first_name, last_name
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
	order by last_name, first_name;

-- #5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
-- the number of employees returned (899 returns)
-- the first employee number and their first and last name (10021- Erde)
-- the last employee number with their first and last name (499648- Erde)
select last_name, emp_no
from employees
where last_name like 'e%'and last_name like '%e'
	order by emp_no;

-- #6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. 
-- the number of employees returned (899 returns)
-- the name of the newest employee, (Teiji Eldridge in 1999-11-27)
-- the name of the oldest emmployee. (Sergi Erde in 1985-02-02)
select first_name, last_name, hire_date
from employees
where last_name like 'e%' and last_name like '%e'
	order by hire_date DESC;

-- #7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 
-- the number of employees returned (362 returns)
-- the name of the oldest employee who was hired last (Khun Bernini)
-- the name of the youngest emmployee who was hired first (Douadi Pettis)
select first_name, last_name, hire_date, birth_date 
from employees
where hire_date like '199%' and birth_date like '%-12-25'
	order by birth_date , hire_date DESC;