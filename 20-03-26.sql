SELECT * FROM PropertyForRent WHERE NOT EXISTS (SELECT Viewing.propertyNo FROM Viewing WHERE Viewing.propertyNo = PropertyForRent.propertyNo);
SELECT PropertyForRent.propertyNo, COUNT(Viewing.propertyNo) AS TimesVisited FROM PropertyForRent LEFT JOIN Viewing ON PropertyForRent.propertyNo = Viewing.propertyNo GROUP BY Viewing.propertyNo;
SELECT * FROM Staff WHERE NOT EXISTS (SELECT PropertyForRent.staffNo FROM PropertyForRent WHERE PropertyForRent.staffNo = Staff.staffNo);
SELECT PrivateOwner.* FROM PrivateOwner,PropertyForRent WHERE PropertyForRent.ownerNo = PrivateOwner.OwnerNo GROUP BY PropertyForRent.ownerNo HAVING COUNT(PropertyForRent.propertyNo) > 2
SELECT * FROM Branch WHERE NOT EXISTS (SELECT PropertyForRent.branchNo FROM PropertyForRent WHERE PropertyForRent.branchNo = Branch.branchNo);
SELECT Branch.City FROM Branch GROUP BY Branch.City HAVING COUNT(Branch.branchNo) > 2;
SELECT * FROM Staff s WHERE EXISTS (SELECT Staff.* FROM Staff a WHERE a.salary = s.salary AND a.staffNo != s.staffNo);
SELECT Client.* FROM Client, PrivateOwner WHERE Client.tellNo = PrivateOwner.tellNo;
SELECT Branch.branchNo, COUNT(t.branchNo) FROM Branch LEFT JOIN (SELECT Registration.branchNo FROM Registration WHERE Registration.dateJoined BETWEEN '2013-05-01' AND '2013-05-31') AS t ON Branch.branchNo = t.branchNo GROUP BY Branch.branchNo
SELECT * FROM PrivateOwner s WHERE EXISTS (SELECT PrivateOwner.* FROM PrivateOwner a WHERE a.tellNo = s.tellNo AND a.OwnerNo != s.OwnerNo);
-- 
-- Special Query -> Will Give all the clients in May. 
SELECT Branch.branchNo, COUNT(t.branchNo) AS `Registrations in May` FROM Branch LEFT JOIN (SELECT Registration.branchNo,MONTH(Registration.dateJoined) AS Month FROM Registration HAVING Month  = 5) AS t ON Branch.branchNo = t.branchNo GROUP BY Branch.branchNo;