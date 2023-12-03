USE My_Cruise_DB;

-- Create the Ship Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
CREATE TABLE Ship(
	Ship_Number int identity (1,1) NOT NULL,
	Ship_Name varchar(50) NOT NULL,
	Launch_Datetime datetime
	CONSTRAINT PK_Ship_Number PRIMARY KEY (Ship_Number)
);

-- Create the Cruise Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
-- Also add Foreign Key relationship to Ship table via Ship_Number column in both tables
CREATE TABLE Cruise(
	Cruise_Number int identity (1,1) NOT NULL,
	Start_Datetime datetime,
	End_Datetime datetime,
	Cruise_Director_First_Name varchar(50),
	Cruise_Director_Last_Name varchar(50),
	Ship_Number int
	CONSTRAINT PK_Cruise_Number PRIMARY KEY (Cruise_Number),
	CONSTRAINT FK_Ship_Number FOREIGN KEY (Ship_Number) REFERENCES Ship(Ship_Number)
);

-- Create the Country Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
CREATE TABLE Country(
	Country_Number int identity (1,1) NOT NULL,
	Country varchar(100) NOT NULL
	CONSTRAINT PK_Country_Number PRIMARY KEY (Country_Number)
);

-- Create the Port_Visit Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
-- Also add Foreign Key relationship to Country table via Country_Number column in both tables
CREATE TABLE Port_Visit(
	Port_Number int identity (1,1) NOT NULL,
	Port_Name varchar(100),
	Number_of_Docs int,
	Port_Manager_First_Name varchar(50),
	Port_Manager_Last_Name varchar(50),
	Country_Number int,
	CONSTRAINT PK_Port_Number PRIMARY KEY (Port_Number),
	CONSTRAINT FK_Country_Number FOREIGN KEY (Country_Number) REFERENCES Country(Country_Number)
);

-- Create the Visit Table and set a Composite Primary Key with Cruise_Number and Port_Number
-- Also add Foreign Key relationships for both Cruise_Number and Port_Number columns
CREATE TABLE Visit(
	Cruise_Number int NOT NULL,
	Port_Number int NOT NULL,
	Arrival_Datetime datetime,
	Departure_Datetime datetime,
	CONSTRAINT PK_Cruise_and_Port_Numbers PRIMARY KEY (Cruise_Number,Port_Number),
	CONSTRAINT FK_Cruise_Number_Composite FOREIGN KEY (Cruise_Number) REFERENCES Cruise(Cruise_Number),
	CONSTRAINT FK_Port_Number_Composite FOREIGN KEY (Port_Number) REFERENCES Port_Visit(Port_Number)
);

-- Create the Passenger Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
CREATE TABLE Passenger(
	Passenger_Number int identity (1,1) NOT NULL,
	Passenger_First_Name varchar(50),
	Passenger_Middle_Name varchar(50),
	Passenger_Last_Name varchar(50),
	Street_Address varchar(100),
	City_Address varchar(80),
	State_Address varchar(80),
	-- Allow for Business Zip Codes
	Zip_Address varchar(15),
	Country_Name varchar(100),
	-- Allow for International Phone Numbers with various configurations
	Telephone varchar(15),
	Book_Number int,
	CONSTRAINT PK_Passenger PRIMARY KEY (Passenger_Number)
);

-- Create the Passenger_Book Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
-- Also add Foreign Key relationship to Passenger table via Passenger_Number column in both tables
CREATE TABLE Passenger_Book(
	Book_Number int identity (1,1) NOT NULL,
	-- System will INSERT 1 for Head of Family and 0 for Not Head of Family
	Head_of_Family int,
	Book_Datetime datetime,
	Passenger_Number int,
	CONSTRAINT PK_Book_Number PRIMARY KEY (Book_Number),
	CONSTRAINT FK_Passenger_Book_Number FOREIGN KEY (Passenger_Number) REFERENCES Passenger(Passenger_Number)
)

-- Create the Cabin Table and set a Composite Primary Key with Cruise_Number and Passenger_Number
-- Also add Foreign Key relationships for both Cruise_Number and Passenger_Number columns
CREATE TABLE Cabin(
	Passenger_Number int NOT NULL,
	Cruise_Number int NOT NULL,
	Cabin_Number int,
	Fair decimal(5,2),
	CONSTRAINT PK_Passenger_Cruise_Composite PRIMARY KEY(Passenger_Number,Cruise_Number),
	CONSTRAINT FK_Passenger_Composite FOREIGN KEY(Passenger_Number) REFERENCES Passenger(Passenger_Number),
	CONSTRAINT FK_Cruise_Composit FOREIGN KEY(Cruise_Number) REFERENCES Cruise(Cruise_Number)
);

-- Create the Tour Table and set Primary Key with Auto Identity starting at 1 and incrementing by 1
CREATE TABLE Tour(
	Tour_Number int identity(1,1) NOT NULL,
	Tour_Name varchar(100),
	Tour_Description varchar(250),
	-- Number of hours and minutes of tour. INSERTED as partial number 1.5 = 1 hour 30 min.
	Duration decimal(2,2),
	Price decimal(5,2),
	CONSTRAINT PK_Tour_Number PRIMARY KEY(Tour_Number)
);

-- Create the Toured Table and set a Composite Primary Key with Passenger_Number, Cruise_Number, and Tour_Number columns
-- Also add Foreign Key relationships for Passenger_Number, Cruise_Number, and Tour_Number columns
CREATE TABLE Toured(
	Passenger_Number int NOT NULL,
	Cruise_Number int NOT NULL,
	Tour_Number int NOT NULL,
	Tour_Datetime datetime,
	CONSTRAINT PK_Passenger_Cruise_Tour_Composite PRIMARY KEY(Passenger_Number,Cruise_Number,Tour_Number),
	CONSTRAINT FK_Passenger_Tour_Composite FOREIGN KEY (Passenger_Number) REFERENCES Passenger(Passenger_Number),
	CONSTRAINT FK_Cruise_Tour_Composite FOREIGN KEY (Cruise_Number) REFERENCES Cruise(Cruise_Number),
	CONSTRAINT FK_Tour_Number FOREIGN KEY (Tour_Number) REFERENCES Tour(Tour_Number)
);


