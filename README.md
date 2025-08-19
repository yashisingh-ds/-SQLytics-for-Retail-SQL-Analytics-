# 📊  SQLytics for Retail (SQL + Analytics)

## 📝 Project Overview

This project demonstrates an end-to-end retail sales analysis using MySQL on a sample dataset of 1,987 transactions. The workflow covers data cleaning, KPI derivation, and exploratory SQL queries to uncover insights on sales performance, customer behavior, and product trends. Although based on a small dataset, the queries are scalable to over 50,000 rows, reflecting real-world analyst challenges. Key outcomes include identifying high-revenue categories, seasonal demand spikes, and demographic purchase patterns, as well as margin optimization opportunities, showcasing both SQL proficiency and business insight generation.

## 🎯 Key Objectives

- Set up a retail sales database from raw transactional data
- Perform data profiling, including null value detection, duplicate checks, and schema validation
- Clean and transform data to ensure consistency and reliability
- Conduct exploratory data analysis (EDA) entirely in SQL
- Answer realistic business questions about product sales, customer segments, and seasonal trends
- Write optimized, reusable SQL queries for future reporting and analysis
- Document each data-cleaning and analysis step for clear reproducibility

  ## 📌 Business Problem  

Retail & e-commerce businesses often face challenges such as:  

- Tracking *sales and profit trends* across categories and seasons  
- Identifying *high- vs low-margin product lines* 
- Understanding *customer demographics and buying behavior* 
- Detecting *bulk-buying patterns* for promotions or wholesale planning  
This project demonstrates how *SQL-based analysis* can be applied end-to-end to solve such problems using transactional sales data.  

  ## 🛠️ Tech Stack

- **MySQL Workbench** (SQL IDE for writing and testing queries)  
- **MySQL Server** (database engine to store and process the data)  
- **GitHub** (version control and portfolio showcase)
  
## 🗂️ Data Preparation & Cleaning

- Renamed columns for clarity  
- Checked for and removed any NULL values  
- Verified that `transactions_id` has no duplicates  
- Sorted the dataset by `sale_time` in ascending order  
- Exported the clean dataset to CSV for reproducibility

 ## 📈 Key Insights Summary  

- **Clothing** contributed ~35% of revenue, peaking in **November** with a 15% seasonal lift.  
- Customers aged **20–29** were the top spenders (~40% of sales).  
- **Bulk orders (>3 items)** formed 12% of transactions, indicating promotion-driven buying.  
- **Electronics** drove high sales but low margins (~8%), highlighting profit optimization opportunities.  
- Clear demographic preferences: **Females → clothing/footwear**, **Males → electronics**.

## 📜 SQL Queries & Insights  
You can view the complete SQL scripts and exploratory queries used in this project here:  

👉 [View SQLytics Queries](https://github.com/yashisingh-ds/-SQLytics-for-Retail-SQL-Analytics-/blob/main/SQLytics%20for%20Retail%20(SQL%20%2B%20Analytics).sql)  

## 🔎 Exploratory Data Analysis (EDA)

Key EDA tasks performed with supporting queries:

**1️⃣ Check the total number of records in the dataset**  

```SQL
SELECT COUNT(*) FROM retail_sales;

**2️⃣ Rename table and columns for consistency **

ALTER TABLE retail_matrix.retail_sales RENAME TO retail_sales;
ALTER TABLE retail_sales RENAME COLUMN quantiy TO quantity;

**3️⃣ Check for NULL values across key columns**

SELECT *
FROM retail_sales
WHERE category IS NULL
  OR gender IS NULL
  OR customer_id IS NULL
  OR quantity IS NULL
  OR age IS NULL
  OR price_per_unit IS NULL
  OR cogs IS NULL
  OR total_sale IS NULL;

**4️⃣ . Check for duplicate transaction IDs **

SELECT transaction_id, COUNT(*)
FROM retail_sales
GROUP BY transaction_id
HAVING COUNT(*) > 1;

**5️⃣ . Sort the data by sale date in ascending order**
SELECT *
FROM retail_sales
ORDER BY sale_date ASC;

**6️⃣ Preview the first 5 rows of the cleaned table**

SELECT *
FROM retail_sales
LIMIT 5;



 

