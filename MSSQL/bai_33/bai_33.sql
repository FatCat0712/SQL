-- Windows Functions
-- Tính toán trên một tập dữ liệu con( windows ) của bảng
-- dữ liệu

-- Cú pháp
-- FUNCTION_NAME(expression) OVER (
-- [PARTITION BY partition_expression, ... ]
-- [ORDER BY sort_expression [ASC | DESC], ... ]
-- [ROWS BETWEEN frame_specification]
-- )

-- xếp hạng giá trị của các sản phẩm trên toàn table
SELECT ProductID,
		ProductName,
		CategoryID,
		UnitPrice,
		RANK() OVER(ORDER BY UnitPrice DESC) AS "Ranking"
FROM Products;

-- xếp hạng giá trị của các sản phẩm theo từng thể loại
SELECT 
	ProductID,
	ProductName,
	CategoryID,
	UnitPrice,
	RANK() OVER(
				PARTITION BY CategoryID 
				ORDER BY UnitPrice DESC
				) AS "Ranking"
FROM Products;

-- xếp hạng sinh viên toàn trường dựa trên điểm số giảm dần
SELECT 
	MaSinhVien,
	HoTen,
	DiemTrungBinh,
	MaLopHoc,
	RANK() OVER (
		ORDER BY DiemTrungBinh DESC
		) AS "Ranking"
FROM SinhVien;

-- xếp hạng sinh viên theo từng lớp học dựa trên điểm trung bình 
-- giảm dần
SELECT 
	MaSinhVien,
	HoTen,
	DiemTrungBinh,
	MaLopHoc,
	RANK() OVER(
		PARTITION BY MaLopHoc
		ORDER BY DiemTrungBinh DESC
		) AS "Ranking"
FROM SinhVien;

-- xếp hạng sinh viên theo từng lớp học dựa trên điểm trung bình 
-- giảm dần không nhảy xếp hạng
SELECT 
	MaSinhVien,
	HoTen,
	DiemTrungBinh,
	MaLopHoc,
	DENSE_RANK() OVER(
		PARTITION BY MaLopHoc
		ORDER BY DiemTrungBinh DESC
		) AS "Ranking"
FROM SinhVien;

-- xếp hạng sinh viên theo từng lớp học dựa trên điểm trung bình 
-- giảm dần không bị trùng xếp hạng
SELECT 
	MaSinhVien,
	HoTen,
	DiemTrungBinh,
	MaLopHoc,
	ROW_NUMBER() OVER(
		PARTITION BY MaLopHoc
		ORDER BY DiemTrungBinh DESC
		) AS "Ranking"
FROM SinhVien;

-- sử dụng hàm LAG() lấy thông tin về đơn đặt hàng 
-- và ngày đặt hàng trước đó của mỗi khách hàng
SELECT 
	c.CustomerID,
	c.CompanyName,
	o.OrderDate,
	LAG(o.OrderDate) OVER(
		PARTITION BY o.CustomerID
		ORDER BY o.OrderDate ASC)
		AS "PreviousOrderDate"
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID;

-- tính tổng doanh số bán hàng hàng năm cho mỗi khách hàng và 
-- xếp hạng khách hàng dựa trên doanh số bán hàng
WITH CustomerSales AS(
	SELECT 
		c.CustomerID,
		YEAR(o.OrderDate) AS "Year",
		SUM(od.Quantity * od.UnitPrice ) AS "TotalSales"
	FROM 
		Customers AS c
	LEFT JOIN 
		Orders AS o
		ON o.CustomerID = c.CustomerID
	INNER JOIN 
		[Order Details] AS od
		ON od.OrderID = o.OrderID
	GROUP BY c.CustomerID,YEAR(o.OrderDate)
)
SELECT 
		c.CustomerID,
		c.CompanyName,
		cs.Year,
		cs.TotalSales,
		DENSE_RANK() OVER(
			PARTITION BY cs.Year
			ORDER BY cs.TotalSales DESC
		) AS "RankingBasedOnSales"
		
FROM Customers AS c
INNER JOIN CustomerSales AS cs
ON c.CustomerID = cs.CustomerID;

	


