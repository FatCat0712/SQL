-- SELECT INTO trong SQL
--* Cú pháp
--SELECT *
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition;

--SELECT column1, column2, column3, ...
--INTO newtable [IN externaldb]
--FROM oldtable
--WHERE condition;

-- Tạo bảng mới với các sản phẩm có giá > 50
SELECT *
INTO HighValueProducts
FROM Products
WHERE UnitPrice > 50;

SELECT * FROM HighValueProducts;

-- tạo ra bảng mới với các đơn hàng được giao đến USA
SELECT *
INTO USAOrders
FROM Orders
WHERE ShipCountry = 'USA';

SELECT * FROM USAOrders;

-- Tạo một bảng thời "CustomersInLondon" từ bảng "Customers" trong
-- CSDL NorthWind để chứa thông tin của các khách hàng có địa chỉ 
-- ở London
SELECT *
INTO CustomersInLondon
FROM Customers
WHERE City = 'London';

SELECT * FROM CustomersInLondon;

-- tạo một bảng "HighValueOrders" để chứa thông tin về các
-- đơn hàng có tổng giá trị đặt hàng lớn hơn 1000 đô la
WITH ValueOver1000 AS(
	SELECT od.OrderID 
	FROM [Order Details] AS od
	GROUP BY od.OrderID
	HAVING SUM(od.UnitPrice * od.Quantity - od.UnitPrice * od.Quantity * od.Discount) > 1000
)
SELECT 
	o.OrderID,
	o.CustomerID,
	o.EmployeeID,
	o.OrderDate,
	o.RequiredDate,
	o.ShippedDate,
	o.ShipVia,
	o.Freight,
	o.ShipName,
	o.ShipAddress,
	o.ShipCity,
	o.ShipRegion,
	o.ShipPostalCode,
	o.ShipCountry
INTO HighValueOrders
FROM Orders AS o
INNER JOIN ValueOver1000
ON o.OrderID = ValueOver1000.OrderID;

SELECT * FROM HighValueOrders;



