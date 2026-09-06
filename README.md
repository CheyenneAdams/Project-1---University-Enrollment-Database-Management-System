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
-  **COURSE SELECTION** - Stores individual course sections, capacity, enrollment, professor, and semester information
-  **ENROLLMENT** - Connects students to course sections and stores course grades
