With Complaint_Location As (
    SELECT
    Distinct
  borough AS borough,
 incident_zip AS zip_code,
 latitude AS latitude,
 longitude AS longitude

FROM {{ ref('311_Compliant_staging') }}
WHERE EXTRACT(YEAR FROM created_date) BETWEEN 2017 AND 2020

)
Select 
 
   * 
  FROM Complaint_Location 

