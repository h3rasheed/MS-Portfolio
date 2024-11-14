/*
    Name: <Haneefuddin Rasheed>
    DTSC660: Data and Database Managment with SQL
    Module 7
    Assignment 5


*/

--------------------------------------------------------------------------------
/*				                 Table Creation		  		                  */
--------------------------------------------------------------------------------
CREATE TABLE customer_spending (
    sale_date DATE,
    sale_year INT,
    sale_month VARCHAR(255),
    age INT,
    gender VARCHAR(50),
    country VARCHAR(255),
    state VARCHAR(255),
    category VARCHAR(255),
    sub_category VARCHAR(255),
    quantity INT,
    unit_cost DECIMAL(10, 2),
    unit_price DECIMAL(10, 2),
    cost DECIMAL(10, 2),
    revenue DECIMAL(10, 2)
);




--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------

 SET datestyle = 'ISO, MDY';

COPY customer_spending FROM 'C:/Users/Public/customer_spending.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Question 1: 		  		                  */
--------------------------------------------------------------------------------

 SELECT category, SUM(revenue) AS total_revenue
FROM customer_spending
WHERE sale_year = 2016
GROUP BY category
ORDER BY category;



--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------
SELECT 
    sub_category,
    AVG(unit_price) AS average_unit_price,
    AVG(unit_cost) AS average_unit_cost,
    AVG(unit_price) - AVG(unit_cost) AS margin
FROM 
    customer_spending
WHERE 
    sale_year = 2015
GROUP BY 
    sub_category
ORDER BY 
    sub_category;
.

--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------
 SELECT COUNT(*) AS total_female_buyers
FROM customer_spending
WHERE gender = 'F' AND category = 'Clothing';
   
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------

   SELECT 
    age,
    sub_category,
    ROUND(AVG(quantity)) AS average_quantity,
    AVG(cost) AS average_cost
FROM 
    customer_spending
GROUP BY 
    age, sub_category
ORDER BY 
    age DESC, sub_category;


--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--------------------------------------------------------------------------------

 SELECT country
FROM customer_spending
WHERE age BETWEEN 18 AND 25
GROUP BY country
HAVING COUNT(*) > 30;


    
--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--------------------------------------------------------------------------------

  SELECT 
    sub_category,
    ROUND(AVG(quantity), 2) AS avg_quantity,
    ROUND(AVG(cost), 2) AS avg_cost
FROM 
    customer_spending
GROUP BY 
    sub_category
HAVING 
    COUNT(*) >= 10
ORDER BY 
    sub_category;


--------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--------------------------------------------------------------------------------

   SELECT 
    sub_category,
    SUM(quantity) AS total_quantity,
    SUM(revenue) AS total_revenue
FROM 
    customer_spending
WHERE 
    gender = 'M' AND sale_year = 2016
GROUP BY 
    sub_category;


--------------------------------------------------------------------------------
/*				                  Question 8           		  		          */
--------------------------------------------------------------------------------

  SELECT 
    country,
    SUM(revenue) AS total_revenue
FROM 
    customer_spending
GROUP BY 
    country
ORDER BY 
    country;


--------------------------------------------------------------------------------
/*				                  Question 9           		  		          */
--------------------------------------------------------------------------------

   SELECT 
    gender,
    category,
    MAX(unit_cost) AS high_cost,
    MIN(unit_cost) AS low_cost,
    AVG(unit_cost) AS avg_cost
FROM 
    customer_spending
GROUP BY 
    gender, category
ORDER BY 
    gender, category;


--------------------------------------------------------------------------------
/*				                  Question 10           		  	          */
--------------------------------------------------------------------------------

 SELECT 
    country,
    AVG(revenue) AS high_sales
FROM 
    customer_spending
GROUP BY 
    country
ORDER BY 
    high_sales DESC
LIMIT 1;
