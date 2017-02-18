IF OBJECT_ID('CreateUser') IS NOT NULL
	DROP PROCEDURE CreateUser
GO

CREATE PROCEDURE CreateUser
@userEmail	varchar(255),
@userSalt	varchar(255),
@userHash	varchar(max)
AS
	INSERT INTO Users(UserEmail, UserSalt, UserHash)
	VALUES (@userEmail, @userSalt, @userHash)
GO

IF OBJECT_ID('CreatePlayerCharacter') IS NOT NULL
	DROP PROCEDURE CreatePlayerCharacter
GO

CREATE PROCEDURE CreatePlayerCharacter
@charName	varchar(255),
@userID		int,
@positionY	int,
@positionX	int,
@mapID		int
AS
	INSERT INTO PlayerChar(CharName, UserID, Position_Y, Position_X, MapID)
	VALUES (@charName, @userID, @positionY, @positionX, @mapID)
GO

IF OBJECT_ID('CreatePlayerCharacterStat') IS NOT NULL
	DROP PROCEDURE CreatePlayerCharacterStat
GO

CREATE PROCEDURE CreatePlayerCharacterStat
@charID		int,
@statID		int,
@statValue	int
AS
	INSERT INTO CharStats(CharID, StatID, StatValue)
	VALUES(@charID, @statID, @statValue)
GO

IF OBJECT_ID('CreateStat') IS NOT NULL
	DROP PROCEDURE CreateStat
GO

CREATE PROCEDURE CreateStat
@statName	varchar(255)
AS
	INSERT INTO Stat(StatName)
	VALUES (@statName)
GO

IF OBJECT_ID('CreateNPC') IS NOT NULL
	DROP PROCEDURE CreateNPC
GO
CREATE PROCEDURE CreateNPC
@npc_Name	varchar(255),
@spriteID	int
AS
	INSERT INTO NPC(NPC_Name, SpriteID)
	VALUES (@npc_Name, @spriteID)
GO