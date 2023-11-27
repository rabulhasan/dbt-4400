SELECT
  ROW_NUMBER() OVER(ORDER BY timestamp) AS vehicleType_ID,
  vehicle_type_code1 AS vehicle_type
FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
LIMIT 1000