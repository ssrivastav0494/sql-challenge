

-- Create titles table
CREATE TABLE IF NOT EXISTS titles (
	title_id VARCHAR(10) NOT NUll PRIMARY KEY,
	title VARCHAR(30) NOT NULL);

-- Import and view table
SELECT * FROM titles;

-- Create departments table
CREATE TABLE IF NOT EXISTS departments (
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL);

-- Import and view table
SELECT * FROM departments;

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id));

-- Import and view table
SELECT * FROM employees;

--Create salaries table
CREATE TABLE IF NOT EXISTS salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	PRIMARY KEY (emp_no, salary),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no));

-- Import and view table
SELECT * FROM salaries;

--Create department employee table
CREATE TABLE IF NOT EXISTS department_employee (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no));

-- Import and view table
SELECT * FROM department_employee;

--Create department_manager table
CREATE TABLE IF NOT EXISTS department_manager (
	dept_no VARCHAR(10) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no));

-- Import and view table
SELECT * FROM department_manager;

