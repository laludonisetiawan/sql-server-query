use AdventureWorks2022
GO

-- studi kasus
-- 1. dapatkan daftar 10 orang dengan nama belakang 'Smith'.
-- 2. Cari produk dengan harga antaran $100 dan $500.
-- 3. berapa produk yang tersedia di setiap kelas 'Class'?
-- 4. Dapatkan 5 produk termahal yang masih diproduksi.






-- 1. Dapatkan daftar 10 orang dengan nama belakang 'Smith'.
SELECT TOP 10 * FROM Person.Person WHERE LastName =  'Smith'

-- 2. Cari produk dengan harga antara $100 dan $500
SELECT * FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 500;

-- 3. berapa produk yang tersedia di setiap kelas 'Class'?
SELECT Class, COUNT(ProductID) AS jumlah FROM Production.Product
WHERE Class IS NOT NULL
GROUP BY Class

-- 4. Dapatkan 5 produk termahal yang masih diproduksi.
SELECT TOP 5 ProductID, Name, ListPrice  FROM Production.Product
WHERE DiscontinuedDate IS NULL
ORDER BY ListPrice DESC