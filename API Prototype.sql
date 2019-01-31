-- Prototype for the API
-- The GPS data is located in the GPSData table.
-- It is tied to the rental table per its RentalId.
-- JSON results are returned via the MySQL JSON_OBJECT() function.

SELECT
    JSON_OBJECT
        (
        "TimeStamp", TimeStamp, "Latitude", Latitude, "Longtitude", Longtitude
    )
FROM gpsdata WHERE RentalId = 1 order BY TimeStamp ASC

CREATE PROCEDURE GPSData.DeleteEntriesOlderThanSevenDays()
BEGIN
    DELETE FROM
        GPSDATA
    WHERE
        DATEDIFF(CURDATE(), TimeStamp) > 7;
END