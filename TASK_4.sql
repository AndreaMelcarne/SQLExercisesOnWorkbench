SELECT ceil(EXTRACT(MONTH FROM orderdate)/4) as four_months,
count(ordernumber) as count
FROM orders
WHERE extract(year from orderdate) = 2004
group by four_months
ORDER BY count desc