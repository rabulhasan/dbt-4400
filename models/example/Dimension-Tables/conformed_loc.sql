WITH LocationD AS (
    SELECT *
    FROM {{ ref('LocationDimension') }}
),

CollisionLocationDim AS (
    SELECT *
    FROM {{ ref('CollisionLocationDimension') }}
)

SELECT
    ROW_NUMBER() OVER() AS location_ID,
    COALESCE(LocationD.borough, CollisionLocationDim.borough) AS borough,
    COALESCE( cast(LocationD.zip_code AS STRING),CAST( CollisionLocationDim.zip_code AS STRING) ) AS zip_code,
    COALESCE(LocationD.latitude, CollisionLocationDim.latitude ) AS latitude,
    COALESCE(LocationD.longitude,CollisionLocationDim.longitude) AS longitude,

FROM LocationD
FULL JOIN CollisionLocationDim ON (LocationD.longitude = CollisionLocationDim.longitude AND
LocationD.latitude = CollisionLocationDim.longitude )



