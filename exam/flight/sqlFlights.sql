DROP TABLE IF EXISTS Flight;
DROP TABLE IF EXISTS Aircraft;
DROP TABLE IF EXISTS Airport;

CREATE TABLE Flight (
	flightNr varchar(255),
	source varchar(255),
	destination varchar(255),
	duration int, 
	aircraftNr int
);

CREATE TABLE Aircraft (
	aircraftNr int,
	type varchar(255), 
	speed int, 
	registrationYear int, 
	seats int
);

CREATE TABLE Airport(
	name varchar(255), 
	openedYear int
);

INSERT INTO Flight VALUES ('FR4056', 'JFK New York', 'CDG Paris', 420, 1001);
INSERT INTO Flight VALUES ('EK215', 'copenhagen', 'LAX Los Angeles', 1020, 1010);
INSERT INTO Flight VALUES ('LH123', 'FRA Frankfurt', 'HND Tokyo', 690, 1020);
INSERT INTO Flight VALUES ('QF8', 'SYD Sydney', 'copenhagen', 915, 1030);
INSERT INTO Flight VALUES ('BA55', 'LHR London', 'JNB Johannesburg', 660, 1040);

INSERT INTO Aircraft VALUES (1001, 'Boeing 747-8', 913, 2020, 467);
INSERT INTO Aircraft VALUES (1010, 'Airbus A380', 1020, 2021, 853);
INSERT INTO Aircraft VALUES (1020, 'Boeing 777', 905, 2022, 396);
INSERT INTO Aircraft VALUES (1030, 'Airbus A350', 945, 2023, 440);
INSERT INTO Aircraft VALUES (1040, 'Boeing 777', 913, 2021, 242);

INSERT INTO Airport Values ('JFK New York', 1948);
INSERT INTO Airport Values ('CDG Paris', 1974);
INSERT INTO Airport Values ('DXB Dubai', 1960);
INSERT INTO Airport Values ('LAX Los Angeles', 1930);
INSERT INTO Airport Values ('FRA Frankfurt', 1936);
