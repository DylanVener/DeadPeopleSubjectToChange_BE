DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SearchSeriesByPublisher`//

CREATE PROCEDURE `SearchSeriesByPublisher` (
	IN pub varchar(30)
    )
BEGIN
	SELECT * 
    FROM Series
    WHERE P_name = pub;
END //

