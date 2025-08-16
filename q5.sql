DELIMITER $$

CREATE PROCEDURE PrintAllSubscribersWatchHistory()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE s_id INT;

    -- Cursor for all subscribers
    DECLARE cur CURSOR FOR
        SELECT SubscriberID FROM Subscribers;

    -- Handler for end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Print subscriber info header
        SELECT CONCAT('Watch history for Subscriber ID: ', s_id) AS Info;

        -- Call to print watch history for current subscriber
        CALL GetWatchHistoryBySubscriber(s_id);
    END LOOP;

    CLOSE cur;
END $$

DELIMITER ;


CALL PrintAllSubscribersWatchHistory();
