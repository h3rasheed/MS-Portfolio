CREATE DATABASE auto_parts_unlimited;

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(255),
    street_address VARCHAR(255),
    city VARCHAR(255),
    zip VARCHAR(5),
    state CHAR(2)
);

CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(255),
    street_address VARCHAR(255),
    city VARCHAR(255),
    zip VARCHAR(5),
    state CHAR(2),
    hire_date DATE NOT NULL,
    salary_amount DECIMAL(10, 2) NOT NULL,
    probationary_status BOOLEAN NOT NULL
);

CREATE TABLE PartsInventory (
    part_number VARCHAR(255) PRIMARY KEY,
    manufacturer_name VARCHAR(255) NOT NULL,
    quantity_in_stock INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    backordered_status BOOLEAN NOT NULL
);
