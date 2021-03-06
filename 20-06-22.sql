-- 1)
CREATE DATABASE 4Brothers;
----------------------------------------------------------------
-- 2)
CREATE TABLE Employee(
	empID INT UNSIGNED PRIMARY KEY,
	fName VARCHAR(20),
	lName VARCHAR(20),
	dateOfBirth DATE,
	position ENUM('Manager','Supervisor'),
	salary INT(8) UNSIGNED,
	email VARCHAR(128),
	phoneNumber VARCHAR(16)
);
----------------------------------------------------------------
-- 3)
INSERT INTO Employee 
	(empID, fName, lName, dateOfBirth, position, salary, email, phoneNumber) 
VALUES 
	(1, 'Arose', 'Niazi', '1999-05-13', 'Manager', 300000, 'arose.niazi@yahoo.com', '+923152033333'), 
	(2, 'Rimsha', 'Arif', '1999-07-27', 'Supervisor', 70000, 'rimshaarif729@gmail.com', '+923214675112'), 
	(3, 'Qasim', 'Hayat', '1999-04-08', 'Supervisor', 70000, 'muhammadqasimhayat2@gmail.com', '+923154411896'), 
	(4, 'Aeman', 'Fatima', '2000-07-18', 'Supervisor', 65000, 'aeman098.fatima@gmail.com', '+923230465309'), 
	(5, 'Fuad', 'Mufti', '1999-12-25', 'Supervisor', 90000, 'fuadmufti20@gmail.com', '+923321403309');
----------------------------------------------------------------
-- 4)
ALTER TABLE Employee
ADD COLUMN joiningDate DATE NOT NULL;
----------------------------------------------------------------
-- 5)
ALTER TABLE Employee
DROP COLUMN salary;
----------------------------------------------------------------
-- 6)
SELECT joiningDate FROM Employee;
SELECT salary FROM Employee; -- //Should Return Error
----------------------------------------------------------------
-- 7)
-- You can not change from DATE to YEAR in MYSQL!
-- To work this around I used this,

ALTER TABLE Employee
ADD COLUMN dateOfBirthY YEAR;

UPDATE Employee SET dateOfBirthY = YEAR(dateOfBirth);

ALTER TABLE Employee
DROP COLUMN dateOfBirth;

ALTER TABLE Employee
RENAME COLUMN dateOfBirthY dateOfBirth;

ALTER TABLE Employee
CHANGE COLUMN dateOfBirthY dateOfBirth YEAR;
----------------------------------------------------------------
-- 8)
TRUNCATE Employee;
----------------------------------------------------------------
-- 9)
SELECT * FROM Employee;
----------------------------------------------------------------
-- 10)
DROP TABLE Employee;
----------------------------------------------------------------
-- 11)
SELECT * FROM Employee; -- //Should Return Error
----------------------------------------------------------------
-- 12)
DROP DATABASE 4Brothers;
----------------------------------------------------------------
-- 13)
USE 4Brothers; -- //Should Return Error