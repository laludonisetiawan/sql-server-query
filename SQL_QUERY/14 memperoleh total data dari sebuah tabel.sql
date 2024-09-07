USE sqlserver_udemy;
GO

-- Memperoleh total data dari sebuah table
SELECT * FROM Konsumer;

-- cek jumlah data
SELECT COUNT(id) AS jumlah FROM Konsumer

-- filter nama depan dengan mentotalkan jumlah datanya
SELECT COUNT(id) AS jumlah FROM Konsumer WHERE  NamaDepan = 'ariane'