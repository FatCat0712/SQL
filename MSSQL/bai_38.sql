-- INSERT INTO trong SQL
-- Cú pháp
-- thêm dữ liệu cho những cột cụ thể
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ... );

-- thêm dữ liệu cho toàn bộ cột trong bảng
-- INSERT INTO table_name
-- VALUES (value1, value2, value3, ... );

-- thêm một khách hàng mới
INSERT INTO Customers(CustomerID,CompanyName,ContactName,Phone)
VALUES ('KH123','TITV.VN','Le Nhat Tung','0123456789');

-- thêm một khách hàng mới đầy đủ các cột
INSERT INTO Customers
VALUES
	('KH456','Bosch','Mai Son Hai','0123456789','-',null,null,null,null,null,null)
	;

-- thêm một khách hàng mới cùng lúc
INSERT INTO Customers
VALUES
	('KH124','Bosch','Mai Son Hai','0123456789','-',null,null,null,null,null,null),
	('KH125','FPT','Mai Son Hai','0123456789','-',null,null,null,null,null,null),
	('KH126','Viettel','Mai Son Hai','0123456789','-',null,null,null,null,null,null),
	('KH127','Shinhan Finance','Mai Son Hai','0123456789','-',null,null,null,null,null,null)
	;
SELECT * FROM Customers

-- nên insert into dữ liệu vào database 1 lần với nhiều dữ liệu
-- vì mỗi lần gọi lệnh insert dữ liệu sẽ phải ghi vào ổ cứng nên rất mất thời gian, 
-- tài nguyên

-- Thêm một sản phảm mới vào bảng Products
INSERT INTO Products(ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock)
VALUES('Aquafina',1,2,'24 bottles',10.99,100);

SELECT * FROM Products;

-- thêm một đơn hàng mới vào bảng Orders
INSERT INTO Orders(CustomerID,EmployeeID,OrderDate,ShipVia)
VALUES ('ALFKI',3,'2023-10-25',2);

-- chèn nhiều khách hàng vào bảng Customers bằng cách sử dụng câu lệnh INSERT INTO
-- và giá trị VALUES
INSERT INTO Customers(CustomerID,ContactName,CompanyName,City,Country)
VALUES
	('CUST1','Alice Johnson','Johnson Inc','New York','USA'),
	('CUST2','Bob Smith','Smith Corp','Los Angeles','USA'),
	('CUST3','Charie Brown','Brown Ltd.','London','UK');

-- Viết một câu lệnh INSERT INTO để thêm nhà cung cấp sau vào bảng Suppliers
INSERT INTO Suppliers(
	CompanyName,
	ContactName,
	ContactTitle,
	Address,
	City,
	Region,
	PostalCode,
	Country,
	Phone,
	Fax,
	HomePage)
VALUES(
	'Microsoft',
	'John Smith',
	'Sales Manager',
	'123 Wall Street',
	'New York',
	'NY',
	'10001',
	'USA',
	'555-555-5555',
	'555-555-5556',
	'http://www.newsupplier.com'
);

SELECT * FROM Suppliers;

-- Hãy viết một câu lệnh INSERT INTO để thêm đơn hàng sau:
-- CustomerID: chọn một mã khách hàng hiện có trong bảng Customers
-- EmployeeID: chọn một mã nhân viên hiện có trong bảng Employees
-- OrderDate: Sử dụng ngày hiện tại
-- ShipVia: chọn một mã Shipper hiện có trong bảng Shippers
INSERT INTO Orders(CustomerID,EmployeeID,OrderDate,ShipVia)
VALUES('TITV',3,GETDATE(),3);
