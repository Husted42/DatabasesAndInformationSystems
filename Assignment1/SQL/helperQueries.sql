SELECT * FROM Restaurants;
SELECT * FROM Customer;
SELECT * FROM Ratings2;
SELECT * FROM Dishes;
SELECT * FROM orders;
SELECT * FROM Delivery;
SELECT * FROM Couriers;


-- All dishes on Østerbro
SELECT dishes_id
FROM Dishes
JOIN Restaurants ON restaurant_id = cooked_by
WHERE location = 'Østerbro';