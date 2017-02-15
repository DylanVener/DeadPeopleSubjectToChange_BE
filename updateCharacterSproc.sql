DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterUpdate`//

CREATE Procedure `CharacterUpdate`(IN id mediumint,
 	IN pname varchar(30), IN cname varchar(30)
)
BEGIN
	DECLARE p_name varchar(30) DEFAULT (SELECT P_name FROM `Characters` WHERE ID = id);
	DECLARE c_name varchar(30) DEFAULT (SELECT C_name FROM `Characters` WHERE ID = id);
    
    IF pname <> '' 
    THEN BEGIN
		Set p_name = pname;
	END IF;
    
    IF cname <> ''
    THEN BEGIN
		Set c_name = cname;
    END IF;

UPDATE `Characters` 
SET 
    P_name = p_name,
    C_name = c_name
WHERE
    ID = id;
END;