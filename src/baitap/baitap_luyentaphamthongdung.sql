create database 4_baitapluyentap;
create table table_name(
    id int primary key ,
    ten varchar(15) not null ,
    tuoi tinyint not null ,
    khoahoc varchar(15) not null ,
    sotien float
);

insert into table_name values
(1,'hoang',21,'cntt',40000),
(2,'viet',19,'dtvt',30000),
(3,'thanh',18,'ktdn',20000),
(4,'nhan',19,'ck',40000),
(5,'huong',20,'tcnh',250000),
(5,'huong',20,'tcnh',350000);
use 4_baitapluyentap;
show tables ;

select * from table_name;

#- Viết câu lệnh hiện thị tất cả các dòng có tên là Huong

select * from table_name
where table_name.ten = 'huong';

#- Viết câu lệnh lấy ra tổng số tiền của Huong

select ten,sum(sotien) as tong_tien from table_name
where ten = 'huong'
group by ten;

#- Viết câu lệnh lấy ra tên danh sách của tất cả học viên, không trùng lặp

select ten from table_name
group by ten;