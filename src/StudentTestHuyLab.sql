create database StudentTest;

use StudentTest;
# Sử dụng alter để sửa đổi
create table Test(
    testID int primary key ,
    Name varchar(20) not null
);

create table Student (
    RN int primary key ,
    Name VARCHAR(20) not null ,
    Age tinyint not null
);

create table StudentTest(
    RN int not null ,
    TestID int not null ,
    Date DATE not null ,
    Mark FLOAT ,

    constraint foreign key
        (RN) references Student(RN),
    constraint foreign key
        (TestID) references Test(testID)

);

insert into Student
values
(1,'Nguyen Hong Ha',20),
(2,'Truong Ngoc Anh',30),
(3,'Tuan Minh',25),
(4,'Dan Truong',22);

insert into Test
values
(1,'EPC'),
(2,'DWMX'),
(3,'SQL1'),
(4,'SQL2');

insert into StudentTest
values
(1,1,'2006-07-18',8),
(1,2,'2006-07-18',5),
(1,3,'2006-07-19',7),
(2,1,'2006-07-17',7),
(2,2,'2006-07-18',4),
(2,3,'2006-07-19',2),
(3,1,'2006-07-17',10),
(3,3,'2006-07-18',1);

# 2. Sử dụng alter để sửa đổi
# Thêm ràng buộc dữ liệu cho cột age với giá trị thuộc khoảng: 15-55
alter table Student
add CONSTRAINT check_age check ( 15 <= Age and Age <= 55 );

# Thêm giá trị mặc định cho cột mark trong bảng StudentTest là 0
alter table StudentTest
alter Mark set default (0);

# Thêm khóa chính cho bảng studenttest là (RN,TestID)
alter table StudentTest
add constraint
    primary key (RN,TestID);

# Thêm ràng buộc duy nhất (unique) cho cột name trên bảng Test
alter table Test
add constraint unique_name unique (Name);

#1.Xóa ràng buộc duy nhất (unique) trên bảng Test
alter table Test
drop constraint unique_name;

#2.Hiển thị danh sách các học viên đã tham gia thi,
select
       Student.Name ,
       Test.Name,
       StudentTest.Mark,
       StudentTest.Date
from
     Student,Test,StudentTest;

#3.Hiển thị danh sách các bạn học viên chưa thi môn nào
use StudentTest;
select Student.RN,Name,Age from Student
left join StudentTest
on Student.RN = StudentTest.RN
where StudentTest.RN is null;

#4.Hiển thị danh sách học viên phải thi lại, điểm nhỏ hơn 5
use StudentTest;
select Student.Name, Test.Name, Mark,StudentTest.Date
from StudentTest,Student,Test
where Student.RN = StudentTest.RN
  and StudentTest.TestID = Test.testID
    and Mark < 5;

#5. Hiển thị danh sách học viên và điểm trung bình(Average) của các môn đã thi.
# Danh sách phải sắp xếp theo thứ tự điểm trung bình giảm dần

select Student.Name, AVG(Mark) as Average from Student,StudentTest
where StudentTest.RN = Student.RN
group by Name
order by Average desc ;

#6. Hiển thị tên và điểm trung bình
# của học viên có điểm trung bình lớn nhất

select  Student.Name , AVG(Mark) as Average from StudentTest,Student
where Student.RN = StudentTest.RN
group by Name
order by Average desc
limit 1;

#7. Hiển thị điểm thi cao nhất của từng môn học. // chua lam duoc
select Test.Name, Mark as 'Max Mark' from StudentTest, Test
where StudentTest.TestID = Test.testID;

#8. Hiển thị danh sách tất cả các học viên và môn học mà các học viên
# đó đã thi nếu học viên chưa thi môn nào thì phần tên môn học để Null:

select Student.Name,Test.Name from Student
left join (StudentTest,Test)
on Student.RN = StudentTest.RN and StudentTest.TestID = Test.testID;


#9. Sửa (Update) tuổi của tất cả các học viên mỗi người lên một tuổi.

update Student
set Age = Age + 1;

#10.Thêm trường tên là Status có kiểu Varchar(10) vào bảng Student.

alter table Student
add Status varchar(10);

#11 cap nhat status old and young 30; va hien thi bang student
update Student
set Status = (
    case    when Age < 30 then 'young'
            when Age > 30 then 'old'
     end);

select * from Student;

#12Hiển thị danh sách học viên và điểm thi,
# dánh sách phải sắp xếp tăng dần theo ngày thi

select Student.Name , Test.Name, Mark,Date from StudentTest
left join (Student , Test)
    on Student.RN = StudentTest.RN
        and StudentTest.TestID = Test.testID
order by Date;

#13.  Hiển thị các thông tin sinh viên có tên bắt đầu bằng ký tự ‘T’
# và điểm thi trung bình >4.5. Thông tin bao gồm Tên sinh viên, tuổi, điểm trung bình

select Student.Name,Student.Age ,AVG(Mark) as Average from Student,StudentTest
where StudentTest.RN = Student.RN
  and (Name like 'T%')
  and (select AVG(Mark) from StudentTest
        where Student.RN = StudentTest.RN group by Name) > 4.5
group by Name,Age;


#14. Hiển thị các thông tin sinh viên (Mã, tên, tuổi, điểm trung bình, xếp hạng).
# diem trung binh cao nhat xep hang 1;
#code mau~
select AVG(Mark), @xepHang := @xepHang + 1 xepHang
from StudentTest,Student,(SELECT @xepHang := 0) m
where Student.RN = StudentTest.RN
group by Name;

#code that
select Student.RN, Student.Name,Student.Age,AVG(Mark) as diemTrungBinh,@xepHang := @xepHang + 1 xepHang
from Student,(SELECT @xepHang := 0) m,StudentTest
where Student.RN = StudentTest.RN
group by Name,Student.RN,Age;








