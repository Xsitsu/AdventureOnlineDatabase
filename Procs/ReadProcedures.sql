IF OBJECT_ID('ReadUserCharacters') IS NOT NULL
	DROP PROCEDURE ReadUserCharacters
GO

CREATE PROCEDURE ReadUserCharacters
@userEmail VARCHAR(255)
AS
DECLARE @userID INT = (SELECT UserID FROM Users WHERE UserEmail = @userEmail)

	SELECT *
	FROM Users AS _user 
		join PlayerChar ON _user.UserID = PlayerChar.UserID --select only characters that belong to this player
	WHERE _user.UserID = @userID

GO

IF OBJECT_ID('ReadCharacterInfo') IS NOT NULL
	DROP PROCEDURE ReadCharacterInfo
GO

CREATE PROCEDURE ReadCharacterInfo
@characterID INT
AS

	SELECT * 
	FROM PlayerChar as PC
		join CharStats as PCStats on PC.CharID = PCStats.CharID
		join Stat as Stat on PCStats.StatID = Stat.StatId
	WHERE PC.CharID = @characterID
GO

IF OBJECT_ID('ReadNPCInfo')	IS NOT NULL
	DROP PROCEDURE ReadNPCInfo
GO

CREATE PROCEDURE ReadNPCInfo
@npcID		int
AS
	SELECT *
	FROM NPC as NPC
		join NPCStats as NPCStat on NPC.NPC_ID = NPCStat.NPC_ID
		join Stat	as Stat on NPCStat.StatID = Stat.StatId
	WHERE NPC.NPC_ID = @npcID
GO

IF OBJECT_ID('ReadStatInfo') IS NOT NULL
	DROP PROCEDURE ReadStatInfo
GO

CREATE PROCEDURE ReadStatInfo
@statName		varchar(255)
AS
	SELECT *
	FROM Stat
	WHERE StatName = @statName
GO