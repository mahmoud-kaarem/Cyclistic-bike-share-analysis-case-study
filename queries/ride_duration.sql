SELECT ride_length
  FROM [Cyclistic].[dbo].[202407tripdata]
  order by ride_length desc


-- code for calculate duartion of ride
-- Step 1: Add the new column
ALTER TABLE [202407tripdata]
ADD ride_length VARCHAR(8);

-- Step 2: Update the column with ride durations
UPDATE [202407tripdata]
SET ride_length = 
    RIGHT('00' + CAST(DATEDIFF(SECOND, started_at, ended_at) / 3600 AS VARCHAR(2)), 2) + ':' +
    RIGHT('00' + CAST((DATEDIFF(SECOND, started_at, ended_at) % 3600) / 60 AS VARCHAR(2)), 2) + ':' +
    RIGHT('00' + CAST(DATEDIFF(SECOND, started_at, ended_at) % 60 AS VARCHAR(2)), 2);
