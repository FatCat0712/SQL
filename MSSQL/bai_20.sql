-- DAY, MONTH, YEAR trong SQL
-- DAY (date | datetime) : lấy ra dữ liệu ngày
-- MONTH (date | datetime) : lấy ra dữ liệu tháng
-- YEAR (date | datetime) : lấy ra dữ liệu năm

-- tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
SELECT CustomerID,
		YEAR(OrderDate) AS "Năm đặt đơn",
		COUNT(*) AS "Số lượng đơn hàng"
FROM Orders
WHERE YEAR(OrderDate) = '1997'
GROUP BY CustomerID, YEAR(OrderDate);

-- hãy lọc ra các đơn hàng được đặt hàng vào tháng 5 năm 1997
SELECT *
FROM Orders
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 1997;

-- lấy danh sách các đơn hàng được đặt vào ngày 4 tháng 9 năm 1996
SELECT *
FROM Orders
WHERE OrderDate = '1996-09-04';

-- lấy danh sách khách hàng đặt hàng trong năm 1998 và số đơn hàng mỗi tháng
-- sắp xếp tháng tăng dần
SELECT CustomerID, MONTH(OrderDate) AS "Tháng đặt hàng", COUNT(OrderID) AS "Số đơn hàng"
FROM Orders
WHERE YEAR(OrderDate) = 1998
GROUP BY CustomerID, MONTH(OrderDate)
ORDER BY MONTH(OrderDate);

-- lọc các đơn đặt hàng đã được giao vào tháng 5 và sắp xếp tăng dần theo năm
SELECT * 
FROM Orders
WHERE MONTH(ShippedDate) = 5
ORDER BY YEAR(ShippedDate) ASC;

-- đếm số lượng nhân viên theo City và có năm sinh là 1992
SELECT City,COUNT(*) AS "Số lượng nhân viên sinh năm 1992"
FROM Employees
WHERE YEAR(BirthDate) = 1992
GROUP BY City;

SELECT * FROM Employees;

-- thống kê số lượng hóa đơn trong mỗi năm: hiển thị: Year, CountOfOrders
SELECT YEAR(OrderDate) AS "Year",
		COUNT(OrderID) AS "CountOfOrders"
FROM Orders
GROUP BY YEAR(OrderDate);

-- thống kê số lượng hóa đơn trong mỗi tháng/ năm. Thông tin hiển thị: Year, Month, CountOfOrders
SELECT YEAR(OrderDate) AS "Year",
		MONTH(OrderDate) AS "Month",
		COUNT(OrderID) AS "CountOfOrders"
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY YEAR(OrderDate)

-- thống kê số lượng hóa đơn trong mỗi tháng/năm và ứng với mỗi nhân viên.
SELECT YEAR(OrderDate) AS "Year",
	   MONTH(OrderDate) AS "Month",
	   EmployeeID,
	   COUNT(OrderID) AS "CountOfOrders"
FROM Orders
GROUP BY YEAR(OrderDate),MONTH(OrderDate),EmployeeID;

-- lọc ra các đơn hàng đã được giao vào từ tháng 7, và sắp xếp giảm dần theo năm
SELECT * 
FROM Orders
WHERE MONTH(ShippedDate) = 7
ORDER BY YEAR(ShippedDate) DESC;

-- lấy danh sách các đơn hàng được giao vào ngày 7 tháng 2 năm 1992
SELECT * 
FROM Orders
WHERE ShippedDate = '1992-02-07'

-- lấy ra danh sách nhân viên có tháng sinh 01 và sắp xếp số phone giảm dần
SELECT * 
FROM Employees
WHERE MONTH(BirthDate) = 1 
ORDER BY HomePhone DESC;
SELECT * FROM Orders;

-- liệt ra danh sách số lượng nhân viên có năm sinh vào năm 1963 theo từng quốc gia
SELECT Country, COUNT(*) AS "số nhân viên sinh vào năm 1963"
FROM Employees 
WHERE YEAR(BirthDate) = 1963
GROUP BY Country;

-- lấy ra các Employee có ngày sinh từ năm 1950 đến năm 1960
SELECT *
FROM Employees
WHERE YEAR(BirthDate) BETWEEN 1950 AND 1960

-- lấy ra Order có RequiredDate bé hơn 2 ngày so với ShippedDate
SELECT * 
FROM Orders
WHERE DAY(RequiredDate) = DAY(ShippedDate) - 2

-- tính số lượng nhân viên được thuê vào các (HireDate) và sắp xếp
-- tăng dần theo năm
SELECT YEAR(HireDate) AS "Year",COUNT(*) AS "Số lượng nhân viên"
FROM Employees
GROUP BY YEAR(HireDate)
ORDER BY YEAR(HireDate) DESC;

-- tính số lượng đơn đặt hàng của mỗi khách hàng năm 1997 và sắp xếp theo thứ
-- tự giảm dần số lượng đặt hàng
SELECT CustomerID,COUNT(OrderID) AS "Số lượng đơn đặt"
FROM Orders
WHERE YEAR(OrderDate) = 1997
GROUP BY CustomerID
ORDER BY COUNT(OrderID) DESC;

-- lọc ra danh sách khách hàng yêu cầu giao hàng trong tháng 5 và sắp xếp
-- tên khách hàng từ A - Z
SELECT c.CustomerID,c.CompanyName,o.RequiredDate
FROM Orders AS o
RIGHT JOIN Customers AS c ON o.CustomerID = c.CustomerID
WHERE MONTH(RequiredDate) = 5
GROUP BY c.CustomerID,c.CompanyName,o.RequiredDate
ORDER BY c.CompanyName;

-- tính số lượng đơn hàng yêu cầu giao trong tháng 5
SELECT COUNT(*) 
FROM Orders
WHERE MONTH(RequiredDate) = 5;

-- lọc ra danh sách nhân viên sinh vào tháng 1, sắp xếp tên theo bảng chữ cái
SELECT *
FROM Employees
WHERE MONTH(BirthDate) = 1
ORDER BY LastName;

-- lọc danh sách đơn hàng mà khách hàng muốn được giao vào ngày 22,23,24 của tháng 12
-- sắp xếp tăng theo năm 
SELECT * 
FROM Orders
WHERE DAY(RequiredDate) IN (22,23,24) AND MONTH(RequiredDate) = 12
ORDER BY YEAR(RequiredDate);

-- lấy ra danh sách nhân viên có năm sinh 1950, sắp theo tên a - z
SELECT *
FROM Employees
WHERE YEAR(BirthDate) = 1950
ORDER BY LastName;

-- lấy ra danh sách đơn hàng có ngày yêu cầu (requiredDate) là 17/5/1998
SELECT *
FROM Orders
WHERE RequiredDate = '1998-05-17';







