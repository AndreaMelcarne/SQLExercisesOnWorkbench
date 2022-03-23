SELECT orderdate,
orderdetails.productcode
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber
WHERE EXTRACT(YEAR FROM orderdate) NOT BETWEEN "2003" AND "2005"