CREATE DATABASE QUANLYGIAOVU
USE QUANLYGIAOVU
CREATE TABLE KHOA
(
	MAKHOA	char(4),
	TENKHOA	varchar(40),
	NGTLAP	smalldatetime,
	TRGKHOA	char(4)
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC
(
	MAMH	char(10),
	TENMH	varchar(40),
	TCLT	tinyint,
	TCTH	tinyint,
	MAKHOA	char(4),
	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN
(
	MAMH		char(10),
	MAMH_TRUOC	char(10),
	CONSTRAINT PK_DK PRIMARY KEY(MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN
(
	MAGV		char(4),
	HOTEN		varchar(40),
	HOCVI		varchar(10),
	HOCHAM		varchar(10),
	GIOITINH	varchar(3),
	NGSINH		smalldatetime,
	NGVL		smalldatetime,
	HESO		numeric(4,2),
	MUCLUONG	money,
	MAKHOA		char(4),
	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
)

CREATE TABLE LOP
(
	MALOP	char(3),
	TENLOP	varchar(40),
	TRGLOP	char(5),
	SISO	tinyint,
	MAGVCN	char(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN
(
	MAHV		char(5),
	HO		varchar(40),
	TEN		varchar(10),
	NGSINH		smalldatetime,
	GIOITINH	varchar(3),
	NOISINH		varchar(40),
	MALOP		char(3),
	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
)


CREATE TABLE GIANGDAY
(
	MALOP	char(3),
	MAMH	char(10),
	MAGV	char(4),
	HOCKY	tinyint,
	NAM	smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	CONSTRAINT PK_GD PRIMARY KEY(MALOP,MAMH)
)

CREATE TABLE KETQUATHI
(
	MAHV	char(5),
	MAMH	char(10),
	LANTHI	tinyint,
	NGTHI	smalldatetime,
	DIEM	numeric(4,2),
	KQUA	varchar(10),
	CONSTRAINT PK_KQ PRIMARY KEY(MAHV,MAMH,LANTHI)
);
ALTER TABLE HOCVIEN ADD CONSTRAINT M CHECK(GIOITINH IN ('NAM','NU'))

ALTER TABLE KETQUATHI ALTER COLUMN DIEM NUMERIC(4,2)
ALTER TABLE KETQUATHI ADD CONSTRAINT K CHECK(DIEM BETWEEN 0 AND 10)

ALTER TABLE KETQUATHI ADD CONSTRAINT L CHECK(((KQUA='DAT')AND(DIEM BETWEEN 5 AND 10)) OR((KQUA='KHONG DAT')AND(DIEM <5)))

ALTER TABLE KETQUATHI ADD CONSTRAINT LAN CHECK(LANTHI<=3)

ALTER TABLE GIANGDAY ADD CONSTRAINT HK CHECK (HOCKY BETWEEN 1 AND 3)

ALTER TABLE GIAOVIEN ADD CONSTRAINT HVI CHECK(HOCVI IN('CN','KS','THS','TS','PTS')) 



