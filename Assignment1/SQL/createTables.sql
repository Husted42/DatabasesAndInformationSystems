DROP TABLE Restaurants CASCADE;
DROP TABLE Customer CASCADE;
DROP TABLE Orders CASCADE;
DROP TABLE Couriers CASCADE;
DROP TABLE Dishes CASCADE;
DROP TABLE Cuisine CASCADE;
DROP TABLE TakeOut CASCADE;
DROP TABLE Delivery CASCADE;
DROP TABLE Ratings CASCADE;
DROP TABLE ComposedOf CASCADE;

CREATE TABLE Restaurants(
	restaurant_id SERIAL,
	name CHAR(20),
	location VARCHAR(30),
	date_created DATE,
	speciality CHAR(20), 
	password VARCHAR(20),
	PRIMARY KEY (restaurant_id)
);

CREATE TABLE Customer(
	customer_id SERIAL,
	name CHAR(20),
	date_created DATE,
	password VARCHAR(20),
	f_cuisine CHAR(20),
	f_courier INT,
	f_restaurant INT,
	PRIMARY KEY (customer_id)
);

CREATE TABLE Couriers(
	couriers_id SERIAL,
	name CHAR(20),
	date_created DATE,
	password VARCHAR(20),
	f_restaurant INTEGER,
	PRIMARY KEY (couriers_id)
);

CREATE TABLE Dishes(
	dishes_id SERIAL,
	name CHAR(20),
	prices INTEGER,
	cooked_by INTEGER,
	PRIMARY KEY (dishes_id)
);
	
CREATE TABLE Cuisine(
	name CHAR(20),
	PRIMARY KEY (name)
);

CREATE TABLE TakeOut(
	takeout_id SERIAL,
-- 	orders_id  INTEGER,
	PRIMARY KEY (takeout_id)
);
	
CREATE TABLE Delivery(
	delivery_id SERIAL,
	c_accepted_by INTEGER,
	location VARCHAR(20), 
-- 	orders_id INTEGER, 
	PRIMARY KEY (delivery_id)
);

CREATE TABLE Orders(
	orders_id SERIAL, 
	takeout_id INTEGER, 
	delivery_id INTEGER, 
	PRIMARY KEY (orders_id)
);

CREATE TABLE Ratings(
	customer INTEGER,
	restaurant INTEGER,
	rating INTEGER,
	PRIMARY KEY (customer, restaurant)
);

CREATE TABLE ComposedOf(
	orders_id INTEGER,
	dish1 INTEGER,
	dish2 INTEGER,
	dish3 INTEGER,
	dish4 INTEGER,
	dish5 INTEGER,
	PRIMARY KEY (orders_id)
);

ALTER TABLE Restaurants ADD FOREIGN KEY (speciality) REFERENCES Cuisine(name);
ALTER TABLE Ratings ADD FOREIGN KEY (restaurant) REFERENCES Restaurants(restaurant_id);
ALTER TABLE Ratings ADD FOREIGN KEY (customer) REFERENCES Customer(customer_id);
ALTER TABLE Customer ADD FOREIGN KEY (f_cuisine) REFERENCES Cuisine(name);
ALTER TABLE Customer ADD FOREIGN KEY (f_courier) REFERENCES Couriers(couriers_id);
ALTER TABLE Couriers ADD FOREIGN KEY (f_restaurant) REFERENCES Restaurants(restaurant_id);
ALTER TABLE Dishes ADD FOREIGN KEY (cooked_by) REFERENCES Restaurants(restaurant_id);
ALTER TABLE Customer ADD FOREIGN KEY (f_restaurant) REFERENCES Restaurants(restaurant_id);

-- Orders are composed of a maximum of 5 dishes
ALTER TABLE ComposedOf ADD FOREIGN KEY (dish1) REFERENCES Dishes(dishes_id); 
ALTER TABLE ComposedOf ADD FOREIGN KEY (dish2) REFERENCES Dishes(dishes_id); 
ALTER TABLE ComposedOf ADD FOREIGN KEY (dish3) REFERENCES Dishes(dishes_id); 
ALTER TABLE ComposedOf ADD FOREIGN KEY (dish4) REFERENCES Dishes(dishes_id); 
ALTER TABLE ComposedOf ADD FOREIGN KEY (dish5) REFERENCES Dishes(dishes_id); 

ALTER TABLE Delivery ADD FOREIGN KEY (c_accepted_by) REFERENCES Couriers(couriers_id);

ALTER TABLE Orders ADD FOREIGN KEY (delivery_id) REFERENCES Delivery(delivery_id);
ALTER TABLE Orders ADD FOREIGN KEY (takeout_id) REFERENCES Takeout(takeout_id);



