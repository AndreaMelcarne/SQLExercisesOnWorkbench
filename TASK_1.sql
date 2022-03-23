SELECT COUNT(Employee_num) as Num_of_orders_per_employee, Employee_Num
    FROM(
		SELECT customers.salesRepEmployeeNumber as Employee_num
		FROM orders
		LEFT OUTER JOIN customers ON orders.customerNumber = customers.customerNumber
		WHERE orders.status='shipped'
		) AS sub
GROUP BY Employee_num 
ORDER BY Num_of_orders_per_employee DESCpayments