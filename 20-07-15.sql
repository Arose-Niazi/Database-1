-- 1)
SELECT fName,City FROM staff AS s INNER JOIN branch AS b ON s.branchNo = b.branchNo;
----------------------------------------------------------------------------------------
-- 2)
SELECT SUM(salary) AS `Total Salary`,City FROM staff AS s INNER JOIN branch AS b ON s.branchNo = b.branchNo AND City = 'London'
----------------------------------------------------------------------------------------
-- 3)
SELECT COUNT(staffNo) AS `Total Staff` FROM staff AS s INNER JOIN branch AS b ON s.branchNo = b.branchNo AND City IN ('Bristol','Aberdeen');
----------------------------------------------------------------------------------------
-- 4)
SELECT pfr.* FROM propertyForRent AS pfr INNER JOIN privateOwner AS po ON pfr.ownerNo = po.ownerNo WHERE po.fName = 'Carol';
----------------------------------------------------------------------------------------
-- 5)
SELECT CONCAT(s.fName,' ', s.lName) AS Name FROM propertyForRent AS pfr JOIN staff AS s ON pfr.staffNo = s.staffNo WHERE pfr.propertyNo = 'PG36';
----------------------------------------------------------------------------------------
-- 6)
SELECT pfr.* FROM propertyForRent AS pfr INNER JOIN branch AS b ON pfr.branchNo = b.branchNo WHERE b.branchNo = 'B005' AND pfr.city = 'London';
----------------------------------------------------------------------------------------
-- 7)
SELECT CONCAT(MIN(rent), ' - ', MAX(rent)) AS `Rent Range` FROM propertyForRent AS pfr INNER JOIN branch AS b ON pfr.branchNo = b.branchNo WHERE pfr.city = 'Glasgow' AND type = 'Flat';
----------------------------------------------------------------------------------------
-- 8)
SELECT pfr.*,CONCAT(po.fName, ' ', po.lName) AS `Owner Name`, b.city AS `Branch City`, CONCAT(s.fName, ' ', s.lName) AS `Staff Name`  FROM propertyForRent AS pfr, privateOwner AS po, branch AS b, staff AS s WHERE pfr.ownerNo = po.ownerNo AND pfr.branchNo = b.branchNo AND pfr.staffNo = s.staffNo AND pfr.propertyNo = 'PA14';
----------------------------------------------------------------------------------------
-- 9)
SELECT CONCAT(po.fName, ' ', po.lName) AS `Owner Name`, telNo, pfr.* FROM privateOwner AS po LEFT JOIN propertyForRent AS pfr ON po.ownerNo = pfr.ownerNo WHERE po.email IS NULL
----------------------------------------------------------------------------------------
-- 10)
SELECT branchNo FROM branch WHERE branchNo NOT IN (SELECT branchNo FROM propertyForRent);
----------------------------------------------------------------------------------------
-- 11)
SELECT COUNT(*) AS 'Properties Registered' FROM propertyForRent WHERE staffNo = 'SL21';
----------------------------------------------------------------------------------------
-- 12)
SELECT COUNT(*) AS 'Properties Registered' FROM propertyForRent LEFT JOIN staff ON propertyForRent.staffNo = staff.staffNo WHERE staff.fName = 'John';
----------------------------------------------------------------------------------------
-- 13)
SELECT * FROM propertyForRent AS pfr, privateOwner AS po, branch AS b WHERE pfr.ownerNo = po.ownerNo AND pfr.branchNo = b.branchNo;