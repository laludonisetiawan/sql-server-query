USE AdventureWorks2022
GO

-- subquery atau sering diartikan query didalam query.
-- contoh kita akan melakukan query SalesPerson dimana didalamnya kita menggunakan query in lagi untuk mendapatkan TeorityID dari salesTeority untuk mendapatkan kode negara US

SELECT * FROM Sales.SalesPerson
WHERE TerritoryID in (
	SELECT TerritoryID FROM Sales.SalesTerritory
	WHERE CountryRegionCode = 'US'
)
GO

-- versi innerjoin
SELECT a. * FROM Sales.SalesPerson a
INNER JOIN Sales.SalesTerritory b
ON a.TerritoryID = b.TerritoryID
WHERE b.CountryRegionCode = 'US'