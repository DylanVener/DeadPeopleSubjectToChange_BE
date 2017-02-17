DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserLogin`//

CREATE Procedure `UserLogin`(
 	IN uname varchar(30),
 	IN pass	char(64)
)
BEGIN 
	DECLARE count SMALLINT;
    SET count = (SELECT Count(*) FROM Users WHERE Username = uname AND Users.`Password` = pass);
	IF(count)<>1
    THEN SELECT 401;
    ELSE
		SELECT Role FROM Users WHERE Username=uname;
        END IF;
        END //
