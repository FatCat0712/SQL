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