delete 
from [202412tripdata]
where ride_length = '00:00:00'
	and (start_station_name is null or end_station_name is null)


