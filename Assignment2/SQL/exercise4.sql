-- a)Using two INSERT statements, store in the database the fact that PC model 1100 is made by
--   manufacturer C, has speed 3.2, RAM 1024, hard disk 180, and sells for $2499.
INSERT INTO Product VALUES ('C', 1100, 'pc');
INSERT INTO PC VALUES (1100, 3.2, 1024, 180, 2499);

-- b) Delete all PCs with less than 100 gigabytes of hard disk.
DELETE FROM PC WHERE hd < 100;

-- c) Delete all laptops made by a manufacturer that does not make printers
DELETE FROM product WHERE product.model IN(
	SELECT product.model FROM product
	WHERE product.type = 'laptop' 
	AND product.maker NOT IN (SELECT maker FROM product WHERE type = 'printer')
);

DELETE FROM Laptop WHERE Laptop.model IN(
	SELECT product.model FROM product
	WHERE product.type = 'laptop' 
	AND product.maker NOT IN (SELECT maker FROM product WHERE type = 'printer')
);

-- d) Manufacturer A acquires manufacturer B. Change all of B’s products, so they are now made by A.
UPDATE product
SET maker = 'B'
WHERE maker = 'A';

-- e) For each PC, double the amount of RAM and add 60 gigabytes to the amount of hard disk
UPDATE pc
SET ram = ram * ram, hd = hd + 60;

-- f) For each laptop made by manufacturer B, add one inch to the screen size and subtract $100 from
-- the price.
UPDATE laptop
SET screen = screen + 1, price = price - 100
WHERE model IN(
	SELECT model FROM product WHERE maker = 'B'
);

-- g) Enough! Delete all products!
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PC;
DROP TABLE IF EXISTS Laptop;
DROP TABLE IF EXISTS Printer;


