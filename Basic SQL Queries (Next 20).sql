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

-- 31. Group students by their department and count the number of students in each.
SELECT * FROM Departments;
SELECT * FROM Students;

UPDATE Students SET DepartmentID=102 WHERE StudentID=2022202416;

SELECT COUNT(StudentID), DepartmentID FROM Students
GROUP BY DepartmentID;

-- 32. Find the number of courses offered by each department.
SELECT * FROM Courses;

UPDATE Courses SET DepartmentID=102 WHERE courseid=6;

SELECT DepartmentID, COUNT(coursename) FROM Courses
GROUP BY DepartmentID;

-- 33. Retrieve the total number of male and female students.
SELECT * FROM Students;

SELECT COUNT(gender), gender FROM Students
GROUP BY gender;

-- 34. Count the number of books authored by each author. 
SELECT * FROM Library;

UPDATE Library SET author='Thomas H. Cormen' WHERE bookid=4;

SELECT COUNT(title), author FROM Library
GROUP BY author;

-- 35. List each grade along with the number of students who received it.
SELECT * FROM Enrollments;

SELECT COUNT(StudentID) CountOfStudents, grade FROM Enrollments
GROUP BY grade;

-- 36. Retrieve the names of students and the departments they belong to.
SELECT * FROM Students;
SELECT * FROM Departments;

UPDATE Students SET departmentid=108 WHERE StudentID=2022202418;

SELECT CONCAT(s.firstname, ' ', s.lastname), d.departmentname FROM Students s
JOIN Departments d ON s.departmentid=d.departmentid;

-- 37. List all courses along with their respective departments.
SELECT * FROM Courses;

SELECT c.coursename, d.departmentname FROM Courses c
JOIN Departments d ON c.departmentid=d.departmentid;

-- 38. Display the names of instructors and the courses they teach. 
SELECT * FROM Instructors;
SELECT * FROM Courses;

SELECT CONCAT(i.firstname, ' ', i.lastname) as Instructor_Name, c.coursename FROM Instructors i
JOIN Courses c ON i.departmentid=c.departmentid;

-- 39. Retrieve the names of students and the books they have borrowed.
SELECT * FROM Students;
SELECT * FROM BookLoans;
SELECT * FROM Library;

SELECT CONCAT(s.firstname, ' ', s.lastname) Student_Name, l.title FROM Students s
JOIN BookLoans b ON s.studentid=b.studentid
JOIN Library l ON l.bookid=b.bookid;

-- 40. List all students and the courses they are enrolled in.
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT CONCAT(s.firstname, ' ', s.lastname) Student_Name, c.coursename FROM Students s
JOIN Enrollments e ON s.studentid=e.studentid
JOIN Courses c ON c.courseid=e.courseid;