select
    ROW_NUMBER() OVER(ORDER BY created_date ) AS sign_complaintType_ID,
    complaint_type,
    descriptor as complaint_descriptor
from `bigquery-public-data.new_york_311.311_service_requests`
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020
limit 1000




