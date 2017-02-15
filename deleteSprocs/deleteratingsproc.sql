DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `RatingDelete`//

CREATE PROCEDURE `RatingDelete` (
	IN Username_1 VARCHAR(30),
	IN KID_1 MEDIUMINT
)
BEGIN
	DELETE FROM Ratings
	WHERE Username = Username_1 AND KID = KID_1;
END //