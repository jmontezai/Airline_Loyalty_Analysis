-- ========================================
-- Database Creation 
-- ========================================
CREATE DATABASE Airline_Loyalty_Analysis;
GO

USE Airline_Loyalty_Analysis;
GO


-- ========================================
-- Schema Creation
-- ========================================
CREATE SCHEMA Loyalty;
GO


-- ========================================
-- Calendar Table Creation
-- ========================================
CREATE TABLE Loyalty.Calendar(
	Date DATE,
	StartOfYear DATE,
	StartOfQuarter DATE,
	StartOfMonth DATE
);
GO


-- ========================================
-- Customer_Flight_Activity Table Creation
-- ========================================
CREATE TABLE Loyalty.Customer_Flight_Activity(
	LoyaltyNumber VARCHAR(25),
	Year VARCHAR(25),
	Month VARCHAR(25),
	TotalFlights VARCHAR(25),
	Distance VARCHAR(25),
	PointsAccumulated VARCHAR(25),
	PointsRedeemed VARCHAR(25),
	DollarCostPointsRedeemed VARCHAR(25)
);
GO


-- ========================================
-- Customer_loyalty_History Table Creation
-- ========================================
CREATE TABLE Loyalty.Customer_Loyalty_History(
	LoyaltyNumber INT PRIMARY KEY,
	Country VARCHAR(50),
	Province VARCHAR(50),
	City VARCHAR(50),
	PostalCode VARCHAR(50),
	Gender VARCHAR(50),
	Education VARCHAR(50),
	Salary VARCHAR(50), 
	MaritalStatus VARCHAR(50),
	LoyaltyCard VARCHAR(50),
	CLV VARCHAR(50),
	EnrollmentType VARCHAR(50),
	EnrollmentYear VARCHAR(10),
	EnrollmentMonth VARCHAR(10),
	CancellationYear VARCHAR(10),
	CancellationMonth VARCHAR(10)
);
GO


-- ========================================
-- Data Loading from .csv files
-- ========================================
-- Data imported using BULK INSERT from CSV files

BULK INSERT Loyalty.Calendar
FROM 'C:\Sql_Data\Airline_Loyalty\Calendar.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FORMAT = 'CSV'
);
GO

BULK INSERT Loyalty.Customer_Flight_Activity
FROM 'C:\Sql_Data\Airline_Loyalty\Customer Flight Activity.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FORMAT = 'CSV'
);
GO

BULK INSERT Loyalty.Customer_Loyalty_History
FROM 'C:\Sql_Data\Airline_Loyalty\Customer Loyalty History.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FORMAT = 'CSV'
);
GO
