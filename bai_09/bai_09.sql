CREATE DATABASE truongdaihoc CHARSET "utf8mb4" COLLATE "utf8mb4_general_ci";


CREATE TABLE chuongTrinhDaoTao(
	maChuongTrinhDaoTao CHAR(10),
	tenNganh VARCHAR(255),
	tongSoTinChi FLOAT ,
	namBatDauDaoTao YEAR ,
	
	PRIMARY KEY(maChuongTrinhDaoTao)
);


CREATE TABLE nhanVien(
	maNhanVien INT NOT NULL AUTO_INCREMENT,
	hoDem VARCHAR(30) ,
	ten VARCHAR(30) ,
	theLoai VARCHAR(30) ,
	ngaySinh DATE ,
	
	PRIMARY KEY(maNhanVien)
);

ALTER TABLE nhanvien
ADD COLUMN gioiTinh CHAR(5);

CREATE TABLE sinhVien(
	 maSinhVien VARCHAR(30) NOT NULL,
	 hoDem VARCHAR(30),
	 ten VARCHAR(20),
	 ngaySinh DATE,
	 namNhapHoc YEAR,
	 maChuongTrinhDaoTao CHAR(10),
	 gioiTinh CHAR(5),
	 
	 PRIMARY KEY(maSinhVien),
	 CONSTRAINT FK_sinhvien_chuongtrinhdaotao 
	 FOREIGN KEY (maChuongTrinhDaoTao) REFERENCES chuongtrinhdaotao(maChuongTrinhDaoTao)
);



CREATE TABLE monHoc(
	maMonHoc VARCHAR(30),
	tenMonHoc VARCHAR(255),
	soTinChi FLOAT,
	namBatDauApdung YEAR,
	theLoai VARCHAR(50),
	moTaTomTat VARCHAR(1024),
	moTaDayDu TEXT,
	taiLieu VARCHAR(1024),
	mucTieuDauRa VARCHAR(1024),
	hinhThucDanhGia VARCHAR(1024),
	maChuongTrinhDaoTao CHAR(10),
	
	PRIMARY KEY(maMonHoc),
	CONSTRAINT FK_monhoc_chuongtrinhdaotao 
	FOREIGN KEY (maChuongTrinhDaoTao) REFERENCES chuongtrinhdaotao(maChuongTrinhDaoTao)	
);



CREATE TABLE lopHocPhan(
	maLopHocPhan INT AUTO_INCREMENT,
	namHoc YEAR NOT NULL,
	hocKy VARCHAR(50) NOT NULL,
	maMonHoc VARCHAR(30) NOT NULL,
	maGiangVien INT NOT NULL,
	ngonNguGiangDay VARCHAR(50),
	moTa TEXT,
	soLuongSinhVien TINYINT,
	
	PRIMARY KEY(maLopHocPhan),
	CONSTRAINT FK_lopHocPhan_maMonHoc
	FOREIGN KEY(maMonHoc) REFERENCES monhoc(maMonHoc) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT FK_lopHocPhan_nhanVien
	FOREIGN KEY(maGiangVien) REFERENCES nhanvien(maNhanVien) ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE thamGiaHoc(
	maLopHocPhan INT ,
	maSinhVien VARCHAR(30) ,
	diemSo FLOAT,
	diemChu CHAR(2),
	
	CONSTRAINT FK_thamGiaHoc_lopHocPhan
	FOREIGN KEY (maLopHocPhan) REFERENCES lophocphan(maLopHocPhan),
	
	CONSTRAINT FK_thamGiaHoc_sinhVien
	FOREIGN KEY (maSinhVien) REFERENCES sinhvien(maSinhVien),
	
	PRIMARY KEY(maLopHocPhan,maSinhVien)
);

CREATE TABLE nguoiDung(
	tenNguoiDung VARCHAR(50) NOT NULL,
	matKhau VARCHAR(1024),
	theLoai VARCHAR(50),
	maNhanVien INT,
	maSinhVien VARCHAR(30),

	PRIMARY KEY(tenNguoiDung),
   CONSTRAINT FK_nguoiDung_nhanVien
   FOREIGN KEY(maNhanVien) REFERENCES nhanvien(maNhanVien),
   CONSTRAINT FK_nguoiDUng_sinhVien
   FOREIGN KEY(maSinhVien) REFERENCES sinhvien(maSinhVien)
);	

