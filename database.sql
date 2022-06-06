CREATE DATABASE exobar;
USE exobar;

-- Create tables for database

CREATE TABLE suppliers (
supplier_id INT PRIMARY KEY,
supplier_name VARCHAR(30),
supplier_telephone_number INT,
supplier_postcode VARCHAR(10),
supplier_email VARCHAR(80)
);

CREATE TABLE stock(
stock_id INT PRIMARY KEY,
stock_name VARCHAR(90),
stock_type VARCHAR(20),
quantity INT,
supplier_id INT,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(30),
customer_telephone_number INT,
customer_email VARCHAR(80)
);

CREATE TABLE events(
event_id INT PRIMARY KEY,
event_date DATE,
event_name VARCHAR(90),
event_postcode VARCHAR(10),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE bars(
bar_id INT PRIMARY KEY,
bar_name VARCHAR(50),
bar_type VARCHAR(30)
);

ALTER TABLE events
ADD COLUMN bar_id INT
;

ALTER TABLE events
ADD FOREIGN KEY (bar_id) REFERENCES bars(bar_id);
