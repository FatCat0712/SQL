-- tạo table NhanVien
CREATE TABLE NhanVien(
	MaNhanVien INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Phai VARCHAR(10),
	NgaySinh DATE,
	DiaChi VARCHAR(255),
	SoDienThoai VARCHAR(10)
);

SELECT * FROM NhanVien;

-- thêm dữ liệu cho bảng nhân viên
INSERT INTO NhanVien(MaNhanVien,HoTen,Phai,NgaySinh,DiaChi,SoDienThoai)
VALUES 
	(1,'Mai Son Hai','Nam','2002-12-07','Vinh Long','123456789'),
	(2,'Le Nhat Tung','Nam','2001-11-06','Ba Lan','123456789');

-- tạo table KhachHang
CREATE TABLE KhachHang(
	MaKhachHang INT IDENTITY(100,5) PRIMARY KEY NOT NULL,
	TenKhachHang VARCHAR(50) NOT NULL,
	DiaCHi VARCHAR(255),
	SoDienThoai VARCHAR(10) CHECK(SoDienThoai LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

SELECT * FROM KhachHang;



-- thêm dữ liệu cho bảng khách hàng
INSERT INTO KhachHang(TenKhachHang,DiaCHi,SoDienThoai)
VALUES
	('Aston Martin','Italy','7939791111')

-- thêm cột Email vào bảng NhanVien
ALTER TABLE NhanVien
ADD Email VARCHAR(100);

-- tăng độ dài tối đa của cột HoTen
ALTER TABLE NhanVien
ALTER COLUMN HoTen VARCHAR(100);

-- thêm ràng buộc cho cột NgaySinh
ALTER TABLE NhanVien
ADD CONSTRAINT NgaySinhCheck CHECK(NgaySinh <= GETDATE());

-- xóa dữ liệu bảng NhanVien
TRUNCATE TABLE NhanVien;

-- xóa bảng NhanVien
DROP TABLE NhanVien;

USE employees;

-- Exercise
-- tạo bảng SinhVien
CREATE TABLE SinhVien(
	MaSinhVien INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTrungBinh FLOAT
);

-- thêm cột Email vào bảng SinhVien với kiểu dữ liệu VARCHAR
ALTER TABLE SinhVien
ADD Email VARCHAR(100);


-- Sửa đổi kiểu dữ liệu của cột DiemTrungBinh trong bảng SinhVien
-- thành kiểu dữ liệu DECIMAL(2,1)
ALTER TABLE SinhVien
ALTER COLUMN DiemTrungBinh DECIMAL(2,1);

-- Xóa cột Nganh khỏi bảng SinhVien.
ALTER TABLE SinhVien
DROP COLUMN Nganh;

-- thêm ràng buộc kiểm tra cột DiemTrungBinh để giá trị 
-- phải lớn hơn hoặc bằng 0
ALTER TABLE SinhVien
ADD CONSTRAINT checkDTB CHECK(DiemTrungBinh >= 0);



-- thêm ràng buộc duy nhất cho cột MaSV trong bảng SinhVien
ALTER TABLE SinhVien
ADD CONSTRAINT checkMa UNIQUE (MaSinhVien);

SELECT * FROM SinhVien;

-- Thêm dữ liệu vào bảng SinhVien
INSERT INTO SinhVien(MaSinhVien,HoTen,Lop,DiemTrungBinh,Email)
VALUES
	(1,'Astion Martin','AN2001',8,'maisonhai456@gmail.com'),
	(2,'Lamborghini','AN2001',7,'lambo@gmail.com')

-- Xóa dữ liệu bảng SinhVien
TRUNCATE TABLE SinhVien;

-- Xóa bảng SinhVien
DROP TABLE SinhVien;

-- Tạo lại bảng SinhVien với cấu trúc ban đầu
CREATE TABLE SinhVien(
	MaSinhVien INT NOT NULL PRIMARY KEY,
	HoTen VARCHAR(50) NOT NULL,
	Lop VARCHAR(20),
	Nganh VARCHAR(20),
	DiemTrungBinh FLOAT
);

SELECT * FROM INFORMATION_SCHEMA.TABLES;



