DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `seriescreate`//

CREATE PROCEDURE `seriescreate` (
	S_name_1 VARCHAR(30),
	C_ID_1 MEDIUMINT
)
BEGIN
	INSERT INTO Ratings(S_name, C_ID)
	VALUES(S_name_1, C_ID_1);
END //

