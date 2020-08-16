CREATE DATABASE Aptech
USE Aptech
GO
CREATE TABLE Classes(
	ClassName CHAR(6),
	Teacher NVARCHAR(30),
	TimeSlot VARCHAR(30),
	Class INT,
	Lab INT
)
--Tạo an unique, clustered index tên là MyClusteredIndex trên trường ClassName
CREATE UNIQUE CLUSTERED INDEX MyCusteredIndex ON Classes(ClassName) WITH (Pad_index = on,FillFactor =70, Ignore_Dup_Key = on)
DROP TABLE Classes 

--Tạo a nonclustered index tên là TeacherIndex trên trường Teacher
CREATE NONCLUSTERED INDEX TeacherIndex ON Classes(Teacher) 
DROP INDEX Classes.TeacherIndex

--Tạo lại MyClusteredIndex
DROP INDEX MyCusteredIndex ON Classes.ClassName
CREATE CLUSTERED INDEX MyCusteredIndex ON Classes(ClassName) WITH (DROP_EXISTING = ON,ALLOW_ROW_LOCKS = ON,ALLOW_PAGE_LOCKS=ON,MAXDOP=2)

--Tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab.
CREATE INDEX Class_lab ON Classes(Class,Lab) 
EXEC sp_helpindex 'Classes'