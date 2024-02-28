-- Mệnh đề WHERE trong SQl
-- được sử dụng để chỉ trích xuất những bảng ghi đáp ứng một điều kiện cụ thể
-- = : equal
-- > : greater than
-- < : less than
-- >= : greater than or equal
-- <= : less than or equal
-- <> : Khác

-- liệt kê tất cả các nhân viên đến từ thành phố London
SELECT * FROM Employees WHERE City = 'London';

-- liệt kê tất cả các nhân viên đến từ thành phố London và sắp xếp theo cột LastName A-Z
SELECT * FROM Employees WHERE City = 'London' ORDER BY LastName;

-- liệt kê các đơn hàng bị giao muộn
SELECT * FROM Orders WHERE ShippedDate > RequiredDate;

-- tính số lượng các đơn hàng bị giao muộn
SELECT COUNT(*) AS "Số đơn hàng giao muộn" FROM Orders WHERE ShippedDate > RequiredDate;

-- lấy ra tất cả các đơn hàng chi tiết được giảm giá nhiều hơn 10%
SELECT * FROM [Order Details] WHERE Discount > 0.1;

-- liệt kê tất cả các đơn hàng được gửi đến quốc gia là "France"
SELECT * FROM Orders WHERE ShipCountry = 'France';

-- liệt kê các sản phẩm có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
SELECT * FROM Products WHERE UnitsInStock > 20;

-- liệt kê các sản phẩm có giá bán lớn hơn hoặc bằng 2 lần sản phẩm có giá
-- bán nhỏ nhất. Sau đó sắp xếp theo thứ tự tăng dần
SELECT ProductName,UnitPrice FROM Products 
WHERE UnitPrice >= 2 * ( SELECT MIN(UnitPrice) FROM Products)
ORDER BY UnitPrice;

-- liệt kê tất các khách hàng có địa chỉ ở London và được sắp xếp tăng dần
-- theo mã khách hàng (CustomerID)
SELECT * FROM Customers WHERE Country = 'London' ORDER BY CustomerID;

-- lấy 10 dòng đầu tất cả các sản phẩm có số lượng sản phẩm tồn kho lớn hơn 10
SELECT TOP 10 * FROM Products WHERE (UnitsInStock - UnitsOnOrder) > 1 ;

-- liệt kê tất cả sản phẩm có số lượng sản  phẩm  trong  kho  nhỏ  hơn số lượng sản phẩm đang được đặt hàng và 
-- được sắp xếp  theo  ProductName  tăng dần từ A-Z
SELECT * FROM Products WHERE UnitsInStock < UnitsOnOrder ORDER BY ProductName;

-- liệt kê các customers có postalcode nhỏ nhất
SELECT * FROM Customers WHERE PostalCode = (SELECT MIN(PostalCode) FROM Customers);

-- liệt kê các sản phẩm có unitprice <100
SELECT * FROM Products WHERE UnitPrice < 100;

-- Tính tổng số lượng tồn kho mà UnitsInStocks lớn hơn 20
SELECT SUM(UnitsInStock - UnitsOnOrder) AS "Tổng số lượng tồn kho" FROM Products WHERE UnitsInStock > 20;

-- Tính Trung bình Freight của những đơn hàng Giao tới France
SELECT AVG(Freight) AS "Số tiền vận chuyển trung bình" FROM Orders WHERE ShipCountry='France';

--  Liệt kê những nhân viên cùng Title = Sales Representative , City = London ,cùng Country = UK
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND City = 'London' AND Country = 'UK';


