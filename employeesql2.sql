--list employee details: employee number, last name, first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no = s.emp_no;

--list first name, last name, and hire date for employees hired in year specified
SELECT first_name, last_name, hire_date
FROM employees
WHERE 
	hire_date >= '1986/01/01' AND
	hire_date <= '1986/12/31';

	-- count employees hired in 1986
SELECT COUNT(hire_date) AS "Total employees hired in 1986"
FROM employees
WHERE
	hire_date >= '1986/01/01' AND
	hire_date <= '1986/12/31';
	
--list department manager info: department number, department name, employee number, last name, first name
SELECT d_m.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name
FROM dept_manager AS d_m
	JOIN departments AS d 
	ON (d_m.dept_no = d.dept_no)
		JOIN employees AS e
		ON (d_m.emp_no = e.emp_no);

--list employee department info: employee number, last name, first name, and department name
DROP VIEW IF EXISTS empl_dept_assign;

CREATE VIEW empl_dept_assign AS 
SELECT d_e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS d_e
	JOIN employees AS e
	ON (d_e.emp_no = e.emp_no)
		JOIN departments AS d
		ON (d_e.dept_no = d.dept_no);

SELECT * FROM empl_dept_assign;

SELECT COUNT(DISTINCT(emp_no)) AS "Total Employees" FROM empl_dept_assign;
		
--list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT first_name, last_name, sex FROM employees
WHERE 
	first_name = 'Hercules' AND
	last_name LIKE 'B%';

--list employees from Sales department, including their employee number, last name, first name, and department name
SELECT * FROM empl_dept_assign
WHERE dept_name = 'Sales';

--list employees in Sales and Development department, with employee number, last name, first name, and department name
SELECT * FROM empl_dept_assign
WHERE 	
	dept_name = 'Sales' OR 
	dept_name = 'Development';

	--employee per dept count check
SELECT dept_name, COUNT(emp_no) AS "Number of Employees"
FROM empl_dept_assign
WHERE 	
	dept_name = 'Sales' OR 
	dept_name = 'Development'
GROUP BY dept_name;

--frequency count of employee last names, decending 
SELECT last_name, COUNT(emp_no) AS "count"
FROM employees
GROUP BY last_name
ORDER BY "count" DESC;