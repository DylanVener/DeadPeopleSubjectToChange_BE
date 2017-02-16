DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `KillsSearchByKillerID`//

CREATE PROCEDURE `KillsSearchByKillerID` (
	IN killer mediumint
)
BEGIN
	SELECT * 
    FROM KillDetails
    WHERE KillerID = killer;
END //

