DELIMITER //
Use test //

INSERT INTO Publishers (P_name, H_name,Img_URL)
VALUES ('Rose-Hulman','RHIT', 'https://lh3.googleusercontent.com/-7SZuNRDZqmM/AAAAAAAAAAI/AAAAAAAACCQ/lpMqfh5HXbs/s0-c-k-no-ns/photo.jpg')//

INSERT INTO Universes (U_name, Size, P_name, Img_URL, Location)
VALUES ('Life', 'Campus', 'Rose-Hulman', 'http://innovativeteacher.org/wp-content/uploads/2012/11/computer-science1.jpg', 'Universal')//

INSERT INTO Series (S_name, U_name, P_name, Img_URL)
VALUES ('Rose Plague Strikes Again', 'Life', 'Rose-Hulman', 'https://lh5.googleusercontent.com/YbVWhqX_6FxSg5bUx6dsNpIiE8d2Uit1FB_x4VtYsUurm6NTqFCo7MJf87pINZJOaoGwWjoeahOPISP4Ozw7cF2LeGgErr7rskau9KWYipBevTREqf5HRmpg-IqaM0JRh3MBeOCv')//

INSERT INTO Characters (P_name, C_name, Img_URL)
VALUES ('Aaron Wilkin', 'SQLGod', 'http://www.rose-hulman.edu/media/1506887/Wilkin-Gregory-Aaron-2014_140x175.jpg'),('Sriram Mohan', 'Database Master', 'http://www.rose-hulman.edu/media/406479/mohan1.jpg'),('David Mutchler', 'MutchDawg', 'http://www.rose-hulman.edu/media/395290/davidmutchler_140x175.jpg'), ('Rose Plague', 'Black Death', 'http://cdn.ndemiccreations.com/image/131-h650.jpeg')//

INSERT INTO CharacterSeries (S_name, C_ID)
VALUES ('Rose Plague Strikes Again', (SELECT ID FROM Characters WHERE P_name='Aaron Wilkin')), ('Rose Plague Strikes Again', (SELECT ID FROM Characters WHERE P_name='Sriram Mohan')),('Rose Plague Strikes Again', (SELECT ID FROM Characters WHERE P_name='David Mutchler')),('Rose Plague Strikes Again', (SELECT ID FROM Characters WHERE P_name='Rose Plague'))//

INSERT INTO Kills (KillerID, KilledID, Img_URL, Issue, Dsc)
VALUES ((SELECT ID FROM Characters WHERE C_name = 'Black Death'),(SELECT ID FROM Characters WHERE C_name = 'MutchDawg'),null, 'Rose Plague Strikes Again Vol 1', 'Ousted from Rose by sickness'),((SELECT ID FROM Characters WHERE C_name = 'Black Death'),(SELECT ID FROM Characters WHERE C_name = 'SQLGod'),null, 'Rose Plague Strikes Again Vol 1', 'Confined to bed by sickness'), ((SELECT ID FROM Characters WHERE C_name = 'Black Death'),(SELECT ID FROM Characters WHERE C_name = 'SQLGod'),null, 'Rose Plague Strikes Again Vol 3', 'Devastated by disease'),((SELECT ID FROM Characters WHERE C_name = 'Black Death'),(SELECT ID FROM Characters WHERE C_name = 'Database Master'),null, 'Rose Plague Strikes Again Vol 2', 'Restricted to email help by sickness'), ((SELECT ID FROM Characters WHERE C_name = 'SQLGod'),(SELECT ID FROM Characters WHERE C_name = 'Black Death'),null, 'Rose Plague Strikes Again Vol 10', 'Dominates the plague in week 10, just in time for project presentations.')//


Insert into Ratings VALUES('a',3,2), ('a',4,3), ('a',5,1), ('a', 6, 2), ('a',7,5);

