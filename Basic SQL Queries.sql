-- Basic Queries (First 20 Queries)

-- Data Retrievel (SELECT queries)

-- 1. Retrieve all columns and rows from the Students table. 
SELECT * FROM Students;

-- 2. Display the first and last names of all students.
SELECT firstname, lastname from Students;

-- 3. List all courses offered by the Computer Science department.
SELECT * FROM Courses;
SELECT * FROM Departments;

SELECT * FROM Courses where DepartmentID=101;

-- 4. Find the details of students born after January 1, 2002.
SELECT * FROM Students;
SELECT * FROM Students where dateofbirth>'2002-01-01';

-- 5. Retrieve distinct department names from the Departments table.
SELECT DISTINCT * FROM Departments;

-- 6. Display the names of students enrolled in courses with 4 credits.
-- Approach
-- Get StudentID from Enrollments and Courses who has Credits of 4
-- Then get names from Students names using the result from above query
SELECT CONCAT(firstname,' ', lastname) FROM Students where studentid in (SELECT e.studentid from Enrollments e
JOIN Courses c on c.courseid=e.courseid WHERE c.credits=4);

-- 7. Find all books authored by "Paula Yurkanis Bruice."
SELECT title FROM Library WHERE author='Paula Yurkanis Bruice';

-- 8. Show the names and grades of students who received a grade of 'A.'
SELECT * FROM Enrollments;

SELECT CONCAT(s.firstname, ' ', s.lastname), e.grade FROM Students s
JOIN Enrollments e on e.studentid=s.studentid WHERE e.grade='A';

-- 9. Retrieve the first and last names of instructors hired before 2010. 
SELECT CONCAT(firstname, ' ', lastname), hiredate FROM Instructors WHERE hiredate<'2010-01-01';

-- 10. List all students and their email addresses.
SELECT CONCAT(firstname, ' ', lastname), email FROM Students;


-- Filtering with WHERE

-- 11. Find courses with more than 3 credits.
SELECT * FROM Courses WHERE credits>=3;

-- 12. List all male students in the Physics department. 
SELECT * FROM Departments;
SELECT * FROM Students;

SELECT * FROM Students
WHERE departmentid = 
(SELECT departmentid FROM Departments WHERE departmentname='Physics');

-- 13. Retrieve all instructors from the Business Administration department.
SELECT * FROM Instructors;
SELECT * FROM Departments;

-- UPDATE Departments SET departmentname='Mathematics' WHERE departmentid=105; 

SELECT * FROM Instructors
WHERE departmentid=
(SELECT departmentid FROM Departments WHERE departmentname='Business Administration');

-- 14. Find students whose phone number starts with '9876.'
SELECT * FROM Students;

SELECT * FROM Students WHERE phone LIKE '9876%';

-- 15. Retrieve all books loaned out but not yet returned (ReturnDate IS NULL). 
SELECT * FROM BookLoans;
SELECT * FROM Library;

SELECT title FROM Library where bookid in
(SELECT bookid FROM BookLoans WHERE returndate is null);

-- 16. Show all enrollments where the grade is either 'A' or 'B.'
SELECT * FROM Enrollments WHERE grade in ('A', 'B');

-- 17. Find all books with the word "Principles" in their title.
SELECT title FROM Library WHERE title LIKE '%Principles%';

-- 18. Retrieve all students whose email domain is example.com.
SELECT studentid FROM Students WHERE email LIKE '%example.com%';

-- 19. List all departments with names starting with "C."
SELECT departmentname FROM Departments WHERE departmentname LIKE 'C%';

-- 20. Find students born between 2001-01-01 and 2002-12-31.
SELECT * FROM Students WHERE dateofbirth BETWEEN '2001-01-01' AND '2002-12-31';