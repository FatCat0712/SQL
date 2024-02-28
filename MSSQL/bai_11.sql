-- +,-,*,/,% trong SQL

-- Tính số lượng sản phẩm còn lại trong kho (UnitsInStock) sau khi
-- bán hết các sản phẩm đã được đặt hàng (UnitsOnOrder)
SELECT ProductName,
		UnitsInStock AS "Số lượng hàng đang có",
		UnitsOnOrder AS "Số lượng hàng được đặt",
		(UnitsInStock - UnitsOnOrder) AS "StockRemaining" FROM Products;

-- Tìm giá trị đơn hàng chi tiết cho tất cả các sản phẩm trong bảng Order Details
SELECT *,(UnitPrice * Quantity) AS "Giá trị đơn hàng" FROM [Order Details];

-- Tính tỷ lệ giá vận chuyển đơn đặt hàng trung bình của các đơn hàng trong bảng Order
-- so với giá trị vận chuyển của đơn hàng lớn nhất
SELECT (AVG(Freight)/MAX(Freight)) AS "Tỷ lệ giá vận chuyển" FROM Orders;

-- Liệt kê danh sách các sản phẩm, và giá(Unit Price) của từng sản phẩm sẽ được giảm 10%
-- Cách 1: dùng phép nhân + phép chia
-- Cách 2: chỉ được dùng phép nhân
SELECT ProductName,UnitPrice AS "Giá gốc",(UnitPrice - (UnitPrice * 10 / 100)) AS "Giá đã giảm 10%" FROM Products;
SELECT ProductName,UnitPrice AS "Giá gốc",(UnitPrice - (UnitPrice * 0.1)) AS "Giá đã giảm 10%" FROM Products;

-- tạo ra mã đơn hàng mới bằng cách lấy mã cũ - 10000 trong bảng Orders
SELECT OrderID AS "Mã cũ", (OrderID - 10000) AS "Mã mới" FROM Orders;

-- Viết câu lệnh gộp lại học và tên của nhân viên
SELECT LastName, FirstName, (LastName + ' ' + FirstName) AS "Họ tên" FROM Employees;

-- liệt kê đơn hàng của Order Details và giá của từng sản phẩm giảm 30%
SELEcT OrderID,
	  ProductID,
	  UnitPrice,
	  Quantity,
	  (UnitPrice * Quantity) AS "Giá gốc",
	  (UnitPrice * Quantity * 70 /100) AS "Giá đã giảm 30%"
	  FROM [Order Details];

-- tính giá tiền các đơn đặt hàng, sau đó lấy ra 5 sản phẩm có giá trị đặt hàng cao nhất
SELECT TOP 5 *, (UnitsOnOrder * UnitPrice) AS "Giá trị đặt hàng"  FROM Products ORDER BY "Giá trị đặt hàng" DESC ;

-- tính tổng giá trị các đơn hàng đã đặt và sắp xếp theo chiều giảm dần
SELECT (UnitPrice * Quantity) AS "Tổng giá trị đơn hàng" FROM [Order Details] ORDER BY "Tổng giá trị đơn hàng" DESC;
