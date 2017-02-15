DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `CharacterSeriesDelete`//

CREATE PROCEDURE `CharacterSeriesDelete` (
	IN S_name_1 VARCHAR(30),
	IN C_ID_1 MEDIUMINT
)
BEGIN
	DELETE FROM CharacterSeries
	WHERE S_name = S_name_1 AND C_ID = C_ID_1;
END //