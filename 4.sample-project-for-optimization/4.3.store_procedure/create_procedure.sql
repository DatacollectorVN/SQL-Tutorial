USE mavenfuzzyfactory;

DROP PROCEDURE  IF EXISTS total_price_user;
DELIMITER $
CREATE PROCEDURE total_price_user(
		IN user_id_ INT,
        OUT total DECIMAL(5,2),
        OUT average DECIMAL(5,2)
)
BEGIN 
	DECLARE count INT DEFAULT 0;
    SET COUNT = (SELECT COUNT(user_id) FROM orders WHERE user_id = user_id_);
    IF COUNT > 0 THEN
		SET total = (SELECT SUM(items_purchased * price_usd) FROM orders WHERE user_id = user_id_);
        SET average = (SELECT AVG(items_purchased * price_usd) FROM orders WHERE user_id = user_id_);
        
    ELSE
		SET total = 0;
        SET average = 0;
		-- Show error
        SELECT  CONCAT('YOUR PARAMETER ', user_id_, ' IS NOT EXISTS!!!') AS 'ERROR';
    END IF;
END $
DELIMITER ;