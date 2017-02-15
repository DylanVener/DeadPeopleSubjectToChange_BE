DELIMITER //
USE test //

DROP Procedure IF EXISTS `PublisherCreate`//

CREATE Procedure `PublisherCreate`(
 	pname varchar(30), hname varchar(30)
)
BEGIN
	INSERT INTO `Publishers`(P_name,H_Name) VALUES (pname, hname);
END