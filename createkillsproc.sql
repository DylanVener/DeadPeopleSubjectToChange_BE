DELIMITER //
USE test //

DROP Procedure IF EXISTS `KillCreate`//

CREATE Procedure `KillCreate`(
 	killer_id varchar(30), killed_ID varchar(30)
)
BEGIN
	INSERT INTO `Kills`(KillerID,KilledID) VALUES (killer_id, killed_ID);
END