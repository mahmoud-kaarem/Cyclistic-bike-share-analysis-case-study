DELETE 
FROM [202412tripdata]
WHERE ride_length > '24:00:00' 
  AND (start_station_name IS NULL 
       OR start_station_id IS NULL 
       OR end_station_name IS NULL 
       OR end_station_id IS NULL);
