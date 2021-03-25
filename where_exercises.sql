-- #2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
-- 709 returns
select *
from employees
where first_name in ('Irena', 'Vidya', 'Maya')

-- #3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- 709 returns
select *
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';

-- #4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
-- 1080241 returns
select *
from employees
where first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya'
	or gender = 'M';

-- #5 Find all current or previous employees whose last name starts with 'E'. 
-- 7330 returns (starts wtith E)
select *
from employees
where last_name like 'e%';

-- #6 Find all current or previous employees whose last name starts or ends with 'E'. 
-- 30723 returns (starts or ends with E)
select *
from employees
where last_name like 'e%'
	or last_name like '%e';

-- #6 Part 2: How many employees have a last name that ends with E, but does not start with E?
-- 23393 (end with E, do not start with E)
select *
from employees
where last_name like '%e'
	and last_name not like 'e%';

-- #7 Find all current or previous employees employees whose last name starts and ends with 'E'. 
-- 899 returns (start and end with E)
select *
from employees
where last_name like 'e%'
	and last_name like '%e';

-- #7 Part 2: How many employees' last names end with E, regardless of whether they start with E?
-- 24292 returns
select *
from employees
where last_name like '%e';


-- #8 Find all current or previous employees hired in the 90s.
-- 135214 returns
select *
from employees
where hire_date like '199%-%-%';

-- #9 Find all current or previous employees born on Christmas
-- 842 returns
select *
from employees
where birth_date like '%-12-25';

-- #10 Find all current or previous employees hired in the 90s and born on Christmas.
-- 362 returns
select *
from employees
where birth_date like '%-12-25'
	and hire_date like '199%-%-%';

-- #11 Find all current or previous employees with a 'q' in their last name.
-- 1873 returns
select *
from employees
where last_name like '%q%';

-- #12 Find all current or previous employees with a 'q' in their last name but not 'qu'
--  547 returns
select *
from employees
where last_name like '%q%' 
	and last_name not like '%qu%';
