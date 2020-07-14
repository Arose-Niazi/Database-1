SELECT COUNT(branchNo) FROM Branch;
SELECT * FROM Branch WHERE City = 'London';
SELECT * FROM Branch WHERE branchNo IN ('B002','B005','B007');
SELECT * FROM Branch WHERE City IN ('Bristol','Glasgow');
SELECT * FROM Staff WHERE lName LIKE 'B%';
SELECT SUM(salary) FROM Staff WHERE sex = 'M';
UPDATE Staff SET position = 'Senior Manager' WHERE position = 'Manager';
SELECT * FROM PropertyForRent WHERE rooms < 6;
UPDATE PropertyForRent SET staffNo = 'SL41' where propertyNo = 'PA14';
SELECT * FROM Client WHERE eMail IS NULL;
SELECT * FROM Client WHERE prefType = 'Flat' ORDER BY maxRent DESC LIMIT 1;
SELECT * FROM PrivateOwner WHERE eMail LIKE 'j%';
SELECT PrivateOwner.*,PropertyForRent.* FROM PrivateOwner,PropertyForRent WHERE PrivateOwner.OwnerNo = PropertyForRent.ownerNo; 
SELECT PrivateOwner.*,PropertyForRent.*,Staff.* FROM PrivateOwner,PropertyForRent,Staff WHERE PrivateOwner.OwnerNo = PropertyForRent.ownerNo AND PropertyForRent.staffNo = Staff.staffNo AND PropertyForRent.propertyNo = 'PA14'
SELECT staffNo FROM Staff ORDER BY staffNo DESC;
SELECT COUNT(OwnerNo) FROM PrivateOwner;
SELECT * FROM PrivateOwner WHERE eMail IS NULL;
SELECT PropertyForRent.* FROM PropertyForRent,Viewing WHERE PropertyForRent.propertyNo = Viewing.propertyNo AND COMMENT IS NOT NULL;
SELECT *,TIMESTAMPDIFF(YEAR, Staff.DOB, CURDATE()) AS AGE FROM Staff;
SELECT Registration.clientNo, Registration.dateJoined FROM Registration;
SELECT COUNT(propertyNo) FROM Viewing WHERE clientNo = 'CR71'
SELECT * FROM `Viewing` WHERE viewDate < '2013-05-01';
SELECT Branch.* , Staff. * FROM Branch,Staff WHERE Branch.branchNo = Staff.branchNo;
SELECT * FROM Client WHERE Client.maxRent = 750 AND Client.prefType = 'House';
SELECT * FROM PrivateOwner WHERE PrivateOwner.LName LIKE 'F%l';
SELECT *,TIMESTAMPDIFF(YEAR, Staff.DOB, CURDATE()) AS AGE FROM Staff HAVING AGE < 50;
SELECT Client.*, Registration.dateJoined FROM Client,Registration WHERE Client.clientNo = Registration.clientNo;

