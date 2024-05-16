SELECT product_id, product_description 
FROM product
WHERE product_id IN (
	SELECT product_id as product_count 
	FROM order_line
	GROUP BY product_id
	HAVING COUNT(*) IN (
		SELECT MAX(count) as product_count
		FROM (
			SELECT product_id, COUNT(*) as count 
			FROM order_line
			GROUP BY product_id
		) as product_count
	)
)

