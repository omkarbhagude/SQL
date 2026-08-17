create database window_function;

use window_function;

CREATE TABLE employee_products (
    Employee_ID INT,
    Employee_Name VARCHAR(50),
    Department VARCHAR(30),
    Product VARCHAR(50),
    Category VARCHAR(30),
    Salary INT,
    Quantity_Sold INT,
    Total_Sales INT
);

INSERT INTO employee_products
(Employee_ID, Employee_Name, Department, Product, Category, Salary, Quantity_Sold, Total_Sales)
VALUES
(101,'Rahul','Sales','Laptop','Electronics',45000,12,720000),
(102,'Priya','Sales','Mobile','Electronics',38000,25,500000),
(103,'Amit','Marketing','Headphones','Accessories',42000,30,150000),
(104,'Sneha','Sales','Laptop','Electronics',52000,18,1080000),
(105,'Rohit','HR','Office Chair','Furniture',35000,15,225000),
(106,'Neha','Marketing','Keyboard','Accessories',40000,35,140000),
(107,'Akash','Sales','Mobile','Electronics',48000,20,400000),
(108,'Pooja','HR','Desk','Furniture',37000,10,180000),
(109,'Karan','Marketing','Monitor','Electronics',55000,14,420000),
(110,'Riya','Sales','Tablet','Electronics',46000,22,550000);

select *,
   row_number() over ( partition by Category order by salary asc) as new_column
   from employee_products;
   
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Amit',   'IT',       60000),
(2, 'Rahul',  'IT',       75000),
(3, 'Priya',  'HR',       50000),
(4, 'Sneha',  'HR',       75000),
(5, 'Rohan',  'Finance',  90000),
(6, 'Neha',   'Finance',  60000),
(7, 'Vikas',  'IT',       90000),
(8, 'Pooja',  'HR',       50000),
(9, 'Akash',  'Finance',  75000),
(10, 'Kiran', 'IT',       60000),
(11, 'Anjali', 'Finance', 90000),
(12, 'Suresh', 'HR',       65000),
(13, 'Manish', 'IT',       75000),
(14, 'Riya',   'Finance', 60000),
(15, 'Nikhil', 'HR',       75000);

SELECT
    emp_id,
    emp_name,
    department,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

select *,
ntile(2) over(order by salary desc) as bucket 
from employees;
