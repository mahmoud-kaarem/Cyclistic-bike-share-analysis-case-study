WITH ConvertedToSeconds AS (
    SELECT
        CAST(SUBSTRING(ride_length, 1, 2) AS BIGINT) * 3600 +
        CAST(SUBSTRING(ride_length, 4, 2) AS BIGINT) * 60 +
        CAST(SUBSTRING(ride_length, 7, 2) AS BIGINT) AS ride_length_in_seconds,
        member_casual,
        day_of_week
    FROM fullYearData
),
AverageInSeconds AS (
    SELECT 
        member_casual,
        day_of_week,
        AVG(ride_length_in_seconds) AS avg_seconds
    FROM ConvertedToSeconds
    GROUP BY member_casual, day_of_week
)
SELECT
    member_casual,
    day_of_week,
    CAST(avg_seconds / 3600 AS VARCHAR) + ':' +
    RIGHT('0' + CAST((avg_seconds % 3600) / 60 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST(avg_seconds % 60 AS VARCHAR), 2) AS average_ride_length
FROM AverageInSeconds
order by day_of_week;

