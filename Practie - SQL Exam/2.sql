SELECT postal_code, COUNT(*) as customer_numbers FROM customer
GROUP BY postal_code
HAVING customer_numbers > 1
ORDER BY customer_numbers DESC
