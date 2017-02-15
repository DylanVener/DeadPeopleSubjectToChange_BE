DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `RatingCreate`//

CREATE PROCEDURE `RatingCreate` (
	IN Uname_1 varchar(30), 
	IN KID_1 mediumint,
	IN Value_1 int
)
BEGIN
	INSERT INTO Ratings(Username, KID, Value)
	VALUES(Uname_1, KID_1, Value_1);
END //

