CREATE TABLE KhachHang (
    MaKhachHang VARCHAR(50) PRIMARY KEY,
    HoTen nVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(15),
    CCCD int,
    DiaChi nVARCHAR(255),
    SDT VARCHAR(15)
);
CREATE TABLE NhanVien (
    MaNV VARCHAR(50) PRIMARY KEY,
    HoTen VARCHAR(100),
	ChuyenNganh nvarchar(100),
    NgaySinh DATE,
    GioiTinh Nvarchar(15),
    DiaChi VARCHAR(255),
    SDT VARCHAR(15)
);
CREATE TABLE BacSi (
    MaBacSi VARCHAR(50) PRIMARY KEY,
    HoTen VARCHAR(100),
    NgaySinh DATE,
    GioiTinh VARCHAR(10),
    ChuyenNganh VARCHAR(100),
	SDT VARCHAR(15)
);
CREATE TABLE LichKhamBacSi (
    MaLichKham VARCHAR(50) PRIMARY KEY,
    MaBacSi VARCHAR(50),
    NgayKham DATE,
    ThoiGian TIME,
    TrangThai VARCHAR(50), -- 'Trống' hoặc 'Đã đặt'
	SoLuongDat int,
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi)
);
CREATE TABLE LichHen (
    MaLichHen VARCHAR(50) PRIMARY KEY,
    MaKhachHang VARCHAR(50),
	MaNhanVien varchar(50),
	MaLichKham varchar(50),
    ThoiGian TIMESTAMP,
    NgayDatLich DATE,
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	FOREIGN KEY (MaLichKham) REFERENCES LichKhamBacSi(MaLichKham)
);
CREATE TABLE HoSoBenhAn (
    MaHoSo VARCHAR(50) PRIMARY KEY,
    MaNhanVien VARCHAR(50),
    MaKhachHang VARCHAR(50),
	MaBacSi varchar(50),
    NgayNhapVien DATE,
	NgayTaoHoSo date,
    BenhLy nVARCHAR(255),
    TrieuChung nVARCHAR(255),
    ChuanDoan nVARCHAR(255),
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNV),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
	FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi)
);

CREATE TABLE LichSuKhamBenh (
    MaLichSu VARCHAR(50) PRIMARY KEY,
    MaLichHen VARCHAR(50),
    MaKhachHang VARCHAR(50),
    MaBacSi VARCHAR(50),
    NgayKham DATE,         -- Ngày khám thực tế
    ChanDoan nVARCHAR(255), -- Kết quả chẩn đoán
    MaHoSo VARCHAR(50)
    FOREIGN KEY (MaLichHen) REFERENCES LichHen(MaLichHen),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang),
    FOREIGN KEY (MaBacSi) REFERENCES BacSi(MaBacSi),
	FOREIGN KEY (MaHoSo) REFERENCES HoSoBenhAn(MaHoSo)
);
CREATE TABLE HoaDonThanhToan (
    MaHoaDon VARCHAR(50) PRIMARY KEY,
    MaKhachHang VARCHAR(50),
    NgayThanhToan DATE,
    DonGia int,
    TrangThaiDon VARCHAR(50) default'Chưa đóng',
    DichVu VARCHAR(100),
    ThanhTien DECIMAL(10, 2),
    FOREIGN KEY (MaKhachHang) REFERENCES KhachHang(MaKhachHang)
);


