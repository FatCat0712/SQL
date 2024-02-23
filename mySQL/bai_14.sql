-- ORDER BY sắp xếp bộ kết quả trả về theo thứ tự tăng dần hoặc giảm dần
-- Mặc định là tăng dần

-- truy vấn bảng sinh viên theo cột namNhapHoc tăng dần
SELECT * FROM sinhvien ORDER BY namNhapHoc ASC

-- truy vấn bảng sinh viên theo cột maChuongTrinhDaoTao giảm dần
SELECT * FROM sinhvien ORDER BY maChuongTrinhDaoTao DESC;

-- truy vấn bảng sinh viên sắp xếp theo cột gioiTinh tăng dần
SELECT * FROM sinhvien ORDER BY gioiTinh ASC;

-- truy vấn bảng sinh viên sắp xếp theo cột maChuongTrinhDaoTao tăng dần, namNhapHoc giảm dần
SELECT * FROM sinhvien ORDER BY maChuongTrinhDaoTao ASC, namNhapHoc DESC;


-- truy vấn bảng chuongtrinhdaotao sắp xếp theo cột 
SELECT * FROM chuongtrinhdaotao ORDER BY namBatDauDaoTao DESC;
SELECT * FROM chuongtrinhdaotao ORDER BY tenNganh ASC;
SELECT * FROM chuongtrinhdaotao ORDER BY tenNganh ASC, tongSoTinChi DESC;
SELECT * FROM chuongtrinhdaotao ORDER BY maChuongTrinhDaoTao DESC;
SELECT * FROM chuongtrinhdaotao ORDER BY tongSoTinChi DESC, namBatDauDaoTao DESC;


-- truy vấn bảng lophocphan sắp xếp theo cột
SELECT * FROM lophocphan ORDER BY namHoc DESC, soLuongSinhVien DESC;
SELECT * FROM lophocphan ORDER BY hocKy DESC, maGiangVien ASC;
SELECT * FROM lophocphan ORDER BY maLopHocPhan DESC;
SELECT * FROM lophocphan ORDER BY maMonHoc ASC;
SELECT * FROM lophocphan ORDER BY soLuongSinhVien ASC;

-- truy vấn bảng monhoc sắp xếp theo cột
SELECT maMonHoc, tenMonHoc, soTinChi FROM monhoc ORDER BY tenMonHoc DESC, soTinChi DESC;
SELECT maMonHoc, tenMonHoc, soTinChi, namBatDauApDung FROM monhoc ORDER BY soTinChi DESC, namBatDauApDung ASC;
SELECT maMonHoc, tenMonHoc, maChuongTrinhDaoTao FROM monhoc ORDER BY maChuongTrinhDaoTao ASC;
SELECT * FROM monhoc ORDER BY namBatDauApDung ASC;
SELECT * FROM monhoc ORDER BY maChuongTrinhDaoTao DESC;

-- truy vấn bảng nguoidung sắp xếp theo cột
SELECT * FROM nguoidung ORDER BY theLoai ASC, maNhanVien ASC;
SELECT * FROM nguoidung ORDER BY maSinhVien ASC;
SELECT * FROM nguoidung ORDER BY tenNguoiDung ASC;
SELECT * FROM nguoidung ORDER BY tenNguoiDung ASC, matKhau DESC;

-- truy vấn bảng nhanvien sắp xếp theo cột
SELECT * FROM nhanvien ORDER BY ngaySinh DESC;
SELECT hoDem,ten FROM nhanvien ORDER BY ten ASC;
SELECT * FROM nhanvien ORDER BY gioiTinh ASC;
SELECT * FROM nhanvien ORDER BY maNhanVien DESC, ngaySinh ASC;
SELECT * FROM nhanvien ORDER BY gioiTinh DESC;

--truy vấn bảng sinhvien sắp xếp theo cột
SELECT * FROM sinhvien ORDER BY maChuongTrinhDaoTao DESC;
SELECT * FROM sinhvien ORDER BY ngaySinh ASC;
SELECT * FROM sinhvien ORDER BY Ten DESC;
SELECT * FROM sinhvien ORDER BY Ten ASC, namNhapHoc DESC;
SELECT * FROM sinhvien ORDER BY Ten ASC, gioiTinh ASC;
