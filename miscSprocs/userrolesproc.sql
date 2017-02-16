DELIMITER //
USE test //

DROP Procedure IF EXISTS `validate`//

CREATE Procedure `validate`(
 	IN uname varchar(30)
)
BEGIN
	SELECT Role
    FROM Users
    WHERE Username = uname
END //