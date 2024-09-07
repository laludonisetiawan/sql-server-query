USE sqlserver_udemy;
GO
/*
Mengambil data yang unik:
- menggunakan DISTINCT
	karena memungkinkan kita mengambil select tetapi kalau ada data yang sama dia cukup 1 saja yang akan di hitung.
- Cocok untuk mengecek kategorikal data yang ada dari table tersebut
*/

-- karena data kita sangat sedikit maka saya akan membuatkan tabel baru dengan nama Karyawan Kontrak

DROP TABLE IF EXISTS KaryawanKontrak;
CREATE TABLE KaryawanKontrak (
    id_karyawan INT IDENTITY(1,1) PRIMARY KEY,
    nama_karyawan VARCHAR(100),
    posisi VARCHAR(100),
    status_kontrak VARCHAR(50),
    created_at DATETIME DEFAULT GETDATE(),
    updated_at DATETIME DEFAULT GETDATE()   
);

INSERT INTO KaryawanKontrak (nama_karyawan, posisi, status_kontrak, created_at, updated_at)
VALUES
('Karyawan A', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan B', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan C', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan D', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan E', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan F', 'Designer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan G', 'Designer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan H', 'HR', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan I', 'HR', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan J', 'HR', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan K', 'Marketing', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan L', 'Marketing', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan M', 'Admin', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan N', 'Admin', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan O', 'Admin', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan P', 'QA', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan Q', 'QA', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan R', 'Sales', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan S', 'Sales', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan T', 'Sales', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan U', 'Support', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan V', 'Support', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan W', 'Engineer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan X', 'Engineer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan Y', 'Engineer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan Z', 'Finance', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan AA', 'Finance', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan BB', 'Finance', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan CC', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan DD', 'Developer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan EE', 'Support', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan FF', 'Support', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan GG', 'Admin', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan HH', 'Admin', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan II', 'QA', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan JJ', 'QA', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan KK', 'Sales', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan LL', 'Sales', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan MM', 'Engineer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan NN', 'Engineer', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan OO', 'Marketing', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan PP', 'Marketing', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan QQ', 'Marketing', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan RR', 'HR', 'Kontrak', GETDATE(), GETDATE()),
('Karyawan SS', 'HR', 'Kontrak', GETDATE(), GETDATE());
GO


-- select unik 
SELECT DISTINCT posisi FROM KaryawanKontrak

-- melihat jumlah data dari kolom posisi || RESULT akan mengembalikan total dari seluruh data yang ada di dalam kolom posisi 
SELECT COUNT(DISTINCT posisi) jumlah_posisi FROM KaryawanKontrak;
