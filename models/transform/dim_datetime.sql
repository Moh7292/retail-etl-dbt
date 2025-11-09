{{ config(materialized='table') }}

with src as (
  select distinct
    InvoiceDate
  from {{ source('retail_dsy', 'raw_invoice') }}
  where InvoiceDate is not null
),

parsed as (
  select
    InvoiceDate as datetime_id,
    coalesce(
      -- 12/1/2010 08:26
      safe_parse_datetime('%m/%d/%Y %H:%M', InvoiceDate),
      -- 12/1/10 08:26
      safe_parse_datetime('%m/%d/%y %H:%M', InvoiceDate),
      -- 12/1/10 08:26:00
      safe_parse_datetime('%m/%d/%y %H:%M:%S', InvoiceDate),
      -- 12/1/2010 08:26:00
      safe_parse_datetime('%m/%d/%Y %H:%M:%S', InvoiceDate)
    ) as dt
  from src
)

select
  datetime_id,
  dt as datetime,
  extract(year   from dt) as year,
  extract(month  from dt) as month,
  extract(day    from dt) as day,
  extract(hour   from dt) as hour,
  extract(minute from dt) as minute,
  extract(dayofweek from dt) as weekday
from parsed
where dt is not null
