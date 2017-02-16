DELIMITER //
USE test//
DROP VIEW IF EXISTS `CharacterSeriesPublisher`//

CREATE VIEW CharacterSeriesPublisher AS
    SELECT 
        cs.C_ID,cs.S_name, Series.P_name
    FROM
        CharactersSeries AS cs
            JOIN
        Series END//