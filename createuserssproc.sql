DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserCreate`//

CREATE Procedure `UserCreate`(
 	IN uname char(30),
 	IN pass	char(32),
 	OUT outp INT
)
BEGIN 
	DECLARE count SMALLINT;
    SET count = (SELECT Count(*) FROM Users WHERE Username = uname);
	IF(count)>0
    THEN set outp= 409;
    ELSE
		Set outp= 500;
        END IF;
        END //