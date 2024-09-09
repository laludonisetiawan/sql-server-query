USE TsqlTraining;
GO

-- membuat schema
CREATE SCHEMA Sales;

CREATE TABLE Sales.Customers (
	CustomerID INT PRIMARY KEY,
	CustomerName NVARCHAR(100),
	ContactEmail NVARCHAR(100)
)

CREATE TABLE Sales.Orders(
	OrderID INT PRIMARY KEY,
	OrderDate DATETIME,
	CustomerID INT FOREIGN KEY REFERENCES Sales.Customers(CustomerID),
	OrdertTotal Money
);


-- membuat schema production
CREATE SCHEMA Production;

-- membuat table dengan schema production
CREATE TABLE Production.Products (
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR(100),
	Price MONEY
);

CREATE TABLE Production.Inventory (
	InventoryID INT PRIMARY KEY,
	ProductID INT FOREIGN KEY REFERENCES Production.Products(ProductID),
	Quantity INT
);

-- Mengisi data ke dalam tabel orders
INSERT INTO Sales.Customers(CustomerID,CustomerName,ContactEmail) VALUES
(1, 'Lalu Doni Setiawan', 'laludonisetiawan@gmail.com'),
(2, 'Prasinta', 'pras@gmail.com');
-- mengisi data ke dalam tabel order
INSERT INTO Sales.Orders (OrderID,OrderDate,CustomerID,OrdertTotal) VALUES
(101,'2024-05-01',1,100.00),
(102,'2024-05-02',2,150.00)

select  * from Sales.Customers
SELECT * FROM Sales.Orders;

-- menampilkan data gabungan dari tabel customers dan orders
SELECT c.CustomerName, o.OrderDate, o.OrdertTotal
FROM Sales.Customers c
JOIN Sales.Orders o ON c.CustomerID = o.CustomerID
GO

-- menghapus tabel dalam schema
DROP TABLE IF EXISTS  Sales.Orders;
DROP TABLE IF EXISTS Sales.Customers;
DROP TABLE IF EXISTS Production.Inventory;
DROP TABLE IF EXISTS Production.Products;

-- menghapus skema sales
DROP SCHEMA IF EXISTS  Sales;
DROP SCHEMA IF EXISTS Production;