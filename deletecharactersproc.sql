DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterDelete`//

CREATE Procedure `CharacterDelete`(
 	IN ID_1 mediumint 
)
BEGIN
	DELETE FROM Characters
	WHERE ID = ID_1;
END //