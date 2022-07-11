-- 3.1. Top Traffic Resource
USE mavenfuzzyfactory;
SELECT 
	utm_source, 
	utm_campaign, 
	http_referer,
	COUNT(website_session_id) AS web_session
FROM website_sessions
WHERE created_at < '2012-04-12'
GROUP BY 
	utm_source, 
	utm_campaign, 
	http_referer
ORDER BY 
	web_session DESC
LIMIT 10;
