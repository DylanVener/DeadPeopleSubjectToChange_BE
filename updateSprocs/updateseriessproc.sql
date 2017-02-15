DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `SeriesDelete`//

CREATE PROCEDURE `SeriesDelete` (
	IN S_name_old VARCHAR(30),
	IN S_name_new VARCHAR(30),
	IN U_name_new VARCHAR(30),
	IN P_name_new VARCHAR(30)
)
BEGIN
	UPDATE Series
	SET S_name = S_name_new, U_name = U_name_new, P_name = P_name_new
	WHERE S_name = S_name_old;
END //
