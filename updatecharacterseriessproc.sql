DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `CharacterSeriesUpdate`//

CREATE PROCEDURE `CharacterSeriesUpdate` (
	IN S_name_old VARCHAR(30),
	IN C_ID_old MEDIUMINT,
	IN S_name_new VARCHAR(30),
	IN C_ID_new MEDIUMINT
)
BEGIN
	UPDATE CharacterSeries
	SET S_name = S_name_new, C_ID = C_ID_new
	WHERE S_name = S_name_old AND C_ID = C_ID_old;
END //
