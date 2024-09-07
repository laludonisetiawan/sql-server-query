USE sqlserver_udemy;
GO

SELECT * FROM KaryawanKontrak


-- grouping data posisi untuk melihat total karyawan di posisi tersebut dengan mengambil nama_karyawan sebagai acuan
SELECT posisi, COUNT(nama_karyawan) AS jumlah
FROM KaryawanKontrak GROUP BY posisi;

-- grouping data posisi untuk melihat total karyawan di posisi tersebut dengan mengambil nama_karyawan sebagai acuan.
-- melakukan pengurutan data dari jumlah posisi terbanyak di perusahaan tersebut.
SELECT posisi, COUNT(nama_karyawan) AS jumlah
FROM KaryawanKontrak GROUP BY posisi
ORDER BY COUNT(nama_karyawan) DESC