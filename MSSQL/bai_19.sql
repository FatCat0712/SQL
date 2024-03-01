-- GROUP BY trong SQL
-- Dùng để nhóm các dòng dữ liệu có cùng giá trị
-- Thường được dùng chung với các hàm: COUNT(),MAX(),
-- MIN(), SUM(), AVG()

-- cho biết mỗi khách hàng đã đặt bao nhiêu đơn hàng
SELECT o.CustomerID AS "ID công ty" ,
		c.CompanyName AS "Tên công ty", 
		COUNT(OrderID) AS "Số lượng đơn hàng"
FROM Orders AS o
INNER JOIN Customers AS c ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID,c.CompanyName;

-- tính giá trị đơn giá trung bình theo mỗi nhà cung cấp sản phẩm
SELECT p.SupplierID AS "ID nhà cung cấp",
		s.CompanyName AS "Tên nhà cung cấp", 
		AVG(UnitPrice) AS "Giá trung bình"
FROM Products AS p
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID
GROUP BY p.SupplierID,s.CompanyName;

-- cho biết mỗi thể loại có tổng số bao nhiêu sản phẩm trong kho (UnitsInStock)
SELECT p.CategoryID AS "Mã thể loại", 
		c.CategoryName AS "Tên thể loại",
		SUM(p.UnitsInStock) AS "Tổng sản phẩm trong kho"
FROM Products AS p
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY p.CategoryID,c.CategoryName;

-- cho biết giá vận chuyển thấp nhất và lớn nhất của các đơn hàng
-- theo từng thành phố và quốc gia khác nhau
SELECT ShipCountry, 
		ShipCity, 
		MIN(Freight) AS "Giá vận chuyển thấp nhất", 
		MAX(Freight) AS "Giá vận chuyển cao nhất"
FROM Orders
GROUP BY ShipCountry,ShipCity
ORDER BY ShipCountry,ShipCity;

-- thống kê số lượng nhân viên theo từng quốc gia khác nhau
SELECT Country, COUNT(EmployeeID) AS "Số lượng nhân viên"
FROM Employees
GROUP BY Country;

-- thống kê ngày sinh nhật của nhân viên theo từng thành phố
SELECT City AS "Thành phố" ,
	  COUNT(BirthDate) AS "Số lượng ngày sinh"
FROM Employees
GROUP BY City

-- đếm số lượng tên công ty của khách hàng theo từng quốc gia
SELECT Country AS "Quốc gia",
	   COUNT(CompanyName) AS "Số lượng tên công ty"
FROM Customers
GROUP BY Country;

-- Liệt kê danh sách các nhóm hàng (category) có tổng số mặt hàng (product) nhỏ hơn 10.  
-- Thông tin kết quả bao gồm CategoryID, CategoryName, CountOfProducts.  
-- Được sắp xếp theo CategoryName, cùng CategoryName thì sắp theo CountOfProducts giảm dần
SELECT c.CategoryID AS "Mã thể loại",
		c.CategoryName AS "Tên thể loại",
		COUNT(p.CategoryID) AS "CountOfProducts"
FROM Products AS p
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID,c.CategoryName
ORDER BY c.CategoryName,CountOfProducts DESC;

-- Lấy ra tên tất các các đơn hàng theo thành phố và quốc gia
SELECT OrderID,ShipCity,ShipCountry
FROM Orders 
GROUP BY ShipCity,ShipCountry,OrderID
ORDER BY OrderID;

-- liệt kê số lượng khách hàng ở mỗi đất nước khác nhau
SELECT Country,COUNT(CustomerID) AS "Số lượng khách hàng" FROM Customers
GROUP BY Country;

-- cho biết tổng đơn giá(UnitPrice) của mỗi đơn hàng trong bảng (Order Details)
SELECT OrderID,SUM(UnitPrice) AS "Tổng đơn giá"
FROM [Order Details]
GROUP BY OrderID;

-- tính số lượng các nhà cung cấp của mỗi nước mà phải có chữ a trong tên
SELECT Country, COUNT(SupplierID) AS "số lượng nhà cung cấp" 
FROM Suppliers
WHERE CompanyName LIKe '%a%'
GROUP BY Country;

-- cho biết tổng giá hàng từ đơn đặt hàng và productID
SELECT od.OrderID, SUM(od.Quantity * od.UnitPrice) AS "Tổng giá hàng"
FROM Products AS p
INNER JOIN [Order Details] AS od ON p.ProductID = od.ProductID
GROUP BY od.OrderID
ORDER BY od.OrderID;

-- Hãy lấy ra 10  khách hàng đã đặt nhiều đơn hàng nhất trong tháng 7 năm 1997
SELECT TOP 10 c.CompanyName, COUNT(o.CustomerID) AS "Số lượng đơn hàng"
FROM Customers AS c
INNER JOIN Orders  AS o ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY COUNT(o.CustomerID) DESC;
-- Tính min và max freight của địa chỉ giao hàng và tên hàng (90)column
SELECT ShipAddress,Min(Freight),Max(Freight) 
FROM Orders 
WHERE ShipAddress LIKE '90%'
GROUP BY ShipAddress;

-- thống kê số lượng nhân viên ở thành phố London theo bảng nhân viên
SELECT COUNT(*) AS "số lượng nhân viên ở London"
FROM Employees
WHERE City = 'London'
GROUP BY City;

-- Hãy thống kê số lượng khách hàng đặt đơn ở mỗi nước
SELECT ShipCountry, COUNT(*) AS "Số lượng khách hàng"
FROM Orders
GROUP BY ShipCountry;

-- lấy ra số đon hàng ship đến cùng một thành phố
SELECT COUNT(*) 
FROM Orders
GROUP BY ShipCity;



-- cho biết một hóa đơn có bao nhiêu sản phẩm
SELECT OrderID, SUM(Quantity) AS "Số lượng sản phẩm"
FROM [Order Details]
GROUP BY OrderID;

-- hãy cho biết một khu vực (ShipRegion) có bao nhiêu hóa đơn
SELECT ShipRegion, COUNT(*) AS "Số hóa đơn"
FROM Orders
WHERE ShipRegion IS NOT NULL
GROUP BY ShipRegion;

-- thống kê số lượng đơn hàng phải giao của các ngày giao hàng
SELECT ShippedDate, COUNT(OrderID) AS "Số đơn"
FROM Orders
GROUP BY ShippedDate;

-- với mỗi khách hàng tương ứng, kiểm tra xem mỗi khách hàng có tất cả
-- bao nhiêu tên liên hệ
SELECT CustomerID,CompanyName, COUNT(ContactName) AS "Số tên liên hệ"
FROM Customers
GROUP BY CustomerID,CompanyName;

-- với mỗi đơn hàng cho biết có bao nhiêu yêu cầu ngày nhận hàng cho từng
-- đơn hàng như thế
SELECT OrderID,COUNT(RequiredDate) AS "số ngày yêu cầu nhận hàng"
FROM Orders
GROUP BY OrderID;

-- thống kê số đơn hàng theo từng nhân viên giao hàng đã giao
SELECT EmployeeID, COUNT(OrderID) AS "Số đơn hàng" 
FROM Orders 
GROUP BY EmployeeID;














