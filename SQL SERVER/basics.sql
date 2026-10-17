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











-- DCL(Data Control Language)







