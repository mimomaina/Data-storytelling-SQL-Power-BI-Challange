CREATE DATABASE mydatabase;
USE mydatabase;
-- creating tables
CREATE TABLE studentID (
ID INT PRIMARY KEY,
 Firstname  VARCHAR (100) NOT NULL,
Lastname VARCHAR (100),
Age INT CHECK ( Age >= 18 ),
Email  VARCHAR (255) UNIQUE NOT NULL
);
-- Inserting data into the table
INSERT INTO studentID ( ID, Firstname, Lastname, Age, Email) VALUES ( 1, 'John', 'Doe' , 20, 'john.doe@gmail.com' );
INSERT INTO studentID ( ID, Firstname, Lastname, Age, Email) VALUES ( 2, ' Jane', 'Smith', 30 , ' jane.smith@gmail.com' ); 
 
 -- Updating values
 SELECT * FROM studentID;
 UPDATE studentID
SET Firstname = 'John', Lastname = 'Doe', Age = 20, Email = 'john.doe@example.com'
WHERE ID = 1;

SELECT * FROM studentID;
UPDATE studentID
SET Firstname = 'Jane' , Lastname = ' Smith ', Age = 22 , Email = ' jane.smith@example.com'
WHERE ID = 2;

 INSERT INTO studentID ( ID, Firstname, Lastname, Age, Email) VALUES (3, 'Micheal' , 'Brown' ,19, ' micheal.brown@example.com');
 SELECT * FROM studentID;
 
 -- Altering table
 ALTER TABLE studentID
 ADD COLUMN EnrollmentDate DATE;
 DESCRIBE studentID;
 ALTER TABLE studentID
 MODIFY COLUMN Email VARCHAR (300);
 
 ALTER TABLE studentID
 DROP COLUMN Lastname;
 
 DESCRIBE studentID;
 
