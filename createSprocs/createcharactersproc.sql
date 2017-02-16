DELIMITER //
USE test //

DROP Procedure IF EXISTS `CharacterCreate`//

CREATE Procedure `CharacterCreate`(
 	IN cname varchar(30), IN pname varchar(30), IN id mediumint, IN url varchar(255)
)
BEGIN
	INSERT INTO `Characters`(ID,P_Name,C_name,Img_URL) VALUES (id, pname, cname,url);
END