SELECT customer_id, customer_name 
FROM customer NATURAL JOIN
(
	SELECT customer_id
	FROM ordert
	GROUP BY customer_id
	HAVING COUNT(*) IN
	(
		SELECT MAX(number_of_orders)
		FROM customer NATURAL JOIN 
		(
			SELECT customer_id, COUNT(*) as number_of_orders
			FROM ordert
			GROUP BY customer_id
		) as order_count
	)
) as customer_max_order