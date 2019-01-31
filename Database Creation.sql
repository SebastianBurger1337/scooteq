CREATE DATABASE IF NOT EXISTS ScooTeq;

USE ScooTeq;

CREATE TABLE IF NOT EXISTS CustomerStatus
(
    CustomerStatusId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CustomerStatus NVARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Customer
(
    CustomerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,FirstName NVARCHAR(50)
    ,LastName NVARCHAR(50)
    ,CustomerStatusId INT NOT NULL
    ,DriversLicense BIT
    ,Address NVARCHAR(100)
    ,City NVARCHAR(60)
    ,PostalCode NVARCHAR(60)
    ,Country NVARCHAR(100)
    ,BirthDate DATE
    ,FOREIGN KEY (CustomerStatusId)
    REFERENCES CustomerStatus(CustomerStatusId)
);


CREATE TABLE IF NOT EXISTS Manufacturer
(
    ManufacturerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Name NVARCHAR(50)
);

CREATE TABLE IF NOT EXISTS VehicleModel
(
    ModelId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Name NVARCHAR(50)
    ,ManufacturerId INT NOT NULL
    ,PricePerHour DECIMAL(15,2)
    ,PricePerDay DECIMAL(15,2)
    ,MinimumAge INT
    ,DriversLicense BIT
	,FOREIGN KEY(ManufacturerId)
	REFERENCES Manufacturer(ManufacturerId)
);

CREATE TABLE IF NOT EXISTS Scooter
(
    ScooterId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,ModelId INT NOT NULL
    ,MetersDriven INT NOT NULL
    ,Acquisition DATETIME
    ,Color NVARCHAR(25)
	,FOREIGN KEY(ModelId)
	REFERENCES VehicleModel(ModelId)
);

CREATE TABLE IF NOT EXISTS RentalStatus
(
    RentalStatusId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,RentalStatus NVARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Rental
(
    RentalId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,CustomerId INT NOT NULL
    ,ScooterId INT NOT NULL
    ,RentalBegin DATETIME
    ,RentalEnd DATETIME
    ,RentalStatusId INT
    ,Distance INT
	,FOREIGN KEY(CustomerId)
	REFERENCES Customer(CustomerId)
	,FOREIGN KEY(ScooterId)
	REFERENCES Scooter(ScooterId)
    ,FOREIGN KEY(RentalStatusId)
    REFERENCES RentalStatus(RentalStatusId)
);

CREATE TABLE IF NOT EXISTS DAMAGE
(
    IncidentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Damage NVARCHAR(200)
    ,CustomerID INT NOT NULL
    ,ScooterId INT NOT NULL
    ,PlaceOfAccident NVARCHAR(200)
    ,AccidentDate DATETIME
    ,Repaired BIT
	,FOREIGN KEY(CustomerID)
	REFERENCES Customer(CustomerId)
    ,FOREIGN KEY(ScooterId)
    REFERENCES Scooter(ScooterId)
);

CREATE TABLE IF NOT EXISTS Features
(
    FeatureId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,Name NVARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ScooterFeatures
(
    ScooterId INT NOT NULL,
    FeatureId INT NOT NULL,
    PRIMARY KEY(ScooterId, FeatureId),
    FOREIGN KEY(ScooterId)
	REFERENCES Scooter(ScooterId),
	FOREIGN KEY(FeatureId)
	REFERENCES Features(FeatureId)
);

CREATE TABLE IF NOT EXISTS GPSData
(
    RentalId INT NOT NULL,
    TimeStamp DATETIME NOT NULL,
    Latitude DECIMAL(9,6),
    Longtitude DECIMAL(9,6),
    PRIMARY KEY (RentalId, TimeStamp),
    FOREIGN KEY (RentalId)
    REFERENCES Rental(RentalId)
);