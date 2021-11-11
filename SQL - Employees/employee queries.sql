SELECT e.emp_no AS "Employee No.",
e.last_name AS "Last Name",
e.first_name AS "First Name",  
e.sex, 
s.salary 
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY "Employee No.";

-- Query 2: Generate list of employees who were hired in 1986 with first name, last name and hire date
SELECT first_name AS "First Name", 
last_name AS "Last Name", 
hire_date AS "Hire Date"
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY "Hire Date"; 

-- Query 3: Generate list of manager for each department
-- with Department No, Department Name First Name, Employee No, Last Name

-- Use Nested Inner Join
SELECT dm.dept_no AS "Department No", 
d.dept_name AS "Department", 
e.emp_no AS "Employee No", 
e.last_name AS "Last Name",
e.first_name AS "First Name"
FROM employees AS e
INNER JOIN department_manager AS dm
ON dm.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = dm.dept_no;

-- Query 4: List all employees with their Department Name, First Name, Last Name & Employee No 

-- Use Nested Inner Join
SELECT d.dept_name AS "Department", 
e.emp_no AS "Employee No", 
e.first_name AS "First Name", 
e.last_name AS "Last Name"
FROM employees AS e
INNER JOIN department_employee AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
ORDER BY e.emp_no;

-- Query 5: List all employees with their first name, last name & sex
-- where first name is "Hercules" and last name starts with "B" 
SELECT first_name AS "First Name", 
last_name AS "Last Name", 
sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY "Last Name";

-- Query 6: List all employees in Sales Department 
-- with their employee no, last name, first name & department name

-- Drop View if already created
DROP VIEW dept_name_employee;

-- Create a View which is a merge table with employee no and department name
CREATE VIEW dept_name_employee AS
SELECT de.emp_no, d.dept_name
FROM department_employee AS de
INNER JOIN departments as d
ON de.dept_no = d.dept_no;

-- Join employees table with the dept_name_employee view to find all employees in Sales department
SELECT e.emp_no AS "Employee No", 
e.last_name AS "Last Name", 
e.first_name AS "First Name",
dne.dept_name AS "Department"
FROM employees AS e
INNER JOIN dept_name_employee AS dne
ON e.emp_no = dne.emp_no
WHERE dne.dept_name = 'Sales';

-- Query 7: List all employees in Sales & Development Department 
-- with their employee no, last name, first name & department name

-- Join employee table with the dept_name_employee view to find all employees in Sales & Development department 
SELECT e.emp_no AS "Employee No", 
e.last_name AS "Last Name", 
e.first_name AS "First Name",
dne.dept_name AS "Department"
FROM employees AS e
INNER JOIN dept_name_employee AS dne
ON e.emp_no = dne.emp_no
WHERE dne.dept_name IN ('Sales', 'Development');

-- Query 8: List no. of employees (count) with same last name in descending order 
SELECT * FROM employees;
SELECT last_name AS "Last Name", 
COUNT(last_name) AS "No. of employees" 
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

-- Epilogue: Search name for employee id = 499942
SELECT first_name AS "First Name",
last_name AS "Last Name"
FROM employees
WHERE emp_no = 499942;