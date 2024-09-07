USE sqlserver_udemy;
GO

-- buat tabel - primary key dan auto-increment
CREATE TABLE Konsumer (
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	NamaDepan VARCHAR(30) NOT NULL,
	NamaBelakang VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Created DATETIME NOT NULL
)