DELIMITER //
USE test//

CREATE PROCEDURE `CSP`(
IN CID mediumint
)
SELECT S_name, P_name FROM CharacterSeriesPublisher WHERE C_ID=CID //