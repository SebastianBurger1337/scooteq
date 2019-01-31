-- Scooters sorted by date of acquisition ascending
SELECT
    *
FROM
    Scooter
ORDER BY
    Acquisition ASC

-- Customer sorted by last name ascending
SELECT
    *
FROM
    Customer
ORDER BY
    LastName ASC

-- Scooters currently rented
SELECT
    SCOOTER.*
FROM
    SCOOTER
JOIN
    Rental
ON
    Scooter.ScooterId = Rental.RentalId
WHERE
    RentalStatusId = 1

-- Customers that are currently renting a scooter
SELECT
    Customer.*
FROM
    Customer
JOIN
    Rental
ON
    Rental.CustomerId = Customer.CustomerId
WHERE RentalStatusId = 1

-- Customers that have previously caused accidents
SELECT
    Customer.*, Damage.Damage
FROM
    Customer
JOIN
    Damage
ON
    Damage.CustomerId = Customer.CustomerId

-- The most profitable Customer
SELECT CustomerId, SUM(Customer) AS 'Cost Sum'
FROM(
SELECT
	RentalId, CustomerId,
	CASE
	WHEN TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 >= 24 THEN
	TIMESTAMPDIFF(DAY, RentalBegin, RentalEnd) * PricePerDay
	ELSE
	TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 * PricePerHour
	END
	AS 'Customer'
FROM
     rental
JOIN
	scooter
ON
	rental.ScooterId = scooter.ScooterId
JOIN
    vehiclemodel
ON
	vehiclemodel.ModelId = scooter.ModelId
WHERE
	RentalStatusId = 3) As CostTable
GROUP BY CustomerId
ORDER BY SUM(Customer) DESC
LIMIT 1
-- OR
SELECT
	CustomerId, MAX(`Cost Sum`) As 'Max Cost Sum'
FROM
(SELECT
	CustomerId, SUM(Customer) AS 'Cost Sum'
FROM(
SELECT
	RentalId, CustomerId,
	CASE
	WHEN TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 >= 24 THEN
	TIMESTAMPDIFF(DAY, RentalBegin, RentalEnd) * PricePerDay
	ELSE
	TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 * PricePerHour
	END
	AS 'Customer'
FROM
     rental
JOIN
	scooter
ON
	rental.ScooterId = scooter.ScooterId
JOIN
    vehiclemodel
ON
	vehiclemodel.ModelId = scooter.ModelId
WHERE
	RentalStatusId = 3) As CostTable
GROUP BY CustomerId) As SummedCosts


-- Least profitable customer
SELECT CustomerId, SUM(Customer) AS 'Cost Sum'
FROM(
SELECT
	RentalId, CustomerId,
	CASE
	WHEN TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 >= 24 THEN
	TIMESTAMPDIFF(DAY, RentalBegin, RentalEnd) * PricePerDay
	ELSE
	TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 * PricePerHour
	END
	AS 'Customer'
FROM
     rental
JOIN
	scooter
ON
	rental.ScooterId = scooter.ScooterId
JOIN
    vehiclemodel
ON
	vehiclemodel.ModelId = scooter.ModelId
WHERE
	-- Only include rentals that have been completed
	RentalStatusId = 3) As CostTable
GROUP BY CustomerId
ORDER BY SUM(Customer) ASC
LIMIT 1

-- OR
SELECT
	CustomerId, MIN(`Cost Sum`) As 'Max Cost Sum'
FROM
(SELECT
	CustomerId, SUM(Customer) AS 'Cost Sum'
FROM(
SELECT
	RentalId, CustomerId,
	CASE
	WHEN TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 >= 24 THEN
	TIMESTAMPDIFF(DAY, RentalBegin, RentalEnd) * PricePerDay
	ELSE
	TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 * PricePerHour
	END
	AS 'Customer'
FROM
     rental
JOIN
	scooter
ON
	rental.ScooterId = scooter.ScooterId
JOIN
    vehiclemodel
ON
	vehiclemodel.ModelId = scooter.ModelId
WHERE
	-- Only include rentals that have been completed
	RentalStatusId = 3) As CostTable
GROUP BY CustomerId) As SummedCosts

-- Each rental that is longer than the average length
SELECT rental.* FROM
(SELECT AVG(TIMESTAMPDIFF(SECOND, RentalBegin, RentalEnd)) AS 'AverageTime'
FROM rental) As AverageRentalTime, rental
WHERE TIMESTAMPDIFF(SECOND, RentalBegin, RentalEnd) > AverageTime

--

select * 
from vehiclemodel
where priceperhour > 4;

-- Extra: Each rental and it's total cost
SELECT
	RentalId, CustomerId,
	CASE
	WHEN TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 >= 24 THEN
	TIMESTAMPDIFF(DAY, RentalBegin, RentalEnd) * PricePerDay
	ELSE
	TIMESTAMPDIFF(MINUTE, RentalBegin, RentalEnd) / 60 * PricePerHour
	END
	AS 'Kosten'
FROM
     rental
JOIN
	scooter
ON
	rental.ScooterId = scooter.ScooterId
JOIN
    vehiclemodel
ON
	vehiclemodel.ModelId = scooter.ModelId;

-- Each scooter that has more than 3 features
SELECT
*
FROM (
	 SELECT scooter.*,
			COUNT(scooterfeatures.ScooterId) AS 'Feature Count'
	 FROM scooter
		  JOIN
		  scooterfeatures
		  ON
		  scooter.ScooterId = scooterfeatures.ScooterId
	 GROUP BY scooterfeatures.ScooterId
	 ) AS FeatureCountTable
WHERE
	`Feature Count` > 3

-- The most popular manufacturer
SELECT ManRentalTable.Name, MAX(ManRentalCount) AS 'Total Rentals' FROM (
SELECT
	manufacturer.Name, COUNT(manufacturer.ManufacturerId) AS 'ManRentalCount'
FROM
	manufacturer
JOIN
	vehiclemodel
ON
	vehiclemodel.ManufacturerId = manufacturer.ManufacturerId
JOIN
	scooter
ON
	vehiclemodel.ManufacturerId = scooter.ModelId
JOIN
	rental
ON
	rental.ScooterId = scooter.ScooterId
GROUP BY
	manufacturer.ManufacturerId) AS ManRentalTable

SELECT
    JSON_OBJECT
        (
        "TimeStamp", TimeStamp, "Latitude", Latitude, "Longtitude", Longtitude
    )
FROM gpsdata ORDER BY TimeStamp ASC

select count(IncidentID) AS 'Noch zu reparieren'
from Damage
where repaired = 0;

select r.customerid, r.scooterid, count(m.name) AS 'Driven with so much different scootermodels'
from rental r
join scooter s on r.scooterid = s.scooterid
join vehiclemodel m on s.modelid = m.modelid
group by r.customerid, r.scooterid;

select r.customerid, r.scooterid, count(m.name) AS 'Driven with so much different scootermodels'
from rental r
join scooter s on r.scooterid = s.scooterid
join vehiclemodel m on s.modelid = m.modelid
group by r.customerid, r.scooterid;

select count(IncidentID) AS 'Noch zu reparieren'
from Damage
where repaired = 0;

select r.customerid, r.scooterid, count(m.name) AS 'Driven with so much different scootermodels'
from rental r
join scooter s on r.scooterid = s.scooterid
join vehiclemodel m on s.modelid = m.modelid
group by r.customerid, r.scooterid;

