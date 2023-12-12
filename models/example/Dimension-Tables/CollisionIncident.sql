
SELECT
ROW_NUMBER() OVER(ORDER BY timestamp) AS Incident_ID, number_of_persons_killed as Death,
number_of_persons_injured as Injured,
timestamp FROM {{ref('CollisionStaging')}}
WHERE EXTRACT(YEAR FROM timestamp) BETWEEN 2017 AND 2020
