USE sqlserver_udemy;
GO

SELECT * FROM KaryawanKontrak;

-- pengurutan data karyawan kontrak 
SELECT * FROM KaryawanKontrak ORDER BY id_karyawan; -- ASC

-- pengurutan data karyawan kontrak dari id yang terbesar sampai terkecil
SELECT * FROM KaryawanKontrak ORDER BY id_karyawan DESC

-- urutan dengan lebih dari 1 kolom dengan ASCENDING DAN DESCENDING
SELECT * FROM KaryawanKontrak ORDER BY id_karyawan DESC,posisi 

SELECT * FROM KaryawanKontrak ORDER BY id_karyawan DESC,posisi DESC


