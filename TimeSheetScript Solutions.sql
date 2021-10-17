USE rachna;

-- 1.Which PROJECT has maximum number of EMPLOYEES? 
SELECT project_id FROM allocation
GROUP BY project_id
HAVING COUNT(emp_id)>= ALL(SELECT COUNT(emp_id) FROM allocation GROUP BY project_id); 

-- 2.Which EMPLOYEE has not yet been allocated to any PROJECT? 
SELECT e.emp_name FROM employee AS e
LEFT JOIN allocation AS a
ON e.emp_id=a.emp_id
WHERE project_id IS NULL;

--  3. Which role played by the employee 'E03' frequently?
SELECT role_title FROM role AS r
LEFT JOIN allocation AS a
ON r.role_id=a.role_id 
GROUP BY a.emp_id
HAVING COUNT(*)>=ALL(SELECT COUNT(*) FROM role AS r
LEFT JOIN allocation AS a
ON r.role_id=a.role_id 
GROUP BY a.emp_id 
HAVING a.emp_id='E003');

-- 4.Which is the costliest Project?
SELECT project_id FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day) project_id FROM allocation GROUP BY project_id);

-- 5. How many employees were there in costliest Project? 
SELECT DISTINCT COUNT(emp_id) FROM allocation
GROUP BY project_id
HAVING project_id=(SELECT project_id FROM allocation
GROUP BY project_id
HAVING SUM(amount_per_day)>=ALL(SELECT SUM(amount_per_day) project_id FROM allocation GROUP BY project_id))
;

-- 6. Which is the cheapest Project in the year 2012?
SELECT project_id,  from_date FROM allocation
GROUP BY YEAR(from_date)
HAVING YEAR(from_date)=2012 AND SUM(amount_per_day)<=ALL(SELECT SUM(amount_per_day) FROM allocation WHERE YEAR(from_date)='2012' GROUP BY YEAR(from_date));

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

-- 37. Prepare a report in this format Ram Works for Ashok Adam works for Akbar Where Ram is employee name and Ashok is his corresponding manager
SELECT DISTINCT CONCAT(A.emp_name,'Works For',B.emp_name) AS `A Works For B`
FROM employee A
INNER JOIN employee B
ON A.mgr_id=B.emp_id;

/*45.	Using ROLL UP and CUBE
Generate a report:
Employee ID	 Project ID	Total salary*/
SELECT emp_id, project_id, SUM(amount_per_day) as `Total Salary`
FROM allocation
GROUP BY emp_id WITH ROLLUP; 

-- CUBE is not supported by MYsql
-- ROLLUP working as CUBE in below case
SELECT emp_id, project_id, SUM(amount_per_day) as `Total Salary`
FROM allocation
GROUP BY emp_id, project_id WITH ROLLUP; 

