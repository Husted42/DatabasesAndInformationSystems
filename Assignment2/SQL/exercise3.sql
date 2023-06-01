-- a) Find the model number, speed, and hard-disk size for all PCs whose price is under $1000 where
-- your rename the speed column to GHz and the hd column to GB.
SELECT pc.model, pc.speed AS GHz, pc.hd AS GB FROM pc
WHERE pc.price < 1000; 

-- b) Find the manufacturers of printers
SELECT DISTINCT product.maker FROM product 
WHERE product.model IN(
	SELECT printer.model FROM printer
);

-- c) Find the manufacturer and speed of laptops with a hard disk of at least thirty gigabytes.
SELECT laptop.model, product.maker, laptop.speed FROM laptop
LEFT JOIN product
ON laptop.model = product.model 
WHERE hd > 30;

-- d) Find the model number and price of all products (of any type) made by manufacturer B.
SELECT product.model, laptop.price FROM product 
RIGHT JOIN laptop ON laptop.model = product.model WHERE maker = 'B'
UNION
SELECT product.model, pc.price FROM product 
RIGHT JOIN pc ON pc.model = product.model WHERE maker = 'B'
UNION
SELECT product.model, pc.price FROM product 
RIGHT JOIN pc ON pc.model = product.model WHERE maker = 'B';

-- e) Find those manufacturers that sell Laptops, but not PCs 
SELECT DISTINCT product.maker, product.type
FROM product
WHERE product.type = 'laptop' 
AND product.maker NOT IN (SELECT maker FROM product WHERE type = 'pc');

-- f) Find the laptops whose speed is slower than that of any PC 
SELECT * FROM laptop
WHERE laptop.speed < (
	SELECT MIN(speed) FROM PC
);

-- g) Find the maker of the color printer with the lowest price
SELECT product.maker FROM product WHERE product.model IN(
	SELECT printer.model FROM printer WHERE printer.price IN(
		SELECT MIN(printer.price) FROM printer));

-- h) Find the model numbers, and the price of the computers (PC or laptop) with the highest speed.
(SELECT model, speed FROM pc UNION SELECT model, speed FROM laptop) ORDER BY speed DESC LIMIT 5;

-- i) Find for each manufacturer, the average screen size of its laptops.
SELECT product.maker, AVG(laptop.screen) FROM Laptop 
LEFT JOIN product ON product.model = laptop.model 
GROUP BY product.maker ORDER BY product.maker;

-- j) Find the manufacturers that make at least three different models of PC
SELECT product.maker, COUNT(product.type)
FROM product WHERE product.type = 'pc'
GROUP BY product.maker
HAVING COUNT(product.type) > 2;

-- k) Find for each manufacturer who sells PCs the maximum price of a PC.
SELECT product.maker, MAX(pc.price) FROM pc 
LEFT JOIN product ON product.model = pc.model
GROUP BY product.maker ORDER BY product.maker;

-- l) Find the average hard disk size of a PC for all those manufacturers that make printers.
SELECT product.maker, AVG(pc.hd) FROM product 
RIGHT JOIN pc ON product.model = pc.model
WHERE maker IN(
SELECT DISTINCT product.maker FROM product WHERE product.type = 'printer')
GROUP BY maker;


	


