-- WITH conform_date_1 AS (
--   SELECT
--     *
--   FROM {{ ref('DateDimension') }}
-- ),
-- conform_date_2 AS (
--   SELECT
--   *
--   FROM {{ ref('CollisionDateDimension') }}
-- )
-- SELECT
--   ROW_NUMBER() OVER () AS date_ID,
--   COALESCE(conform_date_1.year, conform_date_2.year) AS year,
--   COALESCE(conform_date_1.month, conform_date_2.month) AS month,
--   COALESCE(conform_date_1.day, conform_date_2.day) AS day,
--   COALESCE(conform_date_1.month_name, conform_date_2.month_name) AS month_name,
--   COALESCE(conform_date_1.day_name, conform_date_2.day_name) AS day_name
-- FROM conform_date_1
-- FULL JOIN conform_date_2 ON (conform_date_1.month_name = conform_date_2.month_name AND conform_date_1.year = conform_date_2.year)

SELECT
  ROW_NUMBER() OVER() as date_dim_id,
  FORMAT_DATE("%Y%m%d", d) as date_integer,
  d AS full_date,
  EXTRACT(YEAR FROM d) AS year,
  EXTRACT(WEEK FROM d) AS year_week,
  EXTRACT(DAY FROM d) AS year_day,
  EXTRACT(MONTH FROM d) AS month,
  FORMAT_DATE('%B', d) as month_name,
  FORMAT_DATE('%w', d) AS week_day,
  FORMAT_DATE('%A', d) AS day_name,
  (CASE WHEN FORMAT_DATE('%A', d) IN ('Sunday', 'Saturday')
       THEN 0 ELSE 1 END) AS day_is_weekday,
FROM (
  SELECT * FROM 
 UNNEST (GENERATE_DATE_ARRAY('2017-01-01', '2021-01-01', INTERVAL 1 DAY) ) AS d )