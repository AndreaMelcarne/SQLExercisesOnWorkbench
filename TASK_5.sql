SELECT customers.customerNumber,
orders.orderNumber
FROM orders
INNER JOIN customers ON customers.customerNumber=orders.customerNumber
WHERE orderdate NOT BETWEEN "2004-10-01" AND "2005-05-31"
-- order by customernumber