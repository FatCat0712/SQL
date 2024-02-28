-- toán tử BETWEEN chọn các giá trị trong một phạm vi nhất định
-- Các giá trị có thể là số, văn bản hoặc là ngày, tháng
-- Toán tử Between bao gồm: giá trị bắt đầu và kết thúc

-- lấy danh sách các sản phẩm có giá bán từ 10 đến 20 đô la
SELECT * FROM Products WHERE UnitPrice BETWEEN 10 AND 20;

-- lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian
-- từ ngày 1996-07-01 đến ngày 1996-07-31
SELECT * FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- tính tổng số tiền vận chuyển (Freight) của các đơn đặt hàng được đặt
-- trong khoảng thời gian từ 1996-07-01 đến ngày 1996-07-31
SELECT SUM(Freight) AS "Tổng tiền vận chuyển" FROM Orders WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- Lấy danh sách các đơn đặt hàng có ngày đặt hàng trong khoảng từ 1/1/1997 đến
-- ngày 31/12/1997 và được vận chuyển bằng đường tàu thủy
SELECT * FROM Orders WHERE (OrderDate BETWEEN '1997-01-01' AND '1997-12-31') AND ShipVia = 3;

-- liệt kê họ và tên nhân viên chỉ sống ở London, có ngày tháng năm sinh từ 1/1/1952 đến 31/12/1963
-- hoặc ngày tuyển từ 1/2/1992 đến 31/12/1993
-- chỉ lấy 3 nhân viên đầu tiên sắp xếp theo LastName
SELECT TOP 3 LastName,FirstName,LastName+' '+FirstName AS "FullName" FROM Employees 
WHERE (City = 'London' AND BirthDate BETWEEN '1952-01-01' AND '1963-12-31')
OR (HireDate BETWEEN '1992-02-01' AND '1993-12-31')
ORDER BY LastName;

-- liệt kê các đơn hàng, OrderDate từ 01-07-1996 đến 01-09-1996, OrderID từ 10000 đén 10250
SELECT * FROM Orders
WHERE 
(OrderDate BETWEEN '1996-07-01' AND '1996-09-01')AND
(OrderID BETWEEN '10000' AND '10250')
ORDER BY ShipName DESC;

-- tính giá trung bình của các sản phẩm có ngày đặt hàng từ 01-01-1996 đến ngày 
-- 31-07-1997
SELECT AVG(p.UnitPrice) AS "Giá trung bình" 
FROM Products AS p
INNER JOIN [Order Details] AS od ON p.ProductID = od.ProductID
INNER JOIN Orders AS o ON od.OrderID = o.OrderID
WHERE OrderDate BETWEEN '1996-01-01' AND '1997-07-31';

-- liệt kê tất cả các sản phẩm có đơn giá trong khoảng từ 50 đến 100 
-- và Category = 1
SELECT * 
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID
WHERE p.UnitPrice BETWEEN 50 AND 100
AND c.CategoryID = 1;

-- Lấy ra các sản phẩm có số lượng hàng tồn kho từ 50 đến 100 sản phẩm
SELECT * FROM Products WHERE (UnitsInStock - UnitsOnOrder) BETWEEN 50 AND 100;

-- Lấy ra danh sách các quốc gia của các nhân viên có sinh nhật nằm trong khoảng
-- từ ngày 1/8/1996 cho đến ngày 31/8/1996
SELECT Country FROM Employees WHERE BirthDate BETWEEN '1996-08-01' AND '1996-08-31';

-- lấy ra sản phẩm có giá từ 200 tới 400
SELECT * FROM Products WHERE UnitPrice BETWEEN 200 AND 400;

-- lấy ra sản phẩm có giá từ 100 tới 200 và còn hàng trong kho
SELECT * FROM Products WHERE (UnitPrice BETWEEN 100 AND 200) AND (UnitsInStock - UnitsOnOrder) > 0;

-- lấy ra danh sách nhân viên có last name từ "A - M"
SELECT * FROM Employees WHERE LastName BETWEEN 'A' AND 'M';

-- Lấy danh sách nhân viên có quốc tịch Pháp và có tên First Name từ "L-Z"
SELECT * FROM Employees WHERE (Country = 'France') AND (FirstName BETWEEN 'L' AND 'Z');

-- tính giá trung bình của đơn hàng có số lượng sản phẩm từ 5 đến 20
SELECT AVG(UnitPrice) AS "Giá trung bình" FROM [Order Details] WHERE Quantity BETWEEN 5 AND 20;

-- tìm tất cả nhân viên có BirthDate từ 1948-08-12 đến 1956-1-1 và
-- TitleOfCourtesy = Mr
SELECT * FROM Employees WHERE BirthDate BETWEEN '1948-08-12' AND '1956-01-01'
AND TitleOfCourtesy = 'Mr.'

-- liệt kê danh sách danh viên có LastName từ A - M và BirthDate nhỏ hơn bằng
-- 1959
SELECT * FROM Employees	WHERE LastName BETWEEN 'A' AND 'M' AND YEAR(BirthDate) < 1959;

-- liệt kê danh sách Order có Discount = 0.25 hoặc 0.3
SELECT * 
FROM Orders AS o
INNER JOIN [Order Details] AS od
ON o.OrderID = od.OrderID
WHERE od.Discount = 0.25 OR od.OrderID = 0.3;
-- tính giá trị các Order đó
SELECT AVG(UnitPrice) AS "Giá trị trung bình" FROM [Order Details] WHERE Discount = 0.25 OR Discount = 0.3 

-- lấy tên, địa chỉ, quê quán của top 2 nhân viên bắt đầu làm việc
-- trong năm 1993
SELECT TOP 2 LastName,Address,Country FROM Employees WHERE YEAR(HireDate) = 1993;
SELECT TOP 2 LastName,Address,Country FROM Employees WHERE HireDate BETWEEN '1993-01-01' AND '1993-12-31';
