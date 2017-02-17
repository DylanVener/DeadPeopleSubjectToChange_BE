DELIMITER //
USE test //
DROP PROCEDURE IF EXISTS `validateUser`//
CREATE PROCEDURE `validateUser` (
    IN uname VARCHAR(30)
)
BEGIN
    SELECT Role
    FROM Users
    WHERE Username = uname;
END //

