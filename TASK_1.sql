SELECT C.salesRepEmployeeNumber as Employee_ID, 
        COUNT(O.orderNumber) as Num_of_orders_per_employee
		FROM orders O
		LEFT OUTER JOIN customers C ON O.customerNumber = C.customerNumber
		WHERE O.status='shipped'
        GROUP BY Employee_ID 
		ORDER BY Num_of_orders_per_employee DESC
