SELECT
    ROW_NUMBER() OVER(ORDER BY created_date) AS time_ID,
    EXTRACT(HOUR FROM created_date) AS hour,
    EXTRACT(MINUTE FROM created_date) AS minute
FROM 
    `bigquery-public-data.new_york_311.311_service_requests`
   WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020
LIMIT 1000

