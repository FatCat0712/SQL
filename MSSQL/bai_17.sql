-- IN 
-- Có ý nghĩa tương tự như OR
-- Cho phép kiểm tra với nhiều giá trị cùng lúc
-- trả về dữ liệu ứng với một trong những giá trị được cho
-- NOT IN
-- Giá trị của column khác với các giá trị đã được chỉ định

-- lọc ra tất cả đơn hàng với điều kiện
-- Đơn hàng được giao đến Germany, UK, Brazil
SELECT * FROM Orders WHERE ShipCountry IN ('Germany','UK','Brazil');

-- Đơn hàng được giao đến các quốc gia khác Germany, UK,Brazil
SELECT * FROM Orders WHERE ShipCountry NOT IN ('Germany','UK','Brazil');

-- Lấy ra các sản phẩm có mã thể loại khác với 2,3,4
SELECT * FROM Products WHERE CategoryID NOT IN(2,3,4);

-- liệt kê các nhân viên không phải là nữ từ bảng nhân viên
SELECT * FROM Employees WHERE TitleOfCourtesy NOT IN ('Mrs.','Ms.');

-- liệt kê các nhân viên nữ từ bảng nhân viên
SELECT * FROM Employees WHERE TitleOfCourtesy IN ('Mrs.','Ms.');

-- lấy ra các tất cả khách hàng đến từ các thành phố Berlin, London,Warszawa
SELECT * FROM Customers WHERE City IN ('Berlin','London','Warszawa');

-- liệt kê  DS các đơn hàng được vận chuyển trong khoảng thời gian từ 
-- 1996-07-07 đến 1996-07-31 và được vận chuyển bằng tàu thủy
SELECT * FROM Orders WHERE ShippedDate BETWEEN '1996-07-07' AND '1996-07-31'
AND ShipVia = 3;

-- liệt kê danh sách các đơn hàng  được vận chuyển đến các thành phố Genève, Lyon, Oulu
SELECT * FROM Orders WHERE ShipCity IN ('Genève','Lyon','Oulu');

-- liệt kê tất cả các sản phẩm có đơn giá là 10,50,100
SELECT * FROM Products WHERE UnitPrice IN (10,50,100);

-- liệt kê các đơn hàng không gửi đến thành phố Berlin,London
SELECT * FROM Orders WHERE ShipCity NOT IN ('Berlin','London','Warszawa');

-- liệt kê các đơn hàng có ShipVia là 3,4 
SELECT * FROM Orders WHERE ShipVia IN (3,4);

-- liệt kê toàn bộ khách hàng không ở thành phố Berlin, London và Madrid
SELECT * FROM Customers WHERE City NOT IN ('Berlin','London','Madrid');

-- Từ bảng nhà cung cấp, lấy ra các tiêu đề liên lạc(ContactTitle) mà cấp bậc là quản lý(Manager) 
-- & sắp xếp theo thứ tự  a-z
SELECT ContactTitle FROM Suppliers 
WHERE ContactTitle LIKE '%Manager%'
ORDER BY ContactTitle;

-- Từ bảng chi tiết hóa đơn, lấy ra tất cả thông tin về những đơn hàng được giảm giá 
-- & sắp xếp giá tiền theo thứ tự từ đắt nhất đến rẻ nhất  
SELECT * FROM [Order Details] WHERE Discount <> 0 ORDER BY UnitPrice;

-- lấy ra tất cả những sản phẩm có mã nhà cung cấp có giá trị từ 1 đến 5
SELECT * FROM Products WHERE SupplierID LIKE '[1-5]';

-- lấy ra những nhân viên đến từ quốc gia Hoa Kỳ
SELECT * FROM Employees WHERE Country = 'USA';

-- lấy ra tên của nhân viên có họ là Leverling, Peacock, Suyama
SELECT LastName FROM Employees WHERE LastName IN ('Leverling','Peacock','Suyama');

-- lấy ra quốc gia của khách hàng là Mexico, UK, Brazil
SELECT * FROM Customers WHERE Country IN ('Mexico','UK','Brazil');

-- lấy ra những khách hàng không đến từ Germany,Poland
SELECT * FROM Customers WHERE Country NOT IN ('Germany','Poland');

SELECT * FROM Employees;