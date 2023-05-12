INSERT INTO Cuisine(name) VALUES('Thai');
INSERT INTO Cuisine(name) VALUES('Danish');
INSERT INTO Cuisine(name) VALUES('Italian');
INSERT INTO Cuisine(name) VALUES('Mexican');

INSERT INTO Restaurants(name, location, date_created, speciality, password) VALUES('Green Mango', 'Hellerup', '2014-02-02', 'Thai', 'asdfg');
INSERT INTO Restaurants(name, location, date_created, speciality, password) VALUES('Mæxico', 'Østerbro', '2013-02-02', 'Mexican', 'zxcv');
INSERT INTO Restaurants(name, location, date_created, speciality, password) VALUES('tavola calda', 'Hellerup', '2016-02-02', 'Italian', 'qwerty');
INSERT INTO Restaurants(name, location, date_created, speciality, password) VALUES('Babas', 'Østerbro', '2020-04-03', 'Italian', 'jkl');
INSERT INTO Restaurants(name, location, date_created, speciality, password) VALUES('Glade Gris', 'Hellerup', '2020-04-03', 'Danish', 'jkl');

INSERT INTO Couriers(name, date_created, password, f_restaurant) VALUES('Jacob', '2020-04-03', 'password', 1);
INSERT INTO Couriers(name, date_created, password, f_restaurant) VALUES('Ole', '2020-04-03', 'password', 1);
INSERT INTO Couriers(name, date_created, password, f_restaurant) VALUES('Bo', '2020-04-03', 'password', 3);
INSERT INTO Couriers(name, date_created, password, f_restaurant) VALUES('Tom', '2020-04-03', 'password', 2);
INSERT INTO Couriers(name, date_created, password, f_restaurant) VALUES('Arne', '2020-04-03', 'password', 3);

UPDATE Restaurants SET f_courier = 1 WHERE restaurant_id = 1;
UPDATE Restaurants SET f_courier = 1 WHERE restaurant_id = 2;
UPDATE Restaurants SET f_courier = 2 WHERE restaurant_id = 3;
UPDATE Restaurants SET f_courier = 5 WHERE restaurant_id = 4;
UPDATE Restaurants SET f_courier = 5 WHERE restaurant_id = 5;

INSERT INTO Customer(name, date_created, password, location, f_cuisine, f_courier, f_restaurant) VALUES('Jens', '2020-04-03', 'password', 'Hellerup', 'Mexican', 1, 2);
INSERT INTO Customer(name, date_created, password, location, f_cuisine, f_courier, f_restaurant) VALUES('Ole', '2020-04-03', 'password', 'Hellerup','Mexican', 2, 3);
INSERT INTO Customer(name, date_created, password, location, f_cuisine, f_courier, f_restaurant) VALUES('Sky', '2020-04-03', 'password', 'Østerbro','Danish', 1, 5);
INSERT INTO Customer(name, date_created, password, location, f_cuisine, f_courier, f_restaurant) VALUES('Anton', '2020-04-03', 'password', 'Østerbro', 'Italian', 2, 4);

INSERT INTO Dishes(name, prices, cooked_by) VALUES('Panang', 150, 1);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Forårsruller', 69, 1);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Kyllingespyd', 74, 1);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Tacos', 50, 2);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Burito', 75, 2);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Guac', 59, 2);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Caponara', 199, 3);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Lasange', 199, 3);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Pizza', 199, 3);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Durum', 50, 4);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Pizza', 65, 4);
INSERT INTO Dishes(name, prices, cooked_by) VALUES('Butter chicken', 50, 4);

-- ## Jens orders Lasagne(8) from tavola calda (3) and Panang(1) from Geen Mango(1)  ##
INSERT INTO Delivery(c_accepted_by) VALUES(2);
INSERT INTO Orders(ordered_by, delivery_id) VALUES(1, 1);
INSERT INTO ComposedOf(orders_id, dish1, dish2) VALUES (1, 8, 1);

-- ## Jens rates tavola calda (3) 5 and Green Mango (1) 2 and courier (1-Jacob)
INSERT INTO Ratings(customer, restaurant, rating) VALUES (1, 3, 5);
INSERT INTO Ratings(customer, restaurant, rating) VALUES (1, 1, 2);
INSERT INTO Ratings2(customer, courier, rating) VALUES (1, 1, 5);

-- ##### Ole needs change, Mæxico and Green mango is not in the same city ##### --
-- ## Ole(2) orders Caponra(7) and Lasange(8) from tavola calda(3) and forårsruller(2) and kyllingespyd(3) from Green mango(1) ##
INSERT INTO Delivery(c_accepted_by) VALUES(1);
INSERT INTO Orders(ordered_by, delivery_id) VALUES(2, 2);
INSERT INTO ComposedOf(orders_id, dish1, dish2, dish3, dish4) VALUES (2, 7, 8, 2, 3);

-- ## Ole rates Mæxico(2) 1 and Green Mango (1) 2 and courier (2-Ole) 1
INSERT INTO Ratings(customer, restaurant, rating) VALUES (2, 3, 1);
INSERT INTO Ratings(customer, restaurant, rating) VALUES (2, 1, 2);
INSERT INTO Ratings2(customer, courier, rating) VALUES (2, 2, 1);

-- ## Sky Orders Burito(5) and Pizza(11) From Mæxico(2) and Babas(4)
INSERT INTO Delivery(c_accepted_by) VALUES(5);
INSERT INTO Orders(ordered_by, delivery_id) VALUES(3, 3);
INSERT INTO ComposedOf(orders_id, dish1, dish2) VALUES (3, 5, 11);

-- ## Sky rates rates courier (2) 1
INSERT INTO Ratings2(customer, courier, rating) VALUES (3, 4, 1);