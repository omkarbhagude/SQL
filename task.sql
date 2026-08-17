create database task;

use task; 

create table product (
productid int primary key,
product_name varchar(25),
sales int(10)
);

create table sales (
sales_id int primary key,
sales_name varchar (100),
price decimal (10,2)
);

alter table sales add column productid int ;

alter table sales add constraint product_sales foreign key (productid) references product (productid);

create table salesman (
salesman_id int primary key,
sales_name varchar (20),
sold_quantity bigint(20)
); 

alter table salesman modify sold_quantity bigint(20);

alter table salesman modify sold_quantity decimal (10,2);

alter table salesman add column sales_id int;

alter table salesman add constraint sales_salesman foreign key (sales_id) references sales (sales_id);

create table quantity (
total_quantity int primary key,
quantity_name varchar (20)
);

alter table quantity add column salesman_id int;

alter table quantity add constraint salesman_quantity foreign key (salesman_id) references salesman (salesman_id);

create table stock (
stock_id int primary key,
stock_name varchar (20),
total_stock decimal(10,2)
);

alter table stock add column total_quantity int;

alter table stock add constraint quantity_stock foreign key (total_quantity) references quantity (total_quantity);

s