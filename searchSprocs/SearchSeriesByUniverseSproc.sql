DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SearchSeriesByUniverse`//

CREATE PROCEDURE `SearchSeriesByUniverse` (
	IN uname varchar(30)
    )
BEGIN
	SELECT * 
    FROM Series
    WHERE U_name = uname;
END //

