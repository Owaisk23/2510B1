-- DDL(Data Definition Language)

CREATE DATABASE "2510B1";

use "2510B1";


DROP DATABASE "2510B1";

CREATE TABLE Employee(
	id INT PRIMARY KEY IDENTITY(1,1),
	empName VARCHAR(70) NOT NULL,
	designation VARCHAR(70) NOT NULL,
	salary INT NOT NULL,
	city VARCHAR(40) NOT NULL,
	deptId INT
)


-- DML(Data Manipulation Language)
-- CREATE/Insert
INSERT INTO Employee(empName, designation,salary,city)
VALUES ('Atif', 'Senior Software Developer', 550000, 'Isb');

INSERT INTO Employee(empName, designation,salary,city)
VALUES ('Sharjeel', 'Frontend Developer', 150000, 'Hyd'),
('Zaryab', 'UIUX', 120000, 'Lhr'),
('Rukhsar', 'Marketing Agent', 170000, 'Khi'),
('Shaista', 'SQA', 100000, 'Khi'),
('Warda', 'SQA', 100000, 'Khi'),
('Abdul Rehman', 'Backend Developer', 250000, 'Isb'),
('Ashar', 'Lead Frontend Developer', 2250000, 'Khi'),
('Hassan', 'Lead Backend Developer', 350000, 'Isb'),
('Ubaid', 'Mob App Developer', 370000, 'Lhr'),
('Mohsin', 'Backend Developer', 250000, 'Khi'),
('Hashim', 'Lead Mob App Developer', 450000, 'Isb'),
('Tayyab', 'Desktop App Developer', 350000, 'Lhr'),
('Naveed', 'DBA', 150000, 'Khi');



--READ
SELECT * FROM Employee;

-- DISTINCT(different)
SELECT DISTINCT city FROM Employee;

SELECT city FROM Employee;

SELECT * FROM Employee where city='Khi';

UPDATE Employee set salary = 320000 where city='Khi';

UPDATE Employee set empName = 'Bilal', city = 'Hyd' where id = 1;

DELETE FROM Employee where id = 1;

-- where clause

SELECT empName, designation FROM Employee where designation = 'SQA';

--not operator
SELECT empName, designation, salary FROM Employee where not designation = 'SQA';

-- AND operator

SELECT empName, designation, salary FROM Employee where not designation = 'SQA'
AND salary > 500000;


SELECT empName, designation, salary FROM Employee where not designation = 'SQA'
AND salary < 300000;

-- OR Operator

SELECT empName, designation, salary FROM Employee where not designation = 'SQA'
OR salary > 320000;

SELECT empName, designation, salary FROM Employee where not designation = 'SQA'
OR salary < 250000;

-- between
SELECT * FROM Employee where id between 5 and 11;

-- like 
SELECT * FROM Employee where designation like '%S%';
SELECT * FROM Employee where city like '%i%' AND designation like '%S%';

-- IN

SELECT * FROM Employee where city IN ('Khi');

-- Order By

SELECT * FROM Employee order by empName asc;

SELECT * FROM Employee order by salary desc;

-- top

select top 4 * from Employee;

select top 50 percent * from Employee order by empName asc;

-- aggregate functions

SELECT COUNT(empName) as total_employees FROM Employee;

SELECT MIN(salary) as min_salary FROM Employee;

SELECT MAX(salary) as max_salary FROM Employee;

SELECT SUM(salary) as totalsum_salary FROM Employee;

SELECT AVG(salary) as avg_salary FROM Employee;

SELECT CONCAT(empName , ' has a designation of ', designation, ' has salary of ', salary)
as emp_details FROM Employee;

SELECT * FROM Employee;

-- GROUP BY
SELECT city, COUNT(id) as EmpCount FROM Employee GROUP BY city; 

SELECT city, MAX(salary) as MaxSalary FROM Employee GROUP BY city; 

SELECT city, MIN(salary) as MinSalary FROM Employee GROUP BY city; 

SELECT city, SUM(salary) as TotalSalary FROM Employee GROUP BY city; 


-- SUB QUERIES

SELECT empName, salary FROM Employee where salary < (SELECT AVG(salary) as avg_salary FROM Employee);

INSERT INTO Employee(empName, designation,salary,city, deptId)
VALUES ('Asim', 'MANAGER', 550000, 'Hyd', null),
('Rubbas', 'MANAGER', 620000, 'Lhr', null),
('Junaid', 'MANAGER', 770000, 'Khi', null),
('Minhaj', 'MANAGER', 340000, 'ISB', null);


SELECT designation, COUNT(id) as EmpCount FROM Employee
GROUP BY designation having designation = 'MANAGER';


CREATE TABLE Department(
	deptId INT PRIMARY KEY IDENTITY(1,1), -- PK
	deptname varchar(45) NOT NULL
);

INSERT INTO Department
VALUES ('HR'),('Admin'),('Academics'),('SRO'),('Marketing'),('IT'), ('Exam');

SELECT * FROM Department;

SELECT * FROM Employee;

TRUNCATE TABLE Employee;

DROP TABLE Employee;

CREATE TABLE Employee(
	id INT PRIMARY KEY IDENTITY(1,1), --PK
	empName VARCHAR(70) NOT NULL,
	designation VARCHAR(70) NOT NULL,
	salary INT NOT NULL,
	city VARCHAR(40) NOT NULL,
	deptId INT, -- FK
	FOREIGN KEY (deptId) references Department(deptId)
)

INSERT INTO Employee(empName, designation,salary,city, deptId)
VALUES ('Sharjeel', 'Frontend Developer', 150000, 'Hyd', 1),
('Zaryab', 'UIUX', 120000, 'Lhr', 1),
('Rukhsar', 'Marketing Agent', 170000, 'Khi', 5),
('Shaista', 'SQA', 100000, 'Khi', 4),
('Warda', 'SQA', 100000, 'Khi', 4),
('Abdul Rehman', 'Backend Developer', 250000, 'Isb', 6),
('Ashar', 'Lead Frontend Developer', 2250000, 'Khi', 3),
('Hassan', 'Lead Backend Developer', 350000, 'Isb', 3),
('Ubaid', 'Mob App Developer', 370000, 'Lhr', 2),
('Mohsin', 'Backend Developer', 250000, 'Khi', 7),
('Hashim', 'Lead Mob App Developer', 450000, 'Isb', 2),
('Tayyab', 'Desktop App Developer', 350000, 'Lhr', 6),
('Naveed', 'DBA', 150000, 'Khi', 7);


-- JOINS

--INNER JOIN

SELECT empName, designation, deptName, city, salary FROM Employee as emp
INNER JOIN Department as d on emp.deptId = d.deptId;


--LEFT JOIN

SELECT empName, designation, deptName, city, salary FROM Employee as emp
LEFT JOIN Department as d on emp.deptId = d.deptId;

INSERT INTO Department
VALUES ('Books'),('Placement');

SELECT * FROM Department;

DELETE FROM Department where deptId = 8;



--RIGHT JOIN

SELECT empName, designation, deptName, city, salary FROM Employee as emp
RIGHT JOIN Department as d on emp.deptId = d.deptId;

--FULL OUTER JOIN

SELECT empName, designation, deptName, city, salary FROM Employee as emp
FULL OUTER JOIN Department as d on emp.deptId = d.deptId;

-- VIEWS

SELECT empName, designation FROM Employee;

CREATE VIEW [empDetails]
AS
SELECT empName, designation FROM Employee;

SELECT * FROM empDetails;

CREATE VIEW [deptName]
AS
SELECT deptName FROM Department;

SELECT * FROM deptName;

SELECT * FROM sys.views;


-- DCL(Data Control Language)

SELECT * FROM sys.sql_logins;





