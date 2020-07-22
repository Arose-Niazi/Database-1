-- 1)
SELECT * FROM privateOwner WHERE ownerNo NOT IN (SELECT privateOwner.ownerNo FROM privateOwner INNER JOIN propertyForRent ON propertyForRent.ownerNo = privateOwner.ownerNo WHERE type != 'Flat');
----------------------------------------------------------------------------------------
-- 2)
SELECT * FROM privateOwner WHERE address LIKE '%Glasgow%';
----------------------------------------------------------------------------------------
-- 3)
SELECT * FROM privateOwner LEFT JOIN propertyForRent ON privateOwner.ownerNo = propertyForRent.ownerNo;
----------------------------------------------------------------------------------------
-- 4)
SELECT * FROM branch LEFT JOIN propertyForRent ON branch.branchNo = propertyForRent.branchNo;
----------------------------------------------------------------------------------------
-- 5)
SELECT * FROM staff LEFT JOIN propertyForRent ON staff.staffNo = propertyForRent.staffNo;
----------------------------------------------------------------------------------------
-- 6)
SELECT * FROM staff WHERE staffNo NOT IN (SELECT staffNo FROM propertyForRent WHERE staffNo IS NOT NULL)
----------------------------------------------------------------------------------------
-- 7)
SELECT * FROM privateOwner WHERE ownerNo NOT IN (SELECT ownerNo FROM propertyForRent);
----------------------------------------------------------------------------------------
-- 8)
SELECT * FROM staff RIGHT JOIN propertyForRent ON staff.staffNo = propertyForRent.staffNo;
----------------------------------------------------------------------------------------
-- 9)
SELECT * FROM branch,staff; -- The question doesn't ask for their staff.
----------------------------------------------------------------------------------------
-- 10)
SELECT * FROM branch,propertyForRent; -- The question asks for all branches and all properties
----------------------------------------------------------------------------------------
-- 11)
SELECT * FROM client LEFT JOIN viewing ON client.clientNo = viewing.clientNo; -- This doesn't ask for all viewings so added join
----------------------------------------------------------------------------------------
-- 12)
SELECT * FROM propertyForRent WHERE propertyNo NOT IN (SELECT propertyNo FROM viewing);
----------------------------------------------------------------------------------------
-- 13)
SELECT privateOwner.ownerNo, client.clientNo FROM privateOwner INNER JOIN client ON privateOwner.email = client.email; -- Obviously two people don't have same email.
----------------------------------------------------------------------------------------
-- 14)
SELECT YEAR(viewDate) AS Year, propertyNo, SUM(YEAR(viewDate))/YEAR(viewDate) AS TimesViewd FROM viewing GROUP BY Year, propertyNo HAVING TimesViewd = 2
----------------------------------------------------------------------------------------
-- 15)
SELECT * FROM staff WHERE staffNo IN (SELECT staffNo FROM privateOwner INNER JOIN staff ON privateOwner.fName = staff.fName AND privateOwner.lName = staff.lName WHERE ownerNo IN (SELECT ownerNo FROM propertyForRent)); -- No other way to see if a staff member is also a private owner.