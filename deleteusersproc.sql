DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `UserDelete`//

CREATE PROCEDURE `UserDelete` (
	IN Username_1 VARCHAR(30)
)
BEGIN
	DELETE FROM Users
	WHERE Username = Username_1;
END //