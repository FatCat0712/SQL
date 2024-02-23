-- toán tử IN trả về các dữ liệu khi thỏa mãn một trong những giá trị của tập giá trị cho trước => OR
-- NOT IN ngược lại 

-- chọn những sinh viên học ngành CNTT và KHMT
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao IN ("CNTT","KHMT");

-- chọn những sinh viên học những ngành có tổng số tín chỉ là 130
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao IN ( SELECT maChuongTrinhDaoTao FROM chuongtrinhdaotao WHERE tongSoTinChi = 130);

-- chọn những sinh viên học những ngành có tổng số tính chỉ khác 130
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao NOT IN ( SELECT maChuongTrinhDaoTao FROM chuongtrinhdaotao WHERE tongSoTinChi =130);

-- chọn những sinh viên học các ngành bắt đầu đào tạo từ năm 2020
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao IN ( SELECT maChuongTrinhDaoTao FROM chuongtrinhdaotao WHERE namBatDauDaoTao = 2020);



-- chọn những sinh viên học những môn có số tín chỉ = 3
SELECT * FROM sinhvien WHERE maSinhVien IN ( SELECT maSinhVien FROM thamgiahoc WHERE maLopHocPhan IN (SELECT maLopHocPhan FROM lophocphan WHERE maMonHoc IN (SELECT maMonHoc FROM monhoc WHERE soTinCHi = 3 )));

-- chọn những sinh viên có diểm số lớn hơn 8
SELECT * FROM sinhvien WHERE maSinhVien IN (SELECT maSinhVien FROM thamgiahoc WHERE  diemSo >= 8);

-- tìm những giảng viên của những lớp học phần được mở vào năm 2022
SELECT * FROM nhanvien WHERE ( viTri = "Giảng viên" AND maNhanVien IN (SELECT maGiangVien FROM lophocphan WHERE namHoc = 2022));

-- tìm những nhân viên chưa có tài khoản đăng nhập
SELECT * FROM nhanvien WHERE maNhanVien NOT IN ( SELECT maNhanVien FROM nguoidung WHERE maNhanVien IS NOT NULL);

-- tìm những sinh viên nam có điểm số lớn hơn 8
SELECT * FROM sinhvien WHERE gioiTinh = "Nữ" AND maSinhVien IN ( SELECT maSinhVien FROM thamgiahoc WHERE diemSo >= 8);

-- tìm những sinh viên học ngành tài chính mà chưa có tài khoản sinh viên
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao = "TC" AND maSinhVien NOT IN ( SELECT maSinhVien FROM nguoidung WHERE maSinhVien IS NOT NULL);





