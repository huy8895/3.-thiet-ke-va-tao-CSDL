create database test;
create table sanpham(
    masanpham int primary key ,
    ten varchar(20) not null ,
    gia float
);

create table khachhang(
    makhachhang int primary key ,
    tenkhachhang varchar(20) not null
);

create table hoadon(
    maHD int primary key ,
    maKH int not null ,
    ngaymua DATE,
    constraint foreign key (maKH) references khachhang(makhachhang)

);

create table hoadonCT(
    maSP int not null ,
    maHD int not null ,
    soluong int not null ,
    dongia float,
    constraint primary key (maSP,maHD),
    constraint foreign key (maSP) references sanpham(masanpham),
    constraint foreign key (maHD) references hoadon(maHD)
);

drop table hoadonCT;

show tables ;

insert into 4_baitapluyentap.khachhang (makhachhang, tenkhachhang) values (1, 'linh');
insert into 4_baitapluyentap.khachhang (makhachhang, tenkhachhang) values (2, 'dung');
insert into 4_baitapluyentap.khachhang (makhachhang, tenkhachhang) values (3, 'binh');
insert into 4_baitapluyentap.khachhang (makhachhang, tenkhachhang) values (4, 'chau');


insert into 4_baitapluyentap.hoadon (maHD, maKH, ngaymua) values (1, 1, '2020-08-19');
insert into 4_baitapluyentap.hoadon (maHD, maKH, ngaymua) values (2, 2, '2020-08-18');
insert into 4_baitapluyentap.hoadon (maHD, maKH, ngaymua) values (3, 4, '2020-08-18');
insert into 4_baitapluyentap.hoadon (maHD, maKH, ngaymua) values (4, 4, '2020-08-18');
insert into 4_baitapluyentap.hoadon (maHD, maKH, ngaymua) values (5, 4, '2020-08-18');

insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (2, 1, 4, 1000);
insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (1, 1, 1, 3000);
insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (1, 2, 3, 2000);
insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (1, 3, 2, 1000);
insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (1, 4, 5, 1000);
insert into 4_baitapluyentap.hoadonCT (maSP, maHD, soluong, dongia) values (1, 5, 5, 1000);

insert into 4_baitapluyentap.sanpham (masanpham, ten, gia) values (1, 'dien thoai', null);
insert into 4_baitapluyentap.sanpham (masanpham, ten, gia) values (2, 'may tinh', null);



select * from sanpham
join hoadonCT
on hoadonCT.maSP = sanpham.masanpham
where hoadonCT.maHD = 1;

select maHD,sum(dongia * soluong) from hoadonCT
group by maHD;

select sum(soluong * dongia) from hoadonCT
join hoadon h on h.maHD = hoadonCT.maHD
where ngaymua = date(now()) ;

