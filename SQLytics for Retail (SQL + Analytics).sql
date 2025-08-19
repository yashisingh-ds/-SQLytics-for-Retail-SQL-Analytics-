-- SQLytics for Retail (SQL + Analytics)--
CREATE DATABASE IF NOT exists retail_matrix; -- to check database exist or not--

-- Exploratory Data Analysis( EDA) --
SELECT COUNT(*) FROM retail_sales;          -- record count--
 desc retail_sales;
SELECT * FROM retail_matrix.retail_sales LIMIT 5;   -- rename table name --
alter table retail_matrix.retail_sales rename to retail_sales;

SELECT * FROM retail_matrix.retail_sales ; 
ALTER TABLE retail_sales            -- rename column name --
RENAME COLUMN quantiy TO quantity ;

select * from retail_sales           
where category is null
or 
 gender is null
 or                                  -- to check Null values--
 customer_id is null
 or quantity is null
 or age is null 
 or price_per_unit is null
 or cogs is null
 or total_sale is null ;
 desc retail_sales;
 select* from retail_sales
 order by sale_date asc;           -- sorted the data by sale date --
 
 -- Data and Business Insights  --
 select count(*) from retail_sales;

#  1. How many sales we have ' 
select count(*) as total_sales  from retail_sales;

# 2 .How many Customers we have  in retail_sales.alter
select distinct count(*) as total_customers from retail_sales;

#  3 .categories of products we have 
select distinct category from retail_sales;

# 4 . Write a SQL query to calculate the total sales (total_sale) for each category.
select category ,
sum(total_sale) as total_sales,
count(*) as total_orders
from retail_sales
group by category;

# 5 . Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select category , sale_date
from retail_sales
where category = 'Clothing'
and quantity >= 4;

#6. Calculate the percentage revenue contribution of Clothing.
select round(sum(case when category = 'clothing'
then total_sale else 0 end) * 100.0 / sum(total_sale), 2)
as clothing_revenue_percentage
from retail_sales;

#7 .Which customers are repeat buyers and how much have they spent?
select customer_id, count(*) as total_orders,
sum(total_sale) as total_spent
from retail_sales
group by customer_id
having  total_orders > 1
order by total_orders desc;

# 8.What is the revenue contribution and spending behavior of each age group?
with age_group_sales as (
select floor(age / 10) * 10 as age_group,
sum(total_sale) as total_spent
from retail_sales where age is not null
group by floor(age / 10) * 10
)select age_group,
total_spent,
round(total_spent * 100.0 / (select sum(total_sale) from retail_sales where age is not null), 2) 
as revenue_percentage
from age_group_sales
order by age_group;


#9.Month-over-Month Sales Lift Percentage (Seasonality Analysis)
select 
month(str_to_date(sale_date, '%Y-%m-%d')) as month,
sum(total_sale) as monthly_sales,
round((sum(total_sale) - lag(sum(total_sale)) over (order by month(str_to_date(sale_date, '%Y-%m-%d')))) * 100.0 
/ lag(sum(total_sale)) over (order by month(str_to_date(sale_date, '%Y-%m-%d'))), 2) as sales_lift_percentage
from retail_sales
group by month
order by month;

#10.What is the Peak Sales Day of the Week?
select dayname(str_to_date(sale_date, '%Y-%m-%d')) as day_of_week,
sum(total_sale) as total_sales
from retail_sales
group by day_of_week
order by total_sales desc;

# 11. What is the Average Order Value (AOV) across all sales?
select round(sum(total_sale) * 1.0 / count(*), 2) as avg_order_value
from retail_sales;

# 12.Which Product Category Has the Highest Average Basket Size?
select category,
round(avg(quantity), 2) as avg_items_per_order
from retail_sales
group by category
order by avg_items_per_order desc;

#13. Who are the Top 5 Customers by Spend?
select customer_id, sum(total_sale) as total_spent
from retail_sales
group by customer_id
order by total_spent desc
limit 5;

#14. What % of Total Revenue Comes from the Top 10% Customers?
with customer_spend as (
    select customer_id, sum(total_sale) as total_spent
    from retail_sales
    group by customer_id
),ranked as (
    select customer_id, total_spent,
    ntile(10) over (order by total_spent desc) as decile
    from customer_spend
)select 
round(sum(case when decile = 1 then total_spent else 0 end) * 100.0 / sum(total_spent), 2) as top_10_percent_contribution
from ranked;

#15.What is the Year-over-Year (YoY) Sales Growth?
select 
year(str_to_date(sale_date, '%Y-%m-%d')) as year,
sum(total_sale) as yearly_sales,
round((sum(total_sale) - lag(sum(total_sale)) over (order by year(str_to_date(sale_date, '%Y-%m-%d'))))
* 100.0 / lag(sum(total_sale)) over (order by year(str_to_date(sale_date, '%Y-%m-%d'))),2)
 as yoy_growth_percentage
from retail_sales
group by year
order by year;

#16.Retrieve COGS and Filter Sales Transactions by Date.
select sale_date from retail_sales 
where sale_date > '11-01-2022';

#17 .Query for Analyzing Daily Sales Trend Over Time
select sale_date, sum(total_sale) as daily_sales
from retail_sales
group by sale_date
order by sale_date;

#18 .Query for Analyzing Total Orders per Customer to Assess Repeat Purchase Behavior
select customer_id, count(*) as total_orders
from retail_sales
group by customer_id
order by total_orders desc
limit 5;



 
 
 

