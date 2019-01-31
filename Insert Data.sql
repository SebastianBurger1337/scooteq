use scooteq;


#CustomerStatus
#1
insert into customerStatus(CustomerStatus)
values ("Normal");
#2
insert into customerStatus(CustomerStatus)
values ("VIP");
#3
insert into CustomerStatus (CustomerStatus)
values ("Platinum Premium");
#Customers
#1
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Heike", "Boehm", 1, 1, "Fugger Straße 13", "Koblenz", "56076", "Germany", "1941-08-08" );
#2
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Wolfgang", "Kohl", 2, 1, "Esplanade 83", "Bad Abach", "93077", "Germany","1968-04-13" );
#3
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Lehrer", "Alexander", 1, 1, "Jahnstrassem 60", "Prien", "83203", 
"Germany","2000-01-12" );
#4
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Martina", "Sanger", 2, 1, "Sömmingerstrasse 52", "Pforzheim", "75173", "Germany", "1987-06-06" );
#5
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Tim", "Sanger", 2, 1, "Hermannstrasse 35", "Worms", "67550", "Germany","1980-03-15" );
#6
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Sven", "Koch", 1, 1, "Gruenauer Strasse 6", "Heidenau", "01801", "Germany","1973-07-10" );
#7
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Leah", "Maurer", 2, 1, "Ufnau Strasse 48", "Buxheim", "85114", "Germany","1974-02-17" );
#8
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Katharina", "Bar", 1, 1, "Budapester Strasse 54", "Solms", "35606", "Germany","1986-11-04" );
#9
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Philipp", "Eichel", 1, 1, "Park Strasse 70", "Düsseldorf", "40479", "Germany","1990-02-08" );
#10
insert into customer (FirstName, LastName, CustomerStatusId, DriversLicense, Address, City, PostalCode, Country, BirthDate)
values("Antje", "Dresdner", 1, 1, "Luebecker Strasse 70", "Haßfurt", "97432", "Germany","1976-02-14" );


INSERT INTO
    Manufacturer
    (Name)
VALUES
    ("Emil Industries"),
    ("Simon Limited"),
    ("Burger Inc."),
    ("Steffen GmbH");

INSERT INTO
    VehicleModel
    (Name, ManufacturerId, PricePerHour, PricePerDay, MinimumAge, DriversLicense)
VALUES
    ("Quattro", 1, 10.50, 39.99, 21, 1),
    ("Scooterizer 9000", 2, 4.99, 15.99, 16, 1),
    ("Scooterizer 9001", 3, 5.00, 16.00, 18, 1),
    ("Your Feet", 4, 0.01, 1.00, 0, 0);

INSERT INTO
    Features
    (Name)
VALUES
    ("Turbo"),
    ("Super-Turbo"),
    ("Functioning Brakes"),
    ("Lights"),
    ("Comfortable Seating"),
    ("Steffen's Special Bell"),
    ("Simon's Train Horn"),
    ("Emil's Waterskis"),
    ("Sebastian's Rocket Boosters");

INSERT INTO Scooter
    (ModelId, MetersDriven, Acquisition, Color)
VALUES
    (1, 1500000, '2019-01-01', 'Green'),
    (2, 160000, '2000-05-22', 'Blue'),
    (3, 0, '2010-10-10', 'Pink'),
    (4, 1000, '2013-10-31', 'Pink');

INSERT INTO ScooterFeatures
    (ScooterId, FeatureId)
VALUES
    (1, 2),
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (2, 1),
    (2, 3),
    (2, 4),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 6);



INSERT INTO
    Damage
    (Damage, CustomerId, ScooterId, PlaceOfAccident, AccidentDate, Repaired)
VALUES
    ('Scratch across the body', 4, 3, 'Hamburger Straße 10', '2019-01-30', 0),
    ('Broken Foot', 3, 4, 'Right Here', '2018-12-24', 1),
    ('Collapsed Suspension', 7, 2, 'Unknown', '2018-12-10', 1),
    ('Broken Rocket Boosters', 5, 1, 'Highway A7', '2018-10-13', 1);

INSERT INTO RentalStatus
    (RentalStatus)
VALUES
    ('Reserved'),
    ('Canceled'),
    ('Completed'),
    ('CurrentlyRented');

INSERT INTO Rental
    (CustomerId, ScooterId, RentalBegin, RentalEnd, RentalStatusId, Distance)
VALUES
    (3, 1, '2019-01-03 10:00:00', '2019-01-03 11:00:00', 3, 5000),
    (4, 1, '2019-01-02 9:00:00' , '2019-01-02 9:15:00', 3, 1000),
    (6, 2, '2019-02-01 8:00:00', NULL, 1, NULL),
    (8, 4, '2019-01-30 10:00:00', NULL, 2, NULL),
    (10,4,'2019-01-30 15:00:00', '2019-02-03 18:00:00', 4, NULL),
    (8,3,'2019-01-30 15:00:00', '2019-02-04 18:00:00', 4, NULL);

INSERT INTO GPSData
    (RentalId, TimeStamp, Latitude, Longtitude)
VALUES
    (1, '2019-01-03 10:00:00', 53.550721, 9.993026),
    (1, '2019-01-03 10:05:00', 53.551169, 9.992428),
    (1, '2019-01-03 10:10:00', 53.552274, 9.994157),
    (1, '2019-01-03 10:15:00', 53.552830, 9.993296),
    (1, '2019-01-03 10:20:00', 53.553887, 9.991648),
    (1, '2019-01-03 10:25:00', 53.555289, 9.988983),
    (1, '2019-01-03 10:30:00', 53.555289, 9.988983),
    (1, '2019-01-03 10:35:00', 53.555289, 9.988983),
    (1, '2019-01-03 10:40:00', 53.555289, 9.988983),
    (1, '2019-01-03 10:45:00', 53.556492, 9.990330),
    (1, '2019-01-03 10:50:00', 53.557039, 9.988579),
    (1, '2019-01-03 10:55:00', 53.558336, 9.989357),
    (1, '2019-01-03 11:00:00', 53.560356, 9.990708);