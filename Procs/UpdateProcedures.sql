IF OBJECT_ID('UpdateeUser') IS NOT NULL
	DROP PROCEDURE UpdateUser
GO

CREATE PROCEDURE UpdateUser
@userID			int,
@userEmail		varchar(255),
@userSalt		varchar(255),
@userHash		varchar(max)
AS
	UPDATE Users
	SET UserEmail = @userEmail, UserSalt = @userSalt, UserHash = @userHash
	WHERE Users.UserID = @userID
GO

IF OBJECT_ID('UpdateCharacter') IS NOT NULL
	DROP PROCEDURE UpdateCharacter
GO

CREATE PROCEDURE UpdateCharacter
@charID			int,
@charName		varchar(255),
@positionY		int,
@positionX		int,
@mapID			int
AS
	UPDATE PlayerChar
	SET CharName = @charName, Position_Y = @positionY, Position_X = @positionX, MapID = @mapID
	WHERE CharID = @charID
GO

IF OBJECT_ID('UpdateCharStat') IS NOT NULL
	DROP PROCEDURE UpdateCharacterStat
GO

CREATE PROCEDURE UpdateCharStat
@charID		int,
@statID		int,
@statValue	int
AS
	UPDATE CharStats
	SET StatValue = @statValue
	WHERE CharID = @charID AND StatID = @statID
GO

IF OBJECT_ID('UdateNPC') IS NOT NULL
	DROP PROCEDURE UpdateNPC
GO

CREATE PROCEDURE UpdateNPC
@npcID		int,
@npcName	varchar(255),
@spriteID	int
AS
	UPDATE NPC
	SET NPC_Name = @npcName, SpriteID = @spriteID
	WHERE NPC_ID = @npcID
GO

IF OBJECT_ID('UpdateNPCStat') IS NOT NULL
	DROP PROCEDURE UpdateNPCStat
GO

CREATE PROCEDURE UpdateNPCStat
@npcID		int,
@statID		int,
@statValue	int
AS
	UPDATE NPCStats
	SET StatValue = @statValue
	WHERE NPC_ID = @npcID AND StatID = @statID
GO