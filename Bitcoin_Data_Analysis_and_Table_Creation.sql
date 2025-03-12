/*
Assignment 3 Template
Make sure you read all instructions before completing this template. 
Student Name: Haneefuddin Rasheed 
*/


---PART 1: 
---1. Create Table Statement
CREATE TABLE bitcoin_data (
    trans_date TEXT,  
    price_usd NUMERIC,
    code_size INTEGER,
    sent_by_address INTEGER,
    transactions INTEGER,
    mining_profitability NUMERIC,
    sent_in_usd BIGINT,  
    transaction_fees NUMERIC,
    median_transaction_fee NUMERIC,
    confirmation_time NUMERIC,
    market_cap BIGINT,  
    transaction_value BIGINT,  
    median_transaction_value NUMERIC,
    tweets INTEGER,
    google_trends NUMERIC,
    fee_to_reward NUMERIC,
    active_addresses INTEGER,
    top_100_cap NUMERIC
);



---2.Copy Statement
COPY bitcoin_data
FROM 'C:\Users\Public\bitcoin_data.csv'
WITH (FORMAT CSV, HEADER);









---PART 2:
---Question 1
SELECT * FROM bitcoin_data;


---Question 2
SELECT trans_date, 
       code_size,
       (code_size::NUMERIC / transactions) AS difficulty 
FROM bitcoin_data;



---Question 3 
SELECT trans_date, 
       (median_transaction_fee * transactions) AS daily_cost 
FROM bitcoin_data;



---Question 4
SELECT trans_date, 
       (sent_in_usd::NUMERIC / transactions) AS avg_transaction, 
       median_transaction_value 
FROM bitcoin_data;



---Question 5
SELECT AVG(price_usd) AS avg_price 
FROM bitcoin_data;



---Question 6
SELECT SUM(transactions) AS total_transactions 
FROM bitcoin_data;



---Question 7
SELECT MAX(market_cap) AS max_cap 
FROM bitcoin_data;



---Question 8

SELECT AVG(tweets::NUMERIC) AS avg_daily_tweets 
FROM bitcoin_data;


