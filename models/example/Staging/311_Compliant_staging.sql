select
ROW_NUMBER() OVER(ORDER BY created_date) AS Complaint_ID,
    unique_key,
    cast(created_date as date) as created_date,
    cast(closed_date as date) as closed_date,
    complaint_type,
    descriptor,
    location_type,
    incident_zip,
    incident_address,
    street_name,
    address_type,
    city,
    status,
    borough,
    latitude,
    longitude,
    location
from `bigquery-public-data.new_york_311.311_service_requests`

where longitude is not null and latitude is not null  and EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020

