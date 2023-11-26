SELECT
    ROW_NUMBER() OVER(ORDER BY unique_key) AS time_ID,
    EXTRACT(HOUR FROM created_date) AS hour,
    EXTRACT(MINUTE FROM created_date) AS minute
FROM 
    `bigquery-public-data.new_york_311.311_service_requests`
LIMIT 1000

