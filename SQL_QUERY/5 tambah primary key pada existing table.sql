USE sqlserver_udemy;
GO

-- buat table
CREATE TABLE Pegawai (
	id INT,
	nama_depan VARCHAR(30),
	nama_belakang VARCHAR(30),
	email VARCHAR(30),
	created DATETIME
)
GO

CREATE TABLE Pegawai2 (
	id INT NOT NULL,
	nama_depan VARCHAR(30),
	nama_belakang VARCHAR(30),
	email VARCHAR(30),
	created DATETIME
)
GO

-- Ubah id menjadi not null -- untuk merubah id yang memiliki tipe data null saat pembuatan tabel, lakukan perubahan tipedata sebelum membuat menjadi primary key
ALTER TABLE Pegawai
ALTER COLUMN id INT NOT NULL

-- ubah kolom sbg primary key
ALTER TABLE Pegawai
ADD PRIMARY KEY (id)