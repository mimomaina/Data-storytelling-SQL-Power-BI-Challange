CREATE DATABASE EmployeeDatabase;
USE EmployeeDatabase;

-- Creating Tables
CREATE TABLE Employees(
ID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR (100) NOT NULL,
Age INT,
Department VARCHAR (100),
Salary INT,
Hiredate DATE
);
DESCRIBE Employees;

INSERT INTO Employees( Name, Age, Department, Salary, Hiredate) VALUES ( 'John', 20 ,'IT',20000 , '2023-10-22');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ( 'Janet', 40 , 'HR' , 50000, '2010-3-12');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ( 'Dan', 34, 'Finance', 60000, '2014-04-14');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ('George', 45, 'Sales', 50000, '2009-09-09');
INSERT INTO Employees ( Name,Age, Department, Salary, Hiredate) VALUES ( 'Whitney', '34', 'IT' , '30000', '2018-12-23');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ( 'Sam' ,54, 'Sales', 54000,'2009-02-21');
INSERT INTO Employees (Name, Age, Department, Salary , Hiredate) VALUES ( 'Jeff', 25, 'Finance', 45000, '2015-04-26');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ( 'Ben' ,27, 'HR', 45000,'2022-05-09');
INSERT INTO Employees ( Name, Age, Department, Salary, Hiredate) VALUES ( 'Vicky', 35, 'Sales', 43000, '2010-04-09');
INSERT INTO Employees ( Name, Age, Department, Salary , Hiredate) VALUES('Pius', 56, 'IT', 50000,'2024-09-07');

DESCRIBE Employees;
SELECT * FROM Employees;

-- Selecting name, age, salary
SELECT Name,Age, Salary FROM Employees;

-- Filtering age and salary of employees in a department
SELECT Name, Salary FROM Employees
WHERE Department ='Finance';

-- Sorting by salary
SELECT * FROM Employees ORDER BY Salary ASC;
SELECT * FROM Employees ORDER BY Salary DESC;

-- Top 3 highest paid employees
SELECT *FROM Employees ORDER BY Salary DESC LIMIT 3;

-- Unique departments
SELECT DISTINCT Department FROM Employees;

SELECT * FROM Employees WHERE( Department = 'IT' AND Salary > 45000);

-- 2 youngest employees
SELECT * FROM Employees ORDER BY Age ASC LIMIT 2;

-- Distinct departments alphabetically ordered
SELECT DISTINCT Department
FROM Employees
ORDER BY Department DESC;







