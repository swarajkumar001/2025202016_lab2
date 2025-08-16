DELIMITER $$

CREATE PROCEDURE ListAllSubscribers()
BEGIN
    -- Declare variables to hold data and end-of-cursor flag
    DECLARE done INT DEFAULT FALSE;
    DECLARE sub_name VARCHAR(100);
    
    -- Declare cursor to select all subscriber names
    DECLARE cur CURSOR FOR 
        SELECT SubscriberName FROM Subscribers;
    
    -- Declare handler for end of cursor result set
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open the cursor
    OPEN cur;
    
    -- Loop through rows
    read_loop: LOOP
        -- Fetch subscriber name into variable
        FETCH cur INTO sub_name;
        
        -- Exit loop if no more rows
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Print/return subscriber name
        SELECT sub_name AS SubscriberName;
    END LOOP;
    
    -- Close the cursor
    CLOSE cur;
END $$

DELIMITER ;

CALL ListAllSubscribers();

