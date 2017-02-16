DELIMITER //
Use test //

DROP PROCEDURE IF EXISTS `PublisherDelete`//

CREATE PROCEDURE `PublisherDelete` (
	IN P_name_1 VARCHAR(30)
)
BEGIN
	DELETE FROM Publishers
	WHERE P_name = P_name_1;
END //