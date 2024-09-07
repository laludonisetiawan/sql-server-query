USE AdventureWorks2022
GO

SELECT * FROM Production.Product;
SELECT * FROM Production.ProductSubcategory;

--SUBQUERY EXISTS 
SELECT a.Name, a.ProductNumber
FROM Production.Product a
WHERE EXISTS
(
	SELECT b.ProductCategoryID
	FROM Production.ProductSubcategory b
	WHERE b.ProductSubcategoryID = a.ProductSubcategoryID
	AND b.Name = 'Road Bikes'
)

--SUBQUERY NOT EXISTS
SELECT a.Name, a.ProductNumber
FROM Production.Product a
WHERE NOT EXISTS
(
	SELECT b.ProductCategoryID
	FROM Production.ProductSubcategory b
	WHERE b.ProductSubcategoryID = a.ProductSubcategoryID
	AND b.Name = 'Road Bikes'
)
