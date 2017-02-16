DELIMITER //
USE test //

DROP Procedure IF EXISTS `UserLogin`//

CREATE Procedure `UserLogin`(
 	IN uname char(30),
 	IN pass	char(32)
)
BEGIN 
	DECLARE count SMALLINT;
    SET count = (SELECT Count(*) FROM Users WHERE Username = uname AND Users.`Password` = pass);
	IF(count)<>1
    THEN SELECT 401;
    ELSE
		SELECT Role FROM Users WHERE Username;
        END IF;
        END //
