SELECT * FROM INFORMATION_SCHEMA.TABLES;

SELECT COUNT(*) 
FROM Sales.SalesOrderDetail;

-- Bật hiển thị thống kê tài nguyên I/O
SET STATISTICS IO ON;

-- câu truy vấn
SELECT *
FROM Sales.SalesOrderDetail
WHERE CarrierTrackingNumber = '1B2B-492F-A9';

-- Tắt thống kê I/O
SET STATISTICS IO OFF;

-- logical reads : số lần so sánh để lấy thông tin
-- logical reads trước khi đánh index: 1238
-- Tạo Index cho CarrierTrackingNumber
CREATE INDEX idx_CarrierTrackingNumber
ON Sales.SalesOrderDetail (CarrierTrackingNumber);

-- logical reads sau khi đánh index: 69
-- tốc độ đã tăng 1238 / 69 : 17 lần


--Exercise
-- Tạo index trên bảng Person.Address, cột AddressLine1 và 
-- đánh giá hiệu suất truy vấn
-- 1439 Brock Lane

SET STATISTICS IO ON;
SELECT *
FROM Person.Address
WHERE AddressLine1 = '1439 Brock Lane';
SET STATISTICS IO OFF;

-- logical reads : 5

-- tạo index cho cột AddressLine1
CREATE INDEX idx_AddressLine1
ON Person.Address (AddressLine1);

--drop index
DROP INDEX idx_AddressLine1 ON Person.Address;



SET STATISTICS IO ON;
SELECT *
FROM Person.Address
WHERE AddressLine1 = '48995 Evergreen Wy.';
SET STATISTICS IO OFF;
-- logical reads: 5 => không thay đổi nhiều

-- tạo index cho cột "ProductName" trong bảng "Production.Product"
-- và đánh giá hiệu suất truy vấn

-- LL Crankset
SET STATISTICS IO ON;
SELECT * 
FROM Production.Product
WHERE Name = 'LL Crankset';
SET STATISTICS IO OFF;


