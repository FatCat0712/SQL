-- DELETE 
-- Xóa dữ liệu trong bảng
-- Cú pháp
-- DELETE FROM table_name WHERE condition;
-- Nếu không có mệnh đề WHERE thì DELETE sẽ xóa
-- toàn bộ bảng
SELECT *
INTO Customers_1
FROM Customers;

SELECT * FROM Customers_1;

-- Xóa đi khách hàng có có ID 'ALFKI'
DELETE FROM Customers_1
WHERE CustomerID = 'ALFKI';

-- Xóa đi toàn bộ khách hàng có quốc gia bắt đầu bằng U
DELETE FROM Customers_1
WHERE Country LIKE 'U%';

SELECT DISTINCT Country
FROM Customers_1

-- Xóa sạch dữ liệu 1 bảng
DELETE FROM Customers_1

-- Exercise
-- Xóa đơn đặt hàng có OrderID là 10248
SELECT *
INTO Orders_1
FROM Orders;

DELETE 
FROM Orders_1
WHERE OrderID = '10248';

DROP TABLE Orders_1;

-- Xóa tất cả sản phẩm từ bảng Products có số lượng tồn kho bằng 0
SELECT *
INTO Products_1
FROM Products;


DELETE 
FROM Products_1
WHERE UnitsInStock = 0;

SELECT * FROM Products_1;

DROP TABLE Products_1;

-- xóa tất cả đơn hàng và chi tiết đặt hàng liên quan đến
-- một khách hàng cụ thể dựa trên CustomerID
SELECT *
INTO Orders_1
FROM Orders;

SELECT *
INTO OrderDetails_1
FROM [Order Details];

SELECT * FROM Customers_1;

DELETE 
FROM 
Orders_1
WHERE CustomerID LIKE 'QUEEN';

DELETE 
FROM
OrderDetails_1
WHERE OrderID = '10406';

ALTER TABLE OrderDetails_1
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID) REFERENCES Orders_1(OrderID)
ON DELETE CASCADE
-- khi xóa giá trị trong cột PK thì giá trị trong cột FK tương ứng sẽ tự động xóa

ALTER TABLE Orders_1
DROP CONSTRAINT FK_OrderDetails_Orders

ALTER TABLE Orders_1
ADD PRIMARY KEY(OrderID)

SELECT * FROM OrderDetails_1;

SELECT * FROM Orders_1;

SELECT * FROM Orders_1
WHERE CustomerID = 'QUEEN';

DELETE FROM Orders_1
WHERE CustomerID LIKE 'Queen';

DROP TABLE Orders_1;
DROP TABLE OrderDetails_1;







