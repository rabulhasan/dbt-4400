SELECT 
 row_number() over () as location_ID,
borough, incident_zip AS zip_code, 
latitude, longitude, location_type
 FROM `bigquery-public-data.new_york_311.311_service_requests` LIMIT 1000