-- models/fact_service_requests.sql
with service_requests as (
    select
        *,
        ROW_NUMBER() OVER (ORDER BY created_date) as service_request_id  -- This is an example of how you might create a consistent key
    from `bigquery-public-data.new_york_311.311_service_requests`
    limit 1000
),

date_dimension as (
    select * from {{ ref('DateDimension') }}
),

location_dimension as (
    select * from {{ ref('LocationDimension') }}
),

sign_complaint_dimension as (
    select * from {{ ref('SignComplaintTypeDimension') }}
),

status_dimension as (
    select * from {{ ref('StatusDimension') }}
),

time_dimension as (
    select * from {{ ref('TimeDimension') }}
)

select
    s.service_request_id,
    s.created_date,
    d.date_ID,
    l.location_ID,
    sc.sign_complaintType_ID,
    st.status_ID,
    t.time_ID
from service_requests s
left join date_dimension d on d.date_ID = s.service_request_id
left join location_dimension l on l.location_ID = s.service_request_id
left join sign_complaint_dimension sc on sc.sign_complaintType_ID = s.service_request_id
left join status_dimension st on st.status_ID = s.service_request_id
left join time_dimension t on t.time_ID = s.service_request_id
