DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SeriesDelete`//

CREATE PROCEDURE `SeriesDelete` (
	IN S_name_1 VARCHAR(30),
)
BEGIN
	DELETE FROM Series
	WHERE S_name = S_name_1;
END //