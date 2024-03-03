-- hãy cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng, 
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần
SELECT CustomerID, COUNT(OrderID) AS "NumberOfOrders"
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

-- hãy lọc ra các nhân viên (EmployeeID) có tống số đơn hàng lớn hơn hoặc bằng 100, 
-- sắp xếp theo tổng số đơn hàng giảm dần
SELECT EmployeeID, COUNT(OrderID) AS "NumberOfOrders"
FROM Orders
GROUP BY EmployeeID
HAVING COUNT(OrderID) >= 100
ORDER BY COUNT(OrderID) DESC;

-- hãy cho biết những thể loại nào(CategoryID) có số sản phẩm khác nhau lớn hơn 11
SELECT CategoryID,COUNT(ProductID) AS "NumberOfProducts"
FROM Products
GROUP BY CategoryID
HAVING COUNT(ProductID) > 11;

-- hãy cho biết những thể loại nào(CategoryID) có tổng số lượng sản phẩm trong kho(UnitInStock) 
-- lớn hơn 350
SELECT CategoryID, SUM(UnitsInStock) AS "SumInStock" 
FROM Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 350;

-- hãy cho biết những quốc gia nào có nhiều hơn 7 khách hàng
SELECT Country, COUNT(CustomerID) AS "NumberOfCustomers" 
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 7;

-- hãy cho biết những quốc gia nào có nhiều hơn 7 đơn hàng
SELECT ShipCountry,COUNT(OrderID) AS "TotalOrders" 
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 7;

-- hãy cho biết những ngày nào có nhiều hơn 5 đơn hàng được giao, 
-- sắp xếp tăng dần theo ngày giao hàng
SELECT ShippedDate,COUNT(OrderID) AS "TotalOrders"
FROM Orders
GROUP BY ShippedDate
HAVING COUNT(OrderID) > 5
ORDER BY ShippedDate;

-- hãy cho biết những quốc gia bắt đầu bằng chữ 'A' hoặc 'G' 
-- và có số lượng đơn hàng lớn hơn 29
SELECT ShipCountry, COUNT(OrderID) AS "TotalOrders"
FROM Orders
WHERE ShipCountry LIKE '[AG]%'
GROUP BY ShipCountry
HAVING COUNT(OrderID) > 29;

-- hãy cho biết những thành phố nào có số lượng đơn hàng được giao là khác 1 và 2, ngày đặt hàng từ ngày
-- '1997-04-01' đến ngày '1997-08-31'
SELECT ShipCity,COUNT(OrderID) AS "TotalOrders"
FROM Orders
WHERE OrderDate BETWEEN '1997-04-01' AND '1997-08-31'
GROUP BY ShipCity
HAVING COUNT(OrderID) NOT IN (1,2);

-- hãy lọc ra các đơn hàng được giao đến London bị trễ và có số lượng lớn hơn 100, 
-- sắp xếp theo ngày giao hàng giảm dần
SELECT OrderID,RequiredDate,ShippedDate,COUNT(OrderID) AS "TotalOrders"
FROM Orders
WHERE ShipCity = 'London' AND ShippedDate > RequiredDate
GROUP BY OrderID, ShippedDate,RequiredDate
HAVING COUNT(OrderID) > 100
ORDER BY ShippedDate DESC;

SELECT * FROM Orders;

