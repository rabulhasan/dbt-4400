
SELECT
  ROW_NUMBER() OVER(ORDER BY unique_key) AS date_ID,
  EXTRACT(YEAR FROM created_date) AS year,
  EXTRACT(MONTH FROM created_date) AS month,
  EXTRACT(DAY FROM created_date) AS day,
  FORMAT_DATE('%B', created_date) AS month_name,
  FORMAT_DATE('%A', created_date) AS day_name,
  created_date AS full_date
FROM 
  `bigquery-public-data.new_york_311.311_service_requests`
LIMIT 1000


