SELECT * FROM laptop;
SELECT * FROM pc;
SELECT * FROM printer;
SELECT * FROM product;

-- a)
INSERT INTO Product VALUES ('C', 1100, 'pc');
INSERT INTO PC VALUES (1100, 3.2, 1024, 180, 2499);

-- b)
DELETE FROM PC WHERE hd < 100;

-- c)
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




