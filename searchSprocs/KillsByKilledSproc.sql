DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `KillsSearchByKilledID`//

CREATE PROCEDURE `KillsSearchByKilledID` (
	IN killed mediumint
)
BEGIN
	SELECT * 
    FROM Kills
    WHERE KilledID = killed;
END //

