DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
 
CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(50) NOT NULL,
	PRIMARY KEY (title_id)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);
	
CREATE TABLE salaries(
	emp_no INT NOT NULL, 
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,		
	emp_no INT NOT NULL,				
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);


CREATE TABLE dept_emp(
	emp_no INT NOT NULL, 			
	dept_no VARCHAR(4) NOT NULL, 	
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMAry KEY (emp_no, dept_no)
);

SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees LIMIT(100);
SELECT * FROM salaries LIMIT(100);
SELECT * FROM dept_manager;
SELECT * FROM dept_emp LIMIT(100);
	hire_date VARCHAR (30) NOT NULL
);