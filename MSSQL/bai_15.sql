-- LIKE: lọc dữ liệu theo mẫu theo mẫu
-- %: đại diện cho không , hoặc nhiều ký tự
-- _ : đại điện cho một ký tự đơn

-- lọc ra tất cả các khách hàng đến từ các quốc gia (Country) bắt đầu bằng chữ 'A'
SELECT * FROM Customers WHERE Country LIKE 'A%';

-- lấy danh sách các đơn đặt hàng được gửi đến các thành phố có chứa chữ 'a'
SELECT * FROM Orders WHERE ShipCity LIKE '%a%';

-- lọc ra tất cả các đơn hàng với điều kiện
-- ShipCountry LIKE 'U_'
-- ShipCountry LIKE 'U%'
SELECT * FROM Orders WHERE ShipCountry LIKE 'U_';
SELECT * FROM Orders WHERE ShipCountry LIKE 'U_A';
SELECT * FROM Orders WHERE ShipCountry LIKE 'U%';

-- lấy ra tất cả các nhà cung cấp hàng có chữ 'b' trong tên của công ty
SELECT * FROM Suppliers WHERE CompanyName LIKE '%b%';

-- liệt kê 5 dòng đầu tiên lấy họ tên các nhân viên có chữ 'e' trong tên and có ngày từ '1952-01-01' đến
-- '1962-12-31', sắp xếp theo cột FirstName từ A-Z
SELECT TOP 5 LastName + ' ' + FirstName AS "FullName" FROM Employees
WHERE LastName LIKE '%e%' AND 
(BirthDate BETWEEN '1952-01-01' AND '1962-12-31')
ORDER BY FirstName;

-- liệt kê họ tên các nhân viên có quê quán bắt đầu bằng chữ 'U__' và kết thúc bằng 2 ký tự bất kỳ
-- và bắt đầu làm việc từ ngày 1992-03-23 đến ngày 1994-12-31
-- sắp xếp theo cột LastName từ Z - A
-- chỉ lấy 4 dòng đầu tiên
SELECT LastName + ' '+ FirstName AS "FullName" FROM Employees 
WHERE Country LIKE 'U__' AND (HireDate BETWEEN '1992-03-23' AND '1994-12-31')
ORDER BY LastName DESC;

-- lấy ra tất cả LastName có chứa chữ 'a'
SELECT LastName FROM Employees WHERE LastName LIKE '%a%';

-- lấy ra tất cả tên khách hàng có thành phố chứa chữ 'o'
SELECT CompanyName FROM Customers WHERE CompanyName LIKE '%o%';

-- lấy ra tất cả các Employee có ký tự thứ 3 là 's' trong TitleOfCourtesy
SELECT * FROM Employees WHERE TitleOfCourtesy LIKE '__s%';

-- lấy ra tất cả các Suppliers có ký tự bắt đầu là '0' trong Fax
SELECT * FROM Suppliers WHERE Fax LIKE '0%';

-- lấy ra tên của nhân viên có chữ a
SELECT LastName FROM Employees WHERE LastName LIKE '%a%';

-- lấy ra tên thành phố bắt đầu bằng chữ L và kết thúc bằng chữ n
SELECT DISTINCT City FROM Employees WHERE City LIKE 'L%n';

-- lấy ra các nhà cung cấp đến từ quốc gia bắt đầu bằng chữ 'S'
SELECT * FROM Suppliers WHERE Country LIKE 'S%';

-- lấy ra các nhân viên mà trong tên có chữ 't'
SELECT * FROM Employees WHERE LastName LIKE '%t%';

-- liệt kê tên sản phẩm có ký tự 'C' ở đầu và ký tự 'e' ở cuối
SELECT ProductName FROM Products WHERE ProductName LIKE 'C%e';

-- liệt kê danh sách các Suppliers có số điện thoại: có chứa số 4 và có đuôi 22
SELECT * FROM Suppliers WHERE Phone LIKE '%4%22';

-- lấy top 3 tất cả khách hàng có số điện thoại 00
SELECT TOP 3 * FROM Customers WHERE Phone LIKE '%00%';

-- lấy tất cả các nhân viên lastname sắp xếp từ a - z và chứa chữ a
SELECT * FROM Employees WHERE LastName LIKE '%a%' 
ORDER BY LastName;

--  Lấy ra tất cả nhân viên mà trong tên có chữ ‘D’ trong tên của họ
SELECT * FROM Employees WHERE LastName LIKE '%D%';

-- Lấy ra tất cả các sản phẩm mà tên sản phẩm có chữ cái ‘x’
SELECT * FROM Products WHERE ProductName LIKE '%x%';

-- Liệt  kê  tất  cả  các  khách  hàng có tên bắt đầu bằng chữ  A  và kết thúc là chữ M 
SELECT * FROM Customers WHERE CompanyName LIKE 'A%M';

-- Liệt  kê  tất  cả  các  nhân  viên  có  họ  chứa chữ H
SELECT * FROM Employees WHERE FirstName LIKE '%H%';