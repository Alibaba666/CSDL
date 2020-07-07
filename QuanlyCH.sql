CREATE DATABASE QuanLyCH
go

-- tạo bảng EMPLOYEE

Create Table EMPLOYEE 
 (
   E_ID char(5) primary key,
   E_NAME nvarchar(30) not null,
   E_ADDRESS nvarchar(100) not null,
   E_SALARY int not null
 )
 go
 -- tạo bảng SHELF

 Create Table SHELF 
 (
	S_ID char(5) primary key, 
	S_NAME nvarchar(5) not null,
	S_ADDRESS char(5) not null
)
go

 --tạo bảng MANAGER

 Create Table MANAGER 
 (
	M_ID char(5) primary key, 
	M_NAME nvarchar(100), 
	M_ADDRESS nvarchar(100),
	M_SALARY int
)

go

-- tạo bảng KIND

Create Table KIND 
(
	K_ID char(5) primary key, 
	K_NAME nvarchar(30), 
	S_ID char(5) foreign key references SHELF (S_ID)
)
go

-- tạo bảng CUSTOMER

Create Table CUSTOMER 
(
	C_ID char(5) primary key, 
	C_NAME nvarchar(100), 
	C_ADDRESS nvarchar(100), 
	E_ID char(5) foreign key references EMPLOYEE (E_ID)
)
go

-- tạo bảng DISKS

Create Table DISKS 
(
	D_ID char(5) primary key, 
	D_NAME nvarchar(30), 
	D_AUTHORS nvarchar(100), 
	D_COST int, 
	D_DATE int, 
	D_NUMBER int, 
	K_ID char(5) foreign key references KIND (K_ID)
)
go

-- tạo bảng PUBLISHER

Create Table PUBLISHER 
(
	P_ID char(5) primary key, 
	P_NAME nvarchar(100), 
	P_ADDRESS nvarchar(100)
)
go

--tạo bảng INVOICES_OUT

Create Table INVOICES_OUT 
(
	OUT_ID char(5) primary key, 
	OUT_DATE date, 
	E_ID char(5) foreign key references EMPLOYEE (E_ID), 
	C_ID char(5) foreign key references CUSTOMER (C_ID),
	D_ID char(5) foreign key references DISKS (D_ID)
)
go

-- tạo bảng INVOICES_IN

Create Table INVOICES_IN 
(
	IN_ID char(5) primary key, 
	IN_DATE date, 
	E_ID char(5) foreign key references EMPLOYEE (E_ID), 
	D_ID char(5) foreign key references DISKS (D_ID), 
	P_ID char(5) foreign key references PUBLISHER (P_ID)
)
go

-- Nhập dữ liệu cho bảng EMPLOYEE
insert into EMPLOYEE values('E001',N'Nguyễn Văn A',N'Hồ Chí Minh',5000000)
insert into EMPLOYEE values('E002',N'Nguyễn Văn B', N'Hồ Chí Minh',4500000)
insert into EMPLOYEE values('E003',N'Nguyễn Văn C',N'Hồ Chí Minh',5500000)

select * from EMPLOYEE

-- Nhập dữ liệu cho bảng SHELF
insert into SHELF values('S001',N'Số 1','A')
insert into SHELF values('S002',N'Số 2','B')
insert into SHELF values('S003',N'Số 3','C')

select * from SHELF

-- Nhập dữ liệu cho bảng MANAGER
insert into MANAGER values('M001',N'Nguyễn Văn Một',N'Hồ Chí Minh',7000000)
insert into MANAGER values('M002',N'Nguyễn Văn Hai',N'Hồ Chí Minh',6500000)

select * from MANAGER

-- Nhập dữ liệu cho bảng KIND
insert into KIND values('K001',N'Hoạt Hình','S001')
insert into KIND values('K002',N'Phiêu Lưu','S003')
insert into KIND values('K003',N'Hành Động','S002')

select * from KIND

-- Nhập dữ liệu cho bảng CUSTOMER
insert into CUSTOMER values('C001',N'Hồ Nhất',N'Hồ Chí Minh','E001')
insert into CUSTOMER values('C002',N'Chu Nhất',N'Hồ Chí Minh','E001')
insert into CUSTOMER values('C003',N'Bùi Tam',N'Hồ Chí Minh','E003')

select * from CUSTOMER

-- Nhập dữ liệu cho bảng DISKS
insert into DISKS values('D001',N'DORAEMON',N'Fujiko Fujio',10000,1996,20,'K001')
insert into DISKS values('D002',N'Dế mèn phiêu lưu ký',N'Tô Hoài',15000,1941,13,'K002')
insert into DISKS values('D003',N'Diệp Vấn',N'Trần Đại Lợi',20000,2008,15,'K003')

select * from DISKS

-- Nhập dữ liệu cho bảng PUBLISHER
insert into PUBLISHER values('P001',N'Kim Đồng',N'Hà Nội')
insert into PUBLISHER values('P002',N'Trí Việt',N'Hồ Chí Minh')
insert into PUBLISHER values('P003',N'Trí Việt',N'Hồ Chí Minh')

select * from PUBLISHER

-- Nhập dữ liệu cho bảng INVOICES_OUT 
insert into INVOICES_OUT values('O01','20190206','E001','C002','D001')
insert into INVOICES_OUT values('O02','20190519','E003','C002','D003')
insert into INVOICES_OUT values('O03','20201119','E001','C003','D003')

select * from INVOICES_OUT

-- Nhập dữ liệu cho bảng INVOICES_IN 
insert into INVOICES_IN values('I01','20201101','E002','D003','P001')
insert into INVOICES_IN values('I02','20200902','E002','D001','P002')
insert into INVOICES_IN values('I03','20200529','E002','D003','P001')

select * from INVOICES_IN


