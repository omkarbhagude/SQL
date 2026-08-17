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

alter table test_table drop column Degree;

select * from test_table;

alter table test_table rename column age to Age;

alter table test_table rename to test_4;

select * from test_4;

create table zyz (
username varchar(20),
userid int,
age varchar (30),
email varchar(35)
);

insert into zyz (username,age)
values ("omkar",21);

select * from zyz;

set sql_safe_updates = 0;

update zyz
set userid = 101
where username = "omkar"; 

update zyz 
set userid = 202
where username = "omkar"
and age = 21;

select * from zyz; 

insert into zyz (username,userid)
values ("jay",205);

select * from zyz;

update zyz
set age =
   case 
	when username = 'omkar' then userid * 202
    when username = 'sidd' then userid * 203
    when username = 'aditya' then userid * 204
    when  username = 'jay' then userid * 205 
    else age 
end;

select * from zyz;
