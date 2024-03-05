-- truy vấn đệ quy trong SQL
-- Truy vấn đệ quy sử dụng CTE
-- Cú pháp
-- WITH CTE_name (column1, column2, ... ) AS (
-- //Khởi tạo (Anchor member)
-- SELECT ...
-- FROM ...
-- WHERE ...
-- UNION ALL
-- //Đệ quy
-- SELECT ...
-- FROM ...
-- JOIN CTE_name ON ...
-- )
-- SELECT ...
-- FROM CTE_name

-- tính dãy fibonacci
-- 0 1 1 2 3 5 8 13 21 34 55 89
-- Sn = S(n-1) + S(n-2)
WITH fibo(prev_n, n,SoLanDeQuy) AS(
	-- phần cơ sở
	SELECT 
		0 AS prev_n,
		1 AS n,
		0 AS "SoLanDeQuy"
	UNION ALL
	-- phần đệ quy
	SELECT
		n AS prev_n,
		prev_n + n AS n, -- <=> n + 1
		fibo.SoLanDeQuy + 1
	FROM fibo
	WHERE fibo.SoLanDeQuy < 10 -- Điều kiện dừng đệ quy

	/* Vì WHERE thực thi trước SELECT, nên muốn đệ quy bao nhiêu lần thì
	lấy số lần đệ quy làm giá trị của điều kiện dừng */
	/* Đệ quy tính dãy số Fibonacci không có cột tăng mỗi lần lên 1 đơn vị
	nên phải tự thêm 1 cột SoLanDeQuy dùng để lập điều kiện dừng */
)
--SELECT * FROM fibo
--OPTION (MAXRECURSION 5);

SELECT prev_n,n
FROM fibo;

-- tính giai thừa
WITH giaiThua(stt,n) AS (
	-- phần cơ sở
	SELECT 
		1 AS stt,
		1 AS n
	UNION ALL
	-- phần đệ quy
	SELECT
		stt + 1 AS stt,
		(stt + 1) * n AS n -- giai thừa của n = stt(n) * ketqua(n-1)
		
	FROM giaiThua
	WHERE stt < 6
)
SELECT *
FROM giaiThua;

-- Sử dụng truy vấn đệ quy để tạo một cây cáu trúc quản lý của nhân
-- viên trong bảng "Employees"
-- Trong đó "ReportsTo" là mã của người quản lý
DECLARE @EmployeeId int
set @EmployeeId = 2;

WITH e_cte AS (
	-- phần cơ sở
	SELECT 
		e.EmployeeID, 
		e.LastName+' '+e.FirstName AS FullName,
		e.ReportsTo AS ManagerID,
		0 AS Level
	FROM Employees AS e
	WHERE e.EmployeeID  = @EmployeeId
	UNION ALL
	-- phần đệ quy
	SELECT 
		e1.EmployeeID,
		e1.LastName + ' ' + e1.FirstName AS FullName,
		e1.ReportsTo AS ManagerID,
		Level + 1 AS Level
	FROM Employees AS e1
	INNER JOIN e_cte ON 
	e1.ReportsTo = e_cte.EmployeeID
)
SELECT *
FROM e_cte;