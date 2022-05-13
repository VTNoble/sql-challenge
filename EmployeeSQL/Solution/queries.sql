-- List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary 
FROM employees AS a
INNER JOIN salaries AS b
ON a.emp_no = b.emp_no
ORDER BY a.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT a.dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name
FROM departments as a
INNER JOIN dept_manager as b
ON a.dept_no = b.dept_no
INNER JOIN employees as c
ON c.emp_no = b.emp_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees as a
INNER JOIN dept_emp as b
ON a.emp_no = b.emp_no
INNER JOIN departments as c
ON b.dept_no = c.dept_no
ORDER BY a.emp_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE (first_name = 'Hercules')
AND (last_name LIKE 'B%');

-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees as a
INNER JOIN dept_emp as b
ON a.emp_no = b.emp_no
INNER JOIN departments as c
ON b.dept_no = c.dept_no
WHERE c.dept_name = 'Sales'
ORDER BY a.emp_no;

-- List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.
SELECT a.emp_no, a.last_name, a.first_name, c.dept_name
FROM employees as a
INNER JOIN dept_emp as b
ON a.emp_no = b.emp_no
INNER JOIN departments as c
ON b.dept_no = c.dept_no
WHERE (c.dept_name = 'Sales')
OR (c.dept_name = 'Development')
ORDER BY a.emp_no;

-- List the frequency count of employee last names 
-- (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;