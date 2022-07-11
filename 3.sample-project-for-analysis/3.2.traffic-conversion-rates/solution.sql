-- 3.2. Traffic Conversion Rates
USE mavenfuzzyfactory;
SELECT 
	COUNT(DISTINCT website_sessions.website_session_id) AS web_session,
    COUNT(DISTINCT orders.order_id) AS orders,
    COUNT(DISTINCT orders.order_id) / COUNT(DISTINCT website_sessions.website_session_id)  AS conversion_rate 
FROM website_sessions            
	LEFT JOIN orders
		ON website_sessions.website_session_id = orders.website_session_id
WHERE 
	website_sessions.created_at  <  '2012-04-14'
    AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'