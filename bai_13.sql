-- câu lệnh SELECT có điều kiện với AND,OR,NOT
-- Lấy sinh viên thuộc ngành CNTT và có giới tính là nữ
SELECT *FROM sinhvien WHERE (maChuongTrinhDaoTao = "CNTT" AND gioiTinh = "Nữ");

-- lấy ra sinh viên thuộc ngành quản trị kinh doanh ,nhập học vào 2020 và là Nữ
SELECT * FROM sinhvien WHERE(maChuongTrinhDaoTao="QTKD" AND namNhapHoc=2020 AND gioiTinh="Nữ");

-- Lấy sinh viên học ngành TC hoặc CNTT
SELECT * FROM sinhvien WHERE(maChuongTrinhDaoTao="TC") OR (maChuongTrinhDaoTao="TC");

-- lấy ra sinh viên học ngành CNTT hoặc có giới tính nam
SELECT * FROM sinhvien WHERE (maChuongTrinhDaoTao="CNTT") OR (gioiTinh="Nam");

-- lấy sinh viên học ngành CNTT hoặc QTKD và có giới tính nữ
SELECT * FROM sinhvien WHERE(maChuongTrinhDaoTao="CNTT" OR maChuongTrinhDaoTao="QTKD") AND gioiTinh="Nữ";

-- lấy sinh viên không học CNTT
SELECT * FROM sinhvien WHERE NOT maChuongTrinhDaoTao="CNTT";

-- lệnh SELECT cho bảng chuongtrinhdaotao
SELECT * FROM chuongtrinhdaotao WHERE (namBatDauDaoTao = 2021);
SELECT * FROM chuongtrinhdaotao WHERE (tongSoTinChi = 120 AND namBatDauDaoTao = 2022);
SELECT * FROM chuongtrinhdaotao WHERE ( maChuongTrinhDaoTao = "QTKD" OR maChuongTrinhDaoTao="TC");
SELECT * FROM chuongtrinhdaotao WHERE (maChuongTrinhDaoTao = "NNA" OR maChuongTrinhDaoTao="CNTT") AND namBatDauDaoTao=2022;
SELECT * FROM chuongtrinhdaotao WHERE NOT maChuongTrinhDaoTao = "CNTT";

-- lệnh SELECT cho bảng lophocphan
SELECT * FROM lophocphan WHERE (ngonNguGiangDay = "Tiếng Việt");
SELECT * FROM lophocphan WHERE (ngonNguGiangDay="Tiếng Anh" AND soLuongSinhVien=50);
SELECT * FROM lophocphan WHERE (namHoc = 2020) OR (namHoc = 2024);
SELECT * FROM lophocphan WHERE (hocKy = "học kỳ 1" OR hocKy = "học kỳ 2") AND soLuongSinhVien = 50;
SELECT * FROM lophocphan WHERE NOT ngonNguGiangDay = "Tiếng Việt";

-- lệnh SELECT cho bảng monhoc
SELECT * FROM monhoc WHERE theLoai = "Bắt buộc" AND NOT maChuongTrinhDaoTao="ATTT";
SELECT * FROM monhoc WHERE soTinChi = 3;
SELECT * FROM monhoc WHERE maChuongTrinhDaoTao = "ATTT";
SELECT * FROM monhoc WHERE  taiLieu IS NOT NULL;
SELECT * FROM monhoc WHERE (namBatDauApdung = 2020) OR (namBatDauApdung = 2023);

-- lệnh SELECT cho bảng người dùng
SELECT * FROM nguoidung WHERE maNhanVien IS NOT NULL;
SELECT * FROM nguoidung WHERE theLoai = "sinh viên";
SELECT * FROM nguoidung WHERE NOT matKhau = "123456";
SELECT * FROM nguoidung WHERE matKhau="123456" AND theLoai="nhân viên";

-- lệnh  SELECT cho bảng nhân viên
SELECT * FROM nhanvien WHERE gioiTinh = "Nữ";
SELECT * FROM nhanvien WHERE theLoai = "Giảng viên" AND gioiTinh = "Nam";
SELECT * FROM nhanvien WHERE NOT theLoai = "Giảng viên";
SELECt * FROM nhanvien WHERE ten = "Dung" OR ten = "Xuyến";
SELECT * FROM nhanvien WHERE (theLoai = "Giảng viên" OR theLoai = "trợ giảng") AND gioiTinh = "Nữ";

-- lệnh SELECT cho bảng sinh viên
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao = "QHQT" OR maChuongTrinhDaoTao = "QTKD";
SELECT hoDem,ten,ngaySinh FROM sinhvien WHERE maChuongTrinhDaoTao = "CNTT";
SELECT * FROM sinhvien WHERE gioiTinh = "Nữ";
SELECT * FROM sinhvien WHERE namNhapHoc = 2019 AND gioiTinh = "Nữ";
SELECT * FROM sinhvien WHERE ten = "Hải";
