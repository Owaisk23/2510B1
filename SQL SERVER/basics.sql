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

CREATE LOGIN ACC_EMP WITH PASSWORD='555';
CREATE USER ACC_EMP FROM LOGIN ACC_EMP;

DROP LOGIN HR_EMP;

GRANT SELECT on dbo.Department TO ACC_EMP;

GRANT INSERT, DELETE, UPDATE on dbo.Department TO ACC_EMP;

REVOKE INSERT on dbo.Department TO ACC_EMP;

-- STORED PROCEDURES
CREATE PROCEDURE SeeEmp
AS
BEGIN
SELECT * FROM Employee
END;


SeeEmp;

CREATE PROCEDURE SeeEmp2
AS
BEGIN
SELECT * FROM Employee where id = 2
END;

SeeEmp2


CREATE PROCEDURE AddEmp @Name varchar(255), @designation varchar(80), @sal int, @city varchar(60), @dId int
AS 
BEGIN
INSERT INTO Employee VALUES (@Name, @designation, @sal, @city, @dId)
SELECT * FROM Employee
END;

AddEmp @Name='Junaid', @designation='HR Head', @sal=77000, @city='Khi', @dId= 1;

AddEmp @Name='Javeria', @designation='HR', @sal=55000, @city='Khi', @dId= 1;

-- Triggers

CREATE TRIGGER AddEmp_trigger
on Employee
FOR INSERT
AS
BEGIN
print('a new employee added in our company.')
END;


INSERT INTO Employee(empName, designation,salary,city, deptId)
VALUES ('Zafar Abbas', 'Marketing Executive', 350000, 'Khi', 5);

--ALTER
ALTER TRIGGER AddEmp_trigger
ON Employee
FOR INSERT
AS
BEGIN
SELECT * FROM inserted
END;

INSERT INTO Employee(empName, designation,salary,city, deptId)
VALUES ('ALiyan', 'Marketing Intern', 30000, 'Khi', 5);

-- logs

CREATE TABLE EmpLogs(
	logid INT PRIMARY KEY IDENTITY(1,1),
	ActionPerformed nvarchar(255)
);

SELECT * FROM EmpLogs

SELECT * INTO Test FROM Employee;

SELECT * FROM Test;

DROP TRIGGER AddEmp_trigger;


CREATE TRIGGER AddEmp_trigger
on Employee
AFTER INSERT
AS
BEGIN
DECLARE @Id int, @name varchar(60)
SELECT @Id=id, @name=empName FROM inserted
INSERT INTO EmpLogs VALUES(@name + ' having Id = ' + CAST(@Id as varchar(6)) + ' is added at ' +
CAST(GETDATE() as VARCHAR(30)))
END;

INSERT INTO Employee(empName, designation,salary,city, deptId)
VALUES ('Taha', 'Marketing Intern', 35000, 'Khi', 5);

-- instead of
 SELECT * from Employee
 SELECT * from Employee where emp_status = 1;
 Alter TABLE Employee ADD emp_status int default(1) not null;

 CREATE Trigger Soft_Delete
 On Employee
 INSTEAD OF DELETE
 AS
 BEGIN
 DECLARE @ID int
 SELECT @ID=id from Deleted
 Update Employee set emp_status=0 where id=@ID
 END;

 DELETE from Employee where id=3;

-- Update Trigger
 CREATE Trigger Update_Employees
 On Employee
 for Update
 AS
 BEGIN
DECLARE @Id int
DECLARE @Newname varchar(60), @Oldname varchar(60)
DECLARE @Newsalary int,  @Oldsalary int
DECLARE @NewDesignation varchar(60),@OldDesignation varchar(60)
DECLARE @Newdeptid int,  @Olddeptid int
DECLARE @Newcity varchar(60), @Oldcity varchar(60)
DECLARE @AuditString varchar(255)

SELECT * into #Temptable from inserted
WHILE(exists (SELECT id from #Temptable))
begin
SELECT @Id=id, @Newname=empName, @Newsalary=salary, @NewDesignation=designation,@Newcity=city,@Newdeptid=deptId FROM #Temptable
SELECT  @Oldname=empName, @Oldsalary=salary, @OldDesignation=designation,@Oldcity=city,@Olddeptid=deptId FROM deleted where id=@Id
SET @AuditString =''
SET @AuditString ='An employee having id = '+ CAST(@Id as varchar(6))+' on '+  CAST(GETDATE() as varchar(30))+' is changed '
if(@Oldname <> @Newname)
SET @AuditString = @AuditString + ' its name from '+@Oldname +' to '+ @Newname

if(@Oldsalary <> @Newsalary)
SET @AuditString = @AuditString + ' its salary from '+CAST(@Oldsalary as varchar(10)) +' to '+CAST(@Newsalary as varchar(10))

if(@OldDesignation <> @NewDesignation)
SET @AuditString = @AuditString + ' its designation from '+@OldDesignation +' to '+ @NewDesignation

if(@Oldcity <> @Newcity)
SET @AuditString = @AuditString + ' its city from '+@Oldcity +' to '+ @Newcity

if(@Olddeptid <> @Newdeptid)
SET @AuditString = @AuditString + ' its deptid from '+CAST(@Olddeptid as varchar(10)) +' to '+CAST(@Newdeptid as varchar(10))
 Insert into Emplogs values(@AuditString)
 DELETE FROM #Temptable where id=@Id
end
 end;

 select * from Employee;
 update Employee set city='karachi' where id > 4;
 select * from Emplogs;

 
 -- Transactions 
 -- ddl- data definition language (create , alter, drop)
 -- dml-data manipulation language (insert,update,delete, select)
 -- dcl-data control languages (grant/revoke)
 -- tcl- transaction control language. (ROLLBACK/ COMMIT)

 -- ACID properties.
 
-- A => Atomicity -- all the steps are fully completed or not a single step will execute.
-- C => Consistency -- all the nodes in a network should be aware of the transaction.
-- I => Isolation -- one transaction's info should not be known to another transaction.
-- D => Durability -- changes after transaction should be saved.


-- Integrity
Begin Transaction
Update Employee set empName='Khurram' where id= 1;
Commit Transaction;-- save changes

Rollback Transaction;-- wapis

BEGIN TRANSACTION
BEGIN try 
Update Employee set empName='chakwal' where id= 1/0;
print('Commited Successfully.')
COMMIT TRANSACTION
End try
BEGIN catch
print('Rolled back Successfully.')
Rollback Transaction
END catch;
