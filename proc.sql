DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `sp_searchCapes`//

CREATE PROCEDURE `sp_searchCapes` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Characters WHERE c_name = name OR p_name = name;
END //


