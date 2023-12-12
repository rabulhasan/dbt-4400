select

    unique_key
    
from `bigquery-public-data.new_york_311.311_service_requests`

where longitude is not null and latitude is not null  and EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020

