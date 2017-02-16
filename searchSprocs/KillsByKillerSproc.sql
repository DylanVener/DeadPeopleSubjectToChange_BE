DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `KillsSearchByKillerID`//

CREATE PROCEDURE `KillsSearchByKillerID` (
	IN killer mediumint
)
BEGIN
	SELECT * 
    FROM Kills
    WHERE KillerID = killer;
END //

