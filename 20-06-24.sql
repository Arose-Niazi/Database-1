-- 1)
CREATE DATABASE 4Brothers;
----------------------------------------------------------------
-- 2)
CREATE TABLE Employee(
	empID INT UNSIGNED PRIMARY KEY,
	fName VARCHAR(20) NOT NULL,
	lName VARCHAR(20),
	dateOfBirth DATE,
	position ENUM('Manager','Supervisor') DEFAULT('Manager'),
	salary INT(8) UNSIGNED,
	email VARCHAR(128) UNIQUE,
	phoneNumber VARCHAR(16) NOT NULL
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
DROP CONSTRAINT email
----------------------------------------------------------------
-- 5)
ALTER TABLE Employee
ADD CONSTRAINT uni_name UNIQUE(lName)
----------------------------------------------------------------
-- 6)
ALTER TABLE Employee
ADD CONSTRAINT uni_mailNum UNIQUE(email,phoneNumber)
----------------------------------------------------------------
-- 7)
ALTER TABLE Employee
MODIFY COLUMN fName varchar(20) NULL
----------------------------------------------------------------
-- 8)
ALTER TABLE Employee
MODIFY COLUMN salary INT(8) UNSIGNED NOT NULL
----------------------------------------------------------------
-- 9)
ALTER TABLE Employee
DROP CONSTRAINT PRIMARY KEY
----------------------------------------------------------------
-- 10)
ALTER TABLE Employee
ADD CONSTRAINT pk_name UNIQUE(fName,lName)
----------------------------------------------------------------
-- 11)
ALTER TABLE Employee
ALTER position DROP DEFAULT
----------------------------------------------------------------
-- 12)
ALTER TABLE Employee
ALTER empID SET DEFAULT 100
----------------------------------------------------------------
-- 13)
SHOW DATABASES;
----------------------------------------------------------------
-- 14)
SHOW TABLES;