IF OBJECT_ID('DeleteStat') IS NOT NULL
	DROP PROCEDURE DeleteStat
GO

CREATE PROCEDURE DeleteStat
@statID		int
AS
	DELETE FROM CharStats
	WHERE CharStats.StatID = @statID
	
	DELETE FROM NPCStats
	WHERE NPCStats.StatID = @statID

	DELETE FROM Stat
	WHERE Stat.StatId = @statID
GO

IF OBJECT_ID('DeleteChar') IS NOT NULL
	DROP PROCEDURE DeleteChar
GO

CREATE PROCEDURE DeleteChar
@charID		int
AS
	DELETE FROM CharStats
	WHERE CharStats.CharID = @charID

	DELETE FROM PlayerChar
	WHERE PlayerChar.CharID = @charID
GO

IF OBJECT_ID('DeleteNPC') IS NOT NULL
	DROP PROCEDURE DeleteNPC
GO

CREATE PROCEDURE DeleteNPC
@npcID		int
AS
	DELETE FROM NPCStats
	WHERE NPCStats.NPC_ID = @npcID

	DELETE FROM NPC
	WHERE NPC.NPC_ID = @npcID
GO
