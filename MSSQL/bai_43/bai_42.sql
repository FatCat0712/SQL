-- View trong SQL
--Cú pháp 
--CREATE [OR ALTER] VIEW view_name AS
--SELECT column1, column2, ...
--FROM table_name
--WHERE condition;

-- tạo view lấy ra số lượng đơn hàng theo tháng
CREATE VIEW MonthlySales AS 
SELECT 
	YEAR(OrderDate) AS "Year",
	MONTH(OrderDate) AS "Month",
	COUNT(OrderID) AS "TotalOrders"
FROM Orders
GROUP BY YEAR(OrderDate),MONTH(OrderDate);

-- truy vấn đến view
SELECT * FROM MonthlySales
ORDER BY MonthlySales.Year;

--truy vấn trên tương đương với 
SELECT * FROM(
SELECT 
	YEAR(OrderDate) AS "Year",
	MONTH(OrderDate) AS "Month",
	COUNT(OrderID) AS "TotalOrders"
FROM Orders
GROUP BY YEAR(OrderDate),MONTH(OrderDate)
) AS "Temp";

-- xóa 1 view
DROP VIEW MonthlySales;

-- tạo view kết hợp thông tin về khách và đơn hàng
CREATE VIEW CustomerOrders AS 
SELECT 
	c.CustomerID,
	c.CompanyName,
	C.ContactName,
	o.OrderID,
	o.OrderDate,
	o.ShipCountry
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

SELECT * FROM CustomerOrders;

-- tạo view hiển thị tổng giá trị của từng đơn hàng
CREATE VIEW OrderTotalValue AS
SELECT 
	o.OrderID,
	o.CustomerID,
	o.OrderDate,
	SUM(od.Quantity * od.UnitPrice - (od.UnitPrice * od.Quantity * od.Discount)) AS "TotalOrderValue"
FROM Orders AS o
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
GROUP BY o.OrderID,o.CustomerID,o.OrderDate;

SELECT * FROM OrderTotalValue;

-- Sử dụng CHECK OPTION để chỉ cho phép chèn dữ liệu thỏa mãn điều kiện
-- Giả sử bạn có một View có tên "HighValueProducts" để hiển thị
-- sản phẩm có giá trị cao hơn $100
CREATE VIEW HighValueProduct AS
SELECT *
FROM Products
WHERE UnitPrice > 100
WITH CHECK OPTION;

SELECT * FROM HighValueProduct;

CREATE VIEW employee_view_read_only
AS 
SELECT EmployeeID, LastName, FirstName
FROM Employees
UNION ALL
SELECT NULL, NULL, NULL

SELECT * FROM employee_view_read_only;

INSERT INTO employee_view_read_only(EmployeeID,LastName,FirstName)
VALUES(10,'Eddie','Mai')
-- => không insert được vì view đã chứa từ khóa UNION
-- vi phạm điều kiện 1

-- tạo một view có tên "CustomerOrders" để hiển thị thông tin về khách
-- hàng và số lượng hàng của họ
CREATE VIEW CustomerOrders AS
SELECT c.CustomerID,c.CompanyName,od.ProductID,od.Quantity
FROM 
Customers AS c
LEFT JOIN
Orders AS o 
ON c.CustomerID = o.CustomerID
INNER JOIN
[Order Details] AS od 
ON o.OrderID = od.OrderID;

SELECT * FROM CustomerOrders;
DROP VIEW CustomerOrders;

-- Tạo một view có tên "EmployeeSalesByYear" để hiển thị tổng
-- doanh số bán hàng của từng nhân viên theo năm
CREATE VIEW EmployeeSalesByYear AS
SELECT 
	YEAR(o.OrderDate) AS "Year",
	e.EmployeeID,
	e.LastName,
	e.FirstName,
	SUM(od.UnitPrice * od.Quantity - (od.UnitPrice * od.Quantity * od.Discount)) AS "TotalSales"
FROM
Employees AS e
RIGHT JOIN
Orders AS o
ON e.EmployeeID = o.EmployeeID
INNER JOIN
[Order Details] AS od
ON od.OrderID = o.OrderID
GROUP BY YEAR(o.OrderDate),e.EmployeeID,e.LastName,e.FirstName;

SELECT *,
	RANK() OVER(PARTITION BY Year ORDER BY TotalSales DESC) AS "Ranking"
FROM 
EmployeeSalesByYear;

-- tạo một view có tên "CategoryProductCounts" để hiển thị số lượng sản
-- phẩm trong mỗi danh mục sản phẩm
CREATE VIEW CategoryProductCounts AS
SELECT CategoryName,COUNT(p.ProductID) AS "TotalProducts"
FROM 
Categories AS c
LEFT JOIN 
Products AS p
ON c.CategoryID = p.CategoryID
GROUP BY CategoryName;

-- tạo một view có tên "CustomerOrderSummary" để hiển thị tổng giá trị
-- đặt hàng của khách hàng
CREATE VIEW CustomerOrderSummary AS
SELECT c.CompanyName,
	  c.ContactName,
	  c.Country,
	  SUM(od.Quantity * od.UnitPrice - (od.Quantity * od.UnitPrice * od.Discount)) AS "TotalPrice"
FROM 
Customers AS c
LEFT JOIN
Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN
[Order Details] AS od
ON od.OrderID = o.OrderID
GROUP BY c.CompanyName, c.ContactName, c.Country

SELECT 
		Country,
		CompanyName,
		ContactName,
		TotalPrice,
		DENSE_RANK() OVER (PARTITION BY Country ORDER BY TotalPrice DESC) AS "RankingInCountry"
FROM CustomerOrderSummary;




