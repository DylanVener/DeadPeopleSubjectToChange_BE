DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `KillsSearchByKillerID`//

CREATE PROCEDURE `KillsSearchByKillerID` (
	IN killer mediumint
)
BEGIN
	SELECT * 
    FROM KillDetails2
    WHERE Killer_ID = killer;
END //

