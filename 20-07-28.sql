-- 1)
DELIMITER $$
CREATE PROCEDURE GetOwners()
BEGIN
	SELECT * 
 	FROM privateOwner;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 2)
DELIMITER $$
CREATE PROCEDURE GetPropertiesFromBranch(
	IN branch char(5)
)
BEGIN
	SELECT * 
 	FROM propertyForRent
	WHERE branch = branchNo;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 3)
DELIMITER $$
CREATE PROCEDURE GetClientsFromBranch(
	IN branch char(5)
)
BEGIN
	SELECT * 
 	FROM client
	WHERE clientNo IN (
        SELECT clientNo
        FROM registration
        WHERE branch = branchNo
    );
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 4)
DELIMITER $$
CREATE PROCEDURE GetViewdPropertiesOn(
	IN Date date
)
BEGIN
	SELECT * 
 	FROM propertyForRent
	WHERE propertyNo IN (
        SELECT propertyNo
        FROM viewing
        WHERE Date = viewDate
    );
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 5)
DELIMITER $$
CREATE PROCEDURE GetStaffWithSB(
    IN staff char(5),
	IN branch char(5)
)
BEGIN
	SELECT * 
 	FROM staff
	WHERE staff = staffNo
    AND branch = branchNo;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 6)
DELIMITER $$
CREATE PROCEDURE UpdateOwnerAddressByNum(
    IN owner char(5),
	IN addr varchar(50)
)
BEGIN
	UPDATE privateOwner 
 	SET address = addr
	WHERE owner = ownerNo;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 7)
DELIMITER $$
CREATE PROCEDURE GetStaffFromBranch(
	IN branch char(5)
)
BEGIN
	SELECT * 
 	FROM staff
	WHERE branch = branchNo;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 8)
DELIMITER $$
CREATE PROCEDURE DeleteProperty(
	IN property char(5)
)
BEGIN
	DELETE FROM propertyForRent
	WHERE property = propertyNo;
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 9)
DELIMITER $$
CREATE PROCEDURE GetPropertiesFromCity(
	IN c varchar(10)
)
BEGIN
	SELECT * 
 	FROM propertyForRent
	WHERE branchNo IN (
    	SELECT branchNo 
        FROM branch
        WHERE c = city
    );
END $$
DELIMITER ;
----------------------------------------------------------------------------------------
-- 10)
DELIMITER $$
CREATE PROCEDURE UpdateSalary(
    IN staff char(5),
	IN precent INT
)
BEGIN
	UPDATE staff 
 	SET salary = salary+salary*(precent/100)
	WHERE staff = staffNo;
END $$
DELIMITER ;