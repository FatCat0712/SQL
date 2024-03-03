-- Từ bảng Products và Categories, hãy tìm các sản phẩm thuộc danh mục
-- 'Seafood' in ra các thông tin sau đây
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm
SELECT c.CategoryID,
		c.CategoryName,
		p.ProductID,
		p.ProductName
FROM Products AS p, Categories AS c
WHERE 
	p.CategoryID = c.CategoryID
AND c.CategoryName = 'Seafood';

-- từ bảng Products và Suppliers, hãy tìm các sản phẩm
-- được cung cấp từ nước 'Germany' (Đức)
-- Mã nhà cung cấp
-- Quốc gia
-- Mã sản phẩm
-- Tên sản phẩm
SELECT s.SupplierID, 
		s.Country,
		p.ProductID,
		p.ProductName 
FROM Products AS p, Suppliers AS s
WHERE 
	p.SupplierID = s.SupplierID
AND s.Country = 'Germany';

-- Từ 3 bảng Customers, Orders, Shippers hãy in ra các thông tin
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- in ra các đơn của các khách hàng đến từ thành phố London
SELECT OrderID, 
	 c.CompanyName,
	 s.CompanyName AS "ShippingCompany"
FROM Customers AS c, Orders AS o, Shippers AS s
WHERE 
	c.CustomerID = o.CustomerID 
AND o.ShipVia = s.ShipperID
AND c.City = 'London';

-- từ 3 bảng Customers, Orders, Shippers hãy in ra
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- Ngày yêu cầu chuyển hàng
-- Ngày giao hàng
-- chỉ in ra các đơn hàng bị giao muộn hơn qui định
SELECT o.OrderID,
	  c.CompanyName,
	  s.CompanyName AS "ShippingCompany", 
	  o.RequiredDate,
	  o.ShippedDate
FROM 
	Customers AS c,
	Orders AS o,
	Shippers AS s
WHERE 
	c.CustomerID = o.CustomerID
AND o.ShipVia = s.ShipperID
AND	RequiredDate < ShippedDate;

-- Find shipcountries of which Customers don't come from the US
-- Select only countries which have over 100 orders
-- Display ShipCountry and Number Of Orders
SELECT 
	ShipCountry,
	COUNT(OrderID) AS "TotalOrders"
FROM 
	Orders
WHERE 
	NOT ShipCountry = 'USA'
GROUP BY 
	ShipCountry
HAVING COUNT(OrderID) >= 100;






