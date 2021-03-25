-- #2 List the first 10 distinct last name sorted in descending order.
-- Zykh, Zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker, Zuberek, Zschoche, Zongker
SELECT distinct last_name
FROM employees
order by last_name DESC
LIMIT 10;

-- #3 Find all previous or current employees hired in the 90s and born on Christmas.
select *
from employees
where hire_date like '199%' and birth_date like '%-12-25' 
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
select *
from employees
where hire_date like '199%' and birth_date like '%-12-25'
order by hire_date
limit 5;
-- Write a comment in your code that lists the five names of the employees returned.
-- Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner, Petter Stroustrup

-- #4 Update the query to find the tenth page of results.
select *
from employees
where hire_date like '199%' and birth_date like '%-12-25'
order by hire_date
limit 5 offset 50;
-- What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
-- Offset is the number you begin at - on the very next line, (ex) offset 20- starts on 21, 
-- limit is the quantity of returns you want, 
-- page is every "limit quantity" is a new page - (ex) limit is 5, every 5 returns is a new page