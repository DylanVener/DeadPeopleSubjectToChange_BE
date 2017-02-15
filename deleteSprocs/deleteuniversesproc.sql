DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `UniverseDelete`//

CREATE PROCEDURE `UniverseDelete` (
	IN U_name_1 VARCHAR(30),
)
BEGIN
	DELETE FROM Universes
	WHERE U_name = U_name_1;
END //