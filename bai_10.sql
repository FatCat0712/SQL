-- thêm dữ liệu vào bảng
-- thêm dữ liệu cho một cột
INSERT INTO sinhvien(maSinhVien)
VALUE(06);
-- thêm dữ liệu cho 1 hàng
INSERT INTO sinhvien(maSinhVien,hoDem,ten,ngaySinh,namNhapHoc,maChuongTrinhDaoTao,gioiTinh)
VALUES(07,"Võ Đức","Phương","1997-09-07",2020,"KHMT","Nam");
-- thêm dữ liệu cho nhiều hàng
-- thêm dữ liệu cho bảng sinh viên
INSERT INTO sinhvien(maSinhVien,hoDem,ten,ngaySinh,namNhapHoc,maChuongTrinhDaoTao,gioiTinh)
VALUES ("08,"Nguyễn Đặng","Kỳ Phương","2001-01-01",2020,"TC","Nam"),
		 ("09"Trần Thanh","Quang","2002-02-01",2020,"QTKD","Nam"),	
		 ("10,"Nguyễn Thị","Hiếu Thảo","2002-09-04",2020,"QTKD","Nữ");
-- thêm dữ liệu cho bảng chương trình đào tạo
INSERT INTO chuongtrinhdaotao(maChuongTrinhDaoTao,tenNganh,tongSoTinChi,namBatDauDaoTao)
VALUES ("NNA","Ngôn Ngữ Anh",120,2020),
		 ("QHQT","Quan Hệ Quốc Tế",130,2020),
		 ("DLKS","Du Lịch Khách Sạn",130,2020),
		 ("CNTP","Công Nghệ Thực Phẩm",120,2021),
		 ("ATTT","An Toàn Thông Tin",130,2020);
-- thêm dữ liệu cho bảng môn học
INSERT INTO 
monhoc(maMonHoc,tenMonHoc,soTinChi,namBatDauApdung,theLoai,moTaTomTat,moTaDayDu,mucTieuDauRa,hinhThucDanhGia,maChuongTrinhDaoTao)
VALUES("MMT","Mạng máy tính",4,2023,"Bắt buộc","kiến thức về mạng","hiểu về mạng máy tính","nắm kiến thức về mạng máy tính","Thi viết","ATTT"),
		("HĐH","Hệ điều hành",4,2022,"Bắt buộc","kiến thức về hệ điều hành","hiểu về hệ điều hành","nắm kiến thức về hệ điều hành","Thi viết","CNTT"),
		("KTMM","Kĩ thuật mật mã",4,2024,"Bắt buộc","kiến thức về mã hóa", "hiểu về mã hóa","nắm được kiến thức về mã hóa","Thi viết","ATTT"),
		("KTVM","Kinh tế vĩ mô",4,2022,"Bắt buộc","kiến thức kinh tế","hiểu về vĩ mô kinh tết","nắm được kiến thức về kinh tế","Thi viết","QTKD"),
		("VMM","Văn minh mỹ",3,2021,"Bắt buộc","kiến thức về văn hóa", "hiểu về văn hóa mỹ","nắm được kiến thức về văn hóa mỹ","Thi viết","QHQT");
-- thêm dữ liệu cho bảng nhân viên
INSERT INTO nhanvien(hoDem,ten,theLoai,ngaySinh,gioiTinh)
VALUES("Mai Hắc","Sơn","Hỗ trợ kĩ thuật","1959-08-30","Nam"),
		("Võ Thị Kim","Thanh","Bếp trưởng","1964-06-08","Nữ"),
		("Trần Thị","Dung","Bếp phó","1968-01-02","Nữ"),
		("Võ Đức","Phong","Trưởng phòng đối ngoại","2003-09-07","Nam"),
		("Trần Thị","Xuyến","Trưởng phòng marketing","1970-07-08","Nữ");

-- thêm dữ liệu cho bảng lớp học phần
INSERT INTO lophocphan(maMonHoc,namHoc,hocKy,maGiangVien,ngonNguGiangDay,soLuongSinhVien)
VALUES("HĐH",2022,"học kỳ 2",2,"tiếng anh",80),
		("KTMM",2024,"học kỳ 2",3,"tiếng việt",60),
		("VMM",2022,"học kỳ 1",4,"tiếng anh",30),
		("MMT",2021,"học kỳ 2",1,"tiếng anh",50),
		("KTVM",2020,"học kỳ 2",11,"tiếng anh",40);

-- thêm dữ liệu cho bảng thamgiahoc
INSERT INTO thamgiahoc(maLopHocPhan,maSinhVien,diemSo,diemChu)
VALUES(11,"01",8.5,"B+"),
		(10,"08",8.0,"B+"),
		(14,"04",7.5,"B"),
		(9,"10",6.5,"B-"),
		(13,"07",9.0,"A");
-- thêm dữ liệu cho bảng người dùng
INSERT INTO nguoidung(tenNguoiDung,matKhau,theLoai,maNhanVien)
VALUES("xuyen123","abc@123","nhân viên",11),
		("phongvo","abc@phong","nhân viên",10),
		("trungnguyen1985","tuitentrung","nhân viên",6);

INSERT INTO nguoidung(tenNguoiDung,matKhau,theLoai,maSinhVien)
VALUES("titi","van@511","sinh viên","04"),
		("haimapdit","hai113","sinh viên","05");