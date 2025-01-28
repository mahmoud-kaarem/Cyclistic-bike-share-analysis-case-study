WITH ConvertedToSeconds AS (
    SELECT
        CAST(SUBSTRING(ride_length, 1, 2) AS BIGINT) * 3600 +
        CAST(SUBSTRING(ride_length, 4, 2) AS BIGINT) * 60 +
        CAST(SUBSTRING(ride_length, 7, 2) AS BIGINT) AS ride_length_in_seconds
    FROM [202412tripdata]
),
AverageInSeconds AS (
    SELECT AVG(ride_length_in_seconds) AS avg_seconds
    FROM ConvertedToSeconds
)
SELECT
    CAST(avg_seconds / 3600 AS VARCHAR) + ':' +
    RIGHT('0' + CAST((avg_seconds % 3600) / 60 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST(avg_seconds % 60 AS VARCHAR), 2) AS average_ride_length
FROM AverageInSeconds;


select max(ride_length) as max_ride_length
from [202412tripdata]

SELECT top 1 day_of_week, COUNT(day_of_week) AS frequency
FROM [202412tripdata]
GROUP BY day_of_week
ORDER BY frequency DESC

