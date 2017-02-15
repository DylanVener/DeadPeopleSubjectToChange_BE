DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `SeriesSearch`//

CREATE PROCEDURE `SeriesSearch` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Series WHERE s_name = name;
END //
