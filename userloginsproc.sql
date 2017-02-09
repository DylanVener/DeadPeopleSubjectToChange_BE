DELIMITER//
USE test//

DROP Procedure IF EXISITS 'UserLogin'//

CREATE Procedure 'UserLogin'(
 	@uname		[varchar(30)],
 	@pass		[varchar(32)],
 	@out		int OUTPUT]
)
IN Users
BEGIN 
	IF(SELECT Count(*) FROM Users WHERE Users.Username = @uname AND Users.Password = @pass)<>1
	BEGIN
		RETURN 401
	END
	RETURN 500
END