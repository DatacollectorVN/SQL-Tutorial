DROP function  if Exists total_price;

DELIMITER $
CREATE FUNCTION total_price(
	price  FLOAT(5,2),
	quantity INT
)
	RETURNS FLOAT(5,2)
-- add 2 statements below for fixing error.
-- read here. https://stackoverflow.com/questions/26015160/deterministic-no-sql-or-reads-sql-data-in-its-declaration-and-binary-logging-i.
READS SQL DATA
DETERMINISTIC
BEGIN
	-- We can declare new variable
	-- DECLARE total FLOAT;
	-- SET  total = price * quantity;
    -- RETURN total;
    
    -- Or
    RETURN price * quantity;
    
END;
DELIMITER ;


    
