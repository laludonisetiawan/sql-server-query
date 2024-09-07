USE sqlserver_udemy
GO

SELECT * FROM Konsumer;

-- perbarui data dari table konsumer dimana kita akan merubah nilai dari field tersebut contoh:
-- sebelum update gunakan filter agar data didalam field tersebut tidak berubah
UPDATE Konsumer SET NamaDepan='Rio',NamaBelakang='febrian',Email='rio@gmail.com'
WHERE id = 1