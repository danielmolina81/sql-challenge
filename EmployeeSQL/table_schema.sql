-- TABLE SCHEMA

CREATE TABLE titles(
	title_id VARCHAR(5),
	title VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY (title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR(4),
	dept_name VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY (dept_no)
);

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30)NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries(
	emp_no INT,
	salary INT NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR(4),
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);