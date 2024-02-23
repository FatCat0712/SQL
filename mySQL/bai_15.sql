-- NULL và IS NOT NULL
-- dùng để xác định các record có chứa dữ liệu NULL
-- lấy những tài khoản từ bảng nguoidung không có mã nhân viên
SELECT * FROM nguoidung WHERE maNhanVien IS NULL;
-- lấy những tài khoản từ bảng nguoidung có mã nhân viên
SELECT * FROM nguoidung WHERE maNhanVien IS NOT NULL;
-- lấy những tài khoản từ bảng nguoidung có mã sinh viên
SELECT * FROM nguoidung WHERE maSinhVien IS NOT NULL;
-- lấy những tài khoản từ bảng nguoidung không có mã sinh viên
SELECT * FROM nguoidung WHERE maSinhVien IS NULL;
-- lấy những tài khoản đăng ký tham gia học từ bảng thamgiahoc mà không có điểm chữ
SELECT * FROM thamgiahoc WHERE diemChu IS NULL;
-- lấy những tài khoản đăng ký tham gia học từ bảng thamgiahoc mà không có điểm số
SELECT * FROM thamgiahoc WHERE diemSo IS NULL;
-- lấy những tài khoản đăng ký tham gia học từ bảng thamgiahoc mà có điểm số
SELECT * FROM thamgiahoc WHERE diemSo IS NOT NULL;
-- lấy những tài khoản đăng ký tham gia học từ bảng thamgiahoc mà có điểm chữ
SELECT * FROM thamgiahoc WHERE diemChu IS NOT NULL;