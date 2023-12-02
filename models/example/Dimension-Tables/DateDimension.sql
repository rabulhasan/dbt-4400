
SELECT
  ROW_NUMBER() OVER(ORDER BY created_date) AS date_ID,
  EXTRACT(YEAR FROM created_date) AS year,
  EXTRACT(MONTH FROM created_date) AS month,
  EXTRACT(DAY FROM created_date) AS day,
  FORMAT_DATE('%B', created_date) AS month_name,
  FORMAT_DATE('%A', created_date) AS day_name,
  created_date AS full_date
FROM 
 {{ref("311_Compliant_staging")}}
  WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020



