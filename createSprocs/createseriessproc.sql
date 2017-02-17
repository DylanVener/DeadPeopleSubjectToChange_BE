DELIMITER //

USE test //

DROP Procedure IF EXISTS `SeriesCreate`//

CREATE Procedure `SeriesCreate`(
 	IN sname varchar(30), IN uname varchar(30), IN pname varchar(30), IN url varchar(30)
)
BEGIN
	INSERT INTO `Series`(S_name,U_Name,P_name,Img_URL) VALUES (sname,uname,pname, url);
END
