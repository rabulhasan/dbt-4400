SELECT
  ROW_NUMBER() OVER(ORDER BY timestamp) AS time_ID,
  EXTRACT(HOUR FROM timestamp) AS hour,
  EXTRACT(MINUTE FROM timestamp) AS minute,
FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
LIMIT 1000