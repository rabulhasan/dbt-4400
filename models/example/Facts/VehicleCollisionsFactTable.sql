-- models/CollisionFactTable.sql
with
    collision_data as (select * from {{ ref('CollisionStaging') }}),

    collision_date_dimension as (select * from {{ ref('conform_date') }}),

    collision_location_dimension as (
        select * from {{ ref('CollisionLocationDimension') }}
    ),

    -- collision_time_dimension as (select * from {{ ref("CollisionTimeDimension") }}),
    collision_vehicle_dimension as (
        select * from {{ ref('CollisionVehicleTypeDimension') }}
    )

select
    cd.unique_key,
    cd.number_of_pedestrians_killed,
    cd.number_of_persons_injured,
    cd.number_of_persons_killed,
    cdd.date_dim_id,
    cld.location_id,
    -- ctd.time_id as collision_time_id,
    cvd.vehicletype_id

from collision_data cd
left join collision_date_dimension cdd on  cd.timestamp = cdd.full_date  -- Adjust as needed
left join collision_location_dimension cld on cld.latitude = cd.latitude
    and cld.longitude = cd.longitude  -- Adjust as needed
-- left join collision_time_dimension ctd on ctd.time_id = cd.collision_id -- Adjust
-- as needed
left join collision_vehicle_dimension cvd on cd.vehicle_type_code1 = cvd.vehicle_type -- Adjust as needed
    -- left join collision_incidents_dimension ci on ci.timestamp = cd.timestamp --
    -- This assumes that timestamp can be used to join
    
