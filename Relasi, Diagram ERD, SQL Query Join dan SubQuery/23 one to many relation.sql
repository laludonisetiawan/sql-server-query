CREATE DATABASE DemoERD
GO

USE DemoERD
GO

-- one to many relation 
CREATE TABLE Departement(
	DepartementID INT IDENTITY(1,1) PRIMARY KEY,
	Nama VARCHAR(50),
)
GO

CREATE TABLE Karyawan(
	KaryawanID INT IDENTITY(1,1) PRIMARY KEY,
	Nama VARCHAR(50),
	DepartementID INT,
	FOREIGN KEY (DepartementID) REFERENCES Departement(DepartementID)
)
GO


-- test relation tanpa query foreign key one to many dengan GUI SQL SERVER 
CREATE TABLE Departement2(
	DepartementID INT IDENTITY(1,1) PRIMARY KEY,
	Nama VARCHAR(50),
)
GO

CREATE TABLE Karyawan2(
	KaryawanID INT IDENTITY(1,1) PRIMARY KEY,
	Nama VARCHAR(50),
	DepartementID INT
)
GO
