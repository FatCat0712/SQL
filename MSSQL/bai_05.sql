-- SELECT DISTINCT lấy các dữ liệu riêng biệt, không trùng lặp

-- Viết câu lệnh SQL lấy ra tên các quốc gia (Country) khác nhau từ bảng khách hàng
SELECT DISTINCT Customers.Country FROM Customers;

-- Viết câu lệnh SQL lấy ra tên các mã số bưu điện (PostalCode) khác nhau từ bảng Nhà Cung Cấp
SELECT DISTINCT Suppliers.PostalCode FROM Suppliers;

-- Viết câu lệnh SQL lấy ra cá dữ liệu khác nhau về họ của nhân viên (LastName) và cách gọi danh
-- hiệu lịch sự (TitleOfCourtesy) của nhân viên
SELECT DISTINCT Employees.LastName,Employees.TitleOfCourtesy FROM Employees;

-- Viết câu lệnh SQL lấy ra mã đơn vị vận chuyển (ShipVia) khác nhau của các đơn hàng - Orders
SELECT DISTINCT Orders.ShipVia FROM Orders;

-- Lấy ra khu vực, thành phố và Quốc gia (Region, City, Country) từ bảng khác hàng
SELECT DISTINCT Customers.Region,Customers.City,Customers.Country FROM Customers;

-- Lấy ra số lượng và chiết khấu (Quantity, Discount) từ bảng Thông tin đơn hàng
SELECT DISTINCT [Order Details].Quantity,[Order Details].Discount FROM [Order Details];

-- Viết câu lệnh SQL lấy ra các dữ liệu khác nhau về khách hàng CustomerID của các đơn hàng
SELECT DISTINCT Orders.CustomerID FROM Orders;

-- Viết câu lệnh SQL lấy ra các dữ liệu khác nhau về các thành phố của nhà cung cấp
SELECT DISTINCT Suppliers.City FROM Suppliers;

-- Viết câu lệnh SQL lấy ra tên công ty và quốc gia khác nhau từ bảng Customers
SELECT DISTINCT Customers.CompanyName,Customers.Country FROM Customers;

-- Viết ra cấu lệnh SQL lấy ra id (ShipperID) khác nhau từ bảng Shippers;
SELECT Shippers.ShipperID FROM Shippers;

-- Lấy dữ liệu khác nhau của ProductId trong bảng Order Details
SELECT DISTINCT [Order Details].ProductID FROM [Order Details];

-- Lấy tất cả các họ khác nhau của nhân viên
SELECT DISTINCT Employees.LastName FROM Employees;

-- Lấy tất cả giá khác nhau của sản phẩm
SELECT DISTINCT Products.UnitPrice FROM Products;

-- Lấy ra dữ liệu về thành phố (không trùng lặp) của nhân viên
SELECT DISTINCT Employees.City FROM Employees;

-- Lấy ra dữ liệu về đất nước (không trùng lặp) của nhân viên
SELECT DISTINCT Employees.Country FROM Employees;

-- lấy ra đơn đặt hàng (UnitsOnOrder) từ table Products
SELECT DISTINCT Products.UnitsOnOrder FROM Products;

-- lấy ra tên quốc gia khác nhau từ những nhà cung cấp
SELECT DISTINCT Suppliers.Country FROM Suppliers;

-- lấy ra tên thành phố khác nhau của những khách hàng
SELECT DISTINCT Customers.CompanyName FROM Customers;

-- lấy ra dữ liệu khác nhau của Region và Country trong bảng Customers
SELECT DISTINCT Customers.Region, Customers.Country FROM Customers;

-- lấy ra dữ liệu khác nhau của CategoryName trong bảng Catergories
SELECT DISTINCT Categories.CategoryName FROM Categories;

-- hãy cho biết công ty NorthWind có khách hàng đến từ bao nhiêu quốc gia
SELECT DISTINCT Customers.Country FROM Customers;