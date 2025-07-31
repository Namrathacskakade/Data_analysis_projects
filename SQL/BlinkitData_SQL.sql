create database BlinkIT;
use  blinkit;

########################### KPI's ##################################

# TOTAL SALES
select concat(round(sum(`Total Sales`)/1000000,2),' M') as Total_Sales from blinkitdata;

#Average Sales
select round(avg(`Total Sales`),2) as Avg_Sales from blinkitdata;

#Count of products
select count(`Item Type`) as No_of_Items from blinkitdata;

# Average rating
select round(avg(Rating),2) as Average_Rating from blinkitdata;

############################# Granular requirements ####################

# Total Sales by Fat Content
select `Item Fat Content`, concat(round(sum(`Total Sales`)/1000,2),' K') as Total_sales 
from blinkitdata
group by 1
order by 2 desc;

# Total Sales by Item Type
select `Item Type`,
concat(round(sum(`Total Sales`)/1000,2),' K') as Total_Sales
from blinkitdata
group by 1
order by sum(`Total Sales`) desc;


#Fat Content by Outlet for Total Sales
select `Outlet Location Type`,
`Item Fat Content`,
concat(round(sum(`Total Sales`)/1000,2),' K') as Total_Sales
from blinkitdata
group by 1,2
order by 1;

#Total Sales by Outlet Establishment
select `Outlet Establishment Year`,
concat(round(sum(`Total Sales`)/1000,2),' K') as Total_Sales
from blinkitdata
group by 1
order by 1;

# Percentage of Sales by Outlet Size
select `Outlet Size`,
  concat(round(sum(`Total Sales`)*100/(select sum(`Total Sales`) from blinkitdata),2),'%') as Percentage_sales
  from blinkitdata
  group by 1
  order by 2 desc;


#Sales by Outlet Location
select `Outlet Location Type`,
concat(round(sum(`Total Sales`)/1000,2),' K') as Total_Sales
from blinkitdata
group by 1
order by 2 desc;

#All Metrics by Outlet Type
select `Outlet Type`,
concat(round(sum(`Total Sales`)/1000,2),' K') as Total_sales,
round(avg(`Total Sales`),2) as Avg_Sales,
count(`Item Type`) as No_of_Items ,
round(avg(Rating),2) as Average_Rating
from blinkitdata
group by 1;


