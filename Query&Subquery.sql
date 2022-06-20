--Query and subquery.

Find all events where the number of guests is 50 or more and the bar id is 4. 

SELECT event_id 
FROM events 
WHERE number_of_guests >50
AND  bar_id = 4; 
