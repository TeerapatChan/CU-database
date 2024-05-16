SELECT SUM(price_per_product) as total_payment
FROM
(
	SELECT standard_price * ordered_quantity as price_per_product 
	FROM product NATURAL JOIN
	(
		SELECT product_id, ordered_quantity FROM order_line
		WHERE order_id = 3
	) AS sum_quantity
) AS all_price