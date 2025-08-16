DELIMITER $$

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE s_id INT;

    -- Cursor to get distinct subscribers who have watched something
    DECLARE cur CURSOR FOR
        SELECT DISTINCT SubscriberID FROM WatchHistory;

    -- Handler to detect end of cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO s_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Call the procedure to get watch history for each subscriber
        CALL GetWatchHistoryBySubscriber(s_id);
    END LOOP;
    CLOSE cur;
END $$

DELIMITER ;

CALL SendWatchTimeReport();

