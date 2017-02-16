DELIMITER //
USE test//
DROP VIEW IF EXISTS `CharacterSeriesPublisher`//

CREATE VIEW CharacterSeriesPublisher AS
    SELECT 
        cs.*, Series.P_name
    FROM
        CharactersSeries AS cs
            JOIN
        Series END//