--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
--Create a new table using the INTO clause.
--Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date

INTO retirement_titles

FROM employees e
LEFT JOIN titles t on (e.emp_no = t.emp_no)

where e.birth_date >= '1952-01-01' and e.birth_date <='1955-12-31'

order by e.emp_no 

--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:

SELECT * from retirement_titles



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

