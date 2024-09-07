USE sqlserver_udemy;
GO

-- hapus kolom created
ALTER TABLE Konsumer
DROP COLUMN created

-- tambah kolom 
ALTER TABLE Konsumer
ADD Umur INT NOT NULL;

-- ubah tipe data kolom
ALTER TABLE Konsumer
ALTER COLUMN NamaDepan VARCHAR(50)

-- tsql - sql server - ubah nama kolom
EXEC sp_rename 'Konsumer.Umur','Age','COLUMN'