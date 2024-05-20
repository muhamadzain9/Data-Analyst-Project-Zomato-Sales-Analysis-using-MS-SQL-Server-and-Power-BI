--menu
SELECT 
	menu.menu_id,
	menu.r_id,
	menu.f_id,
	menu.cuisine,
	TRY_CONVERT(DECIMAL, menu.price) as price,
	CASE
		WHEN food.veg_or_non_veg is null THEN 'Other'
		ELSE food.veg_or_non_veg
	END AS veg_or_non_veg,
	CASE
		WHEN restaurant.city is null THEN 'Other'
		ELSE restaurant.city
	END AS city
FROM [dbo].[zomato_menu] as menu
LEFT JOIN [dbo].[zomato_food] as food
	ON menu.f_id = food.f_id
LEFT JOIN [dbo].[zomato_restaurant] as restaurant
	ON menu.r_id = restaurant.id