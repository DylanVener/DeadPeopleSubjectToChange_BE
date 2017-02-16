DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SearchCharacterBySeries`//

CREATE PROCEDURE `SearchCharacterBySeries` (
	IN sname varchar(30)
    )
BEGIN
	SELECT * 
    FROM CharacterSeries as cs Join Characters as c ON cs.C_ID = c.ID
    WHERE cs.S_name = sname;
END //

