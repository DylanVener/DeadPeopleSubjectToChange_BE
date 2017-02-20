DELIMITER //
USE test//

DROP PROCEDURE IF EXISTS `CSP`//
CREATE PROCEDURE `CSP`(
IN CID mediumint
)
SELECT S_name, P_name FROM CharacterSeriesPublisher WHERE C_ID=CID //
