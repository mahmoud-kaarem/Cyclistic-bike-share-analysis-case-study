UPDATE [202412tripdata]
SET ride_length = '24:00:00'
WHERE ride_length > '24:00:00'
  AND member_casual = 'casual';

