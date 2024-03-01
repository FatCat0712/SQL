-- IS NULL và IS NOT NULL trong SQL
-- NULL khác với giá trị rỗng
-- giá trị rỗng : có giá trị nhưng không có ký tự ở giữa
-- NULL : không tồn tại

SELECT * FROM Orders WHERE ShippedDate IS NULL;

-- lấy danh sách các khách hàng có khu vực (Region) không bị NULL
SELECT * FROM Customers WHERE Region IS NOT NULL;

-- lấy danh sách khách hàng không có tên công ty (CompanyName)
SELECT * FROM Customers WHERE CompanyName IS NULL;

-- lấy ra tất cả các đơn hàng chưa được giao hàng và có khu vực giao hàng (ShipRegion)
-- không bị NULL
SELECT * FROM Orders WHERE ShippedDate IS NULL AND ShipRegion IS NOT NULL;

-- lấy ra tên loại không bị trống từ bảng thể loại
SELECT CategoryName FROM Categories WHERE CategoryName IS NOT NULL;

-- lấy ra tất cả những nhân viên không có phần báo cáo
SELECT * FROM Employees WHERE ReportsTo IS NULL;

-- Liệt kê tất cả các đơn hàng có ShipName không bị null
SELECT * FROM Orders WHERE ShipName IS NOT NULL;

-- Đếm số lượng các khách hàng có Phone bị NULL
SELECT COUNT(*) AS "Số khách hàng chưa lưu phone" FROM Customers WHERE Phone IS NULL;

-- lấy ra thông tin liên hệ nhà cung cấp (ContactName) không bị Null. Từ bảng Suppliers
SELECT ContactName FROM Suppliers WHERE ContactName IS NOT NULL;

-- lấy ra các đơn hàng không được giao đến thành phố
SELECT * FROM Orders WHERE ShipCity IS NULL;

-- lấy ra sản phẩm có tên và có ở trong kho
SELECT * FROM Products WHERE ProductName IS NOT NULL AND UnitsInStock IS NOT NULL;

-- lấy ra nhân viên không đăng ký sinh nhật
SELECT * FROM Employees WHERE BirthDate IS NULL;

-- lấy ra tất cả nhân viên có PostalCode là not null
SELECT * FROM Employees WHERE PostalCode IS NOT NULL;

-- lấy ra 5 người đầu tiên có ngày sinh là null
SELECT TOP 5 * FROM Employees WHERE BirthDate IS NULL;

-- Lấy ra các nhân viên có Region không phải là NULL
SELECT * FROM Employees WHERE Region IS NOT NULL;

-- lấy ra toàn bộ danh sách nhân viên là nữ và Region không bị Null
SELECT * FROM Employees WHERE TitleOfCourtesy NOT IN ('Mr.','Dr.') AND Region IS NOT NULL;

-- lấy danh sách các khách hàng có số fax bị NULL
SELECT * FROM Customers WHERE Fax IS NULL;

-- Liệt kê danh sách nhân viên có Region != NULL và ReportTo = NULL
SELECT * FROM Employees WHERE Region IS NOT NULL AND ReportsTo IS NULL;

-- Đếm số lượng Suppliers với điều kiện Fax, HomePage đều NULL và có Region khác NULL
SELECT * FROM Suppliers WHERE Fax IS NULL AND HomePage IS NULL AND Region IS NOT NULL;

--  lấy ra danh sách tất cả các khách hàng có mã bưu điện != NULL và không có số Fax 
SELECT * FROM Customers WHERE PostalCode IS NOT NULL AND Fax IS NULL;

-- Có bao nhiêu nhà cung cấp có trang chủ (HomePage)
SELECT COUNT(*) AS "Số lượng nhà cung cấp có trang chủ" FROM Suppliers WHERE HomePage IS NOT NULL;

--  Tìm ra các đơn hàng đã  dc giao trong tháng 7 năm 1997, sắp xếp theo tứ tự ngày giao sớm nhất 
-- đến ngày giao muộn nhất và có khu vực giao hàng NULL
SELECT * FROM Orders 
WHERE (ShippedDate BETWEEN '1997-07-01' AND '1997-07-31')
AND ShipRegion IS NULL 
ORDER BY ShippedDate;

-- Tính giá trị trung bình của phí vận chuyển Freight trong bảng order mà shippeddate không có giá trị null
SELECT AVG(Freight) AS "Phí trung bình" FROM Orders WHERE ShippedDate IS NOT NULL;

-- lấy ra tất cả các nhân viên giới tính nam có Số điện thoại tại nhà bắt đầu bằng (71) và được thuê trước 1994-1-1
SELECT * FROM Employees Where TitleOfCourtesy IN ('Mr.','Dr.') AND HomePhone LIKE '%71%' AND HireDate < '1994-01-01';



