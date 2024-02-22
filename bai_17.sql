-- lệnh DELETE
-- nếu không có mệnh đề WHERE sẽ xóa toàn bộ dữ liệu của bảng

-- Xóa những ngành có năm bắt đầu đào tạo là năm 2000
DELETE FROM chuongtrinhdaotao WHERE namBatDauDaoTao = 2000;

-- Xóa lớp học phần hệ điều hành 
DELETE FROM lophocphan WHERE maMonHoc = "HĐH";

-- Xóa những môn học được áp dụng từ trước năm 2019
DELETE FROM monhoc WHERE namBatDauApDung <= 2019;

-- Xóa những người dùng có mật khẩu là 123456 từ bảng nguoidung
DELETE FROM nguoidung WHERE matKhau = "123456";

-- Xóa nhân viên tên thắng trong bảng nhanvien
DELETE FROM nhanvien WHERE ten = "Thắng";

-- Xoát những sinh viên học ngành CNTT hoặc TC
DELETE FROM sinhvien WHERE (maChuongTrinhDaoTao = "CNTT") OR (maChuongTrinhDaoTao = "TC");

