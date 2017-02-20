DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterUpdate`//

CREATE Procedure `CharacterUpdate` (IN inId mediumint,
 	IN pname varchar(30), IN cname varchar(30), IN url varchar(255)
)
BEGIN
UPDATE Characters 
SET 
    P_name = pname,
    C_name = cname,
    Img_URL = url
WHERE
    ID = inId;
END //
