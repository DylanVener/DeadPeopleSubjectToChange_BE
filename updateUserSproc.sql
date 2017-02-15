DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserUpdate`//

CREATE Procedure `UserUpdate`(
 	IN uname varchar(30), IN pword varchar(32), IN role varchar(30)
)
BEGIN
	DECLARE p_word varchar(32) DEFAULT (SELECT P_name FROM `Users` WHERE Username = uname);
	DECLARE r varchar(30) DEFAULT (SELECT Role FROM `Users` WHERE Username = uname);
				
	IF (SELECT COUNT(*) FROM `Users` WHERE Username = uname) <> 1
    THEN
		SELECT '404'
    ELSE 
			IF pword <> '' 
			THEN BEGIN
				Set p_word = pword;
			END IF;
			
			IF role <> ''
			THEN BEGIN
				Set r = role;
			END IF;

		UPDATE `Users` 
SET 
    `Password` = p_word,
    `Role` = r
WHERE
    Username = uname;
			SELECT '200';
	END IF;
END;