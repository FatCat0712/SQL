-- HAVING lọc dữ liệu sau GROUP BY
-- khi nào các hàm sum, average, count, ... đã được group by
-- thì dùng having

-- cho biết những khách hàng nào đã đặt nhiều hơn 20 đơn hàng
-- sắp xếp theo thứ tự tổng số đơn hàng giảm dần
SELECT CustomerID,COUNT(OrderID) AS "Số lượng đơn hàng" 
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 20
ORDER BY COUNT(OrderID) DESC;

-- lọc ra những nhà cung cấp sản phẩm có tổng số lượng hàng trong 
-- kho (UnitsInStock) lớn hơn 30, và có trung bình đơn giá (UnitPrice)
-- có giá trị dưới 50
SELECT SupplierID,
	SUM(UnitsInStock) AS "TotalUnitPrice", 
	AVG(UnitPrice) AS "AveragePrice"
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitsInStock) > 30 AND AVG(UnitPrice) < 50;

-- Hãy cho biết tổng số tiền vận chuyển của từng tháng, trong nửa
-- năm sau của năm 1996, sắp xếp theo tháng tăng dần
-- tổng tiền vận chuyển lớn hơn 1000
SELECT MONTH(ShippedDate) AS "Month", 
	   SUM(Freight) AS "TotalFreight"
FROM Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate)
HAVING SUM(Freight) > 1000
ORDER BY MONTH(ShippedDate);

-- lọc ra những thành phố có số lượng đơn hàng > 16 và sắp xếp
-- theo tổng số lượng giảm dần
SELECT ShipCity AS "City", COUNT(OrderID) AS "TotalOrders"
FROM Orders
GROUP BY ShipCity
HAVING COUNT(OrderID) > 16
ORDER BY COUNT(OrderID) DESC;

-- lọc ra quốc gia có tổng phí ship lớn hơn 1000
SELECT ShipCountry AS "Country",SUM(Freight) AS "Total Freight"
FROM Orders
GROUP BY ShipCountry
HAVING SUM(Freight) > 1000;

-- lấy ra danh sách sản phẩm có tổng số lượng > 75, có tỷ lệ giảm giá trung bình
-- > 7%, và sắp xếp theo tỷ lệ giá trung bình giảm dần
SELECT ProductID, 
	SUM(Quantity) AS "TotalQuantity",
	AVG(Discount) AS "AverageDiscount"
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity) > 75 AND AVG(Discount) > 0.07
ORDER BY AVG(Discount) DESC;

-- lấy danh sách các quốc gia có chứa ký tự 'e' và 'a', có tổng số
-- lượng các thành phố > 2 và tổng số lượng khách hàng < 10 sắp xếp
-- tên các quốc gia theo thứ tự alphabet
SELECT Country, COUNT(City) AS "NumberOfCities", COUNT(CustomerID) AS "NumberOfCustomers"
FROM Customers
WHERE Country LIKE '%e%' AND Country LIKE '%a%'
GROUP BY Country
HAVING COUNT(City) > 2 AND COUNT(CustomerID) < 10
ORDER BY Country;

-- lọc ra những sản phẩm có tổng số lượng hàng trong kho lớn hơn 100 và sắp xếp
-- giảm dần theo tổng số lượng
SELECT ProductID, ProductName, SUM(UnitsInStock) AS "TotalInStock"
FROM Products 
GROUP BY ProductID,ProductName
HAVING SUM(UnitsInStock) > 100
ORDER BY SUM(UnitsInStock) DESC;

-- lọc ra những đơn hàng được giao đến LonDon và có tổng số tiền vận chuyển
-- lớn hơn 50, sắp xếp giảm dần tổng số tiền vận chuyển
SELECT OrderID,CustomerID, SUM(Freight) AS "TotalFreight"
FROM Orders 
WHERE ShipCity = 'London'
GROUP BY OrderID,CustomerID
HAVING SUM(Freight) > 50
ORDER BY SUM(Freight) DESC;

-- lọc ra các khách hàng có tổng số đơn hàng đã đặt trong năm 1996 lớn hơn 2
-- sắp xếp theo thứ tự giảm dần, dữ liệu lấy trong bảng Orders
SELECT CustomerID,COUNT(OrderID) AS "TotalOrders"
FROM Orders
WHERE YEAR(OrderDate) = 1996
GROUP BY CustomerID
HAVING COUNT(OrderID) > 2
ORDER BY COUNT(OrderID) DESC;

-- lọc ra những sản phẩm có số lượng lớn hơn 10 và đơn giá trung bình giảm dần
SELECT ProductID, COUNT(Quantity) AS "TotalQuantity", AVG(UnitPrice) AS "AveragePrice"
FROM [Order Details]
GROUP BY ProductID
HAVING COUNT(Quantity) > 10
ORDER BY AVG(UnitPrice) DESC;

-- cho biết tổng số tiền vận chuyển của từng tháng trong nửa năm cuối
-- của năm 1996, sắp xếp theo ngày giảm dần, tổng tiền vận chuyển < 5000
SELECT MONTH(ShippedDate) AS "Month",
		SUM(Freight) AS "TotalFreight"
FROM Orders
WHERE ShippedDate BETWEEN '1996-07-01' AND '1996-12-31'
GROUP BY MONTH(ShippedDate)
HAVING SUM(Freight) < 5000
ORDER BY MONTH(ShippedDate) DESC;

-- lọc ra các nhà cung cấp có tổng số lượng đặt hàng (UnitsOnOrder) > 40
-- tổng số lượng đặt hàng lại (ReorderLevel) > 20 và sắp xếp theo thứ tự giảm
-- dần của tổng số lượng đặt hàng
SELECT SupplierID, 
		SUM(UnitsOnOrder) AS [TotalUnitsOnOrder], 
		SUM(ReorderLevel) AS "TotalReorderLevel"
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitsOnOrder) > 40 AND SUM(ReorderLevel) < 20
ORDER BY SUM(UnitsOnOrder) DESC;

-- lọc ra những sản phẩm có tổng số lượng (Quantity) lớn hơn 400
SELECT ProductID, SUM(Quantity) AS "Total Quantity"
FROM "Order Details"
GROUP BY ProductID
HAVING SUM(Quantity) > 400;

-- lọc ra các nước (ShipCountry) có trung bình giá vận chuyển < 500
-- sắp xếp theo giá trị giảm dần của giá vận chuyển
SELECT ShipCountry, AVG(Freight) AS "Average Freight"
FROM Orders
GROUP BY ShipCountry
HAVING AVG(Freight) < 500
ORDER BY AVG(Freight) DESC;

-- lọc ra tên, địa chỉ ship có tổng giá vận chuyển ở Quý 1 năm 1997 > 500,
-- sắp xếp theo giá trị giảm dần của quý 1
SELECT ShipName,ShipAddress, SUM(Freight) AS "TotalFreight" 
FROM Orders
WHERE ShippedDate BETWEEN '1997-01-01' AND '1997-03-31'
GROUP BY ShipName,ShipAddress
HAVING SUM(Freight) > 500
ORDER BY SUM(Freight) DESC;

-- cho biết số lượng khách hàng ở mỗi nước, chỉ lấy danh sách
-- ở các nước có nhiều hơn 5 khách hàng
SELECT Country, COUNT(CustomerID) AS "NumberOfCustomers"
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID)

-- lọc ra số lượng khách hàng đặt trong tháng 5 và chỉ lấy những
-- khách hàng có số lượng nhỏ hơn 3 và sắp xếp theo thứ tự tăng dần
SELECT OrderDate,COUNT(CustomerID) AS "NumberOfCustomers"
FROM Orders
WHERE MONTH(OrderDate) = 5
GROUP BY OrderDate
HAVING COUNT(CustomerID) < 3
ORDER BY COUNT(CustomerID);

-- lọc ra những đơn hàng có tổng giá trị lớn hơn 1000
SELECT OrderID, SUM(UnitPrice) AS "TotalPrice"
FROM [Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice) > 1000;

-- lọc ra những sản phẩm theo nhà cung cấp có giá trung bình lớn 500
SELECT ProductID,ProductName,AVG(UnitPrice) AS "AveragePrice" 
FROM Products
GROUP BY ProductID,ProductName
HAVING AVG(UnitPrice) > 500;

-- liệt kê danh quốc gia có số đơn [20, 50], sắp xếp tăng dần
SELECT ShipCountry,COUNT(OrderID) AS "NumberOfOrders"
FROM Orders
GROUP BY ShipCountry
HAVING COUNT(OrderID) BETWEEN 20 AND 50
ORDER BY COUNT(OrderID);

-- liệt kê danh sách Suppliers có tổng lượng hàng tồn lớn hơn 25
SELECT SupplierID,SUM(UnitsOnOrder - UnitsInStock) AS "InStock" 
FROM Products
GROUP BY SupplierID
HAVING SUM(UnitsOnOrder - UnitsInStock) > 25;



