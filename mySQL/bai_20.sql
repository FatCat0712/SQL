-- COUNT() trả về số lượng record đáp ứng một điều kiện cụ thể
-- AVG() trả về giá trị trung bình của của các record có giá trị kiểu số thỏa mãn 1 điều kiện cụ thể
-- SUM() trả về tổng các giá trị của của các record có giá trị kiểu số thỏa mã 1 diều kiện cụ thể

-- tìm số lượng sinh viên học ngành CNTT
SELECT COUNT(*) FROM sinhvien WHERE maChuongTrinhDaoTao = "CNTT";

-- tìm số lượng sinh viên nữ
SELECT COUNT(*) FROM sinhvien WHERE gioiTinh = "Nữ";

-- tìm số lượng sinh viên nam học ngành QTKD
SELECT COUNT(*) FROM sinhvien WHERE gioiTinh = "Nam" AND maChuongTrinhDaoTao = "QTKD";

-- tìm số lượng sinh viên đang tham gia học tại trường
SELECT COUNT(*) FROM sinhvien;

-- tìm số lượng tín chỉ trung bình của các ngành đào tạo
SELECT AVG(tongSoTinChi) FROM chuongtrinhdaotao;

-- tìm tổng số lượng tín chỉ và số lượng tín chỉ trung bình của các ngành đào tạo
SELECT SUM(tongSoTinChi), AVG(tongSoTinChi) FROM chuongtrinhdaotao;

-- tìm tổng số lượng sinh viên tham gia lớp học phần
SELECT COUNT(*) FROM thamgiahoc;

-- tính số điểm trung bình của các sinh viên tham gia lớp học phần
SELECT AVG(diemSo) FROM thamgiahoc;

-- tổng điểm của các sinh viên tham gia lớp học phần
SELECT SUM(diemso) FROM thamgiahoc;
