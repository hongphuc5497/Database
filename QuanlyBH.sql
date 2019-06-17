use QuanlyBH;
-- Tao bang 
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DC	varchar(50),
	SDT	varchar(20),
	NGSINH	date,
	NGDK	date,
	DOANHSO	int,
	constraint PK_KH primary key(MAKH)
);
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	date,	
	constraint PK_NV primary key(MANV)
);
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NSX	varchar(40),
	GIA	int,
	constraint PK_SP primary key(MASP)	
);
CREATE TABLE HOADON(
	MAHD	int not null,
	NGHD 	date,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	int,
	constraint PK_HD primary key(MAHD)
);
CREATE TABLE CTHD(
	MAHD	int,
	MASP	char(4),
	SL	int,
	constraint PK_CTHD primary key(MAHD, MASP)
);

-- Them khoa ngoai
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH);
ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV);
ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_HOADON FOREIGN KEY(MAHD) REFERENCES HOADON(MAHD);
ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_SANPHAM FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP);

-- Insert du lieu
insert into KHACHHANG values('KH01','Nguyen Van Ti','731 Tran Hung Dao, Q5, TpHCM','8823451','2018-12-31','1000-01-01',130600);
insert into KHACHHANG values('KH02','Nguyen Van B','730 Tran Hung Dao, Q5, TpHCM','8823451','2019-12-31','3000-01-01',13060);
insert into KHACHHANG values('KH03','Nguyen Van c','73 Tran Hung Dao, Q5, TpHCM','8823451','2017-12-31','4000-01-01',1300);
insert into NHANVIEN values('NV01','Nguyen Nhu Nhu','927345678','2006-05-12');
insert into NHANVIEN values('NV02','Nguyen Nhu Nh','92734678','2006-06-12');
insert into SANPHAM values('SP01','Tu lanh','cai','VietNam',3000);
insert into SANPHAM values('SP02','Tu lanh','cai','VietNam',300);
insert into SANPHAM values('SP03','Tu lanh','cai','VietNam',30);
insert into HOADON values(1001,'2006-07-23','KH01','NV01',320);
insert into HOADON values(1002,'2006-08-23','KH01','NV01',3200);
insert into HOADON values(1003,'2006-05-23','KH01','NV01',32);
insert into CTHD values(1001,'SP01',1);
insert into CTHD values(1002,'SP02',5);
insert into CTHD values(1003,'SP03',10);

/* Phan 2 */

-- Tim masp, tensp ma nsx la VietNam
select MASP, TENSP 
from SANPHAM where NSX = 'VietNam';
-- Tim masp, tensp ma dvt la 'KG', 'L'
select MASP, TENSP 
from SANPHAM where DVT in('KG','L');
-- Tim masp, tensp ma masp bat dau bang 'A' va ket thuc la '1'
select MASP, TENSP 
from SANPHAM where MASP like 'A%1';
-- Tim masp, tensp ma nsx la VietNam va gia tu 10000-20000
select MASP, TENSP 
from SANPHAM where NSX ='VietNam' and GIA between 10000 and 20000;
-- Tim masp, tensp ma nsx la VietNam hoac Nhat va gia tu 30000- 40000
select MASP,TENSP 
from SANPHAM 
where (NSX ='VietNam' or NSX ='Nhat') and GIA between 30000 and 40000;
-- Tim mahd, tri gia hoa don ma ban ra trong ngay 1/1/2019 va 1/6/2019
select MAHD, TRIGIA 
from HOADON 
where NGHD >= '2019-01-01' and NGHD <= '2019-06-01';
-- Tim mahd, tri gia hoa don ban ra trong thang 1/2019 va sap xep theo ngay(tang dan) va tri gia(giam dan)
select MAHD, TRIGIA 
from HOADON 
where month(NGHD) = 1 and year(MAHD) = 2019 order by NGHD ASC, TRIGIA DESC;
-- Tim makh, hoten khach hang da mua trong ngay 1/1/2019
select KH.MAKH, HOTEN 
from KHACHHANG KH 
join HOADON H on KH.MAKH = H.MAKH 
where NGHD= '2019-01-01';
-- Tim makh, hoten khach hang do nhan vien 'Nguyen Van Ti' lap trong ngay 10/5/2019
select MAHD, TRIGIA 
from HOADON HD 
join NHANVIEN NV on HD.MANV = NV.MANV 
where NGHD = '2019-05-10' and HOTEN = 'Nguyen Van Ti';
-- Tim masp, ten sp duoc khach hang 'Nguyen Van Teo' mua trong thang 5/2019
select  SP.MASP, TENSP 
from SANPHAM SP 
join CTHD CT on CT.MASP = SP.MASP
join HOADON HD on HD.MAHD = CT.MAHD
join KHACHHANG KH on KH.MAKH = HD.MAKH 
where HOTEN = 'Nguyen Van A' 
	and (month(NGHD) = 5 and year(NGHD) = 2019);

/* Phan 3 */

-- Tim ma hoa don da mua san pham co ma 'BB01' hoac 'BB02', moi san pham mua tu 10 - 20
select HD.MAHD 
from HOADON HD
join CTHD CT on CT.MAHD = HD.MAHD
join SANPHAM SP on SP.MASP = CT.MASP 
where CT.MASP in('BB01','BB02') and (SL between 10 and 20);
-- Tim ma hoa don da mua tat ca san pham do Singapore san xuat
select HD.MAHD 
from HOADON HD
join CTHD CT on CT.MAHD = HD.MAHD
join SANPHAM SP on SP.MASP = CT.MASP 
where NSX = 'Singapore';
-- Tim ma hoa don co mua san pham do VietNam san xuat (3 san pham khac nhau)
select HD.MAHD, NSX, SL
from HOADON HD
join CTHD CT on CT.MAHD = HD.MAHD
join SANPHAM SP on SP.MASP = CT.MASP 
where NSX = 'VietNam' and SL >= 3; 
-- Tim hoa don co mua it nhat 4 san pham khac nhau
select distinct HD.MAHD, NSX, SL 
from HOADON HD 
join CTHD CT on CT.MAHD = HD.MAHD
join SANPHAM SP on SP.MASP = CT.MASP 
where SL >=4;











