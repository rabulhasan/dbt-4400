select
    ROW_NUMBER() OVER(ORDER BY created_date ) AS sign_complaintType_ID,
    complaint_type,
    descriptor as complaint_descriptor
from {{ref("311_Compliant_staging")}}
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020





