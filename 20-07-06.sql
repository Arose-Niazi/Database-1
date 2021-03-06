-- 1)
SELECT * FROM branch WHERE branchNo = 'B005';

-- 2)
SELECT * FROM staff WHERE salary > 18000;

-- 3)
SELECT staffNo,branchNo FROM staff WHERE salary <= 24000;

-- 4)
SELECT * FROM staff WHERE salary != 30000;

-- 5)
SELECT * FROM branch WHERE city = 'London';

-- 6)
SELECT * FROM staff WHERE YEAR(DOB) < 1965;

-- 7)
SELECT * FROM staff WHERE YEAR(DOB) BETWEEN 1940 AND 1960;

-- 8)
SELECT * FROM staff WHERE branchNo IN ('B003','B005','B007');

-- 9)
SELECT * FROM staff WHERE salary BETWEEN 9000 AND 25000;

-- 10)
SELECT * FROM staff WHERE position IN ('Manager','Assistant');

-- 11)
SELECT * FROM staff WHERE branchNo NOT IN ('B004','B007');

-- 12)
SELECT * FROM branch WHERE city = 'Aberdeen' AND postcode LIKE '%AB%';

-- 13)
SELECT * FROM branch WHERE city = 'London' OR branchNo = 'B004';

-- 14)
SELECT position FROM staff WHERE staffNo = 'SG13' AND fName = 'Ann' AND branchNo = 'B003';

-- 15)
SELECT * FROM branch WHERE city NOT IN ('Bristol','London');

-- 16)
SELECT * FROM staff WHERE salary IS NULL;

-- 17)
SELECT * FROM staff WHERE branchNo IS NULL;

-- 18)
SELECT * FROM staff WHERE fName = 'Ann' AND lName = 'Susan';

-- 19)
SELECT * FROM staff WHERE position = 'Supervisor' AND sex = 'M';

-- 20)
SELECT * FROM staff WHERE CHAR_LENGTH(salary) = 6;