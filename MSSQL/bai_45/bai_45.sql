-- STORE PROCEDURE

-- Tạo một stored procedure để lấy thông tin về sản phẩm dựa trên
-- tên sản phẩm được cung cấp
CREATE PROCEDURE GetProductByName(
	@ProductName NVARCHAR(100)
)
AS 
BEGIN
	SELECT *
	FROM Products
	WHERE ProductName = @ProductName
END

-- Sử dụng Stored Procedure
EXEC GetProductByName @ProductName = 'Chai';
EXEC GetProductByName @ProductName = 'Chang';
EXEC GetProductByName @ProductName = 'Ikura';

-- tạo một stored procedure để tính tổng doanh số bán hàng
-- của một nhân viên dựa trên EmployeeID
CREATE PROCEDURE GetEmployeeSalesTotal(
	@EmployeeId TINYINT
)
AS 
BEGIN
	SELECT SUM(od.UnitPrice * od.Quantity - (od.UnitPrice * od.Quantity * od.Discount)) AS "TotalSales"
	FROM Orders AS o
	INNER JOIN [Order Details] AS od
	ON o.OrderID = od.OrderID
	WHERE o.EmployeeID = @EmployeeId
END

-- sử dụng
EXEC GetEmployeeSalesTotal @EmployeeId = 1;

-- xóa 1 stored procedure
DROP PROCEDURE GetEmployeeSalesTotal;

-- tạo một stored procedure để thêm mới khách hàng vào
-- bảng Customers
CREATE PROCEDURE AddCustomer(
	@CustomerID CHAR(5),
	@CompanyName NVARCHAR(30),
	@ContactName NVARCHAR(30),
	@ContactTitle NVARCHAR(40)
)
AS
BEGIN
	INSERT INTO Customers(CustomerID,CompanyName,ContactName,ContactTitle)
	VALUES
		(@CustomerID,UPPER(@CompanyName),@ContactName,@ContactTitle)
END

-- sử dụng
EXEC AddCustomer
	@CustomerID='ONLYF',
	@CompanyName='Only Fan',
	@ContactName = 'Lucia Love',
	@ContactTitle = 'HR Manager';

DROP PROCEDURE AddCustomer;

SELECT * FROM Customers;

-- tạo một stored procedure để cập nhật giá của tất
-- cả các sản phẩm thuộc một danh mục cụ thể.
CREATE PROCEDURE IncreasePrice(
	@CategoryID TINYINT,
	@IncreaseUnit SMALLINT
)
AS
BEGIN
	UPDATE Products
	SET UnitPrice = UnitPrice + @IncreaseUnit
	WHERE CategoryID = @CategoryID
END

-- sử dụng stored procedure
EXEC IncreasePrice @CategoryID=9,@IncreaseUnit = 30
SELECT * FROM Products;

-- tạo một stored procedure để cập nhật giá của tất
-- cả các sản phẩm thuộc một danh mục cụ thể.
CREATE PROCEDURE UpdatePrice(
	@ProductID TINYINT,
	@IncreasePrice DECIMAL(10,2)
)
AS
BEGIN
	UPDATE Products
	SET UnitPrice = UnitPrice + @IncreasePrice
	WHERE ProductID = @ProductID
END

EXEC UpdatePrice @ProductID = 79, @IncreasePrice = 8.5;

SELECT * FROM Products;

DROP PROCEDURE UpdatePrice;

-- viết một stored procedure để truy xuất danh sách các hóa đơn đặt hàng cho một khách
-- hàng dựa trên tên khách hàng. Tham số đầu vào là tên khách hàng và Stored Procedure sẽ trả 
-- về danh sách các đơn đặt hàng liên quan
CREATE PROCEDURE GetOrders(
	@CustomerName NVARCHAR(30)
)
AS
BEGIN
	WITH GetCustomerID AS(
		SELECT CustomerID
		FROM Customers
		WHERE CompanyName = @CustomerName
		)
	SELECT * 
	FROM Orders AS o
	INNER JOIN 
	GetCustomerID AS gcId
	ON o.CustomerID = gcId.CustomerID
END

EXEC GetOrders @CustomerName = 'Bon app''';

SELECT * FROM Customers

-- viết một Stored Procedure để cập nhật số lượng hàng tồn kho cho
-- một sản phẩm cụ thể dựa trên ID sản phẩm và số lượng mới. Stored Procedure
-- sẽ nhân vào ID sản phẩm và số lượng mới, sau đó cập nhật số lượng tồn kho
-- trong bảng Products.
CREATE PROCEDURE UpdateStock(
	@ProductID TINYINT,
	@NumberInStock DECIMAL(3,1)
)
AS 
BEGIN 
	UPDATE Products
	SET UnitsInStock = @NumberInStock
	WHERE ProductID = @ProductID
END

EXEC UpdateStock @ProductID = 79, @NumberInStock = 50;

SELECT * FROM Products;

-- Viết một Stored Procedure để truy xuất danh sách các sản phẩm thuộc một
-- danh mục cụ thể và giới hạn số lượng sản phẩm trả về. Tham số đầu vào bao
-- gồm ID danh mục và số lượng sản phẩm cần phải trả về

CREATE PROCEDURE GetNumberOfProducts(
	@CategoryID TINYINT,
	@NumberOfProducts TINYINT
)
AS
BEGIN
	-- giới hạn số dòng trả về
	SET ROWCOUNT @NumberOfProducts	
	SELECT *
	FROM Products
	WHERE CategoryID = @CategoryID 
	
END

EXEC GetNumberOfProducts @CategoryID = 1, @NumberOfProducts = 1

-- Viết một Stored Procedure để truy xuất danh sách khách hàng dựa trên
-- khu vực địa lý (Region) hoặc quốc gia (Country) của họ. Tham số đầu
-- vào sẽ là khu vực địa lý hoặc quốc gia và Stored Procedure sẽ
-- trả về danh sách các khách hàng trong khu vực đó
CREATE PROCEDURE GetCustomersByRegion(
	@Region NCHAR(30),
	@Country NCHAR(30)
)
AS
BEGIN
	SELECT *
	FROM Customers 
	WHERE Region = @Region OR Country = @Country
END

EXEC GetCustomersByRegion @Region = 'BC', @Country = 'USA'
