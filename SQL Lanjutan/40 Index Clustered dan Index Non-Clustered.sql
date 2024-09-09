USE TsqlTraining;
GO

--  Clustered Index
-- hanya boleh 1 clustered index setiap table
-- primary key akan generate cluster index 
CREATE TABLE EmployeeIndex (
	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)

-- Non-Clustered-IndeX
-- Primary key akan generate non-clustered index
CREATE TABLE Employee2 (
	EmployeeID INT PRIMARY KEY NONCLUSTERED,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)

-- Untuk melihat index dan keys bisa dilakukan di GUI MSSQL dari masing-masing table
-- Melihat key menggunakan query

SELECT name
FROM sys.key_constraints
WHERE type = 'PK' AND parent_object_id = OBJECT_ID('EmployeeIndex')


SELECT name
FROM sys.key_constraints
WHERE type = 'PK' AND parent_object_id = OBJECT_ID('Employee2')



-- test primary key vs non primary key
-- buat table
CREATE TABLE EmployeewithPK (
	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)

CREATE TABLE EmployeewithoutPK (
	EmployeeID INT,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)


-- isi data
-- Insert data into EmployeeWithPK
INSERT INTO EmployeeWithPK (EmployeeID, FirstName, LastName, Departement, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 60000),
(2, 'Jane', 'Smith', 'IT', 80000),
(3, 'Michael', 'Johnson', 'Finance', 75000),
(4, 'Emily', 'Davis', 'IT', 85000),
(5, 'Robert', 'Brown', 'HR', 65000);

-- Insert the same data into EmployeeWithoutPK
INSERT INTO EmployeeWithoutPK (EmployeeID, FirstName, LastName, Departement, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 60000),
(2, 'Jane', 'Smith', 'IT', 80000),
(3, 'Michael', 'Johnson', 'Finance', 75000),
(4, 'Emily', 'Davis', 'IT', 85000),
(5, 'Robert', 'Brown', 'HR', 65000);

select * from EmployeeWithPK;
select * from EmployeeWithoutPK;

-- cek pemakaian memory cpu dll
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT * FROM EmployeewithPK WHERE EmployeeID = 3;
SELECT * FROM EmployeewithoutPK WHERE EmployeeID = 3;


-- Hapus clustered
ALTER TABLE EmployeeIndex DROP CONSTRAINT PK__Employee__7AD04FF1EF839D2C;
ALTER TABLE Employee2 DROP CONSTRAINT PK__Employee__7AD04FF01536FD68;
GO

-- (3)-------------------------
-- Non-Clustered index
-- boleh lebih dari 1 untuk non-clustered index setiap table
CREATE TABLE Employee3 (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary INT,
    HireDate DATE
);
GO

CREATE TABLE Employee3NonClustered (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary INT,
    HireDate DATE
);
GO

INSERT INTO Employee3 (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 60000, '2020-01-15'),
(2, 'Jane', 'Smith', 'IT', 80000, '2019-03-20'),
(3, 'Michael', 'Johnson', 'Finance', 75000, '2018-07-10'),
(4, 'Emily', 'Davis', 'IT', 85000, '2021-06-01'),
(5, 'Robert', 'Brown', 'HR', 65000, '2022-02-25');
GO

INSERT INTO Employee3NonClustered (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES
(1, 'John', 'Doe', 'HR', 60000, '2020-01-15'),
(2, 'Jane', 'Smith', 'IT', 80000, '2019-03-20'),
(3, 'Michael', 'Johnson', 'Finance', 75000, '2018-07-10'),
(4, 'Emily', 'Davis', 'IT', 85000, '2021-06-01'),
(5, 'Robert', 'Brown', 'HR', 65000, '2022-02-25');
GO

SELECT * FROM Employee3;
SELECT * FROM Employee3NonClustered;

-- membuat non clustered index pada kolom LastName pada table Employee3NonClustered
CREATE NONCLUSTERED INDEX IX_Employee_LastName
ON Employee3NonClustered (LastName);

-- membuat non clustered index pada kolom Department pada table Employee3NonClustered
CREATE NONCLUSTERED INDEX IX_Employee_Department
ON Employee3NonClustered (Department);

-- membuat non clustered index pada kolom HireDate pada table Employee3NonClustered
CREATE NONCLUSTERED INDEX IX_Employee_HireDate
ON Employee3NonClustered (HireDate);

-- test yang sudah diberikan index 
-- bandingkan dengan table Employee3 yang tidak di index secara non clustered dengan Employee3NonClustered yang sudah di index dengan cara nonClustered
SELECT * FROM Employee3 WHERE LastName = 'Smith';
GO
SELECT * FROM Employee3NonClustered WHERE LastName = 'Smith';
GO

SELECT * FROM Employee3 WHERE Department = 'IT';
GO
SELECT * FROM Employee3NonClustered WHERE Department = 'IT';
GO

SELECT * FROM Employee3 WHERE HireDate = '2021-06-01';
GO
SELECT * FROM Employee3NonClustered WHERE HireDate = '2021-06-01';
GO

-- hapus non-clustered index
DROP INDEX IF EXISTS IX_Employee_LastName ON Employee3NonClustered;
DROP INDEX IF EXISTS IX_Employee_Department ON Employee3NonClustered;
DROP INDEX IF EXISTS IX_Employee_HireDate ON Employee3NonClustered;



-- mematikan statistics
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;


-- hapus tabel
DROP TABLE IF Exists Employee;
DROP TABLE IF Exists Employee2;
DROP TABLE IF Exists Employee3;
DROP TABLE IF Exists Employee3NonClustered;
DROP TABLE IF Exists EmployeeWithPK;
DROP TABLE IF Exists EmployeeWithoutPK;

--Kesimpulan:
	-- indexing NonClustered disarankan untuk melakukan pencarian berdasarkan kolom-kolom tertentu yang sering digunakan
	-- dari sisi preformance itu jauh lebih cepat dibandingkan melakukan indexing menggunakan primary key biasa
GO
