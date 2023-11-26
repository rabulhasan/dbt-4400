-- models/CollisionFactTable.sql
with collision_data as (
    select
        *,
        ROW_NUMBER() OVER (ORDER BY timestamp) as collision_id
    from `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
    limit 1000
),

collision_date_dimension as (
    select * from {{ ref('CollisionDateDimension') }}
),

collision_location_dimension as (
    select * from {{ ref('CollisionLocationDimension') }}
),

collision_time_dimension as (
    select * from {{ ref('CollisionTimeDimension') }}
),

collision_vehicle_dimension as (
    select * from {{ ref('CollisionVehicleTypeDimension') }}
)

select
    cd.collision_id,
    cd.timestamp as collision_timestamp,
    cdd.date_ID as collision_date_ID,
    cld.location_ID as collision_location_ID,
    ctd.time_ID as collision_time_ID,
    cvd.vehicleType_ID as collision_vehicleType_ID
from collision_data cd
left join collision_date_dimension cdd on cdd.date_ID = cd.collision_id
left join collision_location_dimension cld on cld.location_ID = cd.collision_id
left join collision_time_dimension ctd on ctd.time_ID = cd.collision_id
left join collision_vehicle_dimension cvd on cvd.vehicleType_ID = cd.collision_id
