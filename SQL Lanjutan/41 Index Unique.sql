USE TsqlTraining;
GO;

-- buat table 
CREATE TABLE Employee (
	EmployeeID INT PRIMARY KEY,
	Email NVARCHAR(255),
	PhoneNumber NVARCHAR(20),
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Department NVARCHAR(50),
	Salary INT
)
-- kita tidak ingin setiap pegawai mendaftar dengan email yang sama
-- buat unique index pada email
CREATE UNIQUE INDEX IX_Employee_Email
ON Employee (Email);

SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Employee');

INSERT INTO Employee (EmployeeID, Email, PhoneNumber, FirstName, LastName, Department, Salary)
VALUES
(1, 'john.doe@example.com', '123-456-7890', 'John', 'Doe', 'HR', 60000),
(2, 'jane.smith@example.com', '234-567-8901', 'Jane', 'Smith', 'IT', 80000),
(3, 'michael.johnson@example.com', '345-678-9012', 'Michael', 'Johnson', 'Finance', 75000),
(4, 'emily.davis@example.com', '456-789-0123', 'Emily', 'Davis', 'IT', 85000),
(5, 'robert.brown@example.com', '567-890-1234', 'Robert', 'Brown', 'HR', 65000);


SELECT * FROM Employee;

-- test data duplikat
INSERT INTO Employee (EmployeeID, Email, PhoneNumber, FirstName, LastName, Department, Salary)
VALUES
(6, 'john.doe@example.com', '555-456-7890', 'John', 'Doe', 'HR', 60000);
GO

-- buat lagi unique index pada PhoneNumber
CREATE UNIQUE INDEX IX_Employee_PhoneNumber
ON Employee (PhoneNumber);
GO

-- cek nama index
SELECT name, type_desc
FROM sys.indexes
WHERE object_id = OBJECT_ID('Employee');
GO

-- hapus unique index pada Email dan PhoneNumber
DROP INDEX IF EXISTS IX_Employee_Email ON Employee;
GO
DROP INDEX IF EXISTS  IX_Employee_PhoneNumber ON Employee;
GO
-- hapus tabel
DROP TABLE IF EXISTS Employee;
GO

/*
	Kesimpulan:
		Unique index adalah diterapkan ketika kita tidak ingin data tertentu yang bersifat unik terduplikat saat menambahakan data baru didalam database
		contohnya email,username, no_telepon tidak boleh sama didalam 1 database dengan user lain 

*/