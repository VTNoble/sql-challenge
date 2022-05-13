-- create 'titles' table
CREATE TABLE titles (
  title_id varchar,
  title varchar,
  PRIMARY KEY (title_id)
);

-- create 'employees' table
CREATE TABLE employees (
  emp_no bigint,
  emp_title_id varchar,
  birth_date varchar,
  first_name varchar,
  last_name varchar,
  sex varchar,
  hire_date varchar,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- create 'salaries' table
CREATE TABLE salaries (
  emp_no bigint,
  salary bigint,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- create 'departments' table
CREATE TABLE departments (
  dept_no varchar,
  dept_name varchar,
  PRIMARY KEY (dept_no)
);

-- create 'dept_emp' table
-- primary key column to be added after data import as both emp_no and dept_no have repetitive values
CREATE TABLE dept_emp (
  emp_no bigint,
  dept_no varchar,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- create 'dept_manager' table
-- emp_no is primary key as dept_no has repetitive values
CREATE TABLE dept_manager (
  dept_no varchar,
  emp_no bigint,
  PRIMARY KEY (emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

 -- run separately after data is imported to add a serial Primary Key to 'dept_emp' table
ALTER TABLE dept_emp
  ADD COLUMN id serial PRIMARY KEY;
