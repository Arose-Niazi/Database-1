-- 1)
CREATE DATABASE `Excise&Taxation`;
----------------------------------------------------------------------------------------
-- 2)
CREATE TABLE VehicleRegistration (
	`Registration#` VARCHAR(20) PRIMARY KEY,
	registrationDate DATE,
	vehicleType VARCHAR(40),
	vendorName VARCHAR(40),
	modelName VARCHAR(40) UNIQUE,
	makeYear YEAR,
	CONSTRAINT ch_my CHECK (makeYear >= 1900),
	`horsePower C/C` INT(4) UNSIGNED,
	seatingCapacity INT(3) UNSIGNED,
	color VARCHAR(10),
	commercial CHAR(1) DEFAULT 'N',
	`imported/local` VARCHAR(8),
	CONSTRAINT ch_il CHECK (`imported/local` = 'imported' OR `imported/local` = 'local'),
	description TEXT,
	ownerCNIC CHAR(15) NULL,
	cityName VARCHAR(40), 
	FOREIGN KEY (ownerCNIC) REFERENCES OwnerDetail(OwnerCNIC),
	FOREIGN KEY (cityName) REFERENCES RegistrationCity(cityName)
);

CREATE INDEX idx_oc
ON VehicleRegistration (ownerCNIC);
----------------------------------------------------------------------------------------
-- 3)
INSERT INTO `VehicleRegistration` (`Registration#`, `registrationDate`, `vehicleType`, `vendorName`, `modelName`, `makeYear`, `horsePower C/C`, `seatingCapacity`, `color`, `commercial`, `imported/local`, `description`, `ownerCNIC`, `cityName`) 
VALUES 
('3213123', '2020-06-01', 'car', 'Toyata', 'Altis 1.6', '2020', '1600', '5', 'Black', 'N', 'local', NULL, '31202-282111-4', 'Islamabad'), 
('4213214', '2020-03-04', 'Car', 'Toyata', 'Grande', '2020', '1800', '4', 'Black', 'N', 'local', NULL, '61101-3894355-7', 'Lahore'), 
('8426342', '2019-06-11', 'Car', 'Honda', 'Civic Tubro', '2018', '1500', '5', 'White', 'N', 'local', NULL, '61101-3894355-7', 'Lahore'), 
('9732948', '2020-05-13', 'Truck', 'Mercedes-Benz', 'Actros', '2015', '8160', '3', 'Red', 'Y', 'imported', NULL, '61101-231324-1', 'Karachi'), 
('9472348', '2020-05-12', 'Truck', 'Mercedes-Benz', 'Actros V2', '2016', '8160', '3', 'Blue', 'Y', 'imported', NULL, '61101-231324-1', 'Karachi');
----------------------------------------------------------------------------------------
-- 4)
ALTER TABLE VehicleRegistration 
ADD CONSTRAINT ch_com CHECK (commercial IN ('Y','N'));
----------------------------------------------------------------------------------------
-- 5)
CREATE INDEX idx_vn_c
ON VehicleRegistration (vendorName,color);
----------------------------------------------------------------------------------------
-- 6)
DROP INDEX 	idx_oc ON VehicleRegistration; 
*Errors*
1) There is no ownerName column. The one column in OwnerDetails does not have index applied.
2) Assuming it's ownerCNIC, can't remove due to foreign key.
----------------------------------------------------------------------------------------
-- 7)
ALTER TABLE VehicleRegistration
DROP CONSTRAINT ch_my;
----------------------------------------------------------------------------------------
-- 8)
CREATE TABLE OwnerDetail (
	OwnerCNIC CHAR(15) PRIMARY KEY,
	ownerName VARCHAR(50) NOT NULL,
	city VARCHAR(40) NOT NULL,
	address VARCHAR(256) NOT NULL,
	`phone#` VARCHAR(15) NOT NULL,
	email VARCHAR(128) NULL
);

----------------------------------------------------------------------------------------
-- 9)
INSERT INTO `OwnerDetail` (`OwnerCNIC`, `ownerName`, `city`, `address`, `phone#`, `email`) 
VALUES 
('61101-3894355-7', 'Arose Niazi', 'Lahore', '66 1D, Block B, Askari 11', '0315-2033333', 'arose.niazi@yahoo.com'), 
('61101-282911-7', 'Afraz Waseem', 'Mianwali', 'M-143 Billokhel Mohallah', '0341-6688868', NULL), 
('31202-282111-4', 'Hamza Shaukat', 'Talagang', 'Talagang Mianwali Road', '0300-9448134', NULL), 
('33123-934829-9', 'Shafatullah', 'Karachi', 'Urugi town', '0331-4324182', 'shafullah@gmail.com'), 
('61101-231324-1', 'Ahmad Khan', 'Islamabad', 'House 2, Street 4, G10/3', '0304-4912341', NULL);
----------------------------------------------------------------------------------------
-- 10)
CREATE INDEX idx_PH
ON OwnerDetail (`phone#`);
----------------------------------------------------------------------------------------
11)
CREATE TABLE RegistrationCity (
	cityName VARCHAR(40) PRIMARY KEY,
	branchName VARCHAR(50) NOT NULL,
	`phone#` VARCHAR(15) NOT NULL,
	address VARCHAR(256) NOT NULL
);
----------------------------------------------------------------------------------------
-- 12)
INSERT INTO `RegistrationCity` (`cityName`, `branchName`, `phone#`, `address`) 
VALUES 
('Mianwali', 'Wattakhel Chowk Branch', '0900-7860113', 'Mianwali Multan Road, Mian'), 
('Islamabad', 'Bluearea Branch', '0900-7860112', '31, Plaza 4, Bluearea'), 
('Rawalipindi', 'Askari 3 Branch', '0900-7860113', 'Market, Block B, Askari 11'), 
('Karachi', 'Talwar Branch', '0900-7860114', 'Next to McDoanalds'), 
('Lahore', 'DHA Branch', '0900-7860115', 'H Block DHA Phase 5');
----------------------------------------------------------------------------------------
-- 13)
ALTER TABLE RegistrationCity 
ADD CONSTRAINT ch_citname CHECK (cityName IN ('Mianwali','Islamabad','Rawalipindi','Karachi','Lahore','Sargodha','Multan'));
----------------------------------------------------------------------------------------
-- 14)
SELECT COUNT(`Registration#`) FROM VehicleRegistration WHERE cityName = 'Lahore'