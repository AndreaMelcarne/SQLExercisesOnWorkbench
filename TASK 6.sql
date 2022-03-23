-- products not sold in 2003
SELECT orderdate,
orderdetails.productcode
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber
WHERE EXTRACT(YEAR FROM orderdate) != 2003

-- products not sold in 2004
SELECT orderdate,
orderdetails.productcode
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber
WHERE EXTRACT(YEAR FROM orderdate) != 2004

-- products not sold in 2005
SELECT orderdate,
orderdetails.productcode
FROM orders
INNER JOIN orderdetails ON orderdetails.orderNumber=orders.orderNumber
WHERE EXTRACT(YEAR FROM orderdate) != 2005