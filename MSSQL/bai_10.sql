-- ORDER BY
-- ASC: Sắp xếp tăng dần ( mặc định nếu không ghi)
-- DESC: sắp xếp giảm dần

-- liệt kê tất cả các nhà cung cấp theo thứ tự tên đơn vị(CompanyName)
SELECT * FROM Suppliers ORDER BY CompanyName;

-- liệt kê tất cả các sản phẩm theo thứ tự giá giảm dần
SELECT * FROM Products ORDER BY UnitPrice DESC;

-- liệt kê tất cả các nhân viên theo thứ tự họ và tên đệm từ A - Z
-- không ASC | DESC
-- sắp xếp theo LastName, ở các record có trùng LastName thì sắp xếp
-- theo FirstName
SELECT * FROM Employees ORDER BY LastName,FirstName;

-- lấy ra một sản phẩm có số lượng bán cao nhất
SELECT TOP 1 * FROM [Order Details] ORDER BY Quantity DESC;

-- liệt kê danh sách các đơn đặt hàng trong bảng Orders theo thứ tự giảm
-- dần của ngày đặt hàng
SELECT * FROM Orders ORDER BY OrderDate DESC;

-- liệt kê tên, đơn giá, số lượng tồn kho (UnitInStock) của tất cả các
-- sản phẩm trong bảng Products, theo thứ tự giảm dần của UnitsInStock
SELECT ProductName,UnitPrice,UnitsInStock 
FROM Products ORDER BY UnitsInStock DESC;

-- Sắp xếp ngày đặt hàng theo thứ tự tăng dần
SELECT OrderDate FROM Orders ORDER BY OrderDate;

-- Sắp xêp giá của sản phẩm theo thứ tự tăng dần
SELECT UnitPrice FROM Products ORDER BY UnitPrice;

-- Sắp xếp số lượng sản phẩm theo thứ tự giảm dần
SELECT QuantityPerUnit FROM Products ORDER BY QuantityPerUnit DESC;

-- Liệt kê tất cả các thông tin của Shippers theo CompanyName từ A-Z trong bảng Shippers
SELECT * FROM Shippers ORDER BY CompanyName;

-- Liệt kê tất cả thông tin của đơn đặt hàng trong bảng Order Details theo thứ tự Discount giảm dần
SELECT * FROM [Order Details] ORDER BY Discount DESC;

-- Liệt kê Mã khách hàng, Tên công ty, Địa chỉ trong bảng Customers, theo thứ tự CompanyName từ A-Z
SELECT * FROM Customers ORDER BY CompanyName;

--  Tất cả thông tin của 10 đơn đặt hàng gần nhất ( theo thứ tự từ đơn hàng gần nhất đến xa nhất )
SELECT TOP 10 * FROM Orders ORDER BY OrderDate DESC;

-- Họ , tên, địa chỉ của 5 nhân viên lớn tuổi nhất công ty (thứ tự giảm dần của tuổi)
SELECT TOP 5 LastName,FirstName,Address FROM Employees ORDER BY BirthDate;

-- Hãy sắp xếp tên sản phẩm theo thứ tự hàng tồn kho lớn đến bé
SELECT ProductName FROM Products ORDER BY UnitsInStock DESC;

-- sắp xếp tên các nhân viên theo thứ tự từ nhân viên trẻ tuổi nhất đến nhân viên lớn tuổi nhất
SELECT LastName,BirthDate FROM Employees ORDER BY BirthDate DESC;

-- liệt kê tên công ty trong bảng Supplier theo thứ tự giảm dần của tên thành phố
SELECT CompanyName,City AS "Tên Công ty" FROM Suppliers ORDER BY City DESC ;

-- liệt tên mã nhân viên, tên và địa chỉ của tất cả nhân viên theo thứ
-- tự ngày sinh tăng dần
SELECT EmployeeID AS "Mã nhân viên", 
	   LastName AS "Tên",
	   Address AS "Địa chỉ"
	   FROM Employees ORDER BY BirthDate;

-- Liệt kê các thành phố(City) của nhân viên trong công ty theo thứ tự từ 
-- Z - A
SELECT City FROM Employees ORDER BY City DESC;

-- cho biết nhân viên nào được tuyển đầu tiên trong công ty
SELECT * FROM Employees WHERE HireDate = (
SELECT TOP 1  HireDate FROM Employees ORDER BY HireDate ASC);

-- cho biết tên những sản phẩm đã ngưng sản xuất theo thứ tự tăng dần
SELECT ProductName FROM Products WHERE Discontinued = 1;

-- liệt kê các nhà cung cấp theo yêu cầu là tên quốc gia của các
-- nhà cung cấp theo chiều tăng A -> Z
SELECT * FROM Suppliers ORDER BY Country;

-- liệt kê 3 nhân viên trong bảng Employees lớn tuổi nhất
SELECT TOP 3 * FROM Employees ORDER BY BirthDate;

-- Liệt kê 1 sản phẩm (productID), số lượng (QuantityPerUnit) trong bảng Products bán chạy nhất
SELECT TOP 1 ProductID FROM Products ORDER BY QuantityPerUnit;

-- Hiển thị tất cả các cột bảng Products theo thứ tự tăng dần của cột UnitsOnOrder
SELECT * FROM Products ORDER BY UnitsOnOrder;

--  hiển thị danh sách tên thông tin liên lạc Contact Title trong bảng Suppliers theo thứ tự A - Z
SELECT ContactTitle FROM Suppliers ORDER BY ContactTitle;

-- hiển thị tất cả các cột bảng Employees của 5 nhân viên có ngày thuê gần nhất
SELECT TOP 5 * FROM Employees ORDER BY HireDate DESC;

-- Liệt kê tất cả 3 nhân viên trong bảng Employees lớn tuổi nhất
SELECT TOP 3 * FROM Employees ORDER BY BirthDate ASC;

-- liệt kê danh sách 40% sản phẩm có giá bán thấp nhất
SELECT TOP 40 PERCENT * FROM Products ORDER BY UnitPrice ASC;

-- sắp xếp số fax theo thứ tự giảm dần trong bảng Customers
SELECT Fax FROm Customers ORDER BY Fax DESC;
