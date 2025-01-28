select member_casual,day_of_week,count(ride_id) as number_of_rides
from fullYearData
group by member_casual,day_of_week
order by day_of_week , member_casual