with Col_Loc_Dim AS (

SELECT
  Distinct
  borough AS borough,
  zip_code AS zip_code,
  latitude AS latitude,
  longitude AS longitude

FROM {{ ref('CollisionStaging') }}
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020

)
Select 
row_number() over () as location_id,
* 
From 
Col_Loc_Dim