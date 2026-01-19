USE UNIVERSITY;



ALTER TABLE dbo.Students
ADD Fee INT;
INSERT INTO dbo.Departments VALUES
(1, 'BSCS'),
(2, 'BSAI'),
(3, 'BSSE'),
(4, 'BBA');

UPDATE dbo.Students
SET Fee = CASE 
    WHEN Programme = 'BSCS' THEN 150000
    WHEN Programme = 'BSSE' THEN 180000
    WHEN Programme = 'BSAI' THEN 160000
    WHEN Programme = 'BBA'  THEN 170000
    ELSE 0 -- Default fee if department not found
END;

SELECT Name, Programme, Fee
FROM dbo.Students;

SELECT * From dbo.Faculty;
SELECT * From dbo.Students;






INSERT INTO Enrollments (RolllNo, ClassID)
SELECT s.RollNo, c.ClassID
FROM Students s
JOIN Classes c ON s.DepartmentID = c.DepartmentID
WHERE s.RollNo = @RollNo;

    

UPdate Classes
set ClassName='BSCS-DSA'
where ClassID=3;

Select * From Students;
-- Check student
SELECT * FROM Students WHERE RollNo = '0095';

-- Check class
SELECT * FROM Classes;

-- Insert enrollment
INSERT INTO Enrollments (RolllNo, ClassID)
VALUES 
('004', 3);


SELECT ClassID FROM Classes;
CREATE TABLE Attendance (
    AttendanceID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID NVARCHAR(50),
    ClassID INT,
    FacultyID NVARCHAR(50),
    AttendanceDate DATE,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent')),
    FOREIGN KEY (StudentID) REFERENCES Students(RollNo),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(RollNo)
);
ALTER TABLE Attendance
ADD ClassName NVARCHAR(100);
Select * from Attendance;
SELECT RollNo, Name FROM Students;
INSERT INTO Attendance (StudentID, ClassID, AttendanceDate, Status)
VALUES ('009', 1, GETDATE(), 'Present');


Select * from Classes;
UPDATE s
SET s.DepartmentID = d.DepartmentID
FROM Students s
JOIN Departments d
    ON s.Programme = d.DepartmentName;

    UPDATE f
SET f.DepartmentID = d.DepartmentID
FROM Faculty f
JOIN Departments d
    ON f.Department = d.DepartmentName;

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Classes';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = 'RollNo';

Select * from Classes;


Select * from Marks;

DELETE FROM Marks;


SELECT TABLE_NAME, TABLE_SCHEMA, TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


Select * from Notice;