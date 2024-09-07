CREATE DATABASE SalesDB;
CREATE DATABASE HRDB;
GO

-- buat table
USE SalesDB;
GO

CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(50),
	Price DECIMAL(10,2)
)

CREATE TABLE Sales (
	SaleID INT PRIMARY KEY,
	ProductID INT,
	EmployeeID INT, 
	SaleDate DATE,
	Quantity INT,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
GO

USE HRDB;
GO

CREATE TABLE Employees (
	EmployeeID INT PRIMARY KEY,
	EmployeeName NVARCHAR(50),
	Position NVARCHAR(50)
);

-- Insert data into Products table
USE SalesDB;
GO

INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Product A', 100.00),
(2, 'Product B', 200.00),
(3, 'Product C', 150.00);

-- Insert data into Sales table
INSERT INTO Sales (SaleID, ProductID, EmployeeID, SaleDate, Quantity)
VALUES
(1, 1, 101, '2023-01-15', 2),
(2, 2, 102, '2023-02-20', 1),
(3, 1, 103, '2023-03-05', 5);

-- Insert data into Employees table
USE HRDB;

INSERT INTO Employees (EmployeeID, EmployeeName, Position)
VALUES
(101, 'John Doe', 'Sales Representative'),
(102, 'Jane Smith', 'Sales Manager'),
(103, 'Alice Johnson', 'Sales Associate');

select * from HRDB.dbo.Employees;
select * from SalesDB.dbo.Products;
select * from SalesDB.dbo.Sales;

--query untuk menggabungkan data dari database HRDB dengan SalesDB
USE SalesDB;
SELECT 
	E.EmployeeID,
	E.EmployeeName,
	E.Position,
	S.SaleID,
	S.SaleDate,
	P.ProductName,
	S.Quantity
FROM
	Sales S
JOIN
	HRDB.dbo.Employees E ON S.EmployeeID = E.EmployeeID
JOIN
	Products P ON S.ProductID = P.ProductID
GO


-- Query untuk Mendapatkan Total Penjualan dan Jumlah Produk yang 
-- Dijual oleh Setiap Karyawan

USE SalesDB;
SELECT * FROM Sales;
SELECT * FROM Products;
select * FROM HRDB.dbo.Employees;
SELECT
	E.EmployeeID,
	E.EmployeeName,
	E.Position,
	COUNT(S.SaleID) AS TotalSales,
	SUM(S.Quantity) AS TotalQuantity,
	SUM(S.Quantity * P.Price) AS TotalRevenue
FROM
	Sales S
INNER JOIN 
	HRDB.dbo.Employees E ON S.EmployeeID = E.EmployeeID
INNER JOIN
	Products P ON S.ProductID = P.ProductID
GROUP BY
	E.EmployeeID, E.EmployeeName, E.Position
ORDER BY
	TotalRevenue DESC
GO 

-- Query untuk Mendapatkan Rata-rata Penjualan per Produk oleh Setiap Karyawan

USE SalesDB;

SELECT 
    E.EmployeeID,
    E.EmployeeName,
    E.Position,
    P.ProductName,
    AVG(S.Quantity) AS AverageQuantitySold
FROM 
    Sales S
JOIN 
    HRDB.dbo.Employees E ON S.EmployeeID = E.EmployeeID
JOIN 
    Products P ON S.ProductID = P.ProductID
GROUP BY 
    E.EmployeeID, E.EmployeeName, E.Position, P.ProductName
ORDER BY 
    E.EmployeeID, P.ProductName;
GO 


	--hapus
DROP DATABASE IF EXISTS SalesDB;
DROP DATABASE  IF EXISTS HRDB;
GO