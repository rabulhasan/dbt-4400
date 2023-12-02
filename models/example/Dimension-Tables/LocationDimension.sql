select row_number() over (order by created_date) as Com_location_ID, 
borough, incident_zip as zip_code, latitude, longitude

from {{ ref("311_Compliant_staging")}}
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020
