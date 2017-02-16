DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `KillsSearchByKilledID`//

CREATE PROCEDURE `KillsSearchByKilledID` (
	IN killed mediumint
)
BEGIN
	SELECT * 
    FROM KillDetails
    WHERE KilledID = killed;
END //

