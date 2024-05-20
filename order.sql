--order
WITH Z AS (
    SELECT 
        CONVERT(DATE, orders.order_date, 103) AS order_date,
		YEAR(CONVERT(DATE, orders.order_date, 103)) AS year,
		MONTH(CONVERT(DATE, orders.order_date, 103)) AS month,
        CONVERT(INT, orders.sales_qty) AS sales_qty,
        CONVERT(INT, orders.sales_amount) AS sales_amount,
        orders.user_id,
        orders.r_id,
        CASE
            WHEN restaurant.city IS NULL THEN 'Other'
            ELSE restaurant.city
        END AS city
    FROM [dbo].[zomato_orders] AS orders
    LEFT JOIN [dbo].[zomato_restaurant] AS restaurant
        ON orders.r_id = restaurant.id
)

SELECT 
    order_date,
	year,
	month,
    user_id,
    r_id,
    city,
    CASE
        WHEN Type = 'sales_qty' THEN 'Quantity'
        WHEN Type = 'sales_amount' THEN 'Amount'
    END AS Type,
    Value
FROM Z
UNPIVOT
(
    Value FOR Type IN (sales_qty, sales_amount)
) AS unpvt
