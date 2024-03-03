-- truy vấn dữ liệu từ nhiều bảng trong SQL

-- từ bảng Products và Categories, hãy in ra các thông tin
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm
SELECT c.CategoryID,c.CategoryName,p.ProductID,p.ProductName 
FROM Products AS p, Categories AS c
WHERE p.CategoryID = c.CategoryID;

-- từ bảng Employees và Orders, hãy in ra các thông tin sau đây
-- Mã nhân viên
-- Tên nhân viên
-- Số lượng đơn hàng mà nhân viên đã bán được
SELECT e.EmployeeID,e.LastName, COUNT(OrderID) AS "TotalOrders"
FROM Employees AS e, Orders AS o
WHERE e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.LastName;

-- từ bảng Customers và Orders, hãy in ra các thông tin sau đây
-- Mã số khách hàng
-- Tên công ty
-- Tên liên hệ
-- Số lượng đơn hàng đã mua
-- Với điều kiện quốc gia của khách hàng là UK
SELECT c.CustomerID,c.CompanyName, COUNT(OrderID) AS "TotalOrders"
FROM Customers AS c, Orders AS o
WHERE c.CustomerID = o.CustomerID AND c.Country = 'UK'
GROUP BY c.CustomerID,c.CompanyName;

-- từ bảng Orders và Shippers, hãy in ra các thông tin
-- Mã nhà vận chuyển
-- Tên công ty vận chuyển
-- Tổng số tiền vận chuyển (Sum Freight)
-- và in ra theo thứ tự giảm dần tổng số tiền vận chuyển
SELECT s.ShipperID, s.CompanyName, SUM(o.Freight) AS "TotalFreight"
FROM Orders AS o, Shippers AS s
WHERE o.ShipVia = s.ShipperID
GROUP BY s.ShipperID, s.CompanyName
ORDER BY SUM(o.Freight) DESC;

-- từ bảng Products và Suppliers, in ra các thông tin
-- Mã nhà cung cấp
-- Tên công ty
-- Tổng các sản phẩm khác nhau đã cung cấp
-- In ra màn hình duy nhất 1 nhà cung cấp có số lượng
-- sản phẩm khác nhau nhiều nhất
SELECT TOP 1 p.SupplierID, s.CompanyName, COUNT(ProductID) AS "TotalProducts" 
FROM Products AS p, Suppliers AS s
WHERE p.SupplierID = s.SupplierID
GROUP BY p.SupplierID,s.CompanyName
ORDER BY COUNT(ProductID) DESC ;

-- Từ bảng Orders và Orders Details, hãy in ra các thông tin
-- Mã đơn hàng
-- Tổng số tiền sản phẩm của đơn hàng đó
SELECT od.OrderID, SUM(Quantity * UnitPrice) AS "TotalPrice"
FROM Orders AS o, [Order Details] AS od
WHERE o.OrderID = od.OrderID
GROUP BY od.OrderID;

-- từ 3 bảng trong hình hãy in ra các thông tin sau đây
-- mã đơn hàng
-- tên nhân viên
-- tổng số tiền sản phẩm của đơn hàng

SELECT o.OrderID,e.LastName+' '+e.FirstName AS "FullName", SUM(od.UnitPrice * od.Quantity) AS "TotalPrice"
FROM Orders AS o, Employees AS e, [Order Details] AS od
WHERE o.EmployeeID = e.EmployeeID AND od.OrderID = o.OrderID
GROUP BY o.OrderID,e.LastName,e.FirstName;

-- từ 3 bảng trong hãy in ra các thông tin
-- Mã đơn hàng
-- Tên khách hàng
-- Tên công ty vận chuyển
-- chỉ in ra các đơn hàng được giao đến 'UK' trong năm 1997
SELECT o.OrderID, c.CompanyName, s.CompanyName AS "ExpressingCompany"
FROM Orders AS o, Customers AS c, Shippers AS s
WHERE o.CustomerID = c.CustomerID 
	AND o.ShipVia = s.ShipperID
	AND o.ShipCountry = 'UK'
	AND YEAR(ShippedDate) = 1997;

-- từ bảng products và orders details, in ra các thông tin sau đây
-- mã đơn hàng
-- mã sản phẩm
-- tên sản phẩm
-- tổng tiền của mỗi đơn hàng
SELECT od.OrderID, od.ProductID, p.ProductName, SUM(od.UnitPrice * Quantity) AS "TotalPrice"
FROM Products AS p, [Order Details] AS od
WHERE p.ProductID = od.ProductID
GROUP BY od.OrderID,od.ProductID,p.ProductName
ORDER BY SUM(od.UnitPrice * od.Quantity) DESC;

-- từ bảng Orders và Customers in ra thông tin
-- OrderID, ContactName,RequiredDate,ShipCity
-- với điều kiện chỉ đến London và RequireDate = 20,24
SELECT o.OrderID, c.ContactName,o.RequiredDate, o.ShipCity 
FROM Orders AS o, Customers AS c
WHERE o.CustomerID = c.CustomerID AND o.ShipCity = 'London' 
	AND DAY(RequiredDate) IN (20,24);

-- in ra 3 công ty có lượng hàng tồn cao nhất 
-- từ bảng Products và Suppliers
SELECT TOP 3 s.CompanyName, p.ProductName, SUM(UnitsInStock - UnitsOnOrder) AS "TotalRemaing"
FROM Products AS p, Suppliers AS s
WHERE p.SupplierID = s.SupplierID
GROUP BY s.CompanyName, p.ProductName
ORDER BY SUM(UnitsInStock - UnitsOnOrder) DESC;

-- từ bảng Suppliers, Product, Order Detail lấy ra
-- mã nhà cung cấp
-- địa chỉ nhà cung cấp 
-- số lượng đặt hàng và chiết khấu
-- tính trung bình giá bán của các sản phẩm cho mỗi nhà cung cấp
-- chỉ lấy 5 kết quả đầu
SELECT s.SupplierID, s.Address, od.Quantity, od.Discount, AVG(p.UnitPrice) AS "AveragePrice"
FROM Suppliers AS s, Products AS p, [Order Details] AS od
WHERE s.SupplierID = p.SupplierID AND p.ProductID = od.ProductID
GROUP BY s.SupplierID, s.Address, od.Quantity, od.Discount;









