-- TimeSheet Domain

-- Timesheet Domain
use TimeSheet;
CREATE TABLE department(dept_id CHAR(6) PRIMARY KEY,dept_name CHAR(20), dept_location CHAR(20));

CREATE TABLE role(role_id CHAR(6) PRIMARY KEY,role_title CHAR(20));
 
CREATE TABLE skill(skill_id CHAR(6) PRIMARY KEY,skill_name CHAR(20));	

CREATE TABLE employee(emp_id CHAR(6) PRIMARY KEY,
					  emp_name CHAR(20),
					  hire_date date,
					  salary decimal(10,2),
					  mgr_id CHAR(6) REFERENCES employee(emp_id),
					  dept_no CHAR(6) REFERENCES department(dept_id),
					  mobile_no CHAR(10),
					  casual_leave INT,
					  sick_leave INT,
					  privilege_leave INT);


CREATE TABLE employeeskill(emp_id CHAR(6) references employee ,skill_id CHAR(6) references skill);
				  
					  
CREATE TABLE project(project_id CHAR(6) PRIMARY KEY,project_name CHAR(20),client_name CHAR(20),deadline date);


CREATE TABLE allocation(emp_id CHAR(6) references employee,project_id CHAR(6) references project ,role_id CHAR(6) references role , from_date date PRIMARY KEY, amount_per_day decimal(10,2));


select * from employee;
select * from role;

-- Insert
insert into role values('R001','Tester');
insert into role values('R002','UI Designer');
insert into role values('R003','Programmer');

insert into project values('P001','Billing','SS Enterprises','2014-04-01');
insert into project values('P002','ERP','HTC','2014-06-25');
insert into project values('P003','Optical','Eagle Vision','2016-02-09');
insert into project values('P004','Collection','The Collector','2015-07-14');
insert into project values('P005','Banking','SomeBank','2015-08-01');


insert into skill values('S001','Java');
insert into skill values('S002','DotNet');
insert into skill values('S003','PHP');
insert into skill values('S004','SQL');
insert into skill values('S005','Mainframe');


insert into department values('D001','Training','Chennai');
insert into department values('D002','Systems','Hydrabad');
insert into department values('D003','Operations','Mumbai');
insert into department values('D004','Development','Delhi');
insert into department values('D005','HR','Goa');

select * from employee;

insert into employee (emp_id,emp_name,hire_date,salary,dept_no,mobile_no,casual_leave, sick_leave,privilege_leave)values('E005','Anish','2014-08-25',90000.00,'D001','7845781336',20,20,15);
insert into employee values('E001','Gopi','2016-03-03',30000.00,'E005','D001','7845781446',10,10,5);
insert into employee values('E002','Raja','2016-07-03',20500.00,'E005','D001','7745781446',10,10,5);
insert into employee values('E003','Kumar','2015-04-03',450000.00,'E005','D002','9845781446',10,10,5);
insert into employee values('E004','Vikram','2016-02-03',25000.00,'E005','D003','7825781446',10,10,5);



insert into employeeskill values('E001','S001');
insert into employeeskill values('E002','S002');
insert into employeeskill values('E003','S003');
insert into employeeskill values('E004','S004');
insert into employeeskill values('E005','S005');


insert into allocation values('E001','P001','R002','2013-04-01',300.00);
insert into allocation values('E002','P002','R001','2012-06-01',300.00);
insert into allocation values('E003','P001','R002','2013-03-01',350.00);
insert into allocation values('E004','P002','R003','2012-05-01',300.00);


insert into allocation values('E001','P002','R001','2014-06-01',200.00);
insert into allocation values('E002','P002','R002','2019-04-01',350.00);
insert into allocation values('E003','P001','R003','2020-03-01',350.00);
insert into allocation values('E003','P003','R002','2019-05-01',330.00);




-- select

select * from employee;
select * from department;
select * from skill;
select * from employeeskill;
select * from project;
