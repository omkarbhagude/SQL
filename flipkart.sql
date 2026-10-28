use flipkart_ecommerce ;

select product_name, price
from Products
where price between 1000 and 5000
order by price asc;

select distinct payment_method
from Orders;

select customer_name, city, state
from Customers
where state in ('Karnataka', 'Tamil Nadu');

select product_id, product_name, category, price
from Products
where product_name like '%Pro%';

select count(*) as returned_orders
from Orders
where order_status = 'Returned';


select o.order_id, c.customer_name, o.order_date,
       o.order_status, o.total_amount
from Orders o
inner join Customers c on o.customer_id = c.customer_id;

select c.customer_id, c.customer_name, COUNT(o.order_id) as order_count from Customers c
left join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name order by order_count desc;

select o.order_id,
       sum(oi.quantity)   as total_quantity,
       sum(oi.item_total) as total_item_value
from Orders o
join Order_Items oi on o.order_id = oi.order_id
group by o.order_id;

select category, round(avg(price), 2) as avg_price
from Products group by category
having avg(price) > 10000
order by avg_price desc;

select product_id, product_name, category
from Products
where product_id not in (
    select distinct product_id from Order_Items
);

select customer_id, count(distinct payment_method) as methods_used
from Orders
group by customer_id
having count(distinct payment_method) > 1
order by methods_used desc;

select order_id, total_amount,
       case
           when total_amount >= 50000 then 'High Value'
           when total_amount >= 10000 then 'Medium Value'
           else 'Low Value'
       end as order_category
from Orders;

select seller_name,
count(*) as line_items_sold, sum(quantity)   as total_units_sold
from Order_Items group by seller_name
order by total_units_sold desc;

select product_id, product_name, price
from Products
where price > (select avg(price) from Products)
order by price desc;

select city as city_name from Customers
union
select shipping_city from Orders;

select product_name, price
from Products
where price = (
    select distinct price
    from Products
	order by price desc
    limit 1 offset 1
);

select customer_id, order_id, order_date,
       row_number() over (partition by customer_id order by order_date) as order_sequence
from Orders
order by customer_id, order_sequence;

select product_id, product_name, category, price,
       rank() over (partition by category order by price desc) as price_rank_in_category
from Products
order by category, price_rank_in_category;




