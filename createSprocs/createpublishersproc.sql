DELIMITER //
USE test //

DROP Procedure IF EXISTS `PublisherCreate`//

CREATE Procedure `PublisherCreate`(
 	IN pname varchar(30), IN hname varchar(30), in url varchar(255)
)
BEGIN
	INSERT INTO `Publishers`(P_name,H_Name,Img_URL) VALUES (pname, hname, url);
END
