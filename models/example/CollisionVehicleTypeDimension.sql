SELECT
  ROW_NUMBER() OVER() AS vehicleType_ID,
  vehicle_type_code1 AS vehicle_type
FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
LIMIT 1000