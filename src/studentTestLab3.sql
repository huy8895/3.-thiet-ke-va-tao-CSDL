use StudentTestLab3;

drop table Subject;
create table Subject(
    SubID int primary key,
    SubName NVARCHAR(30) not null ,
    Credit tinyint not null default (1) check ( Credit >= 1 ),
    Status BIT default (1)
);

create table Student(
    StudentID Int primary key ,
    StudentName Nvarchar(30) not null ,
    Address Nvarchar(50),
    Phone varchar(20),
    Status BIT,
    ClassID int not null
);
truncate table Student;

insert into Student values
(1,'hung','hanoi','0912113113',1,1),
(2,'hung','Hai phong',null,1,1),
(3,'hung','HCM','0123123123',0,2);

select * from Student;

update Student
set Phone = 'no phone'
where Phone is null;
select Phone from Student;

create table Class(
    classID int primary key ,
    className nvarchar(30) not null ,
    startDate Date not null ,
    status BIT
);

insert into Class values
(1,'A1','2008-12-20',1),
(2,'A2','2008-12-22',1),
(3,'B3',now(),0 );

update Class
set className = concat('New ',className) where status = 0;

select * from Class;

show tables ;

create table Mark(
    MarkID int primary key ,
    SubID int not null  ,
    StudentID int not null  ,
    Mark float default (0), check ( Mark between 0 and 100),
    ExamTimes tinyint default 1,
    constraint unique key (SubID,StudentID)
);
alter table Student
add constraint foreign key (ClassID) references Class(classID);

alter table Mark
add constraint foreign key (SubID) references Subject(SubID),
add constraint foreign key (StudentID) references Student(StudentID);

insert into Subject values
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);

drop table Mark;

insert into Mark values
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);

#6g. Hiển thị các thông tin môn học chưa có sinh viên dự thi.

select SubName, Subject.SubID from Subject
left join Mark M on Subject.SubID = M.SubID
where MarkID is null;

#6i. Hiển thị các thông tin sinh viên và điểm trung bình tương ứng.

select S.StudentID,S.StudentName,AVG(Mark) as Average from Student S
left join Mark M on S.StudentID = M.StudentID
group by S.StudentName, S.StudentID;
