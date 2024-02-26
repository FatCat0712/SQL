-- ALIAS cho các cột và bảng
-- Đặt tên bí danh cho các cột hoặc bảng giúp cho việc đọc và hiểu câu lệnh SQL dễ dàng hơn

-- Viết câu lệnh SQL lấy "CompanyName","PostalCode" 
-- và đặt tên thay thế là "Công ty" và "Mã bưu điện"
SELECT CompanyName AS "Công ty", PostalCode AS "Mã bưu điện" FROM Customers;

-- Lấy ra "LastName","FirstName" và đặt tên thay thế "Họ" và "Tên"
SELECT LastName AS "Họ", FirstName AS "Tên" FROM Employees;

-- Lấy ra 15 dòng đầu tiên tất cả các cột trong bảng Orders và đặt tên là "o"
SELECT TOP 15 o.* FROM Orders AS o;

-- Lấy ra các cột "ProductName","SupplierID", "CategoryID" và đặt tên thay thế
-- "Tên sản phẩm","Mã nhà cung cấp","Mã thể loại"
-- đặt tên thay thế cho bảng "Products" là p
-- chỉ lấy ra 5 sản phẩm đầu tiên
SELECT TOP 5 p.ProductName AS "Tên sản phẩm",
	   p.SupplierID AS "Mã nhà cung cấp",
	   p.CategoryID AS "Mã thể loại"
	   FROM Products AS p;

-- lấy ra top 5 LastName khác nhau của Employees, đổi tên Employees
-- sang "T", LastName thành "Họ", FirstName thành "Tên"
SELECT DISTINCT TOP 5 T.LastName AS "Họ", T.FirstName AS "Tên" FROM Employees AS T;

-- Lấy ra 20% Phone của Shippers, đổi tên Shippers thành "VAN CHUYEN"
-- Phone thành "SĐT"
SELECT TOP 20 PERCENT [VAN CHUYEN].Phone AS "SDT" FROM Shippers AS "VAN CHUYEN";

-- Đổi cột "EmployeeID" thành "Mã số nhân viên", "BirthDate" thành "Ngày Sinh",
-- Đổi bảng "Employees" thành "Nhân viên" và chỉ lấy 15% tổng số dòng
SELECT TOP 15 PERCENT [Nhân viên].EmployeeID AS "Mã số nhân viên",
	   [Nhân viên].BirthDate AS "Ngày sinh"
	   FROM Employees AS "Nhân viên";
-- Đổi cột "OrderID" thành "Mã đơn hàng", "ProductID" thành "Mã sản phẩm",
-- Đổi tên bảng "Orders" thành "Đơn hàng" thành chỉ lấy 6 dòng
SELECT TOP 6 [Đơn hàng].OrderID AS "Mã đơn hàng", 
		od.ProductID AS "Mã sản phẩm"
FROM Orders AS "Đơn hàng"
INNER JOIN [Order Details] AS od 
ON "Đơn hàng".OrderID = od.OrderID;

-- lấy ra các cột và đặt tên thay thế
-- OrderID -> mã đơn hàng, 
-- CustomerID -> mã khách hàng, 
-- OrderDate -> ngày đặt
-- đặt tên thay thế của bảng Orders là o
-- lấy ra 20% trên tổng số dòng
SELECT TOP 20 PERCENT o.OrderID AS "Mã đơn hàng",
	   o.CustomerID AS "Mã khách hàng",
	   o.OrderDate AS "Ngày đặt"
	   FROM Orders AS o;

-- lấy ra các cột và đặt tên thay thế
-- OrderID -> mã đơn hàng
-- UnitPrice -> giá
-- Quantity -> số lượng
-- đặt tên thay thế của bảng Orders Details là OD
-- lấy ra 20 dòng đầu tiên
SELECT TOP 20 PERCENT OD.OrderID AS "Mã đơn hàng",
	   OD.UnitPrice AS "giá",
	   OD.Quantity AS "Số lượng"
	   FROM [Order Details] AS OD;

-- Đặt tên cho bảng Suppliers là "Sup" và lấy 10% dữ liệu
-- SupplierID là ""Mã ID",
-- Address là "Địa chỉ",
-- Phone là "Số ĐT"
SELECT TOP 10 PERCENT Sup.SupplierID AS "Mã ID",
	   Sup.Address AS "Địa chỉ",
	   Sup.Phone AS "SĐT"
	   FROM Suppliers AS "Sup";

-- lấy ra 50% dữ liệu và không trùng nhau của bảng Employees có tên e
-- employeeID có tên mã nhân viên, birthDate có tên ngày sinh
SELECT DISTINCT TOP 50 PERCENT 
e.EmployeeID AS "Mã nhân viên",
e.BirthDate AS "Ngày sinh"
FROM Employees AS e;

-- lấy ra 10 dòng đầu tiên của bảng Categories đặt tên là c gồm các cột
-- categoryID là mã thể loại, description đặt là mô tả, picture đặt là hình
-- ảnh
SELECT TOP 10 
c.CategoryID AS "Mã thể loại",
c.Description AS "Mô tả",
c.Picture AS "Hình ảnh"
FROM Categories AS c;

-- truy vấn từ bảng khách hàng, lấy địa chỉ khách hàng, lấy ra 3 dòng đầu tiên
-- khác nhau với bí danh Alias là "Đã lấy địa chỉ";
SELECT DISTINCT TOP 3 Address AS "Đã lấy địa chỉ" FROM Customers;

-- Đặt tên cho bảng Suppliers là "Sup" và 10% khác nhau các dòng đầu tiên
-- SupplierID là "Mã ID"
-- Address là "Địa chỉ"
-- Phone là "SĐT"
SELECT DISTINCT TOP 10 PERCENT 
Sup.SupplierID AS "Mã ID", 
Sup.Address AS "Địa chỉ",
Sup.Phone AS "SĐT"
FROM Suppliers AS "Sup";

-- Đặt tên cho bảng Employees là "E" và lấy ra 5 dòng đàu tiên
-- EmployeeID là "Mã số"
-- LastName là "Họ"
-- BirthDate là "Ngày sinh"
SELECT TOP 5 E.EmployeeID AS "Mã số",
	  E.LastName AS "Họ",
	  E.BirthDate AS "Ngày sinh"
	  FROM Employees AS E;

-- Lấy ra 5 học khác nhau đầu tiên của nhân viên với LastName đặt tên là "Họ"
SELECT DISTINCT TOP 5 LastName AS "Họ" FROM Employees;

-- lấy ra 5 dòng đầu tiên của địa chỉ khách hàng với address có alias là "địa chỉ"
SELECT TOP 5 Address AS "Địa chỉ" FROM Customers;

-- Đặt tên cho bảng Order Details là "OD"" và lấy 20% dữ liệu không bị trùng lặp
-- OrderID -> "Mã đặt hàng"
-- ProductID -> "Mã sản phẩm"
-- UnitPrice -> "Đơn giá"
-- Quantity -> "Số lượng"
-- Discount -> "Giảm giá"
SELECT DISTINCT TOP 20 PERCENT
OD.OrderID AS "Mã đặt hàng",
OD.ProductID AS "Mã sản phẩm",
OD.UnitPrice AS "Đơn giá",
OD.Quantity AS "Số lượng",
OD.Discount AS "Giảm giá"
FROM [Order Details] AS OD;

-- lấy ra mã đơn vị vẩn chuyển khác nhau không bị trùng lặp và đặt tên
-- cho bảng Orders là Đơn hàng
SELECT DISTINCT "Đơn hàng".ShipVia FROM Orders AS "Đơn hàng";

--Lấy ra 3 dòng đầu tiên không trùng lặp dữ liệu của cột tên gọi lịch sự - "TitleOfCourtesy" 
-- và đổi tên thành "Danh Xưng"
SELECT DISTINCT TOP 3 TitleOfCourtesy AS "Danh xưng" FROM Employees;