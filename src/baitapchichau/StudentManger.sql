create table Class
(
    ClassID   int                      not null comment 'ma lop hoc',
    StartDate datetime                 null comment 'ngay bat dau',
    Status    bit                      null comment 'tinh trang',
    ClassName varchar(50) charset utf8 not null comment 'ten lop hoc'
);

create table Mark
(
    MarkID    int   not null comment 'Mã Thi',
    SubID     int   not null comment 'Môn thi',
    StudentID int   not null comment 'Mã học viên',
    Mark      float null comment 'Mark'
)
    comment 'diem thi';

create table Student
(
    StudentID   int                      not null comment 'ma hoc vien',
    StudentName varchar(30) charset utf8 not null comment 'ten hoc vien',
    Address     varchar(50) charset utf8 null comment 'dia chi',
    Phone       varbinary(20)            null comment 'dien thoai',
    Status      bit                      null comment 'tinh trang',
    ClassID     int                      null comment 'ma lop hoc'
);

create table Subject
(
    Subject int                      not null comment 'Mã môn học',
    SubName varchar(30) charset utf8 not null comment 'Tên môn học',
    Credit  tinyint                  null comment 'Thời gian học (h)',
    Status  bit                      not null comment 'Tình trạng'
)
    comment 'mon hoc';

use StudentManager;
insert into Student
values (1, 'Nguyễn', 'Ha noi', '0912245678', true, 1);
insert into Student
values (2, 'Trần', 'Ho Chi Minh', '', true, 1);
insert into Student
values (3, 'Mỹ', 'Ha noi', '0122334455', false, 2);
insert into Student
values (4, 'Lệ', 'Hải phòng', '0913113113', true, 1);

use StudentManager;
insert into Subject
values (1, 'CF', 6, 1);
insert into Subject
values (2, 'C', 32, 1);
insert into Subject
values (3, 'HDJ', 38, 1);
insert into Subject
values (4, 'RDBMS', 13, 1);
insert into Subject
values (5, 'project', 8, 0);

use StudentManager;
show tables from StudentManager;
select *
from Student;

alter table Class
    add constraint primary key (ClassID);

alter table Student
    add constraint foreign key (ClassID) references Class (ClassID);

delete from Student
where StudentID = 4;

alter table Student
add constraint primary key (StudentID);

insert into Student values (1,'Nguyễn','Ha noi','0912245678',1,1);
insert into Student values (2,'Trần','Ho Chi Minh','',1,1);
insert into Student values (3,'Mỹ','Ha noi','0122334455',0,2);
insert into Student values (4,'Lệ','Hải phòng','0913113113',1,1);

select * from Student;
