DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `UniverseSearch`//

CREATE PROCEDURE `UniverseSearch` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Universes WHERE u_name = name;
END //