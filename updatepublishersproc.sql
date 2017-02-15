DELIMITER //
USE test //

DROP Procedure IF EXISTS `PublishersUpdate`//

CREATE Procedure `PublishersUpdate`(
 	IN pname varchar(30), IN hname varchar(30)
)
BEGIN
	IF (SELECT COUNT(*) FROM `Publishers` WHERE P_name= pname) = 0
    THEN
		SELECT '404'
    ELSE 
		UPDATE `Publishers` 
		SET 
			`H_name` = hname
		WHERE
			`P_name` = pname;
			SELECT '200';
		END IF;
END;