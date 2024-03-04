-- liệt kê các đơn hàng có ngày đặt hàng gần đây nhất
SELECT o.*
FROM Orders AS o
WHERE OrderDate = (
			SELECT MAX(OrderDate)
			FROM Orders);

-- liệt kê những sản phẩm không có đơn đặt hàng
SELECT *
FROM 
	Products AS p
WHERE p.ProductID NOT IN ( SELECT DISTINCT ProductID
							FROM [Order Details]);

-- lấy thông tin về các đơn hàng, và tên các sản phẩm thuộc các đơn hàng
-- chưa được giao
SELECT 
	o.OrderID,
	p.ProductName 
FROM Orders AS o
INNER JOIN
	[Order Details] AS od
	ON od.OrderID = o.OrderID
INNER JOIN 
	Products AS p
	ON od.ProductID = p.ProductID
WHERE o.OrderID IN (
	SELECT OrderID
	FROM Orders
	WHERE ShippedDate IS NULL
	);

-- lấy thông tin về các sản phẩm có số lượng tồn kho 
-- ít hơn số lượng tồn kho trung bình của tất cả sản phẩm
SELECT * 
FROM Products
WHERE (UnitsInStock - UnitsOnOrder) < (SELECT AVG(UnitsInStock - UnitsOnOrder)
						FROM Products);

-- lấy thông tin về khách hàng có tổng giá trị đơn hàng là lớn nhất
SELECT DISTINCT c.*
FROM Customers AS c
INNER JOIN 
		Orders AS o
		ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = (SELECT o.CustomerID
				 FROM dbo.Orders AS o
				 WHERE o.OrderID IN
								(SELECT TOP 1 OrderID
								FROM [Order Details] AS od
								GROUP BY OrderID
								ORDER BY SUM(UnitPrice * Quantity * Discount) DESC));

-- lấy thông tin các sản phẩm có doanh số bán hàng cao nhất
SELECT *
FROM Products
WHERE ProductID = (
SELECT TOP 1 ProductID
FROM [Order Details]
GROUP BY ProductID
ORDER BY SUM(Quantity * UnitPrice) DESC);



																
