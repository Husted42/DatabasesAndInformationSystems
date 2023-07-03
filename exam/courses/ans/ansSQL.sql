-- 5.1
-- 5.1.1
-- Which pairs of students (IDs) have attended the same course (in the same year) at least once.
-- Each pair should be listed as many times as they have been attending the same course.
SELECT A.studentID, B.studentID FROM Attends A, Attends B
WHERE A.studentID >  B.studentID AND A.year = b.year AND A.courseID = B.courseID;

-- 5.1.2
-- How many different names of students are there?
SELECT COUNT(name) FROM Student GROUP BY name;

-- 5.1.3
-- What are the pairs of names of the oldest students and the existing courses (titles)?
SELECT name, title FROM Student NATURAL JOIN Course WHERE age IN(
	SELECT MAX(age) FROM Student
);

-- 5.2
-- 5.2.1
-- What is the grade average of every student (ID) who has attended at least one course?
SELECT AVG(grade) FROM Attends GROUP BY studentID;

-- 5.2.2
-- What are the names of students participating in the "DIS" competition in 2022 who have not attended this course in 2021 or earlier?
SELECT Student.name FROM Student
NATURAL JOIN Attends
NATURAL JOIN Competes
NATURAL JOIN Course
WHERE title = 'DIS' AND Attends.year < 2022 AND Competes.year = 2022;

-- 5.2.3
-- Which courses (IDs) were attended by more students in 2022 than is specified as their capacity?
SELECT courseID
FROM Course WHERE capacity < (SELECT COUNT(DISTINCT studentID) FROM Attends
							 WHERE Course.courseID = Attends.studentID AND year = 2022);

-- 5.3.1
-- Exmatriculate! Delete all students 
-- (and the associated course attendance and competition participation data) that enrolled before 2014
DELETE FROM Student;

-- 5.3.2
-- Bonus! Increase every student grade by 1
UPDATE Attends SET grade = grade + 1;

-- 5.3.3
-- Competition bonus! Increase the grade by 1 for those students who have participated in the associated competition
UPDATE Attends SET grade = grade + 1
WHERE studentid IN (SELECT studentid FROM Competes);

-- 5.3.4
-- Create a view DIS_Attends for the students attending the latest "DIS" course.
-- Note that the meaning of "latest" may change over time as data for the new course years arrives
CREATE TABLE DIS_Attends AS 
SELECT * FROM Attends WHERE courseid IN(
	SELECT courseid FROM Course WHERE title = 'DIS'
) AND year = 2023;
SELECT * FROM DIS_Attends;

-- 5.3.5
-- COVID-19 is over: Change all "take-home" exam forms to "written"!
UPDATE Course SET examform = 'written'
WHERE examform = 'Online';