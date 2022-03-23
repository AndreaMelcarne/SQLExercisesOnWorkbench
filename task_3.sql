SELECT officecode,
total_per_office,
total_per_office*100/MAX(total_per_office) OVER() as Percentage
FROM (SELECT officecode,
SUM(total_revenue_per_employee) as total_per_office
FROM (SELECT employee_num, 
employees.officeCode,
total_revenue_per_employee
FROM (SELECT salesRepEmployeeNumber as Employee_Num,
SUM(total_spent_per_order) as total_revenue_per_employee
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
ORDER BY total_revenue_per_employee DESC
) AS sub2
INNER JOIN employees ON sub2.employee_num=employees.employeenumber
)as sub3
group by officecode
order by total_per_office desc
)as sub4
order by percentage desc