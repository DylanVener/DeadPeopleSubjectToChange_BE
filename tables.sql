USE test;

DROP TABLE IF EXISTS Characters;
CREATE TABLE Characters (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    p_name VARCHAR(30),
    c_name VARCHAR(30),
    PRIMARY KEY(ID)
);

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    uname VARCHAR(30) NOT NULL,
    password CHAR(32) NOT NULL,
    role VARCHAR(30) NOT NULL,
    PRIMARY KEY(uname)
);

DROP TABLE IF EXISTS Ratings;
CREATE TABLE Ratings (
    uname VARCHAR(30) NOT NULL,
    kID MEDIUMINT NOT NULL,
    value INT,
    FOREIGN KEY (uname)
    REFERENCES users(uname),
    FOREIGN KEY (ID)
    REFERENCES Kills
);

DROP TABLE IF EXISTS Kills;
CREATE TABLE Kills (
    ID MEDIUMINT NOT NULL AUTO_INCREMENT,
    killerId MEDIUMINT,
    killedId MediumInt,
    value INT,
    FOREIGN KEY (uname)
    REFERENCES users(uname),
    FOREIGN KEY (kID)
    REFERENCES Kills
);


