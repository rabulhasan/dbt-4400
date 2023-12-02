select
    row_number() over (order by timestamp) as vehicletype_id,
    vehicle_type_code1 as Vehicle_Type
from {{ ref('CollisionStaging')}}
where extract(year from timestamp) between 2017 and 2020
