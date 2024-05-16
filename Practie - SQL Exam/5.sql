SELECT customer_id, customer_name, number_of_orders 
FROM customer NATURAL JOIN 
(
	SELECT customer_id, COUNT(*) as number_of_orders
	FROM ordert
	GROUP BY customer_id
) as order_count
ORDER BY number_of_orders DESC