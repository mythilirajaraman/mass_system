CREATE TABLE IF NOT EXISTS Type (
	ID INT PRIMARY KEY, 
	NAME VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Vehicle (
	ID INT auto_increment PRIMARY KEY, 
	NAME VARCHAR(255),
	TypeID INT
);

CREATE TABLE IF NOT EXISTS Road (
	ID INT auto_increment PRIMARY KEY , 
	NAME VARCHAR(255), 
	LENGTH DOUBLE,
	SPEED INT,
	TRAFFICSTATUS INT
);

CREATE TABLE IF NOT EXISTS Stop (
	ID INT auto_increment PRIMARY KEY, 
	NAME VARCHAR(255), 
	X INT,
	Y INT,
	TypeID INT,
);

CREATE TABLE IF NOT EXISTS Route (
	ID INT auto_increment PRIMARY KEY, 
	NAME VARCHAR(255), 
	NO VARCHAR(255), 
	TypeID INT,
);

CREATE TABLE IF NOT EXISTS RouteStop (
	ID INT auto_increment PRIMARY KEY, 
	ROUTEID INT,
	STOPID INT
);

CREATE TABLE IF NOT EXISTS StopRoad (
	ID INT auto_increment PRIMARY KEY, 
	STOPID_S INT,
	STOPID_E INT,
	ROADID INT
);


CREATE TABLE IF NOT EXISTS Rider (
	ID INT auto_increment PRIMARY KEY, 
	NAME VARCHAR(255), 
	CURR_STOP_ID INT,
	DEST_STOP_ID INT,
);