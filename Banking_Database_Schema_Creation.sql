/*
    Name: <Haneefuddin Rasheed>
    DTSC660: Data and Database Managment with SQL
    Module 6
    Assignment 4- PART 1
*/

--------------------------------------------------------------------------------
/*				                 Banking DDL           		  		          */
--------------------------------------------------------------------------------

    CREATE TABLE branch (
    branch_name varchar(40) PRIMARY KEY,
    branch_city varchar(40) NOT NULL CHECK (branch_city IN ('Brooklyn', 'Bronx', 'Manhattan', 'Yonkers')),
    assets money NOT NULL CHECK (assets >= 0::money)
);

CREATE TABLE customer (
    cust_ID varchar(40) PRIMARY KEY,
    customer_name varchar(40) NOT NULL,
    customer_street varchar(40) NOT NULL,
    customer_city varchar(40)
);

CREATE TABLE loan (
    loan_number varchar(40) PRIMARY KEY,
    branch_name varchar(40) NOT NULL REFERENCES branch(branch_name) ON UPDATE CASCADE ON DELETE CASCADE,
    amount money NOT NULL DEFAULT 0::money CHECK (amount >= 0::money)
);

CREATE TABLE borrower (
    cust_ID varchar(40) NOT NULL REFERENCES customer(cust_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    loan_number varchar(40) NOT NULL REFERENCES loan(loan_number) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (cust_ID, loan_number)
);

CREATE TABLE account (
    account_number varchar(40) PRIMARY KEY,
    branch_name varchar(40) NOT NULL REFERENCES branch(branch_name) ON UPDATE CASCADE ON DELETE CASCADE,
    balance money NOT NULL DEFAULT 0::money
);

CREATE TABLE depositor (
    cust_ID varchar(40) NOT NULL REFERENCES customer(cust_ID) ON UPDATE CASCADE ON DELETE CASCADE,
    account_number varchar(40) NOT NULL REFERENCES account(account_number) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (cust_ID, account_number)
);
