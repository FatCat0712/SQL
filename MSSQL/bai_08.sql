-- Min, Max trong SQL
-- Tìm giá trị nhỏ nhất, lớn nhất của một cột
-- Có thể kết hợp với ALIAS để thay đổi tên cột.

-- Tìm giá thấp nhất của các sản phẩm trong bảng Products
SELECT MIN(UnitPrice) AS "Giá thấp nhất" FROM Products;

-- Lấy ra ngày đặt hàng gần đây nhất từ bảng Orders
SELECT MAX(OrderDate) AS "Ngày đặt hàng gần nhất" FROM Orders;

-- lấy mã và tên sản phẩm có số lượng hàng tồn kho lớn nhất
SELECT ProductID,ProductName FROM Products
WHERE UnitsInStock = (SELECT MAX(UnitsInStock) FROM Products);

-- tìm ra số lượng hàng tồn kho lớn nhất
SELECT MAX(UnitsInStock) AS "Số lượng hàng tồn lớn nhất" FROM Products;

-- Hãy cho biết nhân viên có tuổi đời lớn nhất tại công ty
SELECT * FROM Employees WHERE YEAR(GETDATE()) - YEAR(BirthDate) = (
SELECT MAX(YEAR(GETDATE()) - YEAR(BirthDate)) AS "Tuổi đời lớn nhất" FROM Employees);

-- Ngày sinh của nhân viên có tuổi đời lớn nhất
SELECT MIN(BirthDate) FROM Employees;

-- tìm ra số lượng sản phẩm nhỏ nhất trên mỗi đơn vị
SELECT MIN(QuantityPerUnit) AS "Số lượng sản phẩm nhỏ nhất" FROM Products;

-- đơn đặt hàng có số lượng cao nhất
SELECT * FROM [Order Details] 
WHERE Quantity = 
(SELECT MAX(Quantity) AS "Số lượng cao nhất" FROM [Order Details]);

-- cho biết tên nhân viên vào làm lâu nhất ở công ty
SELECT FirstName FROM Employees WHERE EmployeeID 
= (SELECT MIN(EmployeeID) FROM Employees);

-- tìm đơn hàng đã đặt ít nhất
SELECT * FROM Products WHERE UnitsOnOrder
= (SELECT MIN(UnitsOnOrder) FROM Products);

-- tìm ngày ship hàng gần nhất
SELECT MAX(ShippedDate) AS "Ngày ship hàng gần nhất" FROM Orders;

-- lấy ra địa chỉ ship có độ dài ngắn nhất
SELECT MIN(ShipAddress) FROM Orders;

-- lấy ra tên khách hàng có tổng số đơn hàng cao nhất
SELECT DISTINCT CompanyName 
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN [Order Details] AS od ON od.OrderID = o.OrderID
WHERE Quantity = (SELECT MAX(Quantity) FROM [Order Details]);

-- lấy ra 5 danh mục hàng đầu có giá đơn vị tối đa cao nhất
SELECT TOP 5 c.CategoryName
FROM Categories AS c
INNER JOIN Products AS p ON c.CategoryID = p.CategoryID
WHERE UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- tìm sản phẩm có đơn giá thấp nhất
SELECT MIN(UnitPrice) AS "Sản phẩm có đơn giá thấp nhất" FROM Products;

-- tìm nhân viên trẻ nhất công ty
SELECT * FROM Employees 
WHERE (YEAR(GETDATE()) - YEAR(BirthDate)) 
= (SELECT MIN(YEAR(GETDATE()) - YEAR(BirthDate)) FROM Employees);

-- lấy ra mã vận đơn nhỏ nhất của Customers
SELECT MIN(Customers.PostalCode) AS "Mã vận đơn nhỏ nhất" FROM Customers;

-- lấy ra tên (FirstName) dài nhất
SELECT  FirstName FROM Employees 
WHERE LEN(FirstName) = (
SELECT MAX(LEN(FirstName)) AS "Tên dài nhất" FROM Employees);

-- tìm ra nhân viên có cái tên đứng cuối cùng trong danh sách nếu xếp theo bảng 
-- chữ cái
SELECT * FROM Employees WHERE LastName = (SELECT MAX(LastName) FROM Employees);

-- tìm ra ngày thuê nhân viên gần nhất 
SELECT MAX(HireDate) AS "Ngày thuê gần nhất" FROM Employees;