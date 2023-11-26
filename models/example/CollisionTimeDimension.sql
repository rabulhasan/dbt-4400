SELECT
  ROW_NUMBER() OVER() AS time_ID,
  EXTRACT(HOUR FROM timestamp) AS hour,
  EXTRACT(MINUTE FROM timestamp) AS minute,
FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
LIMIT 1000