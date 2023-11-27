select row_number() over (order by unique_key) as status_id, 
status,

from `bigquery-public-data.new_york_311.311_service_requests`
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020
limit 1000