# 📊  SQLytics for Retail (SQL + Analytics)

## 📝 Project Overview

This project showcases an end-to-end data analysis workflow on a simulated retail sales dataset using MySQL. The primary goal is to derive actionable business insights from transactional data, such as sales patterns, product trends, and customer segments. Designed to simulate real-world analytics scenarios, the project demonstrates SQL proficiency, analytical thinking, and domain understanding expected from a Data Analyst in the retail or e-commerce sectors.

## 🎯 Key Objectives

- Set up a retail sales database from raw transactional data
- Perform data profiling, including null value detection, duplicate checks, and schema validation
- Clean and transform data to ensure consistency and reliability
- Conduct exploratory data analysis (EDA) entirely in SQL
- Answer realistic business questions about product sales, customer segments, and seasonal trends
- Write optimized, reusable SQL queries for future reporting and analysis
- Document each data-cleaning and analysis step for clear reproducibility

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


 ## 📈 Key Business Insights

- Identified Clothing as the top-selling product category in Nov 2022.
- Customers aged 20–29 placed the highest number of orders.
- Female customers preferred clothing and footwear; males leaned toward electronics.
- Sales spiked in November, showing strong seasonal demand (possibly Black Friday/Cyber Monday).
- Orders with quantity > 3 hint at bulk buying or promotional sales.
- Products with high COGS often showed high sales volume — an opportunity to optimize profit margins.

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



 

