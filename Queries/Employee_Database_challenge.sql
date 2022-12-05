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


--Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.
--Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
--Exclude those employees that have already left the company by filtering on to_date to keep only those dates that are equal to '9999-01-01'.
--Create a Unique Titles table using the INTO clause.
--Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.

SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title

INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;



--Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:
SELECT * from unique_titles


--Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--First, retrieve the number of titles from the Unique Titles table.
--Then, create a Retiring Titles table to hold the required information.
--Group the table by title, then sort the count column in descending order.

SELECT count(title),
title

into retiring_titles
from unique_titles
group by title
order by count desc

---Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--Before you export your table, confirm that it looks like this image:
select * from retiring_titles
