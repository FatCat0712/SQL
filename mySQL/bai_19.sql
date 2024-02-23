-- MIN, MAX tìm giá trị nhỏ nhất, lớn nhất của cột

-- tìm giá trị nhỏ nhất của cột tongSoTinChi trong bảng chuongtrinhdaotao
SELECT MIN(tongSoTinChi) FROM chuongtrinhdaotao;

-- tìm giá trị lớn nhất của cột tongSoTinChi trong bảng chuongtrinhdaotao
SELECT MAX(tongSoTinChi) FROM chuongtrinhdaotao;

-- tìm giá trị nhỏ nhất, giá trị lớn nhất của cột tongSoTinChi trong bảng chuongtrinhdaotao
SELECT MIN(tongSoTinChi), MAX(tongSoTinChi) FROM chuongtrinhdaotao;

-- tìm chương trình đào tạo có tổng số tín chỉ thấp nhất
SELECT * FROM chuongtrinhdaotao WHERE tongSoTinChi = (SELECT MIN(tongSoTinChi) FROM chuongtrinhdaotao);

-- tìm sinh viên lớn tuổi nhất 
SELECT * FROM sinhvien WHERE ngaySinh = (SELECT MIN(ngaySinh) FROM sinhvien);

-- tìm sinh viên nhỏ tuổi nhất
SELECT * FROM sinhvien WHERE ngaySinh = (SELECT MAX(ngaySinh) FROM sinhvien);

-- tìm sinh viên nhập học sớm nhất
SELECT * FROM sinhvien WHERE namNhapHoc = (SELECT MIN(namNhapHoc) FROM sinhvien);

-- tìm sinh viên nhập học muộn nhất
SELECT * FROM sinhvien WHERE namNhapHoc = (SELECT MAX(namNhapHoc) FROM sinhvien);

-- tìm nhân viên nam nhỏ tuổi nhất
SELECT * FROM nhanvien WHERE ngaySinh = (SELECT MAX(ngaySinh) FROM nhanvien WHERE gioiTinh = "Nam");

-- tìm nhân viên nữ lớn tuổi nhất
SELECT * FROM nhanvien WHERE ngaySinh = (SELECT MIN(ngaySinh) FROM nhanvien WHERE gioiTinh = "Nữ");