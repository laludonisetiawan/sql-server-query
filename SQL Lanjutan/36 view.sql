USE AdventureWorks2022
GO

CREATE VIEW vwProductInfo AS
SELECT	
	p.ProductID,
	p.Name  AS ProductName,
	pc.Name AS CategoryName,
	p.ListPrice,
	p.ModifiedDate
FROM Production.Product p
JOIN Production.ProductSubcategory pc ON p.ProductSubcategoryID=pc.ProductCategoryID
GO

-- CARA MANGGIL
SELECT * FROM dbo.vwProductInfo;

-- contoh misalnya kita ingin menggantikan VIEW ATAU UPDATE
ALTER VIEW vwProductInfo AS
SELECT	
	p.ProductID,
	P.ProductNumber,
	p.Name  AS ProductName,
	pc.Name AS CategoryName,
	p.ListPrice,
	p.ModifiedDate
FROM Production.Product p
JOIN Production.ProductSubcategory pc ON p.ProductSubcategoryID=pc.ProductCategoryID
GO

SELECT * FROM dbo.vwProductInfo;

-- MENGAPUS VIEW
DROP VIEW dbo.vwProductInfo;
