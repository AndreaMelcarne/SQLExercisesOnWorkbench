with A as (SELECT O.orderDate
	,OD.productcode
    FROM orders O 
    INNER JOIN orderdetails OD ON O.orderNumber=OD.orderNumber),
    B as (SELECT O.orderdate
	,OD.productcode
    FROM orders O
    INNER JOIN orderdetails OD ON O.ordernumber=OD.ordernumber
    WHERE EXTRACT(YEAR FROM orderdate) = "2003")
SELECT A.productcode
,A.orderdate
FROM A
LEFT JOIN B ON A.orderdate = B.orderdate AND A.productcode=B.productcode
WHERE B.productcode IS NULL

--CHANGE THE YEAR TO GET THE PRODUCTS NOT SOLD IN THAT YEAR (2003 for the example)
