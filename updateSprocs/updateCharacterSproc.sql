DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterUpdate`//

CREATE Procedure `CharacterUpdate` (IN id mediumint,
 	IN pname varchar(30), IN cname varchar(30), IN url varchar(255)
)
BEGIN
	DECLARE p_name varchar(30) DEFAULT (SELECT P_name FROM `Characters` WHERE ID = id);
	DECLARE c_name varchar(30) DEFAULT (SELECT C_name FROM `Characters` WHERE ID = id);
    DECLARE i_url varchar(30) DEFAULT (SELECT Img_URL FROM `Characters` WHERE ID = id);
    
    IF pname <> '' THEN Set p_name = pname;
    IF (cname <> '')THEN Set c_name = cname;
	IF url <> ''THEN SET i_url =  url;
UPDATE Characters 
SET 
    P_name = p_name,
    C_name = c_name,
    Img_URL = i_url
WHERE
    ID = id;
END//
