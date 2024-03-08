-- Trigger trong SQL
USE NORTHWND;
-- Trigger khi insert sẽ chuyển productName về viết hoa toàn bộ
CREATE TRIGGER MakeProductNameUppercase
ON Products
AFTER INSERT
AS 
BEGIN
	-- hiện số dòng bị ảnh hưởng
	SET NOCOUNT ON;
	UPDATE Products
	SET ProductName = UPPER(i.ProductName)
	-- lấy từ dòng vừa thêm vào
	FROM inserted i
	WHERE Products.ProductID = i.ProductID;
END;

INSERT INTO Products(ProductName)
VALUES 
	('waygu');

SELECT * FROM Products;

-- tạo trigger ngăn không cho cập nhật điểm trung bình của sinh viên < 0
CREATE TRIGGER PrevenAvarageScoreNegative
ON SinhVien
FOR UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	-- nếu tồn tại dòng dữ liệu có giá trị DiemTrungBinh < 0
	IF EXISTS (SELECT 1 FROM inserted WHERE inserted.DiemTrungBinh < 0)
	BEGIN
		-- quay trở lại trạng thái trước khi có thay đổi
		ROLLBACK
		-- hiển thị ra lỗi
		RAISERROR('Average Score cannot be negative',16,1);
	END
END;

SELECT * FROM SinhVien;
UPDATE SinhVien
SET DiemTrungBinh = 4
WHERE MaSinhVien = 1;

-- viết 1 trigger đảm bảo mỗi khi có một chi tiết đơn hàng mới được thêm vào
-- số lượng tồn kho, phải giảm đi
CREATE TRIGGER DecreaseInStocks
ON "Order Details"
AFTER INSERT
AS 
BEGIN
	UPDATE Products
	SET UnitsInStock = UnitsInStock - i.Quantity
	FROM inserted i
	WHERE Products.ProductID = i.ProductID
END

INSERT INTO [Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES (10248,1,10,10,0)

SELECT * FROM [Order Details]
SELECT * FROM Products;

-- Bổ sung thêm cột LastModified và tạo một trigger để sau khi một sản
-- phẩm được thêm hoặc cập nhật vào bảng "Products" tự động cập nhật
-- trường "LastModified" với ngày và giờ hiện tại
ALTER TABLE Products
ADD LastModified DATETIME;

CREATE TRIGGER UpdateLastModified
ON Products
AFTER UPDATE
AS
BEGIN 
	UPDATE Products
	SET LastModified = GETDATE()
	FROM inserted i
	WHERE Products.ProductID = i.ProductID
END

UPDATE Products
SET SupplierID = 3, CategoryID = 6,QuantityPerUnit = '1kg',UnitPrice = 50,UnitsInStock = 70
WHERE ProductID = 80

SELECT * FROM Products;

-- tạo một trigger "INSTEAD OF DELETE" để kiểm tra xem khách hàng
-- có đơn hàng (Orders) không. Nếu có, trigger không cho phép
-- xóa khách hàng. Nếu không có đơn hàng liên quan, trigger thực hiện xóa
-- khách hàng
CREATE TRIGGER InsteadOfDelete
ON Customers
FOR DELETE
AS
BEGIN
	IF EXISTS(SELECT CustomerID FROM deleted WHERE deleted.CustomerID IN (SELECT DISTINCT CustomerID FROM Orders))
		BEGIN
		ROLLBACK
		RAISERROR('Cannot delete this customer. Because they are having Orders',16,1)
		END
	ELSE
		BEGIN
		DELETE 
		FROM Customers
		WHERE Customers.CustomerID = (SELECT CustomerID FROM inserted)
		END
END

DELETE FROM Customers
WHERE CustomerID = 'KH124'
DROP TRIGGER InsteadOfDelete

SELECT * FROM Customers;


SELECT * FROM Orders

SELECT CustomerID
FROM Customers
WHERE CustomerID NOT IN (SELECT DISTINCT CustomerID FROM Orders)

-- Tạo một trigger trong CSDL Northwind để kiểm tra và 
-- không cho phép đặt hàng (Order) với số lượng sản phẩm 
-- lớn hơn số lượng tồn kho
CREATE TRIGGER PreventOrderingHigherInStock
ON "Order Details"
FOR INSERT
AS
BEGIN
	  SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Inserted i 
        INNER JOIN dbo.[Order Details] od ON od.OrderID = i.OrderID
        INNER JOIN dbo.Products p ON p.ProductID = od.ProductID
        WHERE p.UnitsInStock < od.Quantity
    )
    BEGIN
        ROLLBACK;
        RAISERROR(N'Số lượng đặt hàng lớn hơn số lượng trong kho.', 16, 1);
    END
END

INSERT INTO [Order Details](OrderID,ProductID,UnitPrice,Quantity,Discount)
VALUES(11079,78,45.50,30,0)


