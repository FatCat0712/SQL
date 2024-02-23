-- CREATE DATABASE quanlysinhvien CHARSET "utf8mb4" COLLATE "utf8mb4_general_ci";

-- UNIQUE các dữ liệu trong một cột không được trùng nhau
-- NOT NULL đảm bảo một cột không được chứa giá trị NULL
-- CHECK đảm bảo rằng các giá trị trong một cột thỏa mãn một điều kiện cụ thể
-- DEFAULT Đặt giá trị mặc định cho mặc định cho một cột nếu không có giá trị được chỉ định
-- PRIMARY KEY sự kết hợp của NOT NULL và UNIQUE. Xác định duy nhất từng hàng trong bảng
-- FOREIGN KEY khóa chính nhưng nằm trong bảng khác nhằm tạo liên kết giữa các bảng



DROP TABLE IF EXISTS sinhvien;
CREATE TABLE sinhvien(
   maSV VARCHAR(20) NOT null,
   hoDem VARCHAR(20) NOT NULL,
   ten VARCHAR(30) NOT NULL,
   ngaySinh DATE NOT NULL DEFAULT '2000-01-01',
   namNhapHoc YEAR ,
   maThuVien VARCHAR(20) UNIQUE,
   
   CHECK (namNhapHoc >= 2000)
   
);

CREATE TABLE lophoc(
	maLop VARCHAR(20) NOT NULL,
	tenLop VARCHAR(20) NOT NULL,
	tenKhoa VARCHAR(20) NOT NULL
);