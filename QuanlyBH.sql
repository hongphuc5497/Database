CREATE TABLE KHACHHANG
(makh int, hoten text, diachi nvarchar(100), sodt int, ngaysinh datetime, doanhso int, ngaydk datetime);
 ALTER TABLE KHACHHANG 
 ADD CONSTRAINT PK_KHACHHANG PRIMARY KEY(makh);
create table NHANVIEN
(manv int, hoten text, ngayvl datetime, sodt int, constraint PK_NHANVIEN primary key(manv));
create table SANPHAM 
(masp int, tensp text, dvt nvarchar(10), nuocsx nvarchar(20), gia int, constraint PK_SANPHAM primary key(masp));
create table HOADON
(sohd int, ngayhd datetime, makh int, manv int, trigia int);
alter table HOADON add constraint PK_HOADON primary key(sohd);
alter table HOADON add constraint FK_HOADON_manv_NHANVIEN foreign key (manv) references NHANVIEN(manv);
alter table HOADON add constraint FK_HOADON_makh_KHACHHANG foreign key (makh) references KHACHHANG(makh);
create table CTHD 
(sohd int, masp int, sl int);
alter table CTHD add constraint FK_CTHD_sohd_HOADON foreign key(sohd) references HOADON(sohd);
alter table CTHD add constraint FK_CTHD_masp_SANPHAM foreign key(masp) references SANPHAM(masp);

alter table SANPHAM add ghichu varchar(20);
alter table KHACHHANG add loaikh tinyint;
alter table SANPHAM modify column SANPHAM varchar(100);
alter table SANPHAM drop column ghichu;







