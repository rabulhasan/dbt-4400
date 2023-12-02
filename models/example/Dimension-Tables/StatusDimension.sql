select row_number() over (order by created_date) as status_id, 
status

from {{ ref("311_Compliant_staging")}}
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020




