DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserLogin`//

CREATE Procedure `UserLogin`(
 	IN uname char(30),
 	IN pass	char(32),
 	OUT outp INT
)
BEGIN 
	DECLARE count SMALLINT;
    SET count = (SELECT Count(*) FROM Users WHERE Username = uname AND Users.`Password` = pass);
	IF(count)<>1
    THEN set outp= 401;
    ELSE
		Set outp= 500;
        END IF;
        END //