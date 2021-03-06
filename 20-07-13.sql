-- 1)
SELECT city, COUNT(branchNo) AS Branches FROM branch GROUP BY city;
----------------------------------------------------------------------------------------
-- 2)
SELECT city, COUNT(branchNo) AS Branches FROM branch GROUP BY city HAVING city IN ('London','Bristol');
----------------------------------------------------------------------------------------
-- 3)
SELECT branchNo, COUNT(staffNo) AS `Staff Members` FROM staff GROUP BY branchNo HAVING branchNo IN ('B003','B005') ORDER BY branchNo DESC;
----------------------------------------------------------------------------------------
-- 4)
SELECT branchNo, AVG(salary) AS `Avg Salary` FROM staff GROUP BY branchNo HAVING `Avg Salary` > 10000;
----------------------------------------------------------------------------------------
-- 5)
SELECT branchNo, SUM(salary) AS `Total Salary` FROM staff GROUP BY branchNo HAVING COUNT(staffNo) > 3;
----------------------------------------------------------------------------------------
-- 6)
SELECT position, SUM(salary) AS `Total Salary`, AVG(salary) AS `Avg Salary`, COUNT(staffNo) AS `Employees Count` FROM staff WHERE position = 'Assistant' HAVING `Employees Count` > 5
----------------------------------------------------------------------------------------
-- 7)
SELECT branchNo FROM staff GROUP BY branchNo HAVING SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) = SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END);
----------------------------------------------------------------------------------------
-- 8)
CREATE VIEW `b003_staff` AS SELECT staffNo,fName,lName,position,sex,DOB,salary FROM staff WHERE branchNo = 'B003'
----------------------------------------------------------------------------------------
-- 9)
CREATE VIEW `managers` AS SELECT branchNo,staffNo,fName,lName,sex,DOB,salary FROM staff WHERE position = 'Manager';
----------------------------------------------------------------------------------------
-- 10)
CREATE VIEW `byGender` AS SELECT branchNo,staffNo,fName,lName,position,sex,DOB,salary FROM staff ORDER BY sex;