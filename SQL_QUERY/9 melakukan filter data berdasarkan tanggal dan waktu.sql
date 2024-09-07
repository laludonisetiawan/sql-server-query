USE sqlserver_udemy;
GO

SELECT * FROM Konsumer;

-- filter data berdasarkan waktu 
-- sering digunakan untuk melihat data transaksi berdasarkan diantara tanggal 1 dan tanggal yang ditentukan (between)
SELECT * FROM dbo.Konsumer
WHERE Created BETWEEN '2024-09-05' AND '2024-10-28 23:59:59'

-- filter interval dari tanggal sekian ke tanggal berikutnya 
-- Filter data dengan interval per day dan selisih 0 . bisa juga interval hari, minggu, bulan dan tahun
SELECT * FROM Konsumer
WHERE DATEDIFF(DAY, Created, '2024-09-05') = 0

-- filter data berdasarkan tanggal namun melibatkan waktu
-- saya ingin melihat pada tanggal 2024-09-05 user siapa yang melakukan register akun pada sistem, misalnya karena tanggal tersebut user membuat akun di hari ulang tahun perusaan tersebut maka akan mendapatkan imbalan mungkin, dari CEO WKWK

SELECT * FROM Konsumer
WHERE Created BETWEEN '2024-06-05' AND '2024-06-07 23:59:59' -- artinya saya akan melihat user yang register akun dari tanggal 5 sampai tanggal 7 untuk mendapatkan hadiah menarik 
