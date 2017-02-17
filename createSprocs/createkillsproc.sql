DELIMITER //
USE test //

DROP Procedure IF EXISTS `KillCreate`//

CREATE Procedure `KillCreate`(
 	IN killer_id varchar(30), IN killed_ID varchar(30),IN diedinissue varchar(50), IN descript varchar(255)
)
BEGIN
	INSERT INTO `Kills`(KillerID,KilledID,Issue,`Dsc`) VALUES (killer_id, killed_ID,diedinissue,descript);
END
