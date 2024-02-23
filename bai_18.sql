-- LIMIT giới hạn số lượng dữ liệu trả về
-- chọn 2 sinh viên ngành CNTT từ bảng sinhvien
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao = "CNTT" LIMIT 2;

-- chọn 2 giảng viên từ bảng nhanvien
SELECT * FROM nhanvien WHERE viTri = "Giảng viên" LIMIT 2;

-- chọn 3 nhân viên nam từ bảng nhanvien
SELECT * FROM nhanvien WHERE gioiTinh = "Nam" LIMIT 3;

-- chọn 3 sinh viên nhập học từ năm 2020
SELECT * FROM sinhvien WHERE namNhapHoc = "2020" LIMIT 3;

-- chọn 2 sinh viên có điểm môn trên 7 điểm từ bảng thamgiahoc
SELECT * FROM thamgiahoc WHERE diemSo >= 7 LIMIT 2;