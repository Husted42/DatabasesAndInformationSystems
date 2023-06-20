DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Attends;
DROP TABLE IF EXISTS Competes;

CREATE TABLE Course (
	courseID INT,
	title varchar(255),
	compID INT,
	capacity varchar(255),
	examForm varchar(255)
);

CREATE TABLE Student (
	studentID INT,
	name varchar(255),
	age INT,
	enrollYear INT
);

CREATE TABLE Attends (
	studentID INT,
	courseID INT,
	year INT,
	grade INT
);

CREATE TABLE Competes (
	studentID INT,
	compID INT,
	year INT,
	round INT,
	points INT
);

INSERT INTO Course Values (101, 'Intro to Computer Science', 1001, 200, 'Written');
INSERT INTO Course Values (102, 'Advanced Mathematics', 1002, 150, 'Online');
INSERT INTO Course Values (103, 'Physics', 1003, 100, 'Oral');
INSERT INTO Course Values (104, 'English Literature', 1004, 120, 'Written');
INSERT INTO Course Values (105, 'Biology', 1005, 180, 'Online');

INSERT INTO Student VALUES (501, 'John Smith', 19, 2022);
INSERT INTO Student VALUES (502, 'Emma Brown', 20, 2021);
INSERT INTO Student VALUES (503, 'Oliver Johnson', 18, 2023);
INSERT INTO Student VALUES (504, 'Sophia Williams', 21, 2020);
INSERT INTO Student VALUES (505, 'Michael Davis', 22, 2019);

INSERT INTO Attends VALUES (501, 101, 2023, 85);
INSERT INTO Attends VALUES (502, 102, 2023, 90);
INSERT INTO Attends VALUES (503, 103, 2023, 88);
INSERT INTO Attends VALUES (504, 104, 2023, 92);
INSERT INTO Attends VALUES (505, 105, 2023, 89);

INSERT INTO Competes VALUES (501, 1001, 2023, 1, 85);
INSERT INTO Competes VALUES (502, 1002, 2023, 2, 90);
INSERT INTO Competes VALUES (503, 1003, 2023, 3, 88);
INSERT INTO Competes VALUES (504, 1004, 2023, 2, 92);
INSERT INTO Competes VALUES (505, 1005, 2023, 1, 89);