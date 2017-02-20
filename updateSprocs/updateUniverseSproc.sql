DELIMITER //
USE test //

DROP Procedure IF EXISTS `UniversesUpdate`//

CREATE Procedure `UniversesUpdate`(
 	IN oldname varchar(30),  IN newname varchar(30),IN size varchar(30), IN location varchar(100),IN pname varchar(30), IN url varchar(255)
)
BEGIN
	IF (SELECT COUNT(*) FROM `Universes` WHERE U_name = uname) = 0
    THEN BEGIN
	    	SELECT '404';
            END IF;
    ELSE 
        BEGIN
		UPDATE `Ratings` 
		SET 
			`U_name`=newname,
			`Size` = size,
			`P_name` = pname,
            `Img_URL`=url
		WHERE
			`U_name` = oldname;
			SELECT '200';
		END IF;
END//
