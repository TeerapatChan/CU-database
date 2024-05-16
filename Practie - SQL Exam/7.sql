SELECT product_id, product_description
FROM product NATURAL JOIN 
(
	SELECT product_id
	FROM order_line
	GROUP BY product_id
	HAVING SUM(ordered_quantity) IN
	(
		SELECT MAX(sum) FROM
		(
			SELECT product_id, SUM(ordered_quantity)
			FROM order_line
			GROUP BY product_id
		) as quantity_count
	)
) as max_product
