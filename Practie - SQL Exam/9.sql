SELECT customer_id, customer_name
FROM customer NATURAL JOIN 
(
	SELECT DISTINCT customer_id from ordert
	WHERE order_date 
	BETWEEN '2020-01-10' AND '2020-01-15'
) AS date_between
