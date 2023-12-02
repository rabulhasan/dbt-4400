SELECT
  ROW_NUMBER() OVER(ORDER BY timestamp) AS date_ID, -- Now ordered by timestamp
  EXTRACT(YEAR FROM timestamp) AS year,
  EXTRACT(MONTH FROM timestamp) AS month,
  EXTRACT(DAY FROM timestamp) AS day,
  FORMAT_DATE('%B', timestamp) AS month_name,
  FORMAT_DATE('%A', timestamp) AS day_name,
  timestamp AS full_date
FROM {{ref('CollisionStaging')}}
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020


