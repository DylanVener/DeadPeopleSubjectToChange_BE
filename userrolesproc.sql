DELIMITER //
USE test //

DROP Procedure IF EXISTS `sp_validate`//

CREATE Procedure `sp_validate`(
 	IN uname varchar(30)
)
BEGIN
	SELECT Role
    FROM Users
    WHERE Username = uname
END;