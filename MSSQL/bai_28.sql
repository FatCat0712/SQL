-- SUBQUERY (câu truy vấn con) trong SQL là một truy vấn SELECT được
-- viết bên trong một truy vấn SELECT, UPDATE, INSERT hoặc DELETE khác

-- SUBQUERY hoạt động như một bảng ảo tạm thời, nó được sử dụng để
-- trích xuất thông tin từ các bảng hoặc tập dữ liệu khách trong cùng
-- một câu truy vấn

-- liệt kê ra toàn bộ sản phẩm
SELECT ProductID,ProductName,UnitPrice
FROM Products;

-- Tìm ra giá trung bình của các sản phẩm
SELECT AVG(UnitPrice) AS "AveragePrice"
FROM Products;

-- Lọc những sản phẩm có giá lớn hơn giá trung bình
SELECT ProductID,ProductName,UnitPrice 
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) 
							FROM Products);

-- lọc ra những khách hàng có số đơn hàng lớn hơn 10
SELECT DISTINCT c.CustomerID,c.CompanyName
FROM 
	Customers AS c
WHERE c.CustomerID IN (
		SELECT CustomerID 
		FROM Orders
		GROUP BY CustomerID
		HAVING COUNT(OrderID) > 10
);

-- tính tổng tiền cho từng đơn hàng
SELECT o.*,
		(SELECT SUM(UnitPrice * Quantity) 
				FROM [Order Details] AS od
				WHERE o.OrderID = od.OrderID)
		AS "TotalPrice"
FROM Orders AS o;

-- lọc ra tên sản phẩm và tổng số đơn hàng của sản phẩm
SELECT p.ProductID,p.ProductName,
		(SELECT COUNT(OrderID)
				FROM [Order Details] AS od
				WHERE p.ProductID = od.ProductID
		) AS "TotalOrders"
FROM Products AS p;

SELECT ProductName, TotalOrders
FROM 
	(SELECT p.ProductID,p.ProductName,
		(SELECT COUNT(OrderID)
				FROM [Order Details] AS od
				WHERE p.ProductID = od.ProductID
		) AS "TotalOrders"
	FROM Products AS p)
		AS "Temp";

-- hãy in ra mã đơn hàng và tổng giá trị của đơn hàng đó
SELECT o.OrderID,( 
			SELECT SUM(Quantity * UnitPrice)
			FROM [Order Details] AS od
			WHERE o.OrderID = od.OrderID
			) AS "TotalPrice"						
FROM
	Orders AS o;

-- hãy in ra mã đơn hàng và số lượng sản phẩm của đơn hàng đó
SELECT o.OrderID,( 
			SELECT COUNT(od.ProductID)
			FROM [Order Details] AS od
			WHERE o.OrderID = od.OrderID
			) AS "NumberOfProducts"						
FROM
	Orders AS o;


					