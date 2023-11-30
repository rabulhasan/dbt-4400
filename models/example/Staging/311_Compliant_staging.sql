select
ROW_NUMBER() OVER(ORDER BY created_date) AS Complaint_ID,
    unique_key,
    created_date,
    closed_date,
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
