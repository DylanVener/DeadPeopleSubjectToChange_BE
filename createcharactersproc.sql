DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterCreate`//

CREATE Procedure `CharacterCreate`(
 	IN cname varchar(30), IN pname varchar(30), IN id mediumint 
)
BEGIN
	INSERT INTO `Characters`(ID,P_Name,C_name) VALUES (id, pname, cname);
END