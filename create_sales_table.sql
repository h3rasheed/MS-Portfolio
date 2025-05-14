CREATE TABLE sales
    (
    order_num INT,
        quantity INT,
        price MONEY,
        order_line_num INT, 
        sales MONEY,
        order_date DATE,
        status VARCHAR(255),
        qtr INT,
        month_id INT,
        year_id INT,
        product_line VARCHAR(255),
        msrp INT,
        product_code VARCHAR(255),
        customer VARCHAR(255),
        phone VARCHAR(17),
        address_l1 VARCHAR(255),
        address_l2 VARCHAR(255),
        city VARCHAR(255),
        state VARCHAR(40),
        postal_code VARCHAR(40),
        country VARCHAR(255),
        territory VARCHAR(12),
        contact_last_name VARCHAR(255),
        contact_first_name VARCHAR(255),
        deal_size VARCHAR(20)
    );
SET DATESTYLE = mdy