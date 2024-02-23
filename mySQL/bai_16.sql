-- Câu lệnh UPDATE
-- nếu không có mệnh đề WHERE thì toàn bộ dữ liệu của bảng sẽ được thay đổi

-- UPDATE chuongtrinhdaotao
-- set tongSoTinChi = tongSoTinChi + 10
-- tổng số tín chỉ của các chương trình đào tạo sẽ được cộng thêm 10

-- cập nhật tổng số tín chỉ của ngành CNTT và QTKD thêm 30 tín chỉ
UPDATE chuongtrinhdaotao
SET tongSoTinChi = tongSoTinChi + 30
WHERE (maChuongTrinhDaoTao = "CNTT") OR (maChuongTrinhDaoTao = "QTKD");

-- cập nhật năm bắt đầu đào tạo của ngành Khoa học máy tính thành năm 2024
UPDATE chuongtrinhdaotao
SET namBatDauDaoTao = 2024
WHERE (maChuongTrinhDaoTao = "KHMT");

-- cập nhật những ngành có tổng số tín chỉ là 120 có năm bắt đầu đào tạo là năm 2000
UPDATE chuongtrinhdaotao
SET namBatDauDaoTao = 2000
WHERE tongSoTinChi = 120;

-- cập nhật thể loại cho các môn không phải của ngành CNTT là môn tự chọn
UPDATE monhoc
SET theLoai = "Tự chọn"
WHERE NOT maChuongTrinhDaoTao = "CNTT";

-- cập nhật vị trí cho Mai Thanh Hà trong bảng nhanvien
UPDATE nhanvien
SET viTri = "Giám đốc điều hành"
WHERE hoDem = "Mai Thanh" AND ten = "Hà";

-- cập nhật vị trí cho Võ Thị Kim Thanh trong bảng nhanvien
UPDATE nhanvien
SET viTri = "Chủ tịch hội đồng quản trị"
WHERE hoDem = "Võ Thị Kim" AND ten = "Thanh";

-- cập nhật lại hoDem, ten của Võ Thị Kim Thanh trong bang nhanvien
UPDATE nhanvien
SET hoDem = "Võ Thị", ten = "Kim Thanh"
WHERE maNhanVien = 8;

-- cập nhật năm nhập học của các sinh viên ngành QTKD thành năm 2018
UPDATE sinhvien
SET namNhapHoc = 2018
WHERE maChuongTrinhDaoTao = "QTKD";


