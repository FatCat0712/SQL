-- JOIN trong SQL
-- INNER JOIN (JOIN) trả về tất cả các hàng khi có giá trị đều xuất hiện ở cả 2 bảng

-- LEFT OUTER JOIN (LEFT JOIN) trả lại tất cả các dòng từ bảng bên trái, và các dòng
-- đúng với điều kiện từ bảng bên phải
-- những giá trị không xuất hiện ở bảng bên phải sẽ trả về giá trị NULL

-- RIGHT OUTER JOIN (RIGHT JOIN) trả lại tất cả các dòng từ bảng bên phải, và các dòng
-- đúng với điều kiện từ bảng bên trái
-- những giá trị không xuất hiện ở bảng bên trái sẽ trả về giá trị NULL

-- FULL OUTER JOIN (FULL JOIN) trả về tất cả các dòng đúng với 1 trong các bảng
-- những giá trị không xuất hiện ở bảng bên trên trái hoặc bảng bên phải sẽ trả 
-- về NULL

-- Sử dụng INNER JOIN, hãy in ra các thông tin sau đây
-- Mã đơn hàng
-- Tên công ty khách hàng
SELECT o.OrderID,c.CompanyName
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

-- Sử dụng INNER JOIN, từ bảng Products và Categories, hãy in ra
-- các thông tin sau đây
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm
SELECT 
	c.CategoryID, 
	c.CategoryName,
	p.ProductID,
	p.ProductName
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID;

-- sử dụng INNER JOIN
-- từ bảng Products và Categories, hãy đưa ra các thông tin sau 
-- Mã thể loại
-- Tên thể loại
-- Số lượng sản phẩm
SELECT c.CategoryID, 
	   c.CategoryName,
	   COUNT(ProductID) AS "TotalProducts"
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--INSERT INTO Categories(CategoryName)
--VALUES	('Asian Food'),
--		('Vietnamese Food');


-- sử dụng LEFT JOIN
-- từ bảng Products và Categories, hãy đưa ra các thông tin sau 
-- Mã thể loại
-- Tên thể loại
-- Số lượng sản phẩm
SELECT 
	c.CategoryID, 
	c.CategoryName,
	p.ProductID,
	p.ProductName
FROM Categories AS c
LEFT JOIN Products AS p
ON c.CategoryID = p.CategoryID;

-- sử dụng LEFT JOIN
-- từ bảng Products và Categories, hãy đưa ra các thông tin sau 
-- Mã thể loại
-- Tên thể loại
-- Số lượng sản phẩm
SELECT 
	c.CategoryID, 
	c.CategoryName,
	COUNT(p.ProductID) AS "TotalOrders"
FROM Categories AS c
LEFT JOIN Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

--INSERT INTO Customers(CustomerID,CompanyName,ContactName)
--VALUES ('TITV','TITV.vn','Lê Nhật Tùng');

-- Sử dụng RIGHT JOIN, hãy in ra các thông tin sau đây
-- Mã đơn hàng
-- Tên công ty khách hàng
SELECT o.OrderID, c.CompanyName
FROM Orders AS o
RIGHT JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

-- sử dụng RIGHT JOIN
-- từ bảng Customers và Orders, hãy đưa ra các thông tin sau 
-- Tên khách hàng
-- Số lượng đơn hàng
SELECT c.CompanyName,COUNT(o.OrderID) AS "TotalOrders"
FROM Orders AS o
RIGHT JOIN Customers AS c
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName;

--INSERT INTO Products(ProductName)
--VALUES ('Mi Hao Hao');

-- Sử dụng FULL OUTER JOIN
-- từ bảng Products và Categories, in ra các thông tin
-- Mã thể loại
-- Tên thể loại
-- Mã sản phẩm
-- Tên sản phẩm
SELECT c.CategoryID,
	   c.CategoryName,
	   p.ProductID,
	   p.ProductName
FROM Categories AS c 
FULL JOIN Products AS p
ON p.CategoryID = c.CategoryID;

-- liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong
-- bảng "Orders", sử dụng INNER JOIN
SELECT 
	e.LastName+' '+	e.FirstName AS "FullName",
	c.CompanyName
FROM 
	Employees AS e
INNER JOIN
	Orders AS o ON e.EmployeeID = o.EmployeeID
INNER JOIN
	Customers AS c ON o.CustomerID = c.CustomerID;

-- liệt kê tên nhà cung cấp và tên sản phẩm của các sản phẩm trong bảng
-- "Products", bao gồm cả các sản phẩm không có nhà cung cấp (LEFT JOIN)
SELECT p.ProductName,s.CompanyName
FROM 
	Products AS p
LEFT JOIN
	Suppliers AS s ON p.SupplierID = s.SupplierID;

-- liệt kê tên khách hàng và tên đơn hàng của các đơn hàng trong bảng "Orders"
-- bao gồm cả các khách hàng không có đơn hàng
SELECT c.CompanyName,o.ShipName
FROM 
	Orders AS o
RIGHT JOIN
	Customers AS c ON o.CustomerID = c.CustomerID;

-- liệt kê tên danh mục và tên nhà cung cấp của các sản phẩm trong bảng "Products",
-- bao gồm cả các danh mục và nhà cung cấp không có sản phẩm (FULL JOIN)
SELECT c.CategoryName, s.CompanyName
FROM 
	Categories AS c
FULL JOIN
	Products AS p ON p.CategoryID = c.CategoryID
FULL JOIN
	Suppliers AS s ON p.SupplierID = s.SupplierID;

-- In ra tên nhân viên, tổng số đơn nhân viên đó bán được(LEFT JOIN)
SELECT 
		e.LastName + ' '+ e.FirstName AS "FullName", 
		COUNT(OrderID) AS "TotalOrders"
FROM 
	Employees AS e
LEFT JOIN Orders AS o 
	ON e.EmployeeID = o.EmployeeID
GROUP BY e.LastName,e.FirstName
ORDER BY COUNT(OrderID) DESC;



