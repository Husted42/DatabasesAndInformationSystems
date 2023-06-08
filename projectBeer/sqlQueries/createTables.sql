DROP TABLE Ratings CASCADE;
DROP TABLE Users CASCADE;
DROP TABLE Beers CASCADE;
DROP TABLE Breweries CASCADE;

CREATE TABLE Breweries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    location VARCHAR(50),
    est SMALLINT,
    history VARCHAR(1000),
    description VARCHAR(500) 
);
CREATE TABLE Beers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    alc DECIMAL(2,1),
    pri_ing VARCHAR(50),
    rating DECIMAL(2,1),
    description TEXT,
    brewery VARCHAR(50),
    FOREIGN KEY (brewery) REFERENCES Breweries(name)
);
CREATE TABLE Users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age SMALLINT,
    gender VARCHAR(20),
    since DATE 
);
CREATE TABLE Ratings (
    user_id INT,
    beer INT,
    rating INT,
    PRIMARY KEY (user_id, beer),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (beer) REFERENCES Beers(id)
);
select * from Beers