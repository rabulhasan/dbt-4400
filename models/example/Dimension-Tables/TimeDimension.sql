SELECT
    ROW_NUMBER() OVER(ORDER BY created_date) AS time_ID,
    EXTRACT(HOUR FROM created_date) AS hour,
    EXTRACT(MINUTE FROM created_date) AS minute
FROM 
    {{ ref("311_Compliant_staging")}}
   WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020


