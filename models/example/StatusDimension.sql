SELECT
    ABS(FARM_FINGERPRINT(CONCAT(status, CAST(ROW_NUMBER() OVER () AS STRING)))) AS status_ID,
    status
FROM 
    `bigquery-public-data.new_york_311.311_service_requests`
LIMIT 1000
