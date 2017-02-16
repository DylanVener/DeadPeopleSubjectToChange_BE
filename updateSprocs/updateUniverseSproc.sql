DELIMITER //
USE test //

DROP Procedure IF EXISTS `UniversesUpdate`//

CREATE Procedure `UniversesUpdate`(
 	IN uname varchar(30), IN size varchar(30), IN pname varchar(30), IN url varchar(255)
)
BEGIN
	IF (SELECT COUNT(*) FROM `Universes` WHERE U_name = uname) = 0
    THEN
		SELECT '404'
    ELSE 
		UPDATE `Ratings` 
		SET 
			`Size` = size,
			`P_name` = pname,
            `Img_URL`=url
		WHERE
			`U_name` = uname;
			SELECT '200';
		END IF;
END;