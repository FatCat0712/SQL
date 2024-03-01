-- Wildcard trong SQL
-- % : đại diện cho 0 hoặc nhiều ký tự
-- _ : đại diện cho 1 ký tự đơn lẻ
-- [] : đại điện cho ký tự bất kỳ trong dấu ngoặc vuông
-- ^ : đại diện cho ký tự không nằm trong dấu ngoặc vuông
-- - : đại diện cho ký tự bất kỳ nằm trong khoảng cho trước

-- lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'A'
SELECT * FROM Customers WHERE ContactName LIKE 'A%';

-- lọc ra tất cả các khách hàng có tên liên hệ bắt đầu bằng chữ 'H' và có chữ 
-- thứ 2 là bất kỳ ký tự nào
SELECT * FROM Customers WHERE ContactName LIKE 'H_%';

-- lọc ra tất cả đơn hàng được gửi đến thành phố có chữ cái bắt đầu
-- là L, chữ cái thứ hai là u hoặc o
SELECT * FROM Orders WHERE ShipCity LIKE 'L[uo]%';

-- lọc ra tất cả các đơn hàng được gửi đến thành phố có chữ cái bắt đầu
-- là L, chữ cái thứ hai không phải là u hoặc o
SELECT ShipCity FROM Orders WHERE ShipCity LIKE 'L[^uo]%';

-- lọc ra tất cả các đơn hàng được gửi đếm thành phố có chữ cái bắt đầu là
-- L, chữ cái thứ hai là các ký tự từ a đến e
SELECT ShipCity FROM Orders WHERE ShipCity LIKE 'L[a-e]%';

-- lấy ra tất cả các nhà cung cấp hàng có tên công ty bắt đầu bằng chữ A và
-- không chứa ký tự b
SELECT * FROM Suppliers WHERE CompanyName LIKE 'A%' AND CompanyName NOT LIKE '%[b]%';

-- lấy ra tất cả các sản phẩm có tên không chứa ký tự a
SELECT * FROM Products WHERE ProductName NOT LIKE '%a%';

-- lấy ra tất cả các nhân viên có địa chỉ có chữ b và tên bắt đầu bằng a
SELECT * FROM Employees WHERE Address LIKE '%b%' AND LastName LIKE 'a%';

-- lấy ra tất cả các Customers có ContactName bắt đầu bằng chữ 'C' và 
-- có ký tự tiếp theo bất kỳ
SELECT * FROM Customers WHERE ContactName LIKE 'C%';

-- Chọn tất cả các suppliers có ContactName bắt đầu bằng chữ 'A' và chữ cái
-- thứ hai không phải ký tự từ b - d
SELECT * FROM Suppliers WHERE ContactName LIKE 'A[^b-d]%';

-- lấy giá trung bình phí vân chuyển của đơn hàng mà shipcity bắt đâu bằng chữ L chữ thứ 2 từ a - p
SELECT AVG(Freight) AS "Phí vận chuyển trung bình" FROM Orders WHERE ShipCity LIKE 'L[a-p]%';

-- lấy top 5 nhân viên đến từ nước bắt đầu bằng U kí tự thứ 2 là s
SELECT TOP 5 * FROM Employees WHERE Country LIKE 'Us%';

-- liệt kê tất cả Customer có Fax bắt đầu là ký tự '(' và không chứa ký tự '-'
SELECT Fax FROM Customers WHERE Fax LIKE '(%' AND Fax NOT LIKE '%-%';

-- liệt kê tất cả Customer có Phone bắt đầu là ký tự '(' và không chứa ký tự '.'
SELECT Phone FROM Customers WHERE Phone LIKE '(%' AND Phone NOT LIKE '%.%';

-- lấy ra tất cả những khách hàng với tên liên hệ bắt đầu từ 'A' đến 'D'
SELECT ContactName FROM Customers WHERE ContactName LIKE '[A-D]%';

-- lấy ra tất cả những đơn hàng có đất nước được vận chuyển bắt đầu bằng 'U'
-- và ký tự thứ 2 ko rỗng
SELECT ShipCountry FROM Orders WHERE ShipCountry LIKE 'U_%';

-- lọc ra tất cả khách hàng có địa chỉ bắt đầu bằng chữ H, chữ thứ 2 là bất kỳ ký tự nào
SELECT * FROM Customers WHERE Address LIKE 'H_%';

-- lọc ra tất cả các đơn hàng có địa chỉ giao hàng với chữ cái đầu không bắt đầu bằng A hoặc H, chữ cái thứ 2 là  S hoặc G
SELECT * FROM Orders WHERE ShipAddress LIKE '[^AH][SG]%';

-- lấy ra tất cả các nhà cung cấp có tên công ty bắt đầu bằng A và không chứa B
SELECT * FROM Suppliers WHERE CompanyName LIKE 'A%' AND CompanyName NOT LIKE '%B%';

-- lấy tên khách hàng có tên liên hệ là chữ L đầu và không phải chữ G cuối
SELECT CompanyName FROM Customers WHERE ContactName LIKE 'L%' AND ContactName NOT LIKE '%G';

-- lấy ra tên nhân viên chứa chữ B đầu tiên và chữ g cuối tên
SELECT LastName FROM Employees WHERE LastName LIKE 'B%G';

-- lấy ra tên sản phẩm không chứa chữ c
SELECT ProductName FROM Products WHERE ProductName NOT LIKE '%c%';

-- lấy ra tất cả đơn hàng có Shipcountry chứa chữ N là chữ cái thứ 3
SELECT ShipCountry from Orders WHERE ShipCountry LIKE '__N%';

-- liệt kê danh sách Homephone mà trong đó không có số 2,4,6
SELECT HomePhone FROM Employees WHERE HomePhone NOT LIKE '%[246]%';


