-- Basic Queries Next 10

-- Sorting

-- 21. List all courses sorted alphabetically by course name.
SELECT coursename FROM Courses ORDER BY coursename ASC;

-- 22. Display students sorted by their last name in descending order.
SELECT lastname FROM Students ORDER BY lastname DESC;

-- 23. Retrieve instructors sorted by their hire date (earliest first).
SELECT hiredate FROM Instructors ORDER BY hiredate ASC;

-- 24. List books sorted by their title.
SELECT title FROM Library ORDER BY title ASC;

-- 25. Retrieve the latest 5 enrollments based on enrollment date.
UPDATE Enrollments SET enrollmentdate='2024-04-01' WHERE enrollmentid=8;
SELECT * FROM Enrollments ORDER BY enrollmentdate DESC LIMIT 5;

-- Aggregate Functions

-- 26. Count the total number of students in the database.
SELECT COUNT(StudentID) Count_of_Students FROM Students;

-- 27. Find the average number of credits for all courses.
SELECT ROUND(AVG(credits), 2) FROM Courses;

-- 28. Count the total number of books in the Library table.
SELECT COUNT(bookid) FROM Library;

-- 29. Find the earliest hire date among all instructors.
SELECT hiredate FROM Instructors ORDER BY hiredate ASC LIMIT 1;

-- 30. Calculate the number of students enrolled in each course.
SELECT c.courseid, 
       c.coursename, 
       COUNT(e.studentid) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.courseid = e.courseid
GROUP BY c.courseid, c.coursename
ORDER BY c.coursename;