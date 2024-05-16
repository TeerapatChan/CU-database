SELECT customer_id, COUNT(*) as order_count 
FROM ordert
GROUP BY customer_id
ORDER BY order_count DESC
LIMIT 3