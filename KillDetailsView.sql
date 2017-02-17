DELIMITER //
Use test //

DROP VIEW IF EXISTS KillDetails2//

CREATE VIEW KillDetails2 AS
    SELECT 
        k.ID AS Kill_ID,
        k.KillerID AS Killer_ID,
        k.KilledID AS Killed_ID,
        c1.C_name AS Killed_Name,
        c2.C_name AS Killer_Name,
        k.Issue AS Issue,
        k.Dsc AS dsc,
        CEILING(AVG(r.`Value`)) AS Rating
    FROM
        ((Kills AS k
        JOIN Characters AS c1 ON k.KilledID = c1.ID)
        JOIN Characters AS c2 ON k.KillerID = c2.ID)
            LEFT JOIN
        Ratings AS r ON k.ID = r.KID
    GROUP BY k.ID;
