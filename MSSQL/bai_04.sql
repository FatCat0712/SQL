-- Viết câu lệnh SQL lấy ra tên của tất cả sản phẩm
SELECT ProductName FROM Products;

-- Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị, số lượng sản phẩm trên mỗi đơn vị
SELECT ProductName,UnitPrice,QuantityPerUnit FROM Products;

-- Viết câu lệnh SQL lấy ra tên khách hàng và quốc gia của khách hàng đó
SELECT CompanyName, Country FROM Customers;

-- Viết câu lệnh SQL lấy ra tên và số điện thoại của nhà cung cấp hàng
SELECT CompanyName, Phone FROM Suppliers;

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng Products
SELECT * FROM Products;

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng khách hàng
SELECT * FROM Customers;

-- Viết câu lệnh SQL lấy ra tất cả dữ liệu từ bảng nhà cung cấp
SELECT * FROM Suppliers;

-- Viết ra câu lệnh SQL lấy ra tất cả dữ liệu từ bảng nhân viên
SELECT * FROM Employees;

-- Viết ra câu lệnh SQL lấy ra ngày sinh, thành phố hiện tại và số điện thoại nhà của các nhân viên
SELECT BirthDate,City,HomePhone FROM Employees;

 -- Viết ra câu lệnh SQL lấy ra ngày đặt hàng và địa chỉ giao hàng 
SELECT OrderDate,ShipAddress FROM Orders;


-- Liệt kê tên đơn hàng,địa chỉ và tên công ty từ bảng đơn đặt hàng,khách hàng và chủ hàng
SELECT o.ShipName,o.ShipAddress, c.CompanyName
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

-- Viết câu lệnh SQL lấy ra tên, địa chỉ và thành phố và quốc gia nhà cung cấp hàng
SELECT CompanyName,Address,City,Country FROM Suppliers;

-- Viết câu lệnh SQL lấy ra tên khách hàng, ngày đặt hàng và địa chỉ giao hàng của tất cả đơn hàng đặt
SELECT c.CompanyName,o.OrderDate,o.ShipAddress
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

-- viết ra số điện thoại , thuế , thành phố từ bảng khách hàng
SELECT Phone, Fax, City FROM Customers;

-- Viết ra shipName và shipCountry từ bảng Orders
SELECT ShipName,ShipCountry FROM Orders;

-- Viết ra câu lệnh in ra địa chỉ và thành phố của khách hàng
SELECT Address,City FROM Customers;

-- Viết câu lệnh in ra mã số khách hàng và mã số nhân viên
SELECT CustomerID,EmployeeID FROM Orders;

-- Viết câu lệnh SQL lấy ra ID khách hàng và địa chỉ ship mà khách order hàng
SELECT CustomerID,ShipAddress FROM Orders;

--Viết câu lệnh SQL lấy ra ID và SDT của Shipper
SELECT CompanyName,Phone FROM Shippers;

-- Viết câu lệnh SQL lấy ra tên và SDT của Khách Hàng
SELECT CompanyName,Phone FROM Customers;

-- Lấy thông tin họ tên và ngày sinh của nhân viên
SELECT FirstName,LastName,BirthDate FROM Employees;

-- Lấy tên hàng hóa, nhà cung cấp và phân loại của hàng hóa
SELECT Products.ProductName,Suppliers.CompanyName,Categories.CategoryName
FROM Suppliers
INNER JOIN Products ON Products.SupplierID = Suppliers.SupplierID
INNER JOIN Categories ON  Products.CategoryID = Categories.CategoryID;

-- lấy ra tất cả dữ liệu từ bảng đặt hàng
SELECT * FROM Orders;

-- viết câu lệnh SQL lấy ra CategoryID  và CategoryName từ bảng Categories
SELECT * FROM Categories;

-- viết câu lệnh SQL lấy ra ShipperID từ bảng Shipper
SELECT ShipperID FROM Shippers;

-- viết câu lệnh lấy chức vụ và ngày sinh của nhân viên
SELECT Title,BirthDate FROM Employees;

-- lấy ra ID và số điện thoại của Shipper
SELECT ShipperID,Phone FROM Shippers;

--lấy ra ID , địa chỉ ship, thành phố ship, đất nước ship của orders
SELECT ORderID,ShipAddress,ShipCity,ShipCountry FROM Orders;

-- Viet câu lệnh SQL lấy ra ID đơn hàng và số lượng từ Đơn hàng chi tiết
SELECT OrderId, Quantity FROM [Order Details];

-- Viết ra câu lệnh lấy tên shipper, ngày vận chuyển, địa chỉ
SELECT Shippers.CompanyName,Orders.ShippedDate,Orders.ShipAddress
FROM Shippers
INNER JOIN Orders
ON Shippers.ShipperID = Orders.ShipVia; 

-- Viết câu lệnh SQL để biết thông tin số lượng đặt hàng trên mỗi mã hàng
SELECT OrderID,Quantity FROM [Order Details];

-- Viết câu lệnh SQL lấy ra CustomerID từ TABLE Orders và lấy ra ProductName từ TABLE Products
SELECT Orders.CustomerID, Products.ProductName
FROM Orders
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
INNER JOIN Products ON [Order Details].ProductID = Products.ProductID;
