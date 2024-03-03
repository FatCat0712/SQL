-- UNION / UNION ALL
-- kết hợp các kết quả
-- được sử dụng để kết hợp tập kết quả của 2 hoặc nhiều câu lệnh
-- Một câu bên trong phải có cùng số lượng cột
-- Các cột cũng phải có kiểu dữ liệu tương tự
-- Các cột trong mỗi câu lệnh cũng phải theo cùng thứ tự

-- từ bảng Order Details hãy liệt kê các đơn đặt hàng có UnitPrice
-- nằm trong phạm vi từ 100 đến 200
-- I = 22
SELECT OrderID,
	   UnitPrice
FROM [Order Details]
WHERE UnitPrice BETWEEN 100 AND 200;

-- Đưa ra các đơn hàng có Quantity bằng 10 hoặc 20
-- II = 433
SELECT OrderID
FROM [Order Details]
WHERE Quantity IN (10,20);

-- từ bảng Order Details hãy liệt kê các đơn hàng có UnitPrice
-- nằm trong phạm vi từ 100 đến 200 và đơn hàng phải có Quantity bằng
-- 10 hoặc 20
-- III = I AND II = 7 rows
SELECT OrderID
FROM [Order Details]
WHERE 
	UnitPrice BETWEEN 100 AND 200
AND Quantity IN (10,20);
--> câu lệnh lấy phần chung giữa 2 điều kiện

-- từ bảng Order Details hãy liệt kê các đơn hàng UnitPrice
-- nằm trong phạm vi từ 100 đến 200 hoặc đơn hàng phải có Quantity
-- bằng 10 hoặc 20
-- IV = I OR II = 448
SELECT OrderID
FROM [Order Details]
WHERE 
	UnitPrice BETWEEN 100 AND 200
OR Quantity IN (10,20);
--> kết quả đã được lược bớt kết quả trùng lặp ( vừa thuộc I vừa thuộc II)
-- I OR II = 22 + 433 = 455 -> 455 - 7 = 448

-- từ bảng Order Details, hãy liệt kê các đơn hàng có UnitPrice
-- nằm trong phạm vị từ 100 đến 200 hoặc đơn hàng phải có Quantity
-- bằng 10 hoặc 20, có sử dụng DISTINCT
-- V = IV + DISTINCT = 360
SELECT DISTINCT OrderID
FROM [Order Details]
WHERE 
	UnitPrice BETWEEN 100 AND 200
OR	Quantity IN (10,20);

-- thực hiện lại câu lệnh IV sử dụng UNION
-- IV = I OR II = 360 
SELECT OrderID
FROM [Order Details]
WHERE UnitPrice BETWEEN 100 AND 200
UNION
SELECT OrderID
FROM [Order Details]
WHERE Quantity IN (10,20);

-- sử dụng UNION ALL 
SELECT OrderID
FROM [Order Details]
WHERE UnitPrice BETWEEN 100 AND 200
UNION ALL
SELECT OrderID
FROM [Order Details]
WHERE Quantity IN (10,20);
--> không áp dụng distinct
--> chấp nhận luôn kết quả vừa thuộc I vừa thuộc II

-- liệt kê toàn bộ các thành phố và quốc gia tồn tại trong 2 tables
-- Suppliers và Customers với 2 tình huống sử dụng UNION, UNION ALL
SELECT City,Country
FROM Suppliers
UNION
SELECT City, Country
FROM Customers;

SELECT City,Country
FROM Suppliers
UNION ALL
SELECT City,Country
FROM Customers;

-- Explain this query
SELECT City,Country
FROM Customers
WHERE Country LIKE 'U%'
UNION
SELECT City,Country
FROM Suppliers
WHERE City = 'London'
UNION
SELECT ShipCity,ShipCountry
FROM Orders
WHERE ShipCountry = 'USA';

-- lấy ra các tên City, Country không trùng lặp từ 3 bảng Suppliers, Orders, Customers
-- lấy ra tên thành phố, quốc gia của những khách hàng có quốc gia bắt đầu bằng chữ 'U'
-- lấy ra tên thành phố, quốc gia của những nhà cung cấp mà tên thành phố là 'London'
-- sau đó UNION bảng Customers và Suppliers để loại bỏ thành phần bị trùng trong 2 bảng
-- lấy kết quả thu được UNION với bảng Orders
-- lấy ra tên thành phố, quốc gia mà đơn hàng được giao đến 'USA'
-- sau đó UNION mới thu được với bảng Orders ( vì dữ liệu từ bảng Orders đã DISTINCT nên
-- không cần thao tác lọc trùng)
-- sau đó hợp 2 bảng với nhau, loại bỏ trùng lặp và lấy tên cột của truy vấn đầu tiên


-- Giải lại ví dụ 3 nhưng thay vì tìm Country ta đi tìm City (Bảng Customers , Bảng Suppliers)
SELECT City
FROM Customers
UNION 
SELECT City
FROM Suppliers;

-- liệt kê tất cả các Region từ bảng Orders và Customers, các giá trị không được
-- lặp nhau và không lấy giá trị NULL
SELECT ShipRegion
FROM Orders
WHERE ShipRegion IS NOT NULL
UNION
SELECT Region
FROM Customers
WHERE Region IS NOT NULL;

-- liệt kê những sản phẩm (ProductID và UnitPrice) tồn tại trong 
-- bảng Order Details và Products
-- dùng UNION và UNION ALL
SELECT ProductID,UnitPrice
FROM [Order Details]
UNION
SELECT ProductID,UnitPrice
FROM Products;

SELECT ProductID,UnitPrice
FROM [Order Details]
UNION ALL
SELECT ProductID,UnitPrice
FROM Products;










