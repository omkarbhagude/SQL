USE flipkart_ecommerce;

select * from Customers;

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

select c.customer_id, c.customer_name, count(o.order_id) as order_count
from Customers c
left join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
order by order_count desc;

select o.order_id,
       sum(oi.quantity)   as total_quantity,sum(oi.item_total) as total_item_value from Orders o
join Order_Items oi on o.order_id = oi.order_id
group by o.order_id;

select category, round(avg(price), 2) as avg_price
from Products
group by category
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

select seller_name, count(*) as line_items_sold,sum(quantity) as total_units_sold
from Order_Items
group by seller_name
order by total_units_sold desc;

select product_id, product_name, price
from Products
where price > (select avg(price) from Products)
order by price desc;

select city as city_name from Customers
union select shipping_city from Orders;

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

WITH state_month AS (
    SELECT shipping_state,
           DATE_FORMAT(order_date, '%Y-%m') AS month,
           SUM(total_amount) AS revenue
    FROM Orders
    WHERE order_status NOT IN ('Cancelled', 'Returned')
    GROUP BY shipping_state, DATE_FORMAT(order_date, '%Y-%m')
)
select shipping_state, month, revenue,
	sum(revenue) over (partition by shipping_state order by month) as cumulative_revenue
from state_month
order by shipping_state, month;

with monthly_orders as (
    select date_format(order_date, '%Y-%m') as month,
           count(*) as order_count
    from Orders
    group by date_format(order_date, '%Y-%m')
)
select month, order_count,
       lag(order_count) over (order by month) as prev_month_count,
       order_count - lag(order_count) over(order by month) as change_in_orders
from monthly_orders
order by month;

with top_customers as (
    select customer_id, COUNT(*) AS order_count
    from Orders
    group by customer_id
    order by order_count desc
    limit 5
)
select tc.customer_id, c.customer_name, o.order_id,
       o.order_date, o.total_amount
from top_customers tc
join Customers c on c.customer_id = tc.customer_id
join Orders o on o.customer_id = tc.customer_id
order by tc.customer_id, o.order_date;

WITH monthly_product_revenue AS (
    SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month,
           p.product_id, p.product_name,
           SUM(oi.item_total) AS revenue
    FROM Orders o
    JOIN Order_Items oi ON o.order_id = oi.order_id
    JOIN Products p     ON oi.product_id = p.product_id
    GROUP BY month, p.product_id, p.product_name
),
ranked AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY month ORDER BY revenue DESC) AS rnk
    FROM monthly_product_revenue
)
SELECT product_id, product_name, COUNT(*) AS months_in_top3
FROM ranked
WHERE rnk <= 3
GROUP BY product_id, product_name
HAVING COUNT(*) > 1
ORDER BY months_in_top3 DESC;

with ordered as (
    select customer_id, order_id, order_date,
	lag(order_date) over(partition by customer_id order by order_date) as prev_order_date
    from Orders
)
select customer_id, order_id, order_date, prev_order_date,
       datediff (order_date, prev_order_date) AS days_since_last_order
from ordered
where prev_order_date is not null
order by customer_id, order_date;

with customer_spend as (
    select customer_id, SUM(total_amount) as total_spent
    from Orders
    where order_status not in ('Cancelled', 'Returned')
    group by customer_id
)
select customer_id, total_spent,
ntile(4) over (order by total_spent desc) as spending_quartile
from customer_spend
order by spending_quartile, total_spent desc;

create view monthly_category_revenue as
select date_format(o.order_date, '%Y-%m') as month,
       p.category,
       sum(oi.item_total) as revenue
from Orders o
join Order_Items oi ON o.order_id = oi.order_id
join Products p     ON oi.product_id = p.product_id
where o.order_status not in ('Cancelled', 'Returned')
group by month, p.category;

select month, revenue
from monthly_category_revenue
where category = 'Smartphones'
order by month;

WITH customer_orders AS (
    SELECT customer_id, order_id, order_date, total_amount,
           AVG(total_amount) OVER (PARTITION BY customer_id) AS avg_order_value,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM Orders
)
SELECT customer_id, order_id, order_date, total_amount, avg_order_value
FROM customer_orders
WHERE rn = 1
  AND total_amount > avg_order_value
ORDER BY total_amount DESC;


