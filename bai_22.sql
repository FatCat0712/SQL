-- toán tử BETWEEN trả về dữ liệu nằm trong một khoảng cho trước

-- tìm những sinh viên có năm nhập học từ năm 2021 đến năm 2022
SELECT * FROM sinhvien WHERE namNhapHoc BETWEEN 2021 AND 2022;

-- tìm những sinhvien có ngày sinh từ ngày 01-01-1999 đến ngày 30-06-1999
SELECT * FROM sinhvien WHERE namNhapHoc BETWEEN "1999-01-01" AND "1999-06-30";


-- tìm những sinh viên có điểm số từ 5 đến 8
SELECT * FROM sinhvien WHERE maSinhVien IN ( SELECT maSinhVien FROM thamgiahoc WHERE diemSo BETWEEN 5 AND 8); 

-- tìm những nhân viên có năm sinh từ 1980 đến năm 2000
SELECT * FROM nhanvien WHERE ngaySinh BETWEEN "1980-01-01" AND "2000-01-01";

-- chọn những ngành có được bắt đầu đào tạo từ năm 2020 đến năm 2024
SELECT * FROM chuongtrinhdaotao WHERE namBatDauDaoTao BETWEEN 2020 AND 2024;

-- chọn những nhân viên có ngày sinh từ ngày 01-01-1995 trở về sau
SELECT * FROM nhanvien WHERE ngaySinh BETWEEN "01-01-1995" AND "01-01-2024";

