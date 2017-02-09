DELIMITER // 

USE test //

DROP PROCEDURE IF EXISTS `sp_searchCapes`//

CREATE PROCEDURE `sp_searchCapes` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Characters WHERE c_name = name OR p_name = name;
END //

DROP PROCEDURE IF EXISTS `sp_searchUniverse`//

CREATE PROCEDURE `sp_searchUniverse` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Universes WHERE u_name = name;
END //

DROP PROCEDURE IF EXISTS `sp_searchPublisher`//

CREATE PROCEDURE `sp_searchPublisher` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Publishers WHERE p_name = name;
END //

DROP PROCEDURE IF EXISTS `sp_searchSeries`//

CREATE PROCEDURE `sp_searchSeries` (
    IN name VARCHAR(30)
)
BEGIN
    SELECT * FROM Series WHERE s_name = name;
END //
