USE AdventureWorks2022
GO

SELECT * FROM Production.Product;
SELECT * FROM Production.ProductSubcategory;

-- subquery NOT IN 
SELECT Name, ProductNumber
FROM Production.Product
WHERE ProductSubcategoryID NOT IN 
(
	SELECT ProductSubcategoryID 
	FROM Production.ProductSubcategory
	WHERE Name = 'Mountain Frames'
	OR Name = 'Road Frames'
	OR Name =  'Touring Frames'
)