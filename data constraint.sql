create database test2;
use test2;

create table test_table2 (
student_name varchar(100) not null,
Age tinyint check(Age >=15),
Hobbies varchar(150) unique,
Certificate varchar(100) default "Data is not available"
 );
 
 select * from test_table2;
 
CREATE TABLE Students1 (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Course VARCHAR(50)
);

select * from Students1;

CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    City VARCHAR(50)
);
select * from Employees;





