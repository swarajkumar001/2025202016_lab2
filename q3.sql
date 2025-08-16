DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;


DELIMITER $$

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100))
BEGIN
    DECLARE count_sub INT DEFAULT 0;
    DECLARE max_id INT DEFAULT 0;
    DECLARE new_id INT DEFAULT 0;

    -- Check if subscriber exists
    SELECT COUNT(*) INTO count_sub FROM Subscribers WHERE SubscriberName = subName;

    IF count_sub = 0 THEN
        -- Get max SubscriberID in a separate statement
        SELECT IFNULL(MAX(SubscriberID), 0) INTO max_id FROM Subscribers;
        SET new_id = max_id + 1;

        -- Insert new subscriber without subqueries
        INSERT INTO Subscribers(SubscriberID, SubscriberName, SubscriptionDate)
        VALUES(new_id, subName, CURDATE());
    ELSE
        -- Message for existing subscriber
        SELECT CONCAT('Subscriber "', subName, '" already exists.') AS Message;
    END IF;
END $$

DELIMITER ;

CALL AddSubscriberIfNotExists('ALICE JHON');

