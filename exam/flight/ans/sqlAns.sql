-- 5.1
-- 5.1.1
SELECT Flight.destination FROM Flight
CROSS JOIN Airport
WHERE Flight.source = Airport.name AND Airport.OpenedYear = 1925;

-- 5.1.2
SELECT (2021-MIN(registrationYear)) AS min FROM Aircraft
NATURAL JOIN Flight;

-- 5.1.3
SELECT Flight.source, flight.destination, AVG(seats) AS avg FROM Aircraft
NATURAL JOIN Flight
GROUP BY Flight.source, flight.destination;

-- 5.2
-- 5.2.1 Which aircraft types have the largest number of seats?
SELECT type, MAX(seats) FROM Aircraft
GROUP BY type
LIMIT 1;

-- 5.2.2 Which aircrafts do not fly to (destination) Copenhagen or were registered before 2000.
SELECT aircraftNr FROM Flight
NATURAL JOIN Aircraft
WHERE NOT (destination = 'copenhagen' OR registrationYear < 2000);

-- 5.2.3 
-- For each flight compute the minimum covered distance. Note
-- that multiple aircrafts may fly under the same flight number. You may assume that durations are
-- given in minutes and the aircraft’s (constant) speed in kilometers per minute
SELECT (duration * speed) AS Distance FROM Flight
NATURAL JOIN Aircraft;

-- 5.3.1 Delete all flights that use aircrafts that were registered before 1975.
DELETE FROM Flight WHERE Flight.aircraftNR IN(
	SELECT aircraftNR FROM Aircraft WHERE registrationYear < 1975);
	

-- 5.3.2
-- Air-bike has made an upgrade to the aircrafts of type A330 that increases each aircraft’s speed by 15% 
-- and the number of seats by 10%. Update all aircrafts of that type accordingly.
UPDATE Aircraft 
SET seats = seats * 1.10, speed = speed * 1.15
Where type = 'A330';

-- 5.3.3 Reroute!
-- All flights from (source) Copenhagen to (destination) London Stansted or London Heathrow
-- should now target (destination) London Luton instead.
UPDATE Flight
SET destination = 'London Luton'
WHERE source = 'copenhagen' AND (destination = 'London Stansted' OR destination= 'London Heathrow');

-- 5.3.4 Create a materialized view for aircrafts that fly from or to Copenhagen.
CREATE TABLE view AS(
	SELECT * FROM Flight NATURAL JOIN Aircraft
	WHERE Flight.source = 'copenhagen' OR Flight.destination = 'copenhagen');

-- 5.3.5 COVID-19 strikes: Delete all flights!
DELETE FROM Flight;


