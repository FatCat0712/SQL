-- SELECT TOP giới hạn số lượng dòng (hoặc %) được trả về

-- Lấy ra 5 dòng đầu tiên trong bảng Customers
SELECT TOP 5 * FROM Customers;

-- Lấy ra 20% dữ liệu đầu tiên trong bảng Customers
SELECT TOP 20 PERCENT * FROM Customers;

-- Viết câu lệnh SQL lấy ra 30% nhân viên của công ty hiện tại.
SELECT TOP 30 PERCENT * FROM Employees;

-- Viết câu lệnh SQL lấy ra các đơn hàng với quy định là mã khách hàng
-- không được trùng lặp, chỉ lấy 5 dòng dữ liệu đầu tiên
SELECT DISTINCT TOP 5 Customers.CustomerID FROM Customers;

-- Viết câu lệnh SQL lấy ra các sản phẩm có mã thể loại không bị trùng lặp,
-- và chỉ lấy 3 dòng đầu tiên
SELECT DISTINCT TOP 3 Products.CategoryID FROM Products;

-- truy vấn 20% không trùng lặp ShipName và ShipAddress trong bảng Orders
SELECT DISTINCT TOP 20 PERCENT Orders.ShipName, Orders.ShipAddress FROM Orders;

-- truy vấn 120 dòng đầu trong bảng Orders
SELECT TOP 120 * FROM Orders;

-- lấy ra họ của các nhân viên sao cho không bị trùng lặp và chỉ lấy ra 4 dòng 
-- đầu tiên trong bảng Employees
SELECT DISTINCT TOP 4 LastName FROM Employees;

-- lấy ra tên công ty và quốc gia của khách hàng sao cho không bị trùng lặp
-- (lấy ra tất cả các dòng trong bảng Customers)
SELECT DISTINCT CompanyName, Country FROM Customers;

-- lấy ra TOP 5 Country khác nhau của nhân viên
SELECT DISTINCT TOP 5 Country FROM Employees;

-- lấy ra 30% SĐT khác nhau của các nhà đầu tư
SELECT DISTINCT TOP 30 PERCENT Phone FROM Suppliers;

-- lấy ra 50% các ngày đặt hàng khác nhau từ bảng đơn hàng
SELECT DISTINCT TOP 50 PERCENT OrderDate FROM Orders;

-- lấy ra 10 tên công ty khác nhau từ người cung cấp
SELECT DISTINCT TOP 10 Suppliers.CompanyName FROM Suppliers;

-- lấy ra 5 dòng đầu tiên các quốc gia của khách hàng không trùng nhau
SELECT DISTINCT TOP 5 Country FROM Customers;

-- lấy ra 5 dòng đầu tiên họ của các nhân viên không trùng nhau
SELECT DISTINCT TOP 5 LastName FROM Employees;

-- Lấy ra 5 sản phẩm đã bị ngưng sản xuất
SELECT TOP 5 * FROM Products WHERE Discontinued = 1;