USE sqlserver_udemy
GO

-- alias
SELECT GETDATE() AS 'tanggal-waktu'

-- memberikan alias untuk filed dari table Konsumer
SELECT Created as 'user register date' FROM Konsumer

-- membuat alias untuk menggabungkan NamaDepan dan NamaBelakang menjadi 'nama_lengkap' di kolom Konsumer
SELECT id, NamaDepan + ' ' + NamaBelakang AS 'nama_lengkap' from Konsumer 

/*
kita juga bisa melakukan alias dari level table 

contoh:
Kita ingin melakukan alis dari level tabel dan kolom secara bersamaan, mungkin kita memiliki nama tabel yang panjang
dan ingin melakukan alias agar lebih mudah dalam analisis, dan pada kolom tabel yang sudah dilakukan alias tersebut 
kita juga bisa melakukan filter misalnya cari nama depan user yang memiliki 2 huruf awalan 'do'.
resultnya akan memberikan semua filed kolom yang ada didalam tabel konsumer dengan awalan NamaDepan do
Maka kodenya seperti dibawah ini:
*/
SELECT * FROM Konsumer K WHERE K.NamaDepan LIKE 'do%'

