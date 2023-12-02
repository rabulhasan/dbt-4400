

SELECT
 ROW_NUMBER() OVER(ORDER BY timestamp) AS location_ID,
  borough,
  zip_code,
  latitude,
  longitude
FROM {{ ref('CollisionStaging') }}
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
