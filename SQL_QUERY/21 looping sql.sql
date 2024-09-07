-- looping pada SQL Server
-- 1. Looping dengan While
-- 2. Looping dengan Cursor

CREATE DATABASE PraktikumLooping;
GO


USE PraktikumLooping;
GO

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100),
    Quantity INT
);
GO

--isi data
INSERT INTO Products (ProductName, Quantity)
VALUES 
('Product A', 10),
('Product B', 20),
('Product C', 30),
('Product D', 40);
GO

select * from Products;

-- looping dengan while
DECLARE @counter INT = 1;
DECLARE @max INT;

-- dapatkan jumlah baris dalam tabel Products
SELECT @max = COUNT(*) FROM Products;

-- while loop untuk memperbarui quantity pada setiap baris
WHILE @counter <= @max
BEGIN
	UPDATE Products
	SET Quantity = Quantity + 5
	WHERE ProductID = @counter
	
	SET @counter = @counter + 1;
END
GO

-- verifikasi hasil
SELECT * FROM Products
GO


-- looping dengan cursor
DECLARE @ProductID INT;
DECLARE @ProductName NVARCHAR(100);
DECLARE @Quantity INT;

-- deklarasi cursor
DECLARE ProductCursor CURSOR FOR
SELECT ProductID, ProductName, Quantity
FROM Products;

-- buka cursor
OPEN ProductCursor
--ambil baris pertama dari cursor
FETCH NEXT FROM ProductCursor INTO @ProductID, @ProductName, @Quantity;

-- loop melalui semua baris dalam cursor
WHILE @@FETCH_STATUS = 0 
BEGIN
    -- Contoh operasi: memperbarui Quantity
    UPDATE Products
    SET Quantity = Quantity + 10
    WHERE CURRENT OF ProductCursor;

    -- Ambil baris berikutnya dari cursor
    FETCH NEXT FROM ProductCursor INTO @ProductID, @ProductName, @Quantity;
END;


-- Tutup dan hapus cursor
CLOSE ProductCursor;
DEALLOCATE ProductCursor;
GO

-- Verifikasi hasil
SELECT * FROM Products;
GO


-- hapus database
DROP DATABASE IF EXISTS PraktikumLooping;
GO