SELECT
ROW_NUMBER() OVER(ORDER BY timestamp) AS Incident_ID, number_of_persons_killed as Death,
number_of_persons_injured as Injured,
timestamp FROM `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions` 
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
LIMIT 1000