-- Which PROJECT has maximum number of EMPLOYEES? 
SELECT * FROM allocation;

SELECT project_id, COUNT(*) FROM allocation 
GROUP BY project_id;

SELECT project_id, COUNT(*) AS emp_count
FROM allocation 
GROUP BY project_id
HAVING COUNT(*)>=ALL(SELECT COUNT(*) FROM allocation GROUP BY project_id);

-- Which EMPLOYEE has not yet been allocated to any PROJECT? 

SELECT employee.emp_id, allocation.project_id, employee.emp_name
FROM employee 
LEFT JOIN allocation ON employee.emp_id=allocation.emp_id
WHERE project_id is null;

-- Which role played by the employee 'E03' frequently?
SELECT allocation.emp_id, allocation.role_id, role.role_title, count(*) as role_count
FROM allocation 
LEFT JOIN role ON allocation.role_id=role.role_id 
WHERE emp_id='E003' 
GROUP BY role_title
HAVING COUNT(*)>=ALL(SELECT COUNT(*) FROM allocation GROUP BY role_title); 

-- Which is the costliest Project?
SELECT project_id, SUM(amount_per_day) as Sum
FROM allocation
Group by project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day) FROM allocation Group by project_id);

-- How many employees were there in costliest Project? 
SELECT project_id, emp_id
FROM allocation
Where project_id='P002'
Group by emp_id;

-- Which is the cheapest Project in the year 2012?
Select project_id, from_date, SUM(amount_per_day) as Sum
	from allocation 
	where Year(from_date)='2012'
Order By project_id DESC;

-- How many projects are handled by senior most employee?
SELECT employee.emp_id, employee.salary, allocation.project_id, employee.emp_name
FROM employee
LEFT JOIN allocation ON employee.emp_id=allocation.emp_id
WHERE employee.salary = (SELECT MAX(salary) FROM employee)
Group by allocation.project_id;

-- What is the total amount spent for unassigned employees?
SELECT employee.emp_id, employee.salary, allocation.project_id, employee.emp_name
FROM employee
LEFT JOIN allocation ON employee.emp_id=allocation.emp_id
Where allocation.project_id is null;

-- 21.	Prepare a report in following format
-- Project name and Number of employees
SELECT project_name, count(*) AS No_of_employees FROM allocation 
RIGHT JOIN project ON project.project_id=allocation.project_id 
GROUP BY project_name;

-- 22.	Prepare a report in following format
-- Role name and Number of employees
SELECT role_title, count(*) AS No_of_employees FROM allocation 
RIGHT JOIN role ON role.role_id=allocation.role_id 
GROUP BY role_title;

-- 23.	Prepare a report in following format
-- Emp name and Number of Projects
SELECT emp_name, count(*) AS No_of_projects FROM allocation 
RIGHT JOIN employee ON employee.emp_id=allocation.emp_id 
GROUP BY emp_name;

-- 24.	Prepare a report in following format
-- Emp name and Number of Roles
SELECT emp_name, count(*) as No_of_roles from allocation 
RIGHT JOIN employee ON employee.emp_id=allocation.emp_id 
RIGHT JOIN role ON role.role_id=allocation.role_id 
GROUP BY emp_name;

-- 25.	Prepare a report in following format
--  Role name and Number of Employees
SELECT role_title, count(*) AS No_of_employees FROM allocation 
RIGHT JOIN role ON role.role_id=allocation.role_id 
GROUP BY role_title;

-- 26.	Prepare a report in following format
--  Role name and Number of Projects
SELECT role_title, count(project.project_id) AS No_of_projects FROM allocation 
RIGHT JOIN project ON project.project_id=allocation.project_id 
RIGHT JOIN role ON role.role_id=allocation.role_id 
GROUP BY role_title;

-- 27.	Prepare a report in following format
--  EMP NAME, Role name and Number of Projects
SELECT emp_name, role_title, count(project.project_id) AS No_of_projects FROM allocation 
LEFT JOIN employee ON employee.emp_id=allocation.emp_id 
Left JOIN project ON project.project_id=allocation.project_id 
RIGHT JOIN role ON role.role_id=allocation.role_id 
GROUP BY emp_name;

-- 37.	Prepare a report in this format Ram Works for Ashok Adam works for Akbar 
-- Where Ram is employee name and Ashok is his corresponding manager
SELECT e.emp_name || 'Works for' || m.emp_name AS Employee_works_for
FROM employee e
INNER JOIN employee m
on e.mgr_id=m.emp_id;

