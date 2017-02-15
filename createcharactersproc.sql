DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterCreate`//

CREATE Procedure `CharacterCreate`(
 	cname varchar(30), pname varchar(30), id mediumint 
)
BEGIN
	INSERT INTO `Characters`(ID,P_Name,C_name) VALUES (id, pname, cname);
END