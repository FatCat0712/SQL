-- Update cập nhật dữ liệu trong bảng
-- không cập nhật được PK
-- Cú pháp
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition
-- không có mệnh đề WHERE thì toàn bộ dữ liệu của
-- bảng sẽ được cập nhật

SELECT * FROM Customers_1;

-- cập nhật địa chỉ của khách hàng có mã là KH123
UPDATE Customers_1
SET ContactTitle = 'Finance Manager',Address = '51 Fremont Court Mcminnville'
WHERE CustomerID = 'KH123';

-- tăng toàn bộ giá của bảng Product lên 10% <=> UnitPrice * ((100 + 10)/100)

UPDATE Products
SET UnitPrice = UnitPrice * 1.1; 

-- cập nhật thêm thông tin cho sản phẩm Mi hao hao
UPDATE Products
SET SupplierID = 3, 
	CategoryID = 9,
	QuantityPerUnit = '10 boxes',
	UnitPrice = 15.50,
	UnitsInStock = 36,
	UnitsOnOrder = 20,
	ReorderLevel = 10
WHERE ProductName = 'Mi hao hao'

SELECT * FROM Products;

SELECT * FROM Customers_1;



