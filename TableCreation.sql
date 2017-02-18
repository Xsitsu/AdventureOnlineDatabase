if OBJECT_ID('NPCStats', 'U') IS NOT NULL
	drop table NPCStats;

if OBJECT_ID('CharStats', 'U') IS NOT NULL
	drop table CharStats;	

if OBJECT_ID('PlayerChar', 'U') IS NOT NULL
	drop table PlayerChar;

if OBJECT_ID('Stat', 'U') IS NOT NULL
	drop table Stat;

if OBJECT_ID('NPC', 'U') IS NOT NULL
	drop table NPC;

if OBJECT_ID('Users', 'U') IS NOT NULL
	drop table Users;


create table Users 
(
	UserID			int identity not null,
	UserEmail		varchar(255) unique not null,
	UserSalt		varchar(255) not null,
	UserHash		varchar(max) not null,

	primary key (UserID)
);

create table PlayerChar
(
	CharID			int identity not null,
	CharName		varchar(255) not null,
	UserID			int references Users(UserID) not null,
	Position_X		int not null,
	Position_Y		int not null,
	MapID			int not null,

	primary key (CharID)
);

create table Stat
(
	StatId			int identity not null,
	StatName		varchar(255) unique not null,

	primary key (StatID)
);

create table CharStats
(
	CharID			int references PlayerChar(CharID) not null,
	StatID			int references Stat(StatID) not null,
	StatValue		int not null,

	primary key (CharID, StatID)
);

create table NPC
(
	NPC_ID			int identity not null,
	NPC_Name		varchar(255) not null,
	SpriteID		int not null,
	
	primary key (NPC_ID)
);

create table NPCStats
(
	NPC_ID			int references NPC(NPC_ID) not null,
	StatID			int references Stat(StatID) not null,
	StatValue		int not null,
	
	primary key (NPC_ID, StatID)
);