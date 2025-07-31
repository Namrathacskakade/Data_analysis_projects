create database PizzaDB;

#-------------------TOTAL REVENUE--------------------
select sum(total_price) as Total_Revenue from pizza_sales;

#------------------- AVERAGE ORDER VALUE-----------------
select sum(total_price) / count(distinct order_id) as Average_order from pizza_sales;

#--------------------Pizza's sold-------------------------
select sum(quantity) as Pizzas_sold from pizza_sales;

#-------------------Total Orders----------------
select count(distinct order_id) as Total_orders from pizza_sales;

#--------------------Average pizza per order-----------------
select sum(quantity) / count(distinct order_id) as Average_pizza_sold from pizza_sales;


#----------------------Daily trend for orders----------------------
SELECT 
    dayname(STR_TO_DATE(order_date, '%Y-%m-%d')) AS days,
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
WHERE order_date IS NOT NULL
GROUP BY days
LIMIT 0, 1000;


#------------------------Total orders by month-----------------------
select
monthname(str_to_date(order_date,"%Y-%m-%d")) as Months,
count(distinct order_id) as Total_orders
from Pizza_sales
group by 1
order by total_orders desc;


#-------------------------% of sales by category------------------------
select
pizza_category,
round(sum(total_price),2) as Total_sales,
round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as sales_pct
from pizza_sales
group by 1
order by total_sales desc;


#--------------------------% of sales by pizza size------------------------
select
pizza_size,
round(sum(total_price),2)  as Total_sales,
round(sum(total_price) * 100  / (select sum(total_price) from pizza_sales),2) as sales_pct
from pizza_sales
group by 1
order by total_sales desc;



#--------------------------Top 5 pizza name by revenue-----------------------------------
select
pizza_name,
sum(total_price) as Total_revenue
from pizza_sales
group by 1
order by total_revenue desc
limit 5;


#--------------------------Bottom 5 pizza by revenue-------------------------------
select
pizza_name,
sum(total_price) as Total_revenue
from pizza_sales
group by 1
order by total_revenue 
limit 5;


#-------------------------Top 5 pizza by quantity--------------------------------
select
pizza_name,
sum(quantity) as Total_quantity
from pizza_sales
group by 1
order by total_quantity desc
limit 5;



#-------------------------Bottom 5 pizza by quantity--------------------------------
select
pizza_name,
sum(quantity) as Total_quantity
from pizza_sales
group by 1
order by total_quantity 
limit 5;