USE sqlserver_udemy;
GO

-- ambil tanggal dan jam hari ini 
SELECT GETDATE() AS 'tanggal-jam'

-- tambah data pada tabel 
INSERT INTO Konsumer(NamaDepan,NamaBelakang,Email, Created) 
VALUES 
('Konsumer','1', 'konsumer1@gmail.com',GETDATE()),
('Konsumer','2', 'konsumer1@gmail.com',GETDATE()),
('Konsumer','3', 'konsumer1@gmail.com',GETDATE())
GO

-- cek data
SELECT * FROM Konsumer;