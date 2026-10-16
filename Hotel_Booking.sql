#  Q1. Get all rows where is_canceled = 1

SELECT * 
FROM bookings
WHERE is_canceled = 1;

# Q2. Find the average adr (average daily rate) for each hotel type.

SELECT hotel, ROUND(AVG(adr),2)AS Average_Adr
FROM bookings
GROUP BY hotel
ORDER BY hotel;

# Q3. List all rows where lead_time is 0 (booked same day as arrival).

SELECT * 
FROM bookings
WHERE lead_time = 0;

#Q4. Find the top 5 country values with the highest number of bookings.

SELECT country, COUNT(*) AS Total_Bookings
FROM bookings
GROUP BY country
ORDER BY Total_Bookings DESC
LIMIT 5;

# Q5. For each market_segment, find the average adr

SELECT market_segment, ROUND (AVG (adr),2) AS Average_Adr
FROM bookings
GROUP BY market_segment
ORDER BY Average_Adr DESC;

# Q6, Find the number of cancellations (is_canceled = 1) per hotel

SELECT hotel, COUNT(*) AS No_of_cancelation
FROM bookings
WHERE is_canceled = 1
GROUP BY hotel
ORDER BY No_of_cancelation DESC;

# Q7 Find the month (arrival_date_month) with the highest number of bookings overall.

SELECT arrival_date_month , COUNT(*) AS  No_of_bookings
FROM bookings
GROUP BY arrival_date_month
ORDER BY No_of_bookings DESC;

# Q8. Find bookings where adults = 0 and children = 0 and babies = 0 (no guests listed) — count how many per hotel.

SELECT hotel, COUNT(*) AS No_of_guests
FROM bookings
WHERE adults = 0 AND children = 0 AND babies = 0 
GROUP BY hotel
ORDER BY No_of_guests;

# Q9. For each customer_type, find the row with the highest adr ever recorded

SELECT customer_type,adr
FROM(
SELECT customer_type,adr,
RANK()
OVER ( PARTITION BY customer_type ORDER BY adr DESC) AS  Highest_Adr
FROM bookings) ranking
WHERE Highest_Adr = 1
ORDER BY Adr DESC;

# Q10. Find the month-over-month average adr change for each hotel.

SELECT hotel,arrival_date_month,Average_Adr,
Average_Adr - LAG(Average_Adr) OVER ( PARTITION BY hotel ORDER BY FIELD(arrival_date_month, 'January','February','March','April','May','June','July','August','September','October','November','December')) AS Adr_Change
FROM(
SELECT hotel,arrival_date_month,
ROUND( AVG (adr), 2)AS Average_Adr
FROM bookings
GROUP BY hotel,arrival_date_month
ORDER BY hotel,FIELD(arrival_date_month, 'January','February','March','April','May','June','July','August','September','October','November','December'))bookingg
ORDER BY hotel;

# Q11. For each market_segment, rank country by total booking count

SELECT market_segment,country,Total_Booking,
DENSE_RANK() OVER ( PARTITION BY market_segment ORDER BY Total_Booking DESC) AS D_Rank
FROM
(SELECT market_Segment,country,COUNT(*) AS Total_Booking
FROM bookings
GROUP BY market_segment,country
ORDER BY Total_Booking DESC) booking
ORDER BY market_segment,D_Rank;


# Q12. Find the 2nd highest adr for each hotel.

SELECT hotel,adr
FROM(
SELECT hotel,adr,
DENSE_RANK() OVER(PARTITION BY hotel ORDER BY adr DESC) AS Rnk
FROM bookings
) rnking
WHERE Rnk=2;

# Q13. Calculate average cancellation rate per market_segment per hotel, then find which market_segment has the worst cancellation rate overall.

WITH cancellation AS(
	SELECT hotel,market_segment, ROUND( AVG (is_canceled) * 100 ,2) AS Cancellation_Rate
    FROM bookings
    GROUP BY hotel,market_segment)
SELECT market_segment,ROUND( AVG (Cancellation_Rate),2) AS Avg_Cancellation_rate
FROM cancellation
GROUP BY market_segment
ORDER BY Avg_Cancellation_rate DESC;

# Q14: Find all rows where adr is higher than the average adr of its own hotel type.

SELECT hotel,adr
FROM bookings
WHERE  adr > ( SELECT AVG(adr)
FROM bookings
WHERE hotel = bookings.hotel)
ORDER BY adr DESC;


# Q15: Find country values that have appeared with deposit_type = 'Non Refund' at least once.

SELECT country
FROM bookings
WHERE deposit_type = "Non Refund" 
GROUP BY country
HAVING COUNT(*) = 1;


