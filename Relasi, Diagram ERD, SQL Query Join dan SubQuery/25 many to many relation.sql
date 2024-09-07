USE DemoERD
GO

-- many to many relation 
/*
	Contohnya saya ingin membuat table proyek dimana setiap proyek dimiliki oleh banyak karyawan dan karyawan memiliki banyak proyek,
	dimana data keduanya tersebut ditampung ke dalam table ProyekKaryawan yang berisi karyawanID dan ProyekID yang sudah menerapkan PK dan FK 
*/
CREATE TABLE Proyek (
	ProyekID INT PRIMARY KEY,
	Nama VARCHAR (100)
)
GO

CREATE TABLE KaryawanProyek (
	KaryawanID INT,
	ProyekID INT,
	PRIMARY KEY (KaryawanID, ProyekID),
	FOREIGN KEY (KaryawanID) REFERENCES Karyawan(KaryawanID),
	FOREIGN KEY (ProyekID) REFERENCES Proyek(ProyekID)
)
GO


-- relasi menggunakan GUI SQL SERVER LANSUNG
CREATE TABLE Proyek2 (
	ProyekID INT PRIMARY KEY,
	Nama VARCHAR (100)
)
GO

CREATE TABLE KaryawanProyek2(
	KaryawanID INT,
	ProyekID INT,
	PRIMARY KEY (KaryawanID, ProyekID)	
)
GO