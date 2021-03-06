SELECT * FROM Staff GROUP BY Staff.position;
SELECT * FROM Branch ORDER BY branchNo DESC;
SELECT * FROM Staff,Branch WHERE Staff.branchNo = Branch.branchNo AND Branch.city = 'Bristol';
SELECT Staff.* FROM `Staff`,PropertyForRent WHERE PropertyForRent.staffNo = Staff.staffNo AND PropertyForRent.propertyNo IN ('PA14','PG4','PG36');
SELECT * FROM PropertyForRent WHERE PropertyForRent.staffNo IS NULL;
SELECT COUNT(propertyNo) FROM PropertyForRent WHERE ownerNo = 'CO87';
SELECT DISTINCT SUM(salary)/ COUNT(staffNo) As `Average Salary`, position FROM Staff WHERE position = 'Senior Manager';
SELECT salary*12*5 AS `5 Year Salary` FROM Staff WHERE fName = 'David' AND position = 'Supervisor';
SELECT * FROM Client WHERE Client.maxRent = 425 AND Client.prefType = 'Flat';
SELECT PrivateOwner.*,PropertyForRent.* FROM PrivateOwner,PropertyForRent WHERE PrivateOwner.OwnerNo = PropertyForRent.ownerNo; 
SELECT Client.* FROM Client,Viewing WHERE Client.clientNo = Viewing.clientNo AND Viewing.comment = 'Too Small';
SELECT * FROM PrivateOwner WHERE PrivateOwner.address LIKE '%Glasgow%';
-- or
SELECT DISTINCT PrivateOwner.* FROM PrivateOwner,PropertyForRent WHERE PrivateOwner.address LIKE '%Glasgow%' AND PrivateOwner.ownerNo = PropertyForRent.ownerNo;
SELECT * FROM PrivateOwner WHERE PrivateOwner.tellNo LIKE '%41%';
SELECT PrivateOwner.ownerNo,COUNT(PropertyForRent.propertyNo) FROM PrivateOwner LEFT JOIN PropertyForRent ON PrivateOwner.ownerNo = PropertyForRent.ownerNo GROUP BY PrivateOwner.OwnerNo
SELECT PrivateOwner.*,PropertyForRent.*,Staff.*,Branch.* FROM PrivateOwner,PropertyForRent,Staff,Branch WHERE PrivateOwner.OwnerNo = PropertyForRent.ownerNo AND PropertyForRent.staffNo = Staff.staffNo AND PropertyForRent.branchNo =  Branch.branchNo;
