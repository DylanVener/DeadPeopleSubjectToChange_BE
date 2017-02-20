DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `CapeSearch`//

CREATE PROCEDURE `CapeSearch` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Characters WHERE c_name = name OR p_name = name;
END //