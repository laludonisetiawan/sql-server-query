-- deklarasi variable
DECLARE @a INT;
DECLARE @b INT;

-- Inisialisasi variable
SET @a = 10;
SET @b = 5;

-- operasi aritmatika
DECLARE @sum INT;
DECLARE @differance INT;
DECLARE @product INT;
declare @quotient DECIMAL (10, 2);

SET @sum = @a + @b;
SET @differance = @a - @b;
SET @product = @a * @b;
SET @quotient = CAST(@a AS decimal(10,2)) / CAST(@b AS decimal(10,2));

-- Menampilkan hasil
PRINT 'Hasil Penjumlahan @a + @b =' + CAST(@sum AS VARCHAR);
PRINT 'Hasil Pengurangan @a - @b =' + CAST(@differance AS VARCHAR);
PRINT 'Hasil Perkalian @a * @b =' + CAST(@product AS VARCHAR);
PRINT 'Hasil Pembagian @a / @b =' + CAST(@quotient AS VARCHAR);
