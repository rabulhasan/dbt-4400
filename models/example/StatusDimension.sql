select row_number() over (order by unique_key) as status_id, 
status,

from `bigquery-public-data.new_york_311.311_service_requests`
limit 1000