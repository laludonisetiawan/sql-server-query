USE sqlserver_udemy;
GO

SELECT * FROM Konsumer;

-- filter data
SELECT * FROM Konsumer WHERE id = 1

-- ambil data yg id-nya buka 2
SELECT * FROM Konsumer WHERE id <> 2
SELECT * FROM Konsumer WHERE id > 2 AND id < 10
SELECT * FROM Konsumer WHERE id < 5 OR id > 10


-- Where LIKE filter
-- filter data yang emailnya sama
SELECT * FROM Konsumer WHERE email = 'doni@gmail.com'
-- filter data yang memiliki huruf 'ar'
SELECT * FROM Konsumer WHERE email LIKE '%ar%'
-- filter data yang memiliki nama dengan 2 huruf depan pertama
SELECT * FROM Konsumer WHERE NamaDepan LIKE 'do%'