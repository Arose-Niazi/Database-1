-- 1)
CREATE DATABASE FurnitureStore;
----------------------------------------------------------------------------------------
-- 2)
CREATE TABLE WoodChair (
	chairID INT PRIMARY KEY,
	chairType ENUM('Dining','Easy','Office') NOT NULL,
	color VARCHAR(10) NOT NULL,
	price INT,
	vendorID INT,
	FOREIGN KEY (vendorID) REFERENCES VendorDetail(vendorID)
);
----------------------------------------------------------------------------------------
-- 3)
CREATE TABLE VendorDetail (
	vendorID INT PRIMARY KEY AUTO_INCREMENT,
	vendorName VARCHAR(40) NOT NULL,
	city VARCHAR(40) NULL DEFAULT 'Lahore',
	`phone#` CHAR(12) NOT NULL,
	email VARCHAR(128) NULL
);

ALTER TABLE VendorDetail
AUTO_INCREMENT = 1001;

CREATE INDEX idx_PH
ON VendorDetail (`phone#`);
----------------------------------------------------------------------------------------
-- 4)
INSERT INTO VendorDetail (vendorName, city, `phone#`) VALUES ('Aqsa Enterprises', 'Lahore', '0300-6107991');
INSERT INTO WoodChair (chairID, chairType, color, price, vendorID) VALUES ('701', 'Dining', 'Walnut', 5000, 1001);
----------------------------------------------------------------------------------------
-- 5)
INSERT INTO VendorDetail (vendorID, vendorName, city, `phone#`, email) VALUES (1009, 'Asaco', 'Karachi', '0321-2211911', 'asaco@gmail.com');
INSERT INTO WoodChair (chairID, chairType, color, price, vendorID) VALUES ('800', 'Easy', 'Hazel', 4500, 1009);
----------------------------------------------------------------------------------------
-- 6)
INSERT INTO VendorDetail (vendorName, city, `phone#`, email) VALUES ('Asif Trasders', 'Lahore', '0321-9467852', 'asifwoodtraders@gmail.com');
----------------------------------------------------------------------------------------
-- 7)
INSERT INTO WoodChair (chairID, chairType, color, vendorID) VALUES (801, 'Dining', 'Yellow', 1009);
----------------------------------------------------------------------------------------
-- 8)
INSERT INTO VendorDetail (vendorName, city, `phone#`, email) 
VALUES 
('Revive Furniture', 'Lahore', ' 0300-8426498', 'contact@Revivefurniture.pk'),
('Vantage Madera Casa', 'Islamabad', ' 0300-3124647', NULL),
('Su Casa Furnishings', 'Islamabad', ' 0323-5111777', NULL);

INSERT INTO WoodChair (chairID, chairType, color, price, vendorID) 
VALUES 
('802', 'Easy', 'Brown', 3000, 1009),
('900', 'Office', 'Maple', 15000, 1010),
('604', 'Easy', 'Brown', 4000, 1014);
----------------------------------------------------------------------------------------
-- 9)
INSERT INTO VendorDetail (vendorName, city) VALUES ('Interior Woods', 'Mianwali');
-- *This would give error as phone# has been set to not null.*
----------------------------------------------------------------------------------------
-- 10)
SELECT * FROM WoodChair;
----------------------------------------------------------------------------------------
-- 11)
SELECT * FROM VendorDetail WHERE email IS NULL;
----------------------------------------------------------------------------------------
-- 12)
SELECT vendorName,email,city FROM VendorDetail;
----------------------------------------------------------------------------------------
-- 13)
SELECT * FROM WoodChair WHERE price >= 3500;