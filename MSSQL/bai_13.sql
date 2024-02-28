-- AND, OR và NOT
-- AND: hiển thị một bản ghi nếu tất cả các điều kiện được phân tách bằng AND đều có giá trị TRUE
-- OR: hiển thị một bản ghi nếu có ít nhất 1 điều kiện được phân tách bằng OR có giá trị TRUE
-- NOT: hiển thị một bản ghi nếu điều kiện có giá trị không đúng

-- liệt kê tất cả các sản phẩm có số lượng trong kho(UnitsInStock) thuộc khoảng nhỏ hơn 
-- 50 hoặc lớn hơn 100
SELECT * FROM Products WHERE UnitsInStock < 50 OR UnitsInStock > 100;

-- liệt kê tất cả các đơn hàng được giao đến Brazil đã bị giao muộn
SELECT * FROM Orders WHERE ShipCountry = 'Brazil' AND ShippedDate > RequiredDate;

-- lấy ra tất cả sản phẩm có giá dưới 100$ và mã thể loại khác 1
-- sử dụng NOT
SELECT * FROM Products WHERE NOT (UnitPrice >= 100 OR CategoryID = 1);

-- liệt kê tất cả các đơn hàng có giá vận chuyển Freight trong [50,100] đô la
SELECT * FROM Orders WHERE Freight >= 50 AND Freight <= 100;

-- liệt kê các sản phẩm có số lượng hàng trong kho lớn hơn 20 và số lượng hàng trong đơn hàng
-- nhỏ hơn 20
SELECT * FROM Products WHERE UnitsInStock > 20 AND UnitsOnOrder < 20;

-- liệt kê tất cả đơn hàng có mã đơn hàng khác 1
SELECT * FROM Orders WHERE NOT OrderID = 1;

-- tìm ra nhân viên không phải ở USA và chỉ lấy 5 khác hàng đầu tiên, sắp xếp theo thứ tự [Lastname] A-Z và tạo ra cột full name
SELECT TOP 5 LastName,FirstName,LastName+' '+FirstName AS "FullName" FROM Employees WHERE NOT Country = 'USA' ORDER BY LastName;

-- liệt kê các quốc gia của nhân viên không phải là Pháp
SELECT DISTINCT Country FROM Employees WHERE NOT Country = 'France';

-- liệt kê các mã bưu chính (PostalCode) là 41101 hoặc 44000
SELECT * FROM Customers WHERE PostalCode = '41101' OR PostalCode = '44000';

-- liệt kê tất cả hàng hóa có giá lớn 50 và được giả giá lớn hơn 10 % trong bảng oder details
SELECT ProductName, p.UnitPrice, od.Discount
FROM Products AS p
INNER JOIN [Order Details] AS od
ON p.ProductID = od.ProductID
WHERE p.UnitPrice > 50 AND od.Discount > 0.1;

-- liệt kê tất cả nhân viên nữ ở "London"
SELECT * FROM Employees WHERE (TitleOfCourtesy='Ms.' OR TitleOfCourtesy='Mrs.') AND City='London';

-- liệt kê những nhân viên không ở USA
SELECT * FROM Employees WHERE NOT Country='USA';

-- liệt kê những sản phẩm có mã khác 1 và có giá trên 100 dollar
SELECT * FROM Products WHERE NOT (ProductID = 1 OR UnitPrice <= 100);

-- liệt kê những sản phẩm có tồn kho lớn hơn 5, hàng trong kho lớn hơn 15 và còn sản xuất
SELECT *, (UnitsInStock - UnitsOnOrder) AS "Hàng tồn kho" 
FROM Products
WHERE (UnitsInStock - UnitsOnOrder) > 5
		AND UnitsInStock > 15 
		AND Discontinued <> 1;