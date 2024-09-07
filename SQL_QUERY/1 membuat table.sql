USE sqlserver_udemy;
GO

-- Membuat Table
CREATE TABLE Pegawai(
	id INT,
	nama_depan VARCHAR(30),
	nama_belakang VARCHAR(30),
	email VARCHAR(30),
	created DATETIME
)
GO

CREATE TABLE Konsumer (
	Id INT NOT NULL, 
	NamaDepan VARCHAR(30) NOT NULL,
	NamaBelakang VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Created DATETIME NOT NULL
)
GO

