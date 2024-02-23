-- mệnh đề JOIN dùng để kết hợp 2 hay nhiều bảng, dựa trên mối quan liên giữa các khóa ngoại ở các bảng
-- INNER JOIN trả về những bản ghi thỏa mãn điều kiện chung từ cả 2 bảng
-- LEFT JOIN trả vể tất cả các bản ghi từ bảng bên trái và các bản ghi phù hợp từ bảng bên phải. Nếu bản ghi bên phải không khớp với bên trái thì bản ghi đó sẽ trả về NULL
-- RIGHT JOIN trả về tất cả các bản ghi từ bảng bên phải và các bản ghi phù hợp từ bảng bên trái. Nếu bản ghi bên trái không khớp với bên phải thì bản ghi đó sẽ trả về NULL
-- CROSS JOIN trả về tất cả các bản ghi ở bảng trái và bảng phải kết hợp lại. Bảng được kết hợp sẽ chứa tất cả các bản ghi từ cả hai bảng.

-- Dùng INNER JOIN cho bảng monhoc và bảng lophocphan
SELECT m.maMonHoc, m.tenMonHoc, l.hocKy
FROM monhoc AS m
INNER JOIN lophocphan AS l
WHERE m.maMonHoc = l.maMonHoc;

-- Dùng LEFT JOIN cho bảng monhoc và bảng lophocphan
SELECT m.maMonHoc, m.tenMonHoc, l.hocKy
FROM monhoc AS m
LEFT JOIN lophocphan AS l
ON m.maMonHoc = l.maMonHoc;

-- Dùng RIGHT JOIN cho bảng monhoc và bảng lophocphan
SELECT m.maMonHoc, m.tenMonHoc, l.hocKy
FROM monhoc AS m
RIGHT JOIN lophocphan AS l
ON m.maMonHoc = l.maMonHoc;

-- DÙNG CROSS JOIN cho bảng monhoc và bảng lophocphan
SELECT m.maMonHoc, m.tenMonHOc, l.hocKy
FROM monhoc AS m
CROSS JOIN lophocphan AS l;

