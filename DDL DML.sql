create database test1;
use test1;

create table test_table (
student_id tinyint primary key,
full_name varchar (100) not null,
age tinyint check (Age >=18),
Email varchar (100) unique ,
Degree varchar (50) default" Data is not available"
);

 

insert into test_table (student_id,full_name,age,Email,Degree)
values (101,"Omkar Bhagude",21,"omkarbhagude@gmail.com","BBA"),
(102,"Siddhant Chikatte",21,"siddhantchikate1@gmail.com","BCA"),
(103,"Mnasi Kale",21,"mansikale12@gmail.com","BCA"),
(104,"Aditya Birajdar",20,"adityabirajdar123@gmail.com","BCOM");

select * from test_table;

alter table test_table add column city varchar(50);

select * from test_table;

alter table test_table modify student_id int not null;
