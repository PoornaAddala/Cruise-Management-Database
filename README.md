# Cruise-Management-Database
Designing Cruise Management Database using ER diagram

# Overview
The Cruise Management Database is a comprehensive relational database designed to facilitate the management of cruise-related information, covering ships, cruises, countries, ports, visits, passengers, bookings, cabins, tours, and tour participation. This repository provides SQL scripts to create the necessary database objects and insert sample data, offering a solid foundation for cruise management systems.

# Database Objects

# Ship Table:
Ship_Number (Primary Key, Auto Identity)
Ship_Name (VARCHAR)
Launch_Datetime (DATETIME)
Cruise Table:
Cruise_Number (Primary Key, Auto Identity)
Start_Datetime (DATETIME)
End_Datetime (DATETIME)
Cruise_Director_First_Name (VARCHAR)
Cruise_Director_Last_Name (VARCHAR)
Ship_Number (Foreign Key to Ship)

# Country Table:
Country_Number (Primary Key, Auto Identity)
Country (VARCHAR)

# Port_Visit Table:
Port_Number (Primary Key, Auto Identity)
Port_Name (VARCHAR)
Number_of_Docs (INT)
Port_Manager_First_Name (VARCHAR)
Port_Manager_Last_Name (VARCHAR)
Country_Number (Foreign Key to Country)

# Visit Table:
Cruise_Number (Foreign Key to Cruise)
Port_Number (Foreign Key to Port_Visit)
Arrival_Datetime (DATETIME)
Departure_Datetime (DATETIME)

# Passenger Table:
Passenger_Number (Primary Key, Auto Identity)
Passenger_First_Name (VARCHAR)
Passenger_Middle_Name (VARCHAR)
Passenger_Last_Name (VARCHAR)
Street_Address (VARCHAR)
City_Address (VARCHAR)
State_Address (VARCHAR)
Zip_Address (VARCHAR)
Country_Name (VARCHAR)
Telephone (VARCHAR)
Book_Number (INT)

# Passenger_Book Table:
Book_Number (Primary Key, Auto Identity)
Head_of_Family (INT)
Book_Datetime (DATETIME)
Passenger_Number (Foreign Key to Passenger)

# Cabin Table:
Passenger_Number (Foreign Key to Passenger)
Cruise_Number (Foreign Key to Cruise)
Cabin_Number (INT)
Fare (DECIMAL)

# Tour Table:
Tour_Number (Primary Key, Auto Identity)
Tour_Name (VARCHAR)
Tour_Description (VARCHAR)
Duration (DECIMAL)
Price (DECIMAL)

# Toured Table:
Passenger_Number (Foreign Key to Passenger)
Cruise_Number (Foreign Key to Cruise)
Tour_Number (Foreign Key to Tour)
Tour_Datetime (DATETIME)

# Database Setup:
Use the My_Cruise_DB database.
Execute the provided SQL code to create tables and establish relationships.

# Data Insertion:
Use additional SQL statements to insert data into the tables.

# Queries:
Write custom queries to retrieve specific information based on your requirements.
