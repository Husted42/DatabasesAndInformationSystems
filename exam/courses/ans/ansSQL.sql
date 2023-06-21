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


