-- Which united orders are available for a given customer based on her/his location?
-- Interpreted: Which dishes can a given costumer add to his order based on location?
SELECT Dishes.name FROM Dishes WHERE Dishes.cooked_by  IN(
	SELECT restaurant_id from Restaurants WHERE Restaurants.location = (
	SELECT location FROM Customer WHERE Customer.customer_id = 1
	)
);

-- Which restaurants have been tagged as favorites and have received a poor rating from the same customer?
SELECT Ratings.restaurant FROM Ratings 
JOIN Customer ON Ratings.restaurant = Customer.f_restaurant 
AND Ratings.customer = Customer.customer_id 
AND Ratings.rating = 1;

-- Which couriers have been tagged as favorites by some restaurant and have received a poor rating from some customer?
SELECT f_courier FROM Restaurants WHERE f_courier IN(
	SELECT courier FROM Ratings2 WHERE rating = 1
);

-- Which customers gave a poor rating to all involved parties in a united order?
