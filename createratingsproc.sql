DELIMITER //
CREATE PROCEDURE `ratingcreate` (
	IN Uname_1 varchar(30), 
	KID_1 mediumint,
	Value_1 int
)
BEGIN
	INSERT INTO Ratings(Username, KID, Value)
	VALUES(Uname_1, KID_1, Value_1);
END //

