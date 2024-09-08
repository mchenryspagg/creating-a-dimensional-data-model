-- Step 1: Create Database
CREATE DATABASE DA_mchenryspagg;
USE DA_mchenryspagg;

-- Step 2 : CREATE DIMENSION TABLES
-- (a)  Customers Table:
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

-- Create the Vehicles Table:
CREATE TABLE Vehicles (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Color VARCHAR(20),
    VIN VARCHAR(50),
    RegNo VARCHAR(50),
    Mileage INT,
    OwnerName VARCHAR(100)
);

-- Create the Jobs Table
CREATE TABLE Jobs (
    JobID INT AUTO_INCREMENT PRIMARY KEY,
    JobDescription VARCHAR(255),
    Hours DECIMAL(5, 2),
    Rate DECIMAL(10, 2)
);

-- Create the Parts Table:
CREATE TABLE Parts (
    PartID INT AUTO_INCREMENT PRIMARY KEY,
    PartNumber VARCHAR(50),
    PartName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

-- Create the Locations Table
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address VARCHAR(255)
);

-- Create the Dates Table
CREATE TABLE Dates (
    DateID INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Year INT,
    Month INT,
    Day INT
);

-- Step 3: Create the Fact Table
CREATE TABLE Sales (
    InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    JobID INT,
    PartID INT,
    LocationID INT,
    DateID INT,
    ServiceCharges DECIMAL(10, 2),
    PartsCharges DECIMAL(10, 2),
    TotalSales DECIMAL(10, 2),
    TotalLabor DECIMAL(10, 2),
    TotalParts DECIMAL(10, 2),
    SalesTax DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
    FOREIGN KEY (DateID) REFERENCES Dates(DateID)
);
