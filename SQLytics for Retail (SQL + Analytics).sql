-- SQLytics for Retail (SQL + Analytics)--

-- Exploratory Data Analysis( EDA) --
SELECT COUNT(*) FROM retail_sales;          -- record count--

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
 
 select* from retail_sales
 order by sale_date asc;           -- sorted the data by sale date --
 
 -- Data Analysis and Findings --
 select * from retail_sales;
 
select count(*) from retail_sales;
select transaction_id from retail_sales
limit 10;
 
 select transaction_id , gender from retail_sales;
 select * from retail_sales              -- use of limit --
 order by transaction_id 
 limit 3 ;
 
 
 

