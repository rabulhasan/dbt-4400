select row_number() over (order by unique_key) as Com_location_ID, 
borough, incident_zip as zip_code, latitude, longitude

from `bigquery-public-data.new_york_311.311_service_requests`
limit 1000