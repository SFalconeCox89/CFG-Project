-- TASK  - VIEWS and JOINS
-- Create VIEW with JOINS which combines mutiple tables in a logical way

-- SCENARIO
-- Show an event summary with customer contact details to enable custoemr service to have all details of event in front of them when talking to cutsomer
CREATE VIEW event_details AS
	SELECT
		customers.customer_first_name, customers.customer_last_name, customers.customer_telephone_number, customers.customer_email, events.event_date, events.event_name, events.event_type, events.event_postcode, events.number_of_guests, bars.bar_name, bars.bar_type
	FROM
		customers
	INNER JOIN events ON customers.customer_id = events.customer_id
    INNER JOIN bars ON events.bar_id = bars.bar_id
    GROUP BY events.event_id;
    
SELECT * FROM event_details;

-- SCENARIO
-- See the total takings, after stock deductions for each event

CREATE VIEW event_takings AS
	SELECT
    event_id, sum(deposit + takings) - stock_cost AS total_takings
    FROM
    event_finance
    GROUP BY
    event_id;
    
SELECT * FROM event_takings;

-- SCENARIO
-- Create invoice for customers for pre-payed bar before event.
    
CREATE VIEW invoice AS
	SELECT
		customers.customer_first_name, customers.customer_last_name, customers.customer_email, events.event_date, events.event_name, sum(event_finance.deposit + event_finance.stock_cost + event_finance.stock_cost*0.5) AS total_invoice
    FROM 
		customers
    INNER JOIN events ON customers.customer_id = events.customer_id
    INNER JOIN event_finance ON events.event_id = event_finance.event_id
    GROUP BY events.event_id;
 
SELECT * FROM invoice;

-- TASK - STORED FUNCTION
-- In your database, create a stored function that can be applied to a query in your DB

-- SCENARIO
-- Returning customers get at 5% descount on their deposit

DELIMITER //
CREATE FUNCTION returner_discount(deposit FLOAT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE new_deposit FLOAT;
    SET new_deposit = deposit - deposit*0.05;
    RETURN new_deposit;
END//
DELIMITER ;

SELECT
events.customer_id, events.event_id, event_finance.deposit, returner_discount(event_finance.deposit) AS total_after_discount
FROM events
INNER JOIN event_finance ON events.event_id = event_finance.event_id;

-- TASK - STORED PROCEDURE
-- In your database, create a stored procedure and demonstrate how it runs

-- SCENARIO 
-- Identify which stock needs restocking. If stock is under 20 units, system is to flag.

DELIMITER //
CREATE PROCEDURE need_stock(on_date DATE)
BEGIN
SELECT
	stock_id, quantity, supplier_id
FROM
	stock
WHERE stock.quantity <30
GROUP BY stock_id
ORDER BY supplier_id;
END//
DELIMITER ;

CALL need_stock('2022-06-16');

-- TASK - QUERIES WITH GROUP BY
-- Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis.

-- SCENARIO 
-- Show all the events a particular bar has.

SELECT events.event_id, events.event_date, bars.bar_name
FROM events
INNER JOIN bars ON events.bar_id = bars.bar_id
GROUP BY event_date
HAVING
bars.bar_name='Drunken Huntsman';

-- TASK - EVENT
-- In your database, create an event and demonstrate how it runs.

-- SCENARIO 
-- Each day a table is created showing the events that month

ALTER TABLE events_this_month
ADD COLUMN event_date DATE

CREATE EVENT IF NOT EXISTS events_this_month
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
  INSERT INTO events_this_month(event_id, event_date)
  SELECT event_id, event_date
  FROM events
