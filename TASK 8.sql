SELECT customernumber, 
min(orderdate) firstOrder, 
max(orderdate) lastOrder, 
DATEDIFF(max(orderdate), min(orderdate)) AS days_difference
FROM orders
GROUP BY customernumber
