USE AdventureWorks2022
GO

-- inner join sql 
SELECT * FROM Production.Product;
SELECT * FROM Production.ProductReview;

-- cek total data  product dan product review dari kedua table tersebut.
SELECT COUNT(ProductID) as TotalProduct FROM Production.Product
SELECT COUNT(ProductReviewID) as TotalReview FROM Production.ProductReview;

-- inner join sql 
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
INNER JOIN Production.ProductReview b
ON a.ProductID = b.ProductID

-- filter mau lihat b adalah total rating di atas 3 
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
INNER JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
WHERE b.Rating > 3

-- left join 
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
LEFT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID

SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
LEFT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
WHERE b.ProductID IS NULL

-- right join 
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
RIGHT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID

SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
LEFT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
WHERE a.ProductID IS NULL 

--full join 
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
FULL OUTER JOIN Production.ProductReview b
ON a.ProductID = b.ProductID

SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
FULL OUTER JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
WHERE a.ProductID IS NULL OR b.ProductID IS NULL

-- self join 
-- membandingkan tabel yang sama untuk mendapatkan jumlah sisa hari libur untuk karyawan a dan b yang akan di bandingkan.
-- perlu di perhatikan self join adalah menjoinkan 1 tabel yang sama atau dirisendiri yang nantinya akan dibuatkan nama alias yang berbeda.
select * from HumanResources.Employee;
SELECT  a.NationalIDNumber, b.LoginID
FROM HumanResources.Employee a, HumanResources.Employee b
WHERE a.VacationHours > b.VacationHours

-- union join  -> mengapus data duplikasi antara tabel a dan b
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
LEFT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
UNION
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
RIGHT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID

-- union all -> mempertahankan duplikasi artinya data a dan b akan keduplikat sesuai dengan jenis join
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
LEFT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID
UNION ALL
SELECT a.Name, a.ProductNumber, b.Rating
FROM Production.Product a
RIGHT JOIN Production.ProductReview b
ON a.ProductID = b.ProductID