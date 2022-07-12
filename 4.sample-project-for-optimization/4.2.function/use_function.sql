USE mavenfuzzyfactory;                                  
SELECT 
	MAX(total_price)
FROM (SELECT 
		user_id, 
		total_price(orders.price_usd, orders.items_purchased) AS total_price 
		FROM  orders) AS T