SELECT salesRepEmployeeNumber as Employee_ID
,SUM(total_spent_per_order) as total_revenue
FROM(	SELECT OD.orderNumber 
		,O.customerNumber
		,SUM(priceEach*quantityOrdered) as total_spent_per_order
		FROM orderdetails OD
		INNER JOIN orders O ON OD.orderNumber = O.orderNumber
		WHERE status= 'shipped'
        GROUP BY orderNumber, customerNumber
		ORDER BY total_spent_per_order DESC
		) AS SUB
INNER JOIN customers C ON C.customerNumber = SUB.customerNumber
GROUP BY employee_id
ORDER BY total_revenue DESC
