USE sqlserver_udemy;
GO

SELECT * FROM Konsumer;

-- check null data
SELECT * FROM Konsumer WHERE Email IS NULL;

-- check data yang tidak null
SELECT * FROM konsumer WHERE Email IS NOT NULL;


SELECT * FROM konsumer WHERE Email IS NOT NULL AND NamaDepan LIKE 'd%'