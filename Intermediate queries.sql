-- Intermediate Queries

-- Advanced Data Retrieval

-- 1. Retrieve the full names of students with their department names.
SELECT * FROM Students;
SELECT * FROM Departments;

SELECT CONCAT(s.firstname, ' ', s.lastname) Full_Name, d.departmentname
FROM Students s
JOIN Departments d
ON s.departmentid=d.departmentid;

-- 2. Find students who are enrolled in multiple courses.
SELECT * FROM Enrollments;
INSERT INTO Enrollments VALUES(11, 2022202417, 10, 10, '2024-01-01', 'A');
INSERT INTO Enrollments VALUES(12, 2022202417, 1, 1, '2024-01-01', 'B');

SELECT * FROM Students WHERE studentid
in (SELECT studentid FROM Enrollments
GROUP BY studentid HAVING COUNT(courseid)>=3);

-- 3. List all instructors who teach at least one course with 4 credits.
SELECT * FROM Instructors;
SELECT * FROM Courses;

SELECT CONCAT(firstname, ' ', lastname) 
FROM Instructors 
WHERE departmentid 
IN (SELECT departmentid FROM Courses
WHERE credits=4);

-- 4. Retrieve the names of all students who have borrowed more than 3 books. 
SELECT * FROM Students;
SELECT * FROM BookLoans;
INSERT INTO BookLoans (bookid, studentid, loandate, returndate)
VALUES (2, 2022202411, '2023-10-01', '2023-10-15'),
(3, 2022202411, '2023-10-01', '2023-10-15'),
(4, 2022202411, '2023-10-01', '2023-10-15');

SELECT CONCAT(firstname, ' ', lastname) Full_Name 
FROM Students WHERE Studentid
in (SELECT studentid 
FROM BookLoans 
GROUP BY studentid
HAVING COUNT(bookid)>3);

-- 5. Show the details of students who have received the same grade in more than one course.
SELECT * FROM Enrollments;
SELECT * FROM Students;

SELECT 
    s.studentid,
    s.firstname,
    s.lastname,
    e.grade,
    COUNT(e.courseid) AS course_count
FROM 
    students s
JOIN 
    enrollments e ON s.studentid = e.studentid
GROUP BY 
    s.studentid, e.grade
HAVING 
    COUNT(e.courseid) > 1;