DELIMITER //
USE test //

DROP Procedure IF EXISTS `KillUpdate`//

CREATE Procedure `KillUpdate`(
 	IN killid mediumint, IN Killer mediumint, IN Killed mediumint
)
BEGIN
	IF (SELECT COUNT(*) FROM `Kills` WHERE ID = id) = 0
    THEN
		SELECT '404'
    ELSE IF (SELECT COUNT(*) FROM `Characters` WHERE ID = Killer OR ID = Killed) <> 2
    THEN
		SELECT '404'
    else 
		UPDATE `Kills` 
		SET 
			`KillerID` = Killer,
			`KilledID` = Killed
		WHERE
			`ID` = killid;
			SELECT '200';
		END IF;
END;