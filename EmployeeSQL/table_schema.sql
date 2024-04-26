DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS titles;

CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL UNIQUE
);
	
CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30)NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries(
	emp_no INT UNIQUE REFERENCES employees(emp_no),
	salary INT NOT NULL
);

CREATE TABLE department(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE dept_emp(
	emp_no INT REFERENCES employees(emp_no),
	dept_no VARCHAR(4) REFERENCES department(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) REFERENCES department(dept_no),
	emp_no INT UNIQUE REFERENCES employees(emp_no)
);
