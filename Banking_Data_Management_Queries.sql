/*
    Name: <Haneefuddin Rasheed>
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 4- PART 2
*/

--------------------------------------------------------------------------------
/*				                 Query 1            		  		          */
--------------------------------------------------------------------------------

SELECT 
    b.cust_ID, 
    d.account_number, 
    b.loan_number
FROM 
    borrower b
JOIN 
    depositor d ON b.cust_ID = d.cust_ID
JOIN 
    loan l ON b.loan_number = l.loan_number
JOIN 
    account a ON d.account_number = a.account_number;

--------------------------------------------------------------------------------
/*				                  Query 2           		  		          */
--------------------------------------------------------------------------------

SELECT 
    c.cust_ID, 
    c.customer_city, 
    br.branch_city, 
    br.branch_name, 
    a.account_number
FROM 
    customer c
JOIN 
    depositor d ON c.cust_ID = d.cust_ID
JOIN 
    account a ON d.account_number = a.account_number
JOIN 
    branch br ON a.branch_name = br.branch_name
WHERE 
    c.customer_city = br.branch_city;
--------------------------------------------------------------------------------
/*				                  Query 3           		  		          */
--------------------------------------------------------------------------------
SELECT 
    c.cust_ID, 
    c.customer_name
FROM 
    customer c
WHERE 
    c.cust_ID IN (SELECT b.cust_ID FROM borrower b)
    AND c.cust_ID NOT IN (SELECT d.cust_ID FROM depositor d);
   
--------------------------------------------------------------------------------
/*				                  Query 4           		  		          */
--------------------------------------------------------------------------------
SELECT 
    c.cust_ID, 
    c.customer_name,
    c.customer_street
FROM 
    customer c
WHERE 
    (c.customer_street, c.customer_city) = (
        SELECT 
            customer_street, 
            customer_city
        FROM 
            customer
        WHERE 
            cust_ID = '12345'
    ); 


--------------------------------------------------------------------------------
/*				                  Query 5           		  		          */
--------------------------------------------------------------------------------

   SELECT DISTINCT 
    br.branch_name
FROM 
    branch br
JOIN 
    account a ON br.branch_name = a.branch_name
JOIN 
    depositor d ON a.account_number = d.account_number
JOIN 
    customer c ON d.cust_ID = c.cust_ID
WHERE 
    c.customer_city = 'Harrison'
    AND c.cust_ID IN (
        SELECT cust_ID
        FROM customer
        WHERE customer_city = 'Harrison'
    );

    
--------------------------------------------------------------------------------
/*				                  Query 6           		  		          */
--------------------------------------------------------------------------------

 SELECT 
    c.cust_ID, 
    c.customer_name
FROM 
    customer c
WHERE NOT EXISTS (
    
    SELECT br.branch_name
    FROM branch br
    WHERE br.branch_city = 'Brooklyn'
    AND NOT EXISTS (
        SELECT *
        FROM account a
        JOIN depositor d ON a.account_number = d.account_number
        WHERE d.cust_ID = c.cust_ID AND a.branch_name = br.branch_name
    )
);

--------------------------------------------------------------------------------
/*				                  Query 7           		  		          */
--------------------------------------------------------------------------------

SELECT 
    l.loan_number,
    c.customer_name,
    l.branch_name
FROM 
    loan l
JOIN 
    borrower b ON l.loan_number = b.loan_number
JOIN 
    customer c ON b.cust_ID = c.cust_ID
WHERE 
    l.branch_name = 'Yonkahs Bankahs'
    AND l.amount::numeric > (
        SELECT AVG(l2.amount::numeric)
        FROM loan l2
        WHERE l2.branch_name = l.branch_name
    );



  