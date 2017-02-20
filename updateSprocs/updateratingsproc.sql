DELIMITER //
USE test //

DROP Procedure IF EXISTS `RatingsUpdate`//

CREATE Procedure `RatingsUpdate`(
 	IN killid mediumint, IN uname varchar(30), IN val int
)
BEGIN
	IF (SELECT COUNT(*) FROM `Rating` WHERE KID = killid AND Username = uname) = 0
    THEN
		SELECT '404';
    ELSE 
		UPDATE `Ratings` 
		SET `Value` = val
		WHERE
			`KID` = killid;
			SELECT '200';
		END IF;
END//