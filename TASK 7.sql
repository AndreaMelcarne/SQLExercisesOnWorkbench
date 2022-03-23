SELECT orderdate,
orderdetails.productcode
FROM orders
LEFT OUTER JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber
WHERE EXTRACT(YEAR FROM orderdate) IS NULL
