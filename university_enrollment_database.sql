CREATE DATABASE MIS310Project2;

USE MIS310Project2;

CREATE TABLE STUDENT (
[Student ID] CHAR(8) NOT NULL,
[First Name] VARCHAR(20) NOT NULL,
[Last Name] VARCHAR(20) NOT NULL,
[Street Name] VARCHAR(50) NOT NULL,
City VARCHAR(30) NOT NULL,
State CHAR(2) NOT NULL,
[Zip-code] CHAR(5) NOT NULL,
[Email Address] VARCHAR(100) NOT NULL,
[Phone number] VARCHAR(20) NOT NULL, 
Level VARCHAR(30) NOT NULL,
CONSTRAINT PK_Student PRIMARY KEY ([Student ID])
);

CREATE TABLE MAJOR (
[Major ID] CHAR(3) NOT NULL,
[Major Name] VARCHAR(50) NOT NULL,
Stem VARCHAR(5) NOT NULL,
CONSTRAINT PK_Major PRIMARY KEY ([Major ID])
);

CREATE TABLE [STUDENT MAJOR] (
[Student ID] CHAR(8) NOT NULL,
[Major ID] CHAR(3) NOT NULL,
CONSTRAINT PK_StudentMajor PRIMARY KEY ([Student ID], [Major ID]),
CONSTRAINT FK_StudentMajor_Student
FOREIGN KEY ([Student ID]) REFERENCES [STUDENT]([Student ID]),
CONSTRAINT FK_StudentMajor_Major
FOREIGN KEY ([Major ID]) REFERENCES [Major]([Major ID])
);

CREATE TABLE DEPARTMENT (
[Department Code] CHAR(4) NOT NULL,
[Department Name] VARCHAR(50) NOT NULL,
Chair CHAR(5) NULL,
CONSTRAINT PK_Department PRIMARY KEY ([Department Code])
);

CREATE TABLE PROFESSOR (
[Prof ID] CHAR(5) NOT NULL,
[First Name] VARCHAR(20) NOT NULL,
[Last Name] VARCHAR(20) NOT NULL,
[Department Code] CHAR(4) NOT NULL,
[Street Name] VARCHAR(50) NOT NULL,
City VARCHAR(30) NOT NULL,
State CHAR(2) NOT NULL,
[Zip-code] CHAR(5) NOT NULL,
[Email Address] VARCHAR(100) NOT NULL,
[Phone number] VARCHAR(20) NOT NULL,
CONSTRAINT PK_Professor PRIMARY KEY ([Prof ID]),
CONSTRAINT FK_Professor_Department
FOREIGN KEY ([Department Code]) REFERENCES DEPARTMENT([Department Code])
);

ALTER TABLE DEPARTMENT
ADD CONSTRAINT FK_Department_Professor
FOREIGN KEY (Chair) REFERENCES PROFESSOR([Prof ID]);

CREATE TABLE COURSE (
[Department Code] CHAR(4) NOT NULL,
[Course Number] INT NOT NULL,
Course VARCHAR(100) NOT NULL,
Credits INT NOT NULL,
CONSTRAINT PK_Course PRIMARY KEY ([Department Code], [Course Number]),
CONSTRAINT FK_Course_Department
FOREIGN KEY ([Department Code]) REFERENCES [DEPARTMENT]([Department Code])
);

CREATE TABLE PREREQUISITE (
[Department Code] CHAR(4) NOT NULL,
[Course Number] INT NOT NULL,
[PreRequisite Department Code] CHAR(4) NOT NULL,
[PreRequisite Course Number] INT NOT NULL,
CONSTRAINT PK_PreRequisite PRIMARY KEY
([Department Code], [Course Number], [PreRequisite Department Code], [PreRequisite Course Number]),
CONSTRAINT FK_PreRequisite_Course
FOREIGN KEY ([Department Code], [Course Number])
REFERENCES [COURSE]([Department Code], [Course Number]),
CONSTRAINT FK_PreRequisite_PreReqCourse
FOREIGN KEY ([PreRequisite Department Code], [PreRequisite Course Number])
REFERENCES [COURSE]([Department Code], [Course Number])
);

CREATE TABLE [COURSE SECTION] (
CRN INT NOT NULL,
[Department Code] CHAR(4) NOT NULL,
[Course Number] INT NOT NULL,
Section VARCHAR(10) NOT NULL,
Capacity INT NOT NULL,
Enrolled INT NOT NULL,
Room VARCHAR(50) NOT NULL,
[Prof ID] CHAR(5) NOT NULL,
Semester VARCHAR(20) NOT NULL,
CONSTRAINT PK_CourseSection PRIMARY KEY (CRN),
CONSTRAINT UQ_CourseSection UNIQUE ([Department Code], [Course Number], Section),
CONSTRAINT FK_CourseSection_Course
FOREIGN KEY ([Department Code], [Course Number])
REFERENCES [COURSE]([Department Code], [Course Number]),
CONSTRAINT FK_CourseSection_Professor
FOREIGN KEY ([Prof ID]) REFERENCES [PROFESSOR]([Prof ID])
);

CREATE TABLE [ENROLLMENT] (
[Enrollment ID] CHAR(5) NOT NULL,
[Student ID] CHAR(8) NOT NULL,
[Department Code] CHAR(4) NOT NULL,
[Course Number] INT NOT NULL,
Section VARCHAR(10) NOT NULL,
[Course Grade] INT NULL,
CONSTRAINT PK_Enrollment PRIMARY KEY ([Enrollment ID]),
CONSTRAINT FK_Enrollment_Student
FOREIGN KEY ([Student ID]) REFERENCES [STUDENT]([Student ID]),
CONSTRAINT FK_Enrollment_CourseSection
FOREIGN KEY ([Department Code], [Course Number], Section)
REFERENCES [COURSE SECTION]([Department Code], [Course Number], Section)
);



INSERT INTO STUDENT 
([Student ID], [First Name], [Last Name], [Street Name], City, State, [Zip-code], [Email Address], [Phone number], Level)
VALUES
('G2040413', 'Tyler', 'Jenkins', '7345 Astoria Lane', 'Fairfax', 'VA', '22030', 'tjenkins5@gmu.edu', '571-990-0540', 'Freshman'),
('G3040158', 'Pim', 'Pimpling', '12123 Rockery Drive', 'Alexandria', 'VA', '22312', 'ppimpling@gmu.edu', '703-204-2324', 'Sophomore'),
('G2738980', 'Charlie', 'Dompler', '1452 Cali Street', 'Fairfax', 'VA', '22034', 'cdompler2@gmu.edu', '571-023-2902', 'Sophomore'),
('G7380768', 'Allan', 'Red', '1739 Cooper Drive', 'Woodbridge', 'VA', '22191', 'ared@gmu.edu', '703-249-7796', 'Junior'),
('G8920224', 'Glenn', 'Garrison', '29302 Glee Court', 'Arlington', 'VA', '20318', 'ggarrison@gmu.edu', '571-294-2992', 'Senior'),
('G5551212', 'Ashley', 'Green', '908 Mason Street', 'Pittsburgh', 'PA', '15213', 'agreen@gmu.edu', '412-555-1212', 'Freshman');

INSERT INTO MAJOR 
([Major ID], [Major Name], Stem)
VALUES
('110', 'Business', 'BS'),
('123', 'Economics', 'BA'),
('203', 'MIS', 'BS'),
('224', 'Accounting', 'BS'),
('593', 'Operations Management', 'BS');

INSERT INTO DEPARTMENT
([Department Code], [Department Name], Chair)
VALUES
('BUS', 'Business', NULL),
('ECON', 'Economics', NULL),
('MIS', 'Management Information Systems', NULL),
('ACCT', 'Accounting', NULL),
('OSCM', 'Operations Systems Management', NULL);

INSERT INTO PROFESSOR
([Prof ID], [First Name], [Last Name], [Department Code], [Street Name], City, State, [Zip-code], [Email Address], [Phone number])
VALUES
('P0001', 'Stephanie', 'Reynolds', 'BUS', '5617 Rockfield Lane', 'Fairfax', 'VA', '22031', 'sreynolds@gmu.edu', '202-347-8801'),
('P0002', 'Hunter', 'Graham', 'ECON', '7314 Page Street', 'Lorton', 'VA', '22079', 'hgraham@gmu.edu', '571-743-7053'),
('P0003', 'Gregory', 'Thomas', 'MIS', '5698 Liberia Avenue', 'Manassas', 'VA', '20110', 'gthomas@gmu.edu', '571-802-8743'),
('P0004', 'Rebecca', 'Stevens', 'ACCT', '3456 Harper Lane', 'Gainesville', 'VA', '20155', 'rstevens@gmu.edu', '571-832-1578'),
('P0005', 'Ali', 'Reza', 'OSCM', '1345 Parker Street', 'Haymarket', 'VA', '20169', 'areza@gmu.edu', '703-076-3345');

UPDATE DEPARTMENT
SET Chair = 'P0001'
WHERE [Department Code] = 'BUS';

UPDATE DEPARTMENT
SET Chair = 'P0002'
WHERE [Department Code] = 'ECON';

UPDATE DEPARTMENT
SET Chair = 'P0003'
WHERE [Department Code] = 'MIS';

UPDATE DEPARTMENT
SET Chair = 'P0004'
WHERE [Department Code] = 'ACCT';

UPDATE DEPARTMENT
SET Chair = 'P0005'
WHERE [Department Code] = 'OSCM';

INSERT INTO [STUDENT MAJOR]
([Student ID], [Major ID])
VALUES
('G2040413', '110'),
('G3040158', '123'),
('G2738980', '203'),
('G7380768', '224'),
('G8920224', '593');

INSERT INTO COURSE
([Department Code], [Course Number], Course, Credits)
VALUES
('BUS', 103, 'Business and Society', 3),
('BUS', 210, 'Business Analytics I', 3),
('BUS', 310, 'Business Analytics II', 3),
('ECON', 103, 'Microeconomics', 3),
('ECON', 303, 'Intermediate Microeconomics', 3),
('MIS', 303, 'Database Management', 3),
('MIS', 310, 'Systems Analysis and Design', 3),
('MIS', 330, 'Advanced Database Applications', 3),
('ACCT', 203, 'Survey of Accounting', 3),
('ACCT', 303, 'Intermediate Accounting', 3),
('OSCM', 303, 'Operations Management', 3),
('OSCM', 320, 'Supply Chain Management', 3);

INSERT INTO PREREQUISITE
([Department Code], [Course Number], [PreRequisite Department Code], [PreRequisite Course Number])
VALUES
('BUS', 310, 'BUS', 210),
('ECON', 303, 'ECON', 103),
('MIS', 310, 'MIS', 303),
('MIS', 330, 'MIS', 310),
('ACCT', 303, 'ACCT', 203),
('OSCM', 320, 'OSCM', 303);

INSERT INTO [COURSE SECTION]
(CRN, [Department Code], [Course Number], Section, Capacity, Enrolled, Room, [Prof ID], Semester)
VALUES
(35980, 'MIS', 303, '001', 45, 42, 'Exploratory Hall 2036', 'P0003', 'Fall 2026'),
(34892, 'BUS', 310, '003', 65, 35, 'Art and Design 2003', 'P0001', 'Spring 2026'),
(43567, 'ACCT', 303, '002', 50, 40, 'Buchanan Hall 2308', 'P0004', 'Fall 2026'),
(34597, 'OSCM', 303, 'DL1', 45, 43, 'Online', 'P0005', 'Spring 2026'),
(24589, 'ECON', 303, '001', 75, 67, 'Blue Ridge Hall 129', 'P0002', 'Spring 2026');

INSERT INTO ENROLLMENT
([Enrollment ID], [Student ID], [Department Code], [Course Number], Section, [Course Grade])
VALUES
('E001', 'G2040413', 'BUS', 310, '003', 93),
('E002', 'G3040158', 'ECON', 303, '001', 86),
('E003', 'G2738980', 'MIS', 303, '001', 76),
('E004', 'G7380768', 'OSCM', 303, 'DL1', 73),
('E005', 'G8920224', 'ACCT', 303, '002', 91);

--Q1. List the first and last names of all students
SELECT [First Name], [Last Name]
FROM STUDENT;

--Q2. Retrieve all the majors a specific student is pursuing
SELECT 
    S.[Student ID],
    S.[First Name],
    S.[Last Name],
    M.[Major Name]
FROM STUDENT S
JOIN [STUDENT MAJOR] SM
    ON S.[Student ID] = SM.[Student ID]
JOIN MAJOR M
    ON SM.[Major ID] = M.[Major ID]
WHERE S.[Student ID] = 'G2040413';

--Q3. Find the number of students in each major
SELECT 
    M.[Major Name],
    COUNT(SM.[Student ID]) AS [Number of Students]
FROM MAJOR M
LEFT JOIN [STUDENT MAJOR] SM
    ON M.[Major ID] = SM.[Major ID]
GROUP BY M.[Major Name];

--Q4. Display all students living in a specific state
SELECT *
FROM STUDENT
WHERE State = 'PA';

--Q5. Find Students who have not declared any major yet
SELECT 
    S.[Student ID],
    S.[First Name],
    S.[Last Name]
FROM STUDENT S
LEFT JOIN [STUDENT MAJOR] SM
    ON S.[Student ID] = SM.[Student ID]
WHERE SM.[Major ID] IS NULL;

--Q6. Calculate each student's GPA
SELECT 
    S.[Student ID],
    S.[First Name],
    S.[Last Name],
    ROUND(AVG(
        CASE
            WHEN E.[Course Grade] >= 90 THEN 4.0
            WHEN E.[Course Grade] >= 80 THEN 3.0
            WHEN E.[Course Grade] >= 70 THEN 2.0
            WHEN E.[Course Grade] >= 60 THEN 1.0
            ELSE 0.0
        END
    ), 2) AS GPA
FROM STUDENT S
JOIN ENROLLMENT E
    ON S.[Student ID] = E.[Student ID]
GROUP BY S.[Student ID], S.[First Name], S.[Last Name]
ORDER BY GPA DESC;
