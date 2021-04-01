-- #1 Using the example from the lesson, create the employees_with_departments table.
CREATE TEMPORARY TABLE employees_with_departments(
	n INT UNSIGNED NOT NULL);

-- #1a  Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
INSERT INTO employees_with_departments(n) VALUES (1), (2), (3), (4);

ALTER TABLE employees_with_departments ADD first_name VARCHAR(100);
ALTER TABLE employees_with_departments ADD last_name VARCHAR(100);
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);

-- #1b Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = concat(first_name, ' ', last_name);

-- #1c Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

--#1d What is another way you could have ended up with this same table?

