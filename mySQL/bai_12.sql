-- câu lệnh SELECT với mệnh đề WHERE

-- lấy ra những sinh viên học ngành CNTT
SELECT * FROM sinhvien WHERE (maChuongTrinhDaoTao="CNTT");

-- lấy sinh viên nhập học từ năm 2020
SELECT * FROM sinhvien WHERE(namNhapHoc >= 2020);

-- lấy sinh viên nữ
SELECT * FROM sinhvien WHERE (gioiTinh = "Nữ");

+ Bảng chương trình đào tạo
-- lấy những ngành co tổng số tín chỉ nhỏ hơn 140
SELECT * FROM chuongtrinhdaotao WHERE (tongSoTinChi < 140);

-- lấy những ngành có bắt đầu đào tạo từ năm 2021
SELECT * FROM chuongtrinhdaotao WHERE (namBatDauDaoTao = 2021);

-- lấy những ngành có tổng số tín chỉ là 150
SELECT * FROM chuongtrinhdaotao WHERE (tongSoTinChi = 150);

+ Bảng lớp học phần
-- lấy những lớp học phần có ngôn ngữ giảng dạy là tiếng việt
SELECT * FROM lophocphan WHERE (ngonNguGiangDay = "tiếng việt");

-- lấy những lớp học phần được mở ở năm 2022
SELECT * FROM lophocphan WHERE (namHoc = 2022); 

-- lấy những lớp học phần được mở ở học kỳ 1
SELECT * FROM lophocphan WHERE (hocKy = "học kỳ 1");

+ Bảng môn học
-- lấy những môn học thuộc chương trình đào tạo QHQT
SELECT * FROM monhoc WHERE (maChuongTrinhDaoTao = "QHQT");

-- lấy những môn học thuốc chương trình đào tạo ATTT
SELECT * FROM monhoc WHERE (maChuongTrinhDaoTao = "ATTT");

-- lấy những môn học có số tín chỉ là 3
SELECT * FROM monhoc WHERE (soTinChi = 3);

+ Bảng người dùng
-- lấy những nhân viên từ bảng người dùng
SELECT * FROM nguoidung WHERE (theLoai = "nhân viên");

-- lấy những sinh viên từ bảng người dùng
SELECT * FROM nguoidung WHERE (theLoai = "sinh viên");

+ Bảng nhân viên
-- lấy những nhân viên nam từ bảng nhân viên
SELECT * FROM nhanvien WHERE (gioiTinh = "Nam");

-- lấy những nhân viên nữ từ bảng nhân viên
SELECT * FROM nhanvien WHERE (gioiTinh = "Nữ");

-- lấy những giảng viên từ bảng nhân viên
SELECT * FROM nhanvien WHERE (theLoai = "Giảng viên");

+ Bảng sinh viên
-- lấy những sinh viên Nam từ bảng sinh viên
SELECT * FROM sinhvien WHERE (gioiTinh = "Nam");

-- lấy những sinh viên học CNTT từ bảng sinh viên
SELECT * FROM sinhvien WHERE (maChuongTrinhDaoTao = "CNTT");

-- lấy những sinh viên học QTKD từ bảng sinh viên
SELECT * FROM sinhvien WHERE (maChuongTrinhDaoTao = "QTKD");