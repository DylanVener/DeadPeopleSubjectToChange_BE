DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SearchUniverseByPublisher`//

CREATE PROCEDURE `SearchUniverseByPublisher` (
	IN pub varchar(30)
    )
BEGIN
	SELECT * 
    FROM Universe
    WHERE P_name = pub;
END //

