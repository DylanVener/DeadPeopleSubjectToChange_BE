DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `PublisherSearch`//

CREATE PROCEDURE `PublisherSearch` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Publishers WHERE p_name = name;
END //