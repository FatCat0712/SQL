-- sử dụng câu lệnh SELECT
-- chọn tất cả các dữ liệu của một bảng
SELECT * FROM sinhvien;

-- chọn một số cột cụ thể của bảng
SELECT maSinhVien,hoDem,ten,ngaySinh FROM sinhvien;

-- DISTINCT loại bỏ những dữ liệu có giá trị giống nhau của cột
SELECT DISTINCT maChuongTrinhDaoTao FROM sinhvien;
SELECT DISTINCT gioiTinh FROM sinhvien;

-- lệnh SELECT cho bảng chương trình đào tạo
SELECT * FROM chuongtrinhdaotao;
SELECT maChuongTrinhDaoTao,tenNganh FROM chuongtrinhdaotao;
SELECT tenNganh, tongSoTinChi,namBatDauDaoTao FROM chuongtrinhdaotao;
SELECT DISTINCT tongSoTinChi FROM chuongtrinhdaotao;
SELECT maChuongTrinhDaoTao,namBatDauDaoTao FROM chuongtrinhdaotao;

-- lệnh SELECT cho bảng lớp học phần
SELECT * FROM lophocphan;
SELECT maMonHoc,namHoc,hocKy FROM lophocphan;
SELECT DISTINCT namHoc FROM lophocphan;
SELECT DISTINCT hocKy FROM lophocphan;
SELECT maMonHoc,namHoc,hocKy,soLuongSinhVien FROM lophocphan;

-- lệnh SELECT cho bảng môn học
SELECT * FROM monhoc;
SELECT tenMonHoc,soTinChi,namBatDauApdung,maChuongTrinhDaoTao FROM monhoc;
SELECT maMonHoc,tenMonHoc,maChuongTrinhDaoTao FROM monhoc;
SELECT DISTINCT maChuongTrinhDaoTao FROM monhoc;
SELECT DISTINCT soTinChi FROM monhoc;

-- lệnh SELECT cho bảng người dùng
SELECT tenNguoiDung,matKhau FROM nguoidung;
SELECT DISTINCT theLoai FROM nguoidung;
SELECT DISTINCT tenNguoiDung,maNhanVien FROM nguoidung;
SELECT DISTINCT tenNguoiDung,maSinhVien FROM nguoidung;
SELECT * FROM nguoidung;

-- lệnh SELECT cho bảng nhân viên
SELECT maNhanVien,hoDem,ten,gioiTinh FROM nhanvien;
SELECT hoDem,ten,theLoai,ngaySinh FROM nhanvien;
SELECT maNhanVien,hoDem,ten FROM nhanvien;
SELECT * FROM nhanvien;
SELECT DISTINCT theLoai FROM nhanvien;

-- lệnh SELECT cho bảng sinh viên
SELECT hoDem,ten,ngaySinh,maChuongTrinhDaoTao FROM sinhvien;
SELECT maSinhVien,hoDem,ten FROM sinhvien;
SELECT DISTINCT maChuongTrinhDaoTao FROM sinhvien;
SELECT DISTINCT gioiTinh FROM sinhvien;
SELECT hoDem,ten,ngaySinh FROM sinhvien;

-- lệnh SELECT cho bảng tham gia học
SELECT * FROM thamgiahoc;
SELECT maSinhVien,diemSo,diemChu FROM thamgiahoc;



