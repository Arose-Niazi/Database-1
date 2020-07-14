-- 1)
SELECT * FROM staff WHERE salary = (SELECT MAX(salary) FROM staff LIMIT 1);

-- OR

SELECT * FROM staff ORDER BY salary DESC LIMIT 1;

----------------------------------------------------------------------------------------
-- 2)
SELECT * FROM staff WHERE salary = (SELECT MIN(salary) FROM staff LIMIT 1) AND position = 'Assistant';

-- OR

SELECT staffNo FROM staff WHERE position = 'Assistant' ORDER BY salary LIMIT 1;
----------------------------------------------------------------------------------------
-- 3)
SELECT AVG(salary) FROM staff WHERE position IN('Supervisor','Manager') AND branchNo = 'B003';
----------------------------------------------------------------------------------------
-- 4)
SELECT COUNT(DISTINCT city) FROM branch;
----------------------------------------------------------------------------------------
-- 5)
SELECT SUM(salary) FROM staff WHERE branchNo = 'B005';
----------------------------------------------------------------------------------------
-- 6)
SELECT salary-2000 FROM staff WHERE fName = 'John';
----------------------------------------------------------------------------------------
-- 7)
UPDATE branch SET postCode = 'ASF 53T' WHERE branchNo = 'B005';
----------------------------------------------------------------------------------------
-- 8)
-- To make this work ->
	DELETE FROM branch WHERE branchNo = 'B007';
-- We will have to delete data of this branch from all tables.

----------------------------------------------------------------------------------------
-- 9)
DELETE FROM staff WHERE branchNo IN (SELECT branchNo FROM branch WHERE city = 'Bristol');
----------------------------------------------------------------------------------------
-- 10)
CREATE TABLE Staff_2 AS (SELECT * FROM staff LIMIT 5);
----------------------------------------------------------------------------------------
-- 11)
SELECT * FROM staff WHERE position IN('Assistant','Manager') ORDER BY position ASC , salary DESC;
----------------------------------------------------------------------------------------
-- 12)
SELECT SUM(salary) * 0.20 FROM staff WHERE branchNo = 'B003'