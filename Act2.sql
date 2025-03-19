
--own database format: <LastNAmeDistNameSQL>
create database VillanuevaArmaineSQL


DROP TABLE STUDENT;
DROP TABLE StudentGrade;
DROP TABLE COURSE;

--table STUDENT
CREATE TABLE STUDENT (
StudentID INT PRIMARY KEY, 
Lname VARCHAR(30) NOT NULL,
Mname VARCHAR(30),
Fname VARCHAR(30) NOT NULL,
Birthdate DATE
)

--table COURSE
CREATE TABLE COURSE (
CourseCode VARCHAR(10) PRIMARY KEY, 
C_Description VARCHAR(80),
Units_Credit INT NOT NULL
)

--table SEM 
CREATE TABLE StudentGrade (
StudentID INT,
CourseCode VARCHAR(10),
SchoolYear INT,
Semester VARCHAR(30),
Grade DECIMAL (4,2),
FOREIGN KEY (StudentID) REFERENCES STUDENT(StudentID) ON DELETE CASCADE,
FOREIGN KEY (CourseCode) REFERENCES COURSE(CourseCode) ON DELETE CASCADE
)


SELECT * FROM STUDENT
SELECT * FROM COURSE
SELECT * FROM StudentGrade

--Values into table STUDENT
INSERT INTO STUDENT --(StudentID, Lname, Mname, Fname, Birthdate)
VALUES (20181111, 'Cruz', 'M.', 'Ana', '2005-03-12'),
(20181112, 'Cruz', 'S.', 'John', '2004-02-24'),
(20182222, 'Santos', 'C.', 'Beth', '2005-01-11'),
(20183333, 'Salvador', 'E.', 'Manny', '2003-08-15'),
(20184444, 'Manuel', 'DC.', 'Nicole', '2005-03-10'),
(20185555, 'Castillo', 'DR.', 'Jay', '2005-07-30')

--Values table COURSE
INSERT INTO COURSE (CourseCode, C_Description, Units_Credit)
VALUES ('IT 202', 'Information Management', 5),
('IT 203', 'Object-Oriented Programming I', 5),
('IT 204', 'Networking', 5),
('IT 206', 'Advance Database', 5),
('IT 207', 'Object-Oriented Programming II', 5)

--Values table into 
INSERT INTO StudentGrade (StudentID, CourseCode, SchoolYear, Semester, Grade)
VALUES (20181112, 'IT202', 2022, 'First', 1.25),
(20181112, 'IT 202', '2022-2023', 'First', 1.75),
(20181112, 'IT 203', '2022-2023', 'First', 2.25),
(20183333, 'IT 202', '2022-2023', 'First', 2.25),
(20183333, 'IT 206', '2022-2023', 'First', 2.00),
(20184444, 'IT 203', '2022-2023', 'First', 3.00),
(20184444, 'IT 204', '2022-2023', 'First', 3.00),
(20184444, 'IT 207', '2022-2023', 'First', 2.00)





-- 4. Display the course code and the description of the course. Name the column as 'Course List'
SELECT CourseCode, C_Description AS 'Course List'
FROM COURSE;

-- 5. Display the student's name and their birthday in one column using the format: 
-- <Ana S. Cruz> was born on <Birthday>. Name the column as 'Student and their birthday'
SELECT 
    CONCAT(Fname, ' ', Mname, ' ', Lname, ' was born on ', DATE_FORMAT(Birthdate, '%M %d, %Y')) AS 'Student and their birthday'
FROM STUDENT;

-- 6. Display the description of the course and the unit credits of all courses where the third letter is 'v' in its description.
SELECT C_Description, Units_Credit
FROM COURSE
WHERE C_Description LIKE '__v%';

-- 7. Display the date of birth of the students that were born from 2004 to 2005.
SELECT Fname, Lname, Birthdate
FROM STUDENT
WHERE YEAR(Birthdate) BETWEEN 2004 AND 2005;

-- 8. Display the highest grade of the student whose student number is 2018-4444. Name the column as "Highest Grade".
SELECT MAX(Grade) AS 'Highest Grade'

--9. Drop your table named StudentGrade.
	drop table studentgrade

--10. Drop your database.
	drop database VillanuevaArmaineSQL