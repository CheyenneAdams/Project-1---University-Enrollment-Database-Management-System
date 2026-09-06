# University Enrollment Database Management System
## Project Overview
This project demonstrates the design and implementation of a relational database for a university enrollment system using SQL. The database organizes student, major, course, professor, department, and enrollment data while maintaining relationships between each area.
This system was designed to support common university data needs, including tracking student majors, course enrollment, prerequisites, faculty assignments, and academic performance. 

## Tools & Skills 
- SQL
- Microsoft SQL Server
- Relational Database Design
- Data Modeling
- Primary & Foreign Keys
- JOINs and Aggregate Functions
- Data Analysis

## Database Structure
The database consists of nine interconnected tables:
- **STUDENT** - Stores student demographic and contact information
-  **MAJOR** - Stores available academic majors
-  **STUDENT MAJOR** - Connects students with their declared major(s)
-  **DEPARTMENT** - Stores university department information
-  **PROFESSOR** - Stores faculty information and department assignments
-  **COURSE** - Stores course information and credit values
-  **PREREQUISITE** - Connects courses with their required prerequisite courses
-  **COURSE SECTION** - Stores individual course sections, capacity, enrollment, professor, and semester information
-  **ENROLLMENT** - Connects students to course sections and stores course grades

## SQL Queries & Analysis
After building and populating the database, I developed SQL queries to answer common university questions, including:
- Retrieving the majors pursued by a specific student using multiple JOINs
- Calculating the number of students enrolled in each major
- Filtering student records by state
- Identifying students who have not declared a major
- Calculating student GPA using CASE statements and aggregate functions

## Example: Retrieving a Student's Major
This query joins the STUDENT, STUDENT MAJOR, and MAJOR tables to retrieve the major associated with a specific student. 

```sql
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
```
