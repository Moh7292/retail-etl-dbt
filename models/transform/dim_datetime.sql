-- dim_datetime.sql
-- Objectif : créer une dimension temporelle à partir de la colonne InvoiceDate
-- Exemple de valeur : "12/1/10 8:26" → format M/D/YY H:MM

WITH datetime_cte AS (
  SELECT DISTINCT
    InvoiceDate AS datetime_id,

    CASE
      -- Cas 1 : format long "MM/DD/YYYY HH:MM"
      WHEN LENGTH(InvoiceDate) = 16 THEN
        PARSE_DATETIME('%m/%d/%Y %H:%M', InvoiceDate)

      -- Cas 2 : format court "M/D/YY HH:MM"
      WHEN LENGTH(InvoiceDate) <= 14 THEN
        PARSE_DATETIME('%m/%d/%y %H:%M', InvoiceDate)

      -- Optionnel : si tu veux gérer les cas avec AM/PM
      -- WHEN REGEXP_CONTAINS(InvoiceDate, r'(AM|PM)$') THEN
      --   PARSE_DATETIME('%m/%d/%y %I:%M %p', InvoiceDate)

      ELSE
        NULL
    END AS date_part

  FROM {{ source('retail_dsy', 'raw_invoice') }}
  WHERE InvoiceDate IS NOT NULL
)

SELECT
  datetime_id,
  date_part AS datetime,
  EXTRACT(YEAR FROM date_part) AS year,
  EXTRACT(MONTH FROM date_part) AS month,
  EXTRACT(DAY FROM date_part) AS day,
  EXTRACT(HOUR FROM date_part) AS hour,
  EXTRACT(MINUTE FROM date_part) AS minute,
  EXTRACT(DAYOFWEEK FROM date_part) AS weekday,
  FORMAT_DATE('%A', DATE(date_part)) AS weekday_name,
  FORMAT_DATE('%B', DATE(date_part)) AS month_name
FROM datetime_cte
