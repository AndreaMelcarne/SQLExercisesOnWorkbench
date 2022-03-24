SELECT customernumber,
ROUND(SUM(diff_days)/max(labelling) OVER()) as average_days_between_orders
FROM (with cte as
			(SELECT
			ROW_NUMBER() OVER (PARTITION BY customernumber) as row_,
			customernumber,
			orderdate
			FROM orders)
		SELECT 
		a.customernumber ,
		a.orderdate as following_order,
		b.orderdate as previous_order,
		datediff(a.orderdate, b.orderdate) as diff_days,
        row_number() OVER (PARTITION BY customernumber) as labelling 
		FROM cte a
		inner JOIN cte b -- so i dont have null values
		on a.customernumber = b.customernumber
		and a.row_ = b.row_+1
	 ) as sub1
     
group by customernumber
