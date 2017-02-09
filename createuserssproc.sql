DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserCreate`//

CREATE Procedure `UserCreate`(
 	IN uname char(30),
 	IN pass	char(32)
)
BEGIN 
	DECLARE count SMALLINT;
    SET count = (SELECT Count(*) FROM Users WHERE Username = uname);
	IF(count)>0
    THEN SELECT outp= 409;
    ELSE
		SELECT outp= 500;
        END IF;
        END //