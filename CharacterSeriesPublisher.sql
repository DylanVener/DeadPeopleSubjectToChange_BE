DELIMITER //
USE test//
DROP VIEW IF EXISTS `CharacterSeriesPublisher`//

CREATE VIEW CharacterSeriesPublisher AS
    SELECT 
        cs.C_ID, cs.S_name, s.P_name
    FROM
        CharacterSeries AS cs
            JOIN
        Series AS s ON cs.S_name = s.S_name
