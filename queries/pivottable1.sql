WITH ConvertedToSeconds AS (
    SELECT
        CAST(SUBSTRING(ride_length, 1, 2) AS BIGINT) * 3600 +
        CAST(SUBSTRING(ride_length, 4, 2) AS BIGINT) * 60 +
        CAST(SUBSTRING(ride_length, 7, 2) AS BIGINT) AS ride_length_in_seconds , member_casual
    FROM fullYearData
),
AverageInSeconds AS (
    SELECT member_casual,
	AVG(ride_length_in_seconds) AS avg_seconds
    FROM ConvertedToSeconds
	group by(member_casual)
)
SELECT
	member_casual,
    CAST(avg_seconds / 3600 AS VARCHAR) + ':' +
    RIGHT('0' + CAST((avg_seconds % 3600) / 60 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST(avg_seconds % 60 AS VARCHAR), 2) AS average_ride_length
FROM AverageInSeconds;




