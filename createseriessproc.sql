DELIMITER //

USE test //

DROP Procedure IF EXISTS `SeriesCreate`//

CREATE Procedure `SeriesCreate`(
 	sname varchar(30), uname varchar(30),pname varchar(30)
)
BEGIN
	INSERT INTO `Publishers`(S_name,U_Name,P_name) VALUES (sname,uname,pname);
END
