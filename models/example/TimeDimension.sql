SELECT
    ROW_NUMBER() OVER () AS time_ID,
    EXTRACT(HOUR FROM created_date) AS hour,
    EXTRACT(MINUTE FROM created_date) AS minute
FROM 
    `bigquery-public-data.new_york_311.311_service_requests`
LIMIT 1000

