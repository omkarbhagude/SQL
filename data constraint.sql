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

CREATE TABLE Employee_Sales (
    Employee_ID INT,
    Employee_Name VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Gender VARCHAR(10),
    Sales_Amount DECIMAL(10,2)
);

INSERT INTO Employee_Sales
(Employee_ID, Employee_Name, Department, City, Gender, Sales_Amount)
VALUES
(1, 'Amit', 'Sales', 'Pune', 'Male', 45000),
(2, 'Sneha', 'HR', 'Mumbai', 'Female', 30000),
(3, 'Rahul', 'Sales', 'Pune', 'Male', 55000),
(4, 'Priya', 'IT', 'Mumbai', 'Female', 70000),
(5, 'Rohan', 'Sales', 'Nashik', 'Male', 40000),
(6, 'Neha', 'HR', 'Pune', 'Female', 35000),
(7, 'Akash', 'IT', 'Pune', 'Male', 65000),
(8, 'Pooja', 'Sales', 'Mumbai', 'Female', 60000),
(9, 'Vikas', 'IT', 'Nashik', 'Male', 50000),
(10, 'Kavita', 'HR', 'Mumbai', 'Female', 32000),
(11, 'Suresh', 'Sales', 'Pune', 'Male', 48000),
(12, 'Aditya', 'IT', 'Mumbai', 'Female', 75000);

select * from Employee_Sales;


select Department, sum(Sales_Amount) as Total_Amount
from Employee_Sales
group by Department 
having sum(Sales_Amount) >50000.00;

