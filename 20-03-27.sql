SELECT * FROM Staff WHERE salary IN (SELECT MAX(salary) FROM Staff);
SELECT * FROM Staff WHERE salary IN (SELECT MIN(salary) FROM Staff);
SELECT AVG(salary) AS 'Average Salary' FROM Staff;
SELECT AVG(salary) AS 'Average Salary (BOO3)' FROM Staff WHERE branchNo = 'B003';
SELECT AVG(salary) AS 'Average Salary (Senior Managers)' FROM Staff WHERE position = 'Senior Manager';
SELECT AVG(salary) AS 'Average Salary (Assistants At B005)' FROM Staff WHERE position = 'Assistant' AND branchNo = 'B005';
SELECT COUNT(staffNo) AS 'Staff Members (Salary Less Than 18k)' FROM Staff WHERE salary < 18000;
SELECT * FROM Staff WHERE position = 'Senior Manager' ORDER BY salary DESC LIMIT 1 OFFSET 1;
SELECT COUNT(staffNo) AS 'Staff Members (B004)' FROM Staff WHERE branchNo = 'B004';
SELECT COUNT(staffNo) AS 'Staff Members (London)' FROM Staff,Branch WHERE Staff.branchNo = Branch.branchNo AND Branch.City = 'London';
SELECT COUNT(branchNo) AS 'Branches' FROM Branch;
SELECT * FROM Staff ORDER BY salary ASC LIMIT 1 OFFSET 1;
SELECT Branch.branchNo, COUNT(Staff.staffNo) FROM Branch LEFT JOIN Staff ON Branch.branchNo = Staff.branchNo GROUP BY Branch.branchNo;
SELECT Branch.branchNo, SUM(Staff.salary) FROM Branch LEFT JOIN Staff ON Branch.branchNo = Staff.branchNo GROUP BY Branch.branchNo;
SELECT Branch.branchNo, AVG(Staff.salary) FROM Branch LEFT JOIN Staff ON Branch.branchNo = Staff.branchNo GROUP BY Branch.branchNo;
SELECT * FROM PropertyForRent WHERE rent IN (SELECT MAX(rent) FROM PropertyForRent);
SELECT * FROM PropertyForRent WHERE rent IN (SELECT MIN(rent) FROM PropertyForRent);