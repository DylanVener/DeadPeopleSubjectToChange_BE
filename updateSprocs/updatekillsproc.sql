DELIMITER //
USE test //

DROP Procedure IF EXISTS `KillUpdate`//

CREATE Procedure `KillUpdate`(
 	IN killid mediumint, IN Killer mediumint, IN Killed mediumint, IN diedinissue varchar(50), IN description varchar(255)
)
BEGIN
	IF ((SELECT COUNT(*) FROM `Kills` WHERE ID = id) = 0)THEN SELECT '404';
    ELSE IF ((SELECT COUNT(*) FROM `Characters` WHERE ID = Killer OR ID = Killed) <> 2 )THEN SELECT '404';
    Else 
    BEGIN
		UPDATE Kills
		SET 
			KillerID = Killer,
			KilledID = Killed,
            Issue = diedinissue,
            Dsc = description
		WHERE
			`ID` = killid;
			SELECT '200';
		END IF;
        END
END //