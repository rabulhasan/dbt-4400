-- models/fact_service_requests.sql
with service_requests as (
    select
        *
    from {{ ref('311_Compliant_staging') }}
    
),
date_dimension as (
    select * from {{ ref('conform_date') }}
),

location_dimension as (
    select * from {{ ref('conformed_loc') }}
),

sign_complaint_dimension as (
    select * from {{ ref('SignComplaintTypeDimension') }}
),

status_dimension as (
    select * from {{ ref('StatusDimension') }}
)



select
    s.unique_key,
    l.location_id,
    d.date_dim_id,
    sc.sign_complaintType_ID,
    st.status_ID,
    
from service_requests s
left join date_dimension d on s.created_date = d.full_date
LEFT JOIN location_dimension l ON (l.latitude = s.latitude AND l.longitude = s.longitude)
 --           OR (
 --             ( cast(l.zip_code as string) = cast(s.incident_zip as string) or (l.zip_code is null and s.incident_zip is null))
 --              AND 
 --             (l.borough = s.borough or (l.borough is null and s.borough is null)))
left join sign_complaint_dimension sc on sc.complaint_type= s.complaint_type and sc.complaint_descriptor = s.descriptor
left join status_dimension st on st.status = s.status