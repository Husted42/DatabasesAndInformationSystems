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

