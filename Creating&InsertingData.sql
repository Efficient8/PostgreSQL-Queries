-- Creating Departments Table
CREATE TABLE Departments ( 
 DepartmentID SERIAL PRIMARY KEY, 
 DepartmentName VARCHAR(100) NOT NULL UNIQUE, 
 HeadOfDepartment VARCHAR(100) 
);

-- Setting DepartmentID to start from particular value
ALTER SEQUENCE Departments_DepartmentID_seq RESTART WITH 101;

-- Creating Students Table
CREATE TABLE Students ( 
 StudentID SERIAL PRIMARY KEY, 
 FirstName VARCHAR(50) NOT NULL, 
 LastName VARCHAR(50) NOT NULL, 
 DateOfBirth DATE NOT NULL, 
 Gender CHAR(1) CHECK (Gender IN ('M', 'F')), 
 Phone VARCHAR(15) UNIQUE, 
 Email VARCHAR(100) UNIQUE NOT NULL, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

-- Setting StudentID to start from particular value
ALTER SEQUENCE Students_StudentID_seq RESTART with 2022202401;

-- TRUNCATE TABLE Students;

-- Creating Courses Table
CREATE TABLE Courses ( 
 CourseID SERIAL PRIMARY KEY, 
 CourseName VARCHAR(100) NOT NULL, 
 Credits INT NOT NULL CHECK (Credits > 0), 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

-- Creating Instructors Table
CREATE TABLE Instructors ( 
 InstructorID SERIAL PRIMARY KEY, 
 FirstName VARCHAR(50) NOT NULL, 
 LastName VARCHAR(50) NOT NULL, 
 Phone VARCHAR(15) UNIQUE, 
 Email VARCHAR(100) UNIQUE NOT NULL, 
 HireDate DATE NOT NULL, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

-- Creating Enrollments Table
CREATE TABLE Enrollments ( 
 EnrollmentID SERIAL PRIMARY KEY, 
 StudentID INT, 
 CourseID INT, 
 InstructorID INT, 
 EnrollmentDate DATE NOT NULL, 
 Grade CHAR(2) CHECK (Grade IN ('A', 'B', 'C', 'D', 'F', 'P', 'I')), 
 FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
 FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), 
 FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) 
);

-- Creating Library Table
CREATE TABLE Library ( 
 BookID SERIAL PRIMARY KEY, 
 Title VARCHAR(100) NOT NULL, 
 Author VARCHAR(100) NOT NULL, 
 ISBN VARCHAR(20) UNIQUE, 
 DepartmentID INT, 
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

-- Creating BookLoans
CREATE TABLE BookLoans ( 
 LoanID SERIAL PRIMARY KEY, 
 BookID INT, 
 StudentID INT, 
 LoanDate DATE NOT NULL, 
 ReturnDate DATE, 
 FOREIGN KEY (BookID) REFERENCES Library(BookID), 
 FOREIGN KEY (StudentID) REFERENCES Students(StudentID) 
);

-- Inserting Data into tables

-- Inserting data into Departments Table
INSERT INTO Departments (DepartmentName, HeadOfDepartment) VALUES 
('Computer Science', 'Dr. Alice Johnson'), 
('Mechanical Engineering', 'Dr. Bob Smith'), 
('Electrical Engineering', 'Dr. Carol Lee'), 
('Civil Engineering', 'Dr. David Brown'), 
('MathemaƟcs', 'Dr. Emma Wilson'),
('Physics', 'Dr. Frank Thomas'), 
('Chemistry', 'Dr. Grace Miller'), 
('Biology', 'Dr. Henry Adams'), 
('Business AdministraƟon', 'Dr. Ivy Moore'),
('Economics', 'Dr. Jack White');

-- Viewing inserted data of Departments Table
SELECT * FROM Departments;

-- Inserting data into Students Table
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Phone, Email, 
DepartmentID) VALUES 
('John', 'Doe', '2002-05-15', 'M', '9876543210', 'john.doe@example.com', 101), 
('Jane', 'Smith', '2003-11-20', 'F', '9876543211', 'jane.smith@example.com', 102), 
('Alice', 'Brown', '2001-03-10', 'F', '9876543212', 'alice.brown@example.com', 103), 
('Bob', 'Taylor', '2000-12-05', 'M', '9876543213', 'bob.taylor@example.com', 104), 
('Emma', 'Wilson', '2002-08-22', 'F', '9876543214', 'emma.wilson@example.com', 105), 
('Frank', 'Thomas', '2003-06-18', 'M', '9876543215', 'frank.thomas@example.com', 106), 
('Grace', 'Miller', '2001-01-12', 'F', '9876543216', 'grace.miller@example.com', 107), 
('Henry', 'Adams', '2002-09-07', 'M', '9876543217', 'henry.adams@example.com', 108), 
('Ivy', 'Moore', '2001-04-03', 'F', '9876543218', 'ivy.moore@example.com', 109), 
('Jack', 'White', '2000-07-25', 'M', '9876543219', 'jack.white@example.com', 110);

--Viewing inserted data of Students Table
SELECT * FROM Students;

-- Inserting data into Courses
INSERT INTO Courses (CourseName, Credits, DepartmentID) VALUES 
('Data Structures', 4, 101), 
('Thermodynamics', 3, 102), 
('Circuit Analysis', 3, 103), 
('Structural Engineering', 4, 104), 
('Linear Algebra', 3, 105), 
('Quantum Mechanics', 4, 106), 
('Organic Chemistry', 4, 107), 
('GeneƟcs', 3, 108),
('MarkeƟng Principles', 3, 109),
('Microeconomics', 3, 110);

-- Viewing inserted data of Courses Table
SELECT * FROM Courses;

-- Inserting data into Instructors Table
INSERT INTO Instructors (FirstName, LastName, Phone, Email, HireDate, DepartmentID) 
VALUES 
('Dr. Alan', 'Turing', '9876543220', 'alan.turing@example.com', '2010-09-01', 101), 
('Dr. Barbara', 'Liskov', '9876543221', 'barbara.liskov@example.com', '2008-01-15', 102), 
('Dr. Charles', 'Babbage', '9876543222', 'charles.babbage@example.com', '2012-05-10', 103), 
('Dr. Dorothy', 'Vaughan', '9876543223', 'dorothy.vaughan@example.com', '2005-11-20', 104), 
('Dr. Edwin', 'Hubble', '9876543224', 'edwin.hubble@example.com', '2007-03-25', 105), 
('Dr. Florence', 'NighƟngale', '9876543225', 'florence.nightngale@example.com', '2003-07-30', 106), 
('Dr. Gregor', 'Mendel', '9876543226', 'gregor.mendel@example.com', '2000-12-05', 107), 
('Dr. Hedy', 'Lamarr', '9876543227', 'hedy.lamarr@example.com', '2009-08-15', 108), 
('Dr. Isaac', 'Newton', '9876543228', 'isaac.newton@example.com', '1998-02-28', 109), 
('Dr. James', 'Watson', '9876543229', 'james.watson@example.com', '2015-06-12', 110);

-- Viewing inserted data of Instructors Table
SELECT * FROM Instructors;

-- Inserting data into Enrollments Table
INSERT INTO Enrollments (StudentID, CourseID, InstructorID, EnrollmentDate, Grade) VALUES 
(2022202411, 1, 1, '2023-09-01', 'A'), 
(2022202412, 2, 2, '2023-09-01', 'B'), 
(2022202413, 3, 3, '2023-09-01', 'C'), 
(2022202414, 4, 4, '2023-09-01', 'B'), 
(2022202415, 5, 5, '2023-09-01', 'A'), 
(2022202416, 6, 6, '2023-09-01', 'C'), 
(2022202417, 7, 7, '2023-09-01', 'B'), 
(2022202418, 8, 8, '2023-09-01', 'A'), 
(2022202419, 9, 9, '2023-09-01', 'C'), 
(2022202420, 10, 10, '2023-09-01', 'B'); 

-- Viewing inserted data of Enrollments Table
SELECT * FROM Enrollments;

-- Inserting data into Library Table
INSERT INTO Library (Title, Author, ISBN, DepartmentID) VALUES 
('IntroducƟon to Algorithms', 'Thomas H. Cormen', '9780262033848', 101),
('Thermodynamics: An Engineering Approach', 'Yunus Çengel', '9780073398174', 102), 
('Electric Circuits', 'James W. Nilsson', '9780134746968', 103), 
('Structural Analysis', 'R. C. Hibbeler', '9780134605144', 104), 
('Linear Algebra Done Right', 'Sheldon Axler', '9783319110790', 105), 
('Principles of Quantum Mechanics', 'R. Shankar', '9781475705773', 106), 
('Organic Chemistry', 'Paula Yurkanis Bruice', '9780134042282', 107), 
('GeneƟcs: A Conceptual Approach', 'Benjamin A. Pierce', '9781319050962', 108),
('Principles of MarkeƟng', 'Philip Kotler', '9780134492513', 109),
('Microeconomics', 'Paul Krugman', '9781464188279', 110); 

-- Viewing data for Library Table
SELECT * FROM Library;

-- Inserting data into BookLoans Table
INSERT INTO BookLoans (BookID, StudentID, LoanDate, ReturnDate) VALUES 
(1, 2022202411, '2023-10-01', '2023-10-15'), 
(2, 2022202412, '2023-10-03', '2023-10-18'), 
(3, 2022202413, '2023-10-05', NULL), 
(4, 2022202414, '2023-10-07', '2023-10-22'), 
(5, 2022202415, '2023-10-10', NULL), 
(6, 2022202416, '2023-10-12', '2023-10-27'), 
(7, 2022202417, '2023-10-15', '2023-10-30'), 
(8, 2022202418, '2023-10-18', NULL), 
(9, 2022202419, '2023-10-20', '2023-11-05'), 
(10, 2022202420, '2023-10-25', NULL);

-- Viewing data of BookLoans Table
SELECT * FROM BookLoans;
