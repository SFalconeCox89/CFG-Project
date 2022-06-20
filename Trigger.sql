-- CREATE TRIGGER 
-- Minimum deposit that can be inserted into the table is 100, an 'error message' will show when trying to insert an amount less than 100. 

delimiter $$
CREATE TRIGGER  check_deposit  BEFORE INSERT ON event_finance
FOR EACH ROW
BEGIN
IF NEW.deposit < 100 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'ERROR: DEPOSIT MUST BE AT LEAST 100';
END IF;
END; $$
delimiter; 

-- Demonstrate how it runs - trying to insert the following data will trigger the error message.

Insert into event_finance (event_id, deposit, stock_cost, takings)
values (408, 99, 575, 900); 

