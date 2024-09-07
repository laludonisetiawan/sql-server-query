USE sqlserver_udemy;
GO


SELECT * FROM Konsumer;

-- ambil top
SELECT TOP 2 * FROM Konsumer;

-- ambil N data dengan urutan tertentu
SELECT TOP 3 * FROM Konsumer
ORDER BY NamaDepan ASC;