-- (INNER JOIN): Liệt kê tên sản phẩm và tên nhà cung cấp của các
-- sản phẩm đã được đặt hàng trong bảng "Order Details". Sử dụng INNER
-- JOIN để kết hợp bảng "Order Details" với các bảng liên quan để lấy
-- thông tin sản phẩm và nhà cung cấp
SELECT DISTINCT p.ProductName, s.CompanyName
FROM 
	Products AS p
INNER JOIN
	Suppliers AS s
	ON p.SupplierID = s.SupplierID
INNER JOIN 
	[Order Details] AS od
	ON p.ProductID = od.ProductID;

-- (LEFT JOIN): liệt kê tên khách hàng và tên nhân viên phụ trách của
-- các đơn hàng trong bảng "Orders". Bao gồm cả các đơn hàng không có 
-- nhân viên phụ trách. Sử dụng LEFT JOIN để kết hợp bảng "Orders" với
-- bảng "Employees" để lấy thông tin về khách hàng và nhân viên phụ trách
SELECT 
	OrderID,
	c.CompanyName,
	e.FirstName + ' ' + e.LastName AS "FullName"
FROM 
	Orders AS o
LEFT JOIN
	Employees AS e
	ON o.EmployeeID = e.EmployeeID
LEFT JOIN
	Customers AS c
	ON o.CustomerID = c.CustomerID;

-- (RIGHT JOIN): liệt kê tên khách hàng và tên nhân viên phụ trách của các
-- đơn hàng trong bảng "Orders". Bao gồm cả các khách hàng không có đơn hàng
-- Sử dụng RIGHT JOIN để kết hợp bảng "Orders" với bảng "Customers" để lấy thông
-- tin về khách hàng và nhân viên phụ trách
SELECT 
	OrderID, 
	c.CompanyName, 
	e.FirstName + ' '+e.LastName AS "FullName"
FROM 
	Orders AS o
RIGHT JOIN 
	Employees AS e
	ON e.EmployeeID = o.EmployeeID
RIGHT JOIN
	Customers AS c
	ON o.CustomerID = c.CustomerID;

-- (FULL JOIN): liệt kê tên danh mục và tên nhà cung cấp của
-- các sản phẩm trong bảng "Products". Bao gồm cả các danh mục
-- và nhà cung cấp không có sản phẩm. Sử dụng FULL JOIN hoặc kết
-- hợp LEFT JOIN và RIGHT JOIN để lấy thông tin về danh mục và nhà 
-- cung cấp
SELECT DISTINCT p.ProductID,
				p.ProductName,
				c.CategoryName,
				s.CompanyName
FROM 
	Categories AS c
FULL JOIN
	Products AS p
	ON c.CategoryID = p.CategoryID
FULL JOIN 
	Suppliers AS s
	ON p.SupplierID = s.SupplierID;

-- (INNER JOIN): liệt kê tên khách hàng và tên sản phẩm đã được
-- đặt hàng trong bảng "Orders" và "Orders Details". Sử dụng INNER
-- JOIN để kết hợp bảng "Orders" và "Order Details" để lấy thông
-- tin khách hàng và sản phẩm đã được đặt hàng
SELECT DISTINCT
	o.OrderID,
	c.CompanyName,
	p.ProductName
FROM 
	Orders AS o
INNER JOIN
	Customers AS c
	ON o.CustomerID = c.CustomerID
INNER JOIN
	[Order Details] AS od
	ON od.OrderID = o.OrderID
INNER JOIN
	Products AS p
	ON p.ProductID = od.ProductID;



-- Liệt kê tên nhân viên và tên khách hàng của các đơn hàng trong
-- bảng "Orders". Bao gồm cả các đơn hàng không có nhân viên hoặc 
-- khách hàng tương ứng. Sử dụng FULL JOIN hoặc kết hợp LEFT JOIN
-- RIGHT JOIN để kết hợp bảng "Employees" và "Customers" để lấy
-- thông tin về nhân viên và khách hàng
SELECT o.OrderID,
	   e.LastName + ' ' +e.FirstName AS "FullName"
	   ,c.CompanyName
FROM 
	Orders AS o
LEFT JOIN 
	Employees AS e
	ON e.EmployeeID = o.EmployeeID
RIGHT JOIN
	Customers AS c
	ON o.CustomerID = c.CustomerID;




	
	

