
-- models/CollisionFactTable.sql
with
    collision_data as (
        select *, row_number() over (order by timestamp) as collision_id
        from `bigquery-public-data.new_york_mv_collisions.nypd_mv_collisions`
        WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
        
    ),

    collision_date_dimension as (select * from {{ ref("CollisionDateDimension") }}),

    collision_location_dimension as (
        select * from {{ ref("CollisionLocationDimension") }}
    ),

    collision_time_dimension as (select * from {{ ref("CollisionTimeDimension") }}),

    collision_vehicle_dimension as (
        select * from {{ ref("CollisionVehicleTypeDimension") }}
    ),

    collision_incidents_dimension as (
        select * from {{ ref("CollisionIncident") }}
    )

select
    cd.collision_id,
    ci.incident_id,
    ci.Death,
    ci.Injured,
    cd.timestamp as collision_timestamp,
    cdd.date_id as collision_date_id,
    cld.location_id as collision_location_id,
    ctd.time_id as collision_time_id,
    cvd.vehicletype_id as collision_vehicletype_id

from collision_data cd
left join collision_date_dimension cdd on cdd.date_id = cd.collision_id -- Adjust as needed
left join collision_location_dimension cld on cld.location_id = cd.collision_id -- Adjust as needed
left join collision_time_dimension ctd on ctd.time_id = cd.collision_id -- Adjust as needed
left join collision_vehicle_dimension cvd on cvd.vehicletype_id = cd.collision_id -- Adjust as needed
left join collision_incidents_dimension ci on ci.timestamp = cd.timestamp -- This assumes that timestamp can be used to join
