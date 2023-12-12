select
    borough,
    cast(timestamp as date) as timestamp,
    latitude ,
    longitude,
    location,
    number_of_pedestrians_killed,
    number_of_persons_injured,
    number_of_persons_killed,
    unique_key,
    vehicle_type_code1,
    zip_code
from `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020 and latitude is not null and longitude is not null 
