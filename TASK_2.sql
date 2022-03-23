SELECT salesRepEmployeeNumber as Employee_Num,
SUM(total_spent_per_order) as total_revenue
FROM(
	SELECT sub.orderNumber,
	SUM(total_spent_per_product) AS total_spent_per_order,
	sub.customerNumber
	FROM(	
		SELECT orderdetails.orderNumber, 
		orders.customerNumber,
		priceEach*quantityOrdered as total_spent_per_product
		FROM orderdetails
		INNER JOIN orders ON orderdetails.orderNumber = orders.orderNumber
		WHERE status= 'shipped'
		) AS sub
	GROUP BY sub.orderNumber
	ORDER BY total_spent_per_order DESC
) AS test
INNER JOIN customers ON customers.customerNumber = test.customerNumber
GROUP BY employee_num
ORDER BY total_revenue DESC