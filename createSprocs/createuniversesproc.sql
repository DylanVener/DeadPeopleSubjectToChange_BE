DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `UniverseCreate`//
CREATE PROCEDURE `UniverseCreate` (
	IN U_name_1 varchar(30), 
	IN Size_1 varchar(30),
	IN P_name_1 varchar(30),
    IN url varchar(255)
)
BEGIN
	INSERT INTO Universes(U_name,Size,P_name,Img_URL)
	VALUES(U_name_1, Size_1, P_name_1,url);
END //