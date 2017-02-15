USE test

DROP TABLE IF EXISTS Characters;
CREATE TABLE Characters (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    P_name VARCHAR(30),
    C_name VARCHAR(30),
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    Username VARCHAR(30) NOT NULL,
    Password CHAR(32) NOT NULL,
    Role VARCHAR(30) NOT NULL,
    PRIMARY KEY(Username)
);

DROP TABLE IF EXISTS Kills;
CREATE TABLE Kills (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    KillerID MEDIUMINT,
    KilledID MediumInt,
    FOREIGN KEY (KillerID)
    REFERENCES Characters(ID),
    FOREIGN KEY (KilledID)
    REFERENCES Characters(ID),
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Ratings;
CREATE TABLE Ratings (
    Username VARCHAR(30) NOT NULL,
    KID MEDIUMINT NOT NULL,
    Value INT,
    FOREIGN KEY (Username)
    REFERENCES Users(Username),
    FOREIGN KEY (KID)
    REFERENCES Kills(ID),
    CONSTRAINT unID PRIMARY KEY(Username, KID)
);

DROP TABLE IF EXISTS Publishers;
CREATE TABLE Publishers (
    P_name VARCHAR(30),
    H_name VARCHAR(30),
    PRIMARY KEY(P_name)
);

DROP TABLE IF EXISTS Universes;
CREATE TABLE Universes (
    U_name VARCHAR(30),
    Size VARCHAR(30),
    P_name VARCHAR(30),
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name),
    PRIMARY KEY (U_name)
);

DROP TABLE IF EXISTS Series;
CREATE TABLE Series (
    S_name VARCHAR(30),
    U_name VARCHAR(30),
    P_name VARCHAR(30),
    FOREIGN KEY (U_name)
    REFERENCES Universes(U_name),
    FOREIGN KEY (P_name)
    REFERENCES Publishers(P_name),
    PRIMARY KEY (S_name)
);

DROP TABLE IF EXISTS CharacterSeries;
CREATE TABLE CharacterSeries (
    S_name VARCHAR(30),
    C_ID MEDIUMINT,
    FOREIGN KEY (S_name)
    REFERENCES Series(S_name),
    FOREIGN KEY (C_ID)
    REFERENCES Characters(ID),
    CONSTRAINT sc_ID PRIMARY KEY (S_name, C_ID)
);



