-- 1)
SELECT * FROM propertyForRent WHERE ownerNo IN (SELECT ownerNo FROM privateOwner WHERE address LIKE '%Glasgow%');
----------------------------------------------------------------------------------------
-- 2)
SELECT * FROM staff WHERE branchNo IN (SELECT branchNo FROM branch WHERE city = 'London');
----------------------------------------------------------------------------------------
-- 3)
SELECT * FROM branch WHERE branchNo IN (SELECT branchNo FROM propertyForRent WHERE type = 'Flat');
----------------------------------------------------------------------------------------
-- 4)
SELECT * FROM staff WHERE staffNo IN (SELECT staffNo FROM staff WHERE position = 'Assistant') ORDER BY salary LIMIT 1;
----------------------------------------------------------------------------------------
-- 5)
SELECT * FROM propertyForRent WHERE staffNo IN (SELECT staffNo FROM staff WHERE branchNo IN (SELECT branchNo FROM branch WHERE city = 'London'));
----------------------------------------------------------------------------------------
-- 6)
CREATE TABLE client2 SELECT * FROM client WHERE prefType = 'FLAT';
----------------------------------------------------------------------------------------
-- 7)
UPDATE client2 SET maxRent=maxRent+100 WHERE maxRent < (SELECT AVG(maxRent) FROM client2);
----------------------------------------------------------------------------------------
-- 8)
DELETE FROM client2 WHERE maxRent = (SELECT MIN(maxRent) FROM client2);
----------------------------------------------------------------------------------------
-- 9)
SELECT CONCAT(fName," ",lName) AS Name FROM staff WHERE staffNo = (SELECT staffNo FROM staff ORDER BY salary DESC LIMIT 1,1);
----------------------------------------------------------------------------------------
-- 10)
SELECT * FROM staff WHERE salary < (SELECT AVG(salary) FROM staff);