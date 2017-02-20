DELIMITER //
USE test

DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Kills;
DROP TABLE IF EXISTS CharacterSeries;
DROP TABLE IF EXISTS Series;
DROP TABLE IF EXISTS Characters;
DROP TABLE IF EXISTS Universes;
DROP TABLE IF EXISTS Publishers;

CREATE TABLE Publishers (
    P_name VARCHAR(30),
    H_name VARCHAR(30),
    Img_URL VARCHAR(255),
    PRIMARY KEY(P_name)
);

CREATE TABLE Universes (
    U_name VARCHAR(30),
    Size VARCHAR(30),
    P_name VARCHAR(30),
    Img_URL VARCHAR(255),
    Location VARCHAR(100),
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name)
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,
    PRIMARY KEY (U_name)
);

CREATE TABLE Characters (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    P_name VARCHAR(30),
    C_name VARCHAR(30) NOT NULL,
    Img_URL VARCHAR(255),
    PRIMARY KEY(ID)
);

CREATE INDEX PNameIndex
ON Characters (P_name);

CREATE INDEX CNameIndex
ON Characters (C_name);


CREATE TABLE Series (
    S_name VARCHAR(30),
    U_name VARCHAR(30),
    P_name VARCHAR(30),
    Img_URL VARCHAR(255),
    FOREIGN KEY (U_name)
    REFERENCES Universes(U_name)
    ON DELETE RESTRICT 
    ON UPDATE CASCADE,
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    PRIMARY KEY (S_name)
);

CREATE TABLE CharacterSeries (
    S_name VARCHAR(30),
    C_ID MEDIUMINT,
    FOREIGN KEY (S_name)
    REFERENCES Series(S_name)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (C_ID)
    REFERENCES Characters(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT sc_ID PRIMARY KEY (S_name, C_ID)
);

CREATE TABLE Kills (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    KillerID MEDIUMINT,
    KilledID MediumInt,
    Img_URL VARCHAR(255),
    Issue VARCHAR(50),
    Dsc VARCHAR(255),
    FOREIGN KEY (KillerID)
    REFERENCES Characters(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (KilledID)
    REFERENCES Characters(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    PRIMARY KEY(ID)
);

CREATE TABLE Users (
    Username VARCHAR(30) NOT NULL,
    Password CHAR(64) NOT NULL,
    Role VARCHAR(30) NOT NULL,
    PRIMARY KEY(Username)
);

CREATE TABLE Ratings (
    Username VARCHAR(30),
    KID MEDIUMINT NOT NULL,
    Value INT,
    FOREIGN KEY (Username)
    REFERENCES Users(Username)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (KID)
    REFERENCES Kills(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT unID PRIMARY KEY(Username, KID)
);

DROP VIEW IF EXISTS `CharacterSeriesPublisher`//

CREATE VIEW CharacterSeriesPublisher AS
    SELECT 
        cs.C_ID, cs.S_name, s.P_name
    FROM
        CharacterSeries AS cs
            JOIN
        Series AS s ON cs.S_name = s.S_name//


DROP VIEW IF EXISTS `KillDetails2`//

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
