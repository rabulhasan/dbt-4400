SELECT
  ROW_NUMBER() OVER(ORDER BY timestamp) AS time_ID,
  EXTRACT(HOUR FROM timestamp) AS hour,
  EXTRACT(MINUTE FROM timestamp) AS minute,
FROM {{ ref('CollisionStaging')}}
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
