SELECT staff.* FROM staff ORDER BY staff.fName DESC, staff.salary ASC;
SELECT * FROM propertyforrent WHERE NOT EXISTS (SELECT viewing.propertyNo FROM viewing WHERE  viewing.propertyNo = propertyforrent.propertyNo);
SELECT propertyforrent.propertyNo, COUNT(viewing.clientNo) FROM propertyforrent LEFT JOIN viewing ON viewing.propertyNo = propertyforrent.propertyNo GROUP BY propertyforrent.propertyNo;
-- INVALID----
SELECT COUNT(propertyNo) FROM propertyforrent WHERE ownerNo = 'CO76';
SELECT privateowner.*, COUNT(propertyforrent.propertyNo) FROM privateowner LEFT JOIN propertyforrent ON privateowner.OwnerNo = propertyforrent.ownerNo GROUP BY privateowner.OwnerNo;
SELECT * FROM staff WHERE NOT EXISTS (SELECT registration.staffNo FROM registration WHERE  registration.staffNo = staff.staffNo);
SELECT privateowner.*, COUNT(DISTINCT propertyforrent.branchNo) AS branches FROM privateowner LEFT JOIN propertyforrent ON privateowner.OwnerNo = propertyforrent.ownerNo GROUP BY privateowner.OwnerNo HAVING branches > 1;
SELECT branch.*, COUNT(propertyforrent.propertyNo) AS Properties FROM branch,propertyforrent WHERE branch.branchNo = propertyforrent.branchNo GROUP BY propertyforrent.branchNo HAVING Properties > 100
SELECT DISTINCT PrivateOwner.* FROM PrivateOwner WHERE PrivateOwner.address LIKE '%Glasgow%'
SELECT AVG(rent) FROM `propertyforrent` WHERE type = 'Flat';

