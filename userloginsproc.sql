DELIMITER //
USE test //

DROP Procedure IF EXISTS UserLogin//

CREATE Procedure UserLogin(
 	IN uname		char(30),
 	IN pass		char(32),
 	OUT outp	INT
)
BEGIN 
	IF(SELECT Count(*) FROM Users WHERE Users.Username = uname AND Users.Password = pass)<>1
    THEN set outp= 401;
	Set outp= 500;
