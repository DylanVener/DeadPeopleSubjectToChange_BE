DELIMITER //
USE test //

DROP Procedure IF EXISTS `PublishersUpdate`//

CREATE Procedure `PublishersUpdate`(
 	IN oldname varchar(30), IN newname varchar(30), IN hname varchar(30), IN url varchar(255)
)
BEGIN
	IF (SELECT COUNT(*) FROM `Publishers` WHERE P_name= pname) = 0
    THEN
		SELECT '404';
    ELSE 
		UPDATE `Publishers` 
		SET 
			P_name = newname,
			H_name = hname,
            Img_URL=url
		WHERE
			P_name = oldname;
			SELECT '200';
		END IF;
END//