USE DemoERD
GO

-- one to one relationship (1-to-1)
CREATE TABLE RekamanGaji(
	KaryawanID INT PRIMARY KEY,
	GAJI DECIMAL(10,2),
	FOREIGN KEY (KaryawanID) REFERENCES Karyawan (KaryawanID)
)
GO

-- test menggunakan GUI untuk relasi one to one 
-- one to one relationship (1-to-1)
CREATE TABLE RekamanGaji2(
	KaryawanID INT PRIMARY KEY,
	GAJI DECIMAL(10,2)
)
GO