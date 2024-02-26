-- ALIAS (bí danh) được sử dụng để đặt tên tạm thời cho một bảng hoặc một cột trong bảng
-- Bí danh thường được sử dụng để làm cho tên cột dễ đọc hơn
-- Bí danh chỉ tồn tại trong khoảng thời gian của truy vấn đó
-- Bí danh được tạo bằng từ khóa AS.

-- tạo ALIAS cho bảng
SELECT ctdt.maChuongTrinhDaoTao,ctdt.tongSoTinChi FROM chuongtrinhdaotao AS ctdt;

-- tạo ALIAS cho cột
SELECT ctdt.maChuongTrinhDaoTao AS ID, ctdt.tongSoTinChi AS tinChi FROM chuongtrinhdaotao AS ctdt;

-- tạo ALIAS cho MAX của cột tổng tín chỉ từ bảng chương trình đào tạo
SELECT MAX(tongSoTinChi) AS MAX_tinChi FROM chuongtrinhdaotao;

-- tạo ALIAS cho MIN của cột tổng tín chỉ từ bảng chương trình đào tạo
SELECT MIN(tongSoTinChi) AS MAX_tinChi FROM chuongtrinhdaotao;

-- tạo ALIAS cho MAX của cột số tín chỉ từ bảng môn học
SELECT MAX(soTinCHi) AS MAX_tinChi FROM monhoc;

-- tạo ALIAS cho MIN của cột số tín chỉ từ bảng môn học
SELECT MIN(soTinChi) AS MIN_tinChi FROM monhoc;

-- tạo ALIAS cho MAX của cột diemSo từ bảng thamgiahoc
SELECT MAX(diemSo) AS "Điểm cao nhất" FROM thamgiahoc;

-- tạo ALIAS cho MIN của cột diemSo từ bảng thamgiahoc
SELECT MIN(diemSo) AS "Điểm thấp nhất" FROM thamgiahoc;