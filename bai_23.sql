-- LIkE được sử dụng trong mệnh đề WHERE được sử dùng để truy vấn dữ liệu theo một mẫu nhất định
-- % đại diện cho 0, 1 hoặc nhiều ký tự
-- _ đại diện cho cho duy nhất 1 ký tự

-- tìm những sinh viên có họ Nguyễn 
SELECT * FROM sinhvien WHERE hoDem LIKE "Nguyen%";

-- tìm những sinh viên có tên kết thúc bằng chữ "i"
SELECT * FROM sinhvien WHERE ten LIKE "%i";

-- tìm những sinh viên học những ngành kết thúc bằng chữ "T"
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao LIKE "%T";

-- tìm sinh viên có tên chứa 2 chữ cái và kết thúc bằng chữ "n"
SELECT * FROM sinhvien WHERE ten LIKE "_n";

-- tìm những nhân viên có tên bắt đầu bằng chữ "V"
SELECT * FROM nhanvien WHERE ten LIKE "V%";

-- tìm những sinh viên học ngành bắt đầu bằng chữ "C" và kết thúc bằng chữ "T"
SELECT * FROM sinhvien WHERE maChuongTrinhDaoTao LIKE "C%T";

-- tìm những nhân viên có tên gồm hai chữ cái và bắt đầu bằng chữ "V"
SELECT * FROM nhanvien WHERE ten LIKE "V_";

-- tìm những môn học có tên bắt đầu bằng chữ "K";
SELECT * FROM monhoc WHERE tenMonHoc LIKE "K%";


