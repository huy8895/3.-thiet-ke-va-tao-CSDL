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

insert into khachhang values
(1,'linh'),
(2,'dung'),
(3,'binh'),
(4,'chau');


select * from sanpham
join hoadonCT
on hoadonCT.maSP = sanpham.masanpham
where hoadonCT.maHD = 1;

select maHD,sum(dongia * soluong) from hoadonCT
group by maHD;

select sum(soluong * dongia) from hoadonCT
join hoadon h on h.maHD = hoadonCT.maHD
where ngaymua = date(now()) ;

