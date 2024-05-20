--user
SELECT 
	user_id,
	name,
	CONVERT(INT, Age) AS Age,
	Gender,
	[Marital Status],
	Occupation,
	CASE
		WHEN CONVERT(INT, Age) BETWEEN 0 AND 20 THEN '<21'
		WHEN CONVERT(INT, Age) BETWEEN 21 AND 25 THEN '21-25'
		WHEN CONVERT(INT, Age) BETWEEN 26 AND 30 THEN '26-30'
		WHEN CONVERT(INT, Age) > 30 THEN '>30'
	ELSE '-'
	END AS 'Grouping Age'
FROM [dbo].[zomato_users]
