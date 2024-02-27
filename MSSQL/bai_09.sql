-- COUNT, SUM và AVG
-- COUNT: đếm số lượng dữ liệu ( khác NULL) trong một cột.
-- SUM: tính tổng giá trị của một cột (nếu bất kỳ giá trị trong 
-- cột là NULL thì sẽ bị bỏ qua)
-- AVG: tính giá trị trung bình cho một cột.
-- Nếu tất cả giá trị trong cột là NULL, kết quả của hàm AVG sẽ là NULL
-- Nếu chỉ một vài giá trị là NULL, AVG sẽ bỏ qua các giá trị NULL
-- và tính trung bình cho các giá trị khác

-- Hãy đếm số lượng khách hàng có trong bảng Customers
SELECT COUNT(*) AS "Số lượng khách hàng" FROM Customers;

-- Tính tổng số tiền vận chuyển (Freight) của tất cả các đơn đặt hàng
SELECT SUM(Freight) AS "Tổng số tiền vận chuyển" FROM Orders;

-- Tính trung bình số lượng đặt hàng (Quantity) của tất cả các sản phẩm
-- trong bảng [Order Details]
SELECT AVG(Quantity) AS "Trung bình số lượng đặt hàng" FROM [Order Details];

-- Đếm số lượng, tính tổng số lượng hàng tồn kho, tổng số lượng hàng trong kho và trung bình giá của 
-- các sản phẩm có trong bảng Product
SELECT COUNT(*) AS "Số lượng",
		SUM(UNitsInStock - UnitsOnOrder) AS "Tổng số lượng hàng tồn kho",
		SUM(UnitsInStock) AS "Tổng số lượng hàng trong kho",
		AVG(UnitPrice) AS "Trung bình giá"
		FROM Products;

-- Đếm số lượng đơn hàng từ bảng (Orders) với 2 cách:
-- Cách 1: dùng dấu *
-- Cách 2: dùng mã đơn hàng
SELECT COUNT(*) AS "Số lượng đơn hàng" FROM Orders;
SELECT COUNT(OrderID) AS "Số lượng đơn hàng" FROM Orders;

-- Từ bảng [Order Details] hãy tính trung bình cho cột UnitPrice, và tính
-- tổng cho cột Quantity
SELECT AVG(UnitPrice) AS "Giá trung bình",
	SUM(Quantity) AS "Tổng số lượng"
	FROM "Order Details";

-- Tính số lượng CategoryID của bảng Categories
SELECT COUNT(CategoryID) AS "Số lượng mã danh mục"FROM Categories;

-- tính tổng số ReorderLevel của bảng Products
SELECT SUM(ReorderLevel) AS "Sum_Reorderlevel" FROM Products;

-- cho biết có bao nhiêu nhà cung cấp
SELECT COUNT(SupplierID) AS "Số lượng nhà cung cấp" FROM Suppliers;

-- tính số lượng địa chỉ ở bảng Customers
SELECT COUNT(Address) AS "Số lượng địa chỉ" FROM Customers;

-- tổng số tiền của các đơn hàng trong bảng Order Details
SELECT SUM(UnitPrice) AS "Tổng số tiền các đơn hàng" FROM [Order Details];

-- đếm số lượng người giao hàng từ bảng Shippers theo 2 cách
SELECT COUNT(*) AS "Số lượng người giao hàng" FROM Shippers;
SELECT COUNT(ShipperID) AS "Số lượng người giao hàng" FROM Shippers;

-- tổng số đơn đặt hàng trong bảng Products
SELECT SUM(UnitsOnOrder) AS "Tổng số đơn đặt hàng" FROM Products;

-- tính trung bình số tiền vận chuyển (Freight) của các đơn hàng trong bảng Orders
SELECT AVG(Freight) AS "Số tiền vận chuyển trung bình" FROM Orders;

-- tính trung bình UnitPrice và tính tổng Quantity từ bảng OrderDetails
SELECT AVG(UnitPrice) AS "AVG_UnitPrice",
SUM(Quantity) AS "SUM_Quantity" FROM [Order Details];

-- Đếm các Region khác nhau từ bảng Customers
SELECT COUNT(DISTINCT(Region)) AS "Số lượng vùng" FROM Customers;

-- tính tổng các CategoryID và tổng Các CatergoryID khác nhau từ bảng Products
SELECT SUM(CategoryID) AS "Tổng CategoryID", 
	   SUM(DISTINCT(CategoryID)) AS "Tổng CategoryID khác nhau"  FROM Products;

-- tính tổng mã số EmployeeID 
SELECT SUM(EmployeeID) AS "Tổng mã số Employee" FROM Employees;

-- Đếm có bao nhiêu thành phố của nhà cung cấp và tổng số lượng nhà cung cấp trên thị trường là bao nhiêu
SELECT COUNT(Distinct City) AS "Số lượng thành phố" FROM Suppliers;

-- hãy cho biết tổng số đơn hàng và ngày order gần nhất
SELECT COUNT(*) AS "Tổng số đơn hàng", 
		MAX(OrderDate) AS "Ngày order gần nhất"
		FROM Orders;

-- cho biết có bao nhiêu loại sản phẩm, trung bình số lượng mỗi đơn order
-- tổng giá bán trong bảng Products
SELECT COUNT(ProductID) AS "Số lượng loại sản phẩm",
		AVG(UnitsOnOrder) AS "Trung bình số lượng mỗi Order",
		SUM(UnitPrice) AS "Tổng giá bán"
		FROM Products;

-- cho biết bao nhiêu đơn hàng đã được order(UnitsOnOrder), tổng giá bán(UnitPrice) 
-- và giá trị trung bình mỗi đơn (UnitPrice) trong bảng Products
SELECT COUNT(UnitsOnOrder),
		SUM(UnitPrice), 
		AVG(UnitPrice) FROM Products;