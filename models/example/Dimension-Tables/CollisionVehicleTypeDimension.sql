Select * , 
row_number () over ()  as vehicletype_id

from  (

select
    Distinct
    vehicle_type_code1 as Vehicle_Type
from {{ ref('CollisionStaging')}}
 ) 


