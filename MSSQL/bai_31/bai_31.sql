WITH short_e AS(
	SELECT EmployeeID, LastName,FirstName
	FROM Employees
)

SELECT * FROM short_e;

-- lấy thông tin về các sản phẩm (Products) có cùng thể loại
-- với một sản phẩm cụ thể

-- Sử dụng Sub Query
SELECT ProductID,ProductName, CategoryID
FROM Products
WHERE CategoryID = (SELECT CategoryID
					FROM Products
					WHERE ProductName = 'Chai');

-- Sử dụng Sub Query + JOIN
SELECT p.ProductName,Subquery.CategoryID
FROM Products AS p
LEFT JOIN ( 
			SELECT CategoryID
			FROM Products
			WHERE ProductName = 'Chai') AS Subquery
ON p.CategoryID = Subquery.CategoryID;

-- Sử dụng CTE
WITH ProductCategory AS(
	SELECT CategoryID
	FROM Products
	WHERE ProductName = 'Chai'
)
SELECT pc.CategoryID,p.ProductName
FROM Products AS p
INNER JOIN ProductCategory AS pc
ON p.CategoryID = pc.CategoryID;

-- lấy thông tin về đơn hàng (Orders) cùng với tổng giá trị đơn hàng
-- và tỷ lệ giữa tổng giá trị và phí giao hàng

-- Sử dụng Subquery
SELECT 
		o.OrderID,
	   o.OrderDate,
	   o.Freight,
	   (SELECT SUM(od.UnitPrice * od.Quantity) 
		FROM [Order Details] AS od
		WHERE o.OrderID = od.OrderID) 
		AS "TotalPrice",
		(SELECT SUM(od.UnitPrice * od.Quantity) /o.Freight
		FROM [Order Details] AS od
		WHERE o.OrderID = od.OrderID)
		AS "Ratio"
FROM Orders AS o;

-- mỗi lần chạy subquery sẽ phải quét lại toàn bộ CSDL
-- => chậm => ảnh hưởng lớn tới hiệu năng

-- Sử dụng CTE
WITH TotalMoney AS(
		SELECT OrderID,
			(SELECT SUM(od.UnitPrice * od.Quantity) 
			 FROM [Order Details] AS od
			 WHERE o.OrderID = od.OrderID)
			 AS "TotalPrice"
			 
		FROM Orders AS o
)
SELECT 
	o.OrderID,
	o.OrderDate,
	o.Freight,
	tm.TotalPrice,
	tm.TotalPrice / o.Freight AS "Ratio"

FROM Orders AS o
INNER JOIN TotalMoney AS tm
ON o.OrderID = tm.OrderID;

	


WITH TotalMoney AS(
		SELECT 
			od.OrderID,
			SUM(od.UnitPrice * od.Quantity) AS "TotalPrice"
		FROM [Order Details] AS od
		GROUP BY od.OrderID
),
otx AS(
	SELECT 
			od.OrderID,
			SUM(od.UnitPrice * od.Quantity) AS "TotalPrice"
		FROM [Order Details] AS od
		GROUP BY od.OrderID
),
otx2 AS(
	SELECT 
			od.OrderID,
			SUM(od.UnitPrice * od.Quantity) AS "TotalPrice"
		FROM [Order Details] AS od
		GROUP BY od.OrderID
)


SELECT 
	o.OrderID,
	o.OrderDate,
	o.Freight,
	tm.TotalPrice,
	tm.TotalPrice / o.Freight AS "Ratio"

FROM Orders AS o
INNER JOIN TotalMoney AS tm
ON o.OrderID = tm.OrderID;

-- => Sử dụng một lần truy vấn con và không bị lặp lại code


-- Exercise
-- Sử dụng CTE để tính tổng doanh số bán hàng cho từng sản phẩm
-- từ hai bảng "Order Details" và "Products" trong CSDL Northwind
WITH ProductSales AS(
	SELECT 
		od.ProductID, 
		SUM(od.UnitPrice * Quantity) AS "TotalSales"
	FROM [Order Details] AS od
	GROUP BY od.ProductID
)
SELECT 
	p.ProductID,
	p.ProductName,
	ps.TotalSales
FROM Products AS p
INNER JOIN ProductSales AS ps
ON p.ProductID = ps.ProductID
ORDER BY p.ProductID;

-- Sử dụng CTE để tính toán tổng doanh số bán hàng theo từng
-- khách hàng và sau đó sắp xếp danh sách theo tổng số doanh sổ
-- giảm dần
WITH CustomerSales AS(
	SELECT 
		c.CustomerID,
		SUM(UnitPrice * Quantity) AS "TotalSales"
	FROM Customers AS c
	LEFT JOIN
		Orders AS o
		ON o.CustomerID = c.CustomerID
	INNER JOIN
		[Order Details] AS od
		ON o.OrderID = od.OrderID
	GROUP BY c.CustomerID, c.CompanyName
)
SELECT c.CustomerID, c.CompanyName,cs.TotalSales
FROM 
	Customers AS c
INNER JOIN 
	CustomerSales AS cs
	ON c.CustomerID = cs.CustomerID
ORDER BY cs.TotalSales DESC;

-- sử dụng CTE tính tổng doanh số bán hàng theo năm từ bảng "Orders" và
-- "Order Details"
WITH OrderSales AS (
	SELECT 
			od.OrderID,
			SUM(od.UnitPrice * od.Quantity) AS "TotalOrderSales"
	FROM [Order Details] AS od
	GROUP BY od.OrderID
)
,YearSales AS(
	SELECT YEAR(o.OrderDate) AS "Year",SUM(os.TotalOrderSales) AS "TotalSales"
	FROM Orders AS o
	INNER JOIN OrderSales AS os
	ON o.OrderID = os.OrderID
	GROUP BY YEAR(o.OrderDate)
)

SELECT YEAR(o.OrderDate) AS "Year", ys.TotalSales
FROM Orders AS o
INNER JOIN YearSales AS ys
ON YEAR(o.OrderDate) = ys.Year
GROUP BY YEAR(o.OrderDate), ys.TotalSales;




