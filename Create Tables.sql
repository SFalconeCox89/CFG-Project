CREATE DATABASE exobar;
USE exobar;

-- Create tables for database

CREATE TABLE stock(
stock_id INT PRIMARY KEY,
stock_name VARCHAR(90),
stock_type VARCHAR(20),
quantity INT,
supplier_id INT
);

CREATE TABLE drink_suppliers (
d_supplier_id INT PRIMARY KEY,
d_supplier_name VARCHAR(30),
d_supplier_telephone_number INT,
d_supplier_postcode VARCHAR(10),
d_supplier_email VARCHAR(80),
stock_id INT,
FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);

CREATE TABLE snack_suppliers (
s_supplier_id INT PRIMARY KEY,
s_supplier_name VARCHAR(30),
s_supplier_telephone_number INT,
s_supplier_postcode VARCHAR(10),
s_supplier_email VARCHAR(80),
stock_id INT,
FOREIGN KEY (stock_id) REFERENCES stock(stock_id)
);

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_first_name VARCHAR(30),
customer_last_name VARCHAR(30),
customer_telephone_number INT,
customer_email VARCHAR(80)
);

CREATE TABLE events(
event_id INT PRIMARY KEY,
event_date DATE,
event_name VARCHAR(90),
event_type VARCHAR(50),
event_postcode VARCHAR(10),
number_of_guests INT,
customer_id INT,
bar_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE bars(
bar_id INT PRIMARY KEY,
bar_name VARCHAR(50),
bar_type VARCHAR(30)
);

ALTER TABLE events
ADD FOREIGN KEY (bar_id) REFERENCES bars(bar_id);

CREATE TABLE event_finance(
event_id INT PRIMARY KEY,
deposit FLOAT,
stock_cost FLOAT,
takings FLOAT,
FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE event_booking(
event_id INT PRIMARY KEY,
drink1 INT,
drink2 INT,
drink3 INT,
drink4 INT,
drink5 INT,
drink6 INT,
snack1 INT,
snack2 INT,
snack3 INT
);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink1) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink2) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink3) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink4) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink5) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (drink6) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (snack1) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (snack2) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (snack3) REFERENCES stock(stock_id);

ALTER TABLE event_booking
ADD FOREIGN KEY (event_id) REFERENCES events(event_id);

DROP DATABASE exobar
