DROP TABLE TYPE IF EXISTS;
DROP TABLE BUS IF EXISTS;
DROP TABLE BusRoute IF EXISTS;
DROP TABLE RIDER IF EXISTS;
DROP TABLE ROAD IF EXISTS;
DROP TABLE ROUTE IF EXISTS;
DROP TABLE ROUTESTOP IF EXISTS;
DROP TABLE STOP IF EXISTS;
DROP TABLE STOPROAD IF EXISTS;
DROP TABLE TRAIN IF EXISTS;
DROP TABLE TRAINROUTE IF EXISTS;
DROP TABLE TRAINSTOP IF EXISTS;
DROP TABLE VEHICLE IF EXISTS;
DROP TABLE BUSSTOP IF EXISTS;

CREATE TABLE IF NOT EXISTS ROUTESTOP (
	ID INT auto_increment PRIMARY KEY,
	ROUTEID INT NOT NULL,
	STOPID INT NOT NULL,
	Sequence INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS STOP (
	ID INT auto_increment PRIMARY KEY,
	STOPID INT NOT NULL,
	STOPNAME VARCHAR(50) not NULL,
	Riders INT NOT NULL,
	X FLOAT NOT NULL,
	Y FLOAT NOT NULL,	
	TYPE INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS ROUTE (
	ID INT auto_increment PRIMARY KEY,
	ROUTEID INT NOT NULL,
	ROUTENUMBER INT not NULL,
	ROUTENAME Varchar(50) NOT NULL,	
	TYPE INT NOT NULL,
);

CREATE TABLE IF NOT EXISTS VEHICLE (
	ID INT auto_increment PRIMARY KEY, 
	VehicleID int not null,
    RouteID INT NOT NULL,
    CurrentStop INT,
    NEXTSTOP INT,
    Passengers INT,
    Capacity INT,
    Speed INT,
    Direction VARCHAR(255),
    type int
);

CREATE TABLE IF NOT EXISTS ROAD (
	ID INT auto_increment PRIMARY KEY, 
	ROADID int not null,
	ROADNAME Varchar(50) not null,
	ROADLENGTH FLOAT not null,
	SPEEDLIMIT int,
	TRAFFICSTATUS int,
	type int not null,
);

CREATE TABLE IF NOT EXISTS Rider (
	ID INT auto_increment PRIMARY KEY, 
	RiderID int not null,
	RiderNAME Varchar(50) not null,
	CurrentStopID int not null,
	DestinationStopID int not null,
	RouteID int not null,
);

CREATE TABLE if NOT EXISTS EVENT (
	iD INT auto_increment PRIMARY KEY,
	RANK INT NOT NULL,
	VEHICLEID INT not null,
);

create table if not EXISTS STOPROAD (
	iD INT auto_increment PRIMARY KEY,
	RouteID int not null,
	stopid_from int not null,
	stopid_to int not null,
	roadid int not null,
);


CREATE TABLE IF NOT EXISTS BusRoute (
	ID INT NOT NULL PRIMARY KEY, 
	No INT, 
	NAME VARCHAR(255), 
);

CREATE TABLE IF NOT EXISTS TrainRoute (
	ID INT NOT NULL PRIMARY KEY, 
	No INT, 
	NAME VARCHAR(255), 
);


CREATE TABLE IF NOT EXISTS Bus (
	ID INT auto_increment PRIMARY KEY, 
    RouteID INT	REFERENCES busRoute(ID),
    CurrentStop INT,
    Passengers INT,
    Capacity INT,
    Speed INT,
    Direction VARCHAR(255),
);

CREATE TABLE IF NOT EXISTS Train (
	ID INT auto_increment PRIMARY KEY, 
    RouteID INT	REFERENCES trainRoute(ID),
    CurrentStop INT,
    Passengers INT,
    Capacity INT,
    Speed INT,
    Direction VARCHAR(255),
);

CREATE TABLE IF NOT EXISTS BusStop (
	ID INT auto_increment PRIMARY KEY, 
	NAME INT,
	Riders INT,
	X FLOAT,
	Y FLOAT,
	LENGTH FLOAT,
	SPEED FLOAT,
	TRAFFICSTATUS FLOAT,
    RouteID INT	REFERENCES busRoute(ID)
);

CREATE TABLE IF NOT EXISTS TrainStop (
	ID INT auto_increment PRIMARY KEY, 
	NAME INT, 
	Riders INT,
	X FLOAT,
	Y FLOAT,
	LENGTH FLOAT,
	SPEED INT,
	TRAFFICSTATUS INT,
    RouteID INT	REFERENCES trainRoute(ID)
);

CREATE TABLE IF NOT EXISTS Rider (
	ID INT auto_increment NOT NULL PRIMARY KEY, 
	NAME VARCHAR(255), 
	CURR_STOP_ID INT,
	DEST_STOP_ID INT,
);