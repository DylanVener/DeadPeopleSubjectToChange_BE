DELIMITER //
USE test //

DROP Procedure IF EXISTS `PublisherCreate`//

CREATE Procedure `PublisherCreate`(
 	IN pname varchar(30), IN hname varchar(30)
)
BEGIN
	INSERT INTO `Publishers`(P_name,H_Name) VALUES (pname, hname);
END