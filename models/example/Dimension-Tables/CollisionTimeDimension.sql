select
    borough
 
from `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020 and latitude is not null and longitude is not null 


