CREATE DATABASE Riverplate
USE Riverplate
GO
CREATE TABLE Students(
StudentNo INT PRIMARY KEY,
StudenName VARCHAR(50),
StudentAddress VARCHAR(100),
PhoneNo INT,
)
GO
DROP TABLE Students
GO
CREATE TABLE Department(
DeptNo INT PRIMARY KEY,
DeptName VARCHAR(50),
ManagerName VARCHAR(30)
)
GO
DROP TABLE Department
GO
CREATE TABLE Assignment(
AssignmentNo INT PRIMARY KEY,
Description VARCHAR(100)
)
GO 
DROP TABLE Assignment
GO
CREATE TABLE Works_Assign(
JobID INT PRIMARY KEY,
StudentNo INT,
AssignmentNo INT,
TotalHours INT,
JobDetails XML,
CONSTRAINT std FOREIGN KEY (StudentNo) REFERENCES Students(StudentNo),
CONSTRAINT Assign FOREIGN KEY (AssignmentNo) REFERENCES Assignment(AssignmentNo) 
)
GO
DROP TABLE Works_Assign
GO
CREATE INDEX IX_Students ON Students(StudentNo) WITH (PAD_INDEX = ON,FILLFACTOR = 70) 
ALTER INDEX IX_Students ON Students REBUILD WITH (PAD_INDEX = OFF) 
CREATE NONCLUSTERED INDEX IX_Dept ON Department(DeptNo,DeptName,ManagerName)
