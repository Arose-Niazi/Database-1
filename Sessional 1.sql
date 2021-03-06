-- 1 - 
SELECT AVG(Staff.salary) AS AvgSalary FROM Staff WHERE Staff.position = 'Supervisors';
-- 2 - 
SELECT Staff.fName FROM Staff WHERE Staff.salary < 12000 AND Staff.fName LIKE 'A%' AND Staff.position = 'Assistant'; 
-- 3 - 
SELECT Client.* FROM Client WHERE Client.FName = 'Aline';
-- 4 - 
SELECT TIMESTAMPDIFF(YEAR, Staff.DOB, CURDATE()) AS AGE FROM Staff WHERE Staff.FName = 'Mary';
-- 5 - 
SELECT PropertyForRent.* FROM PropertyForRent WHERE PropertyForRent.staffNo IS NULL;
-- 6 - 
SELECT Client.*, Registration.dateJoined FROM Client,Registration WHERE Client.clientNo = Registration.clientNo;
-- 7 - 
UPDATE Staff SET Staff.salary = Staff.salary + (Staff.salary*0.05) WHERE Staff.FName = 'John'
-- 8 - 
SELECT COUNT(*) AS PropertiesViwed FROM Viewing WHERE Viewing.viewDate BETWEEN '2013-01-01' AND '2018-01-01';
-- 9 - 
SELECT Staff.* FROM Staff WHERE Staff.salary > 18000 AND Staff.salary < 12000;
-- 10 - 
ALTER TABLE Staff ADD COLUMN `Cell number` varchar(13) NULL;

-- NOTES
-- 1 - Question asked for 'Supervisors' while in data we have 'Supervisor'.
-- 2 - No result as there is no one with salary less than 12000 if we add less than equal too <= we will get a result.
-- 9 - No result as this condition can never be met. The question asking 'OR' would work and 'AND' wont. 