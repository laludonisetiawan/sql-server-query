USE TsqlTraining;
GO

-- temporary table local (#)
-- temporary table global (##)

-- buat table temporary
CREATE TABLE #Employee (
	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)
GO

-- sample data manual
INSERT INTO #Employee (EmployeeID,FirstName,LastName,Departement,Salary)
VALUES
(1,'doni', 'baswedan', 'HR', 1000)
GO
-- panggil
SELECT * FROM #Employee



-- buat table temporary global
CREATE TABLE ##Employee2 (
	EmployeeID INT PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Departement NVARCHAR(50),
	Salary INT
)
GO

-- sample data manual
INSERT INTO ##Employee2 (EmployeeID,FirstName,LastName,Departement,Salary)
VALUES
(1,'doni', 'baswedan', 'HR', 1000)
GO
-- panggil
SELECT * FROM ##Employee2

/*
Kesimpulan:
	local: tidak bisa diakses di luar query lain
	global: bisa diakses dari mana saja 

*/