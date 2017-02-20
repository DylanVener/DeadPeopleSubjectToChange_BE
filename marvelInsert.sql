DELIMITER //
Use test //

INSERT INTO Publishers (P_name, H_name,Img_URL)
VALUES ('Marvel','Historical names', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/DC_Comics_logo.svg/2000px-DC_Comics_logo.svg.png')//

INSERT INTO Universes (U_name, Size, P_name, Img_URL, Location)
VALUES ('Marvel Comic Universe 616', 'Universe', 'Marvel', 'http://www.vintagestock.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/5/159823.jpg', 'Universal')//

INSERT INTO Series (S_name, U_name, P_name, Img_URL)
VALUES ('Deadpool Kills the Marvel Universe', 'Marvel Comic Universe 616', 'Marvel', 'http://vignette3.wikia.nocookie.net/marveldatabase/images/1/19/Deadpool_Kills_the_Marvel_Universe_Vol_1_1.jpg/revision/latest/scale-to-width-down/300?cb=20120731185747')//

INSERT INTO Characters (P_name, C_name, Img_URL)
VALUES ('Wade Wilson', 'Deadpool', 'https://s-media-cache-ak0.pinimg.com/736x/bf/e6/4b/bfe64b2af2206edbc4075aab9f08550e.jpg'),('Reed Richards', 'Mister Fantastic', 'http://vignette3.wikia.nocookie.net/marveldatabase/images/f/f9/Reed_Richards_%28Earth-12101%29_from_Deadpool_Kills_the_Marvel_Universe_Vol_1_1_001.jpg/revision/latest?cb=20121229023146'),('Dr. Benjamin Brighton', 'Psycho-Man', 'http://vignette3.wikia.nocookie.net/marveldatabase/images/b/b7/Psych-Man_%28Earth-12101%29.jpg/revision/latest/scale-to-width-down/231?cb=20130921082925')//

INSERT INTO CharacterSeries (S_name, C_ID)
VALUES ('Deadpool Kills the Marvel Universe', (SELECT ID FROM Characters WHERE C_name = 'Deadpool')),('Deadpool Kills the Marvel Universe', (SELECT ID FROM Characters WHERE C_name = 'Mister Fantastic')),('Deadpool Kills the Marvel Universe', (SELECT ID FROM Characters WHERE C_name = 'Psycho-Man'))//

INSERT INTO Kills (KillerID, KilledID, Img_URL, Issue, Dsc)
VALUES ((SELECT ID FROM Characters WHERE C_name = 'Deadpool'),(SELECT ID FROM Characters WHERE C_name = 'Mister Fantastic'),null, 'Deadpool Kills the Marvel Universe Vol 1', 'Body completely melted by a machine'),((SELECT ID FROM Characters WHERE C_name = 'Deadpool'),(SELECT ID FROM Characters WHERE C_name = 'Psycho-Man'),null, 'Deadpool Kills the Marvel Universe Vol 1', 'Crushed on a table')//

INSERT INTO Users (Username, Password, Role)
VALUES ('a','961b6dd3ede3cb8ecbaacbd68de040cd78eb2ed5889130cceb4c49268ea4d506','admin')//

INSERT INTO Ratings
VALUES('a',1,4), ('a',2,3)//
