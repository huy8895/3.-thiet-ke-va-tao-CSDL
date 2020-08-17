create database quanlythuvien;
use quanlythuvien;

create table Book(
    bookCode varchar(15) primary key ,
    bookName varchar(50) not null ,
    author varchar(30) not null ,
    price double not null,
    category varchar(50) not null
);

create table Student(
    studentID varchar(15) primary key ,
    studentName varchar(50) not null ,
    address varchar(500) not null ,
    email varchar(50) not null ,
    image varchar(50) not null
);

create table Category(
    bookCategory varchar(15) primary key ,
    description varchar(50) not null
);

create table BorrowOrder(
    bookCode varchar(15) not null ,
    studentID varchar(15) not null ,
    dateBorrowing DATE not null,
    deadLine DATE default (dateBorrowing + 30),
    constraint primary key (bookCode,studentID)
);

create table