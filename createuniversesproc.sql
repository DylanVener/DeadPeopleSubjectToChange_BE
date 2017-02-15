DELIMITER //
CREATE PROCEDURE `universecreate` (
	IN U_name_1 varchar(30), 
	Size_1 varchar(30),
	P_name_1 varchar(30)
)
BEGIN
	INSERT INTO Universes(U_name,Size,P_name)
	VALUES(U_name_1, Size_1, P_name_1);
END //