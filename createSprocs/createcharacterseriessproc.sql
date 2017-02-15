DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `CharacterSeriesCreate`//

CREATE PROCEDURE `CharacterSeriesCreate` (
	IN S_name_1 VARCHAR(30),
	IN C_ID_1 MEDIUMINT
)
BEGIN
	INSERT INTO Ratings(S_name, C_ID)
	VALUES(S_name_1, C_ID_1);
END //

