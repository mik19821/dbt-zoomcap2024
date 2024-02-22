{{ config(materialized="view") }}

select 
    dispatching_base_num,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
    -- pulocationid as pickup_locationid,
    -- dolocationid as dropoff_locationid,
    pulocationid as pickup_locationid,
    dolocationid as dropoff_locationid,
    cast(sr_flag as integer) as is_shared_ride
from {{ source("staging", "fhv_tripdata_nonp") }}

-- dbt run -m stg_fhv --vars '{'is_test_run',default=false}'
-- {% if var('is_test_run', default=true) %}

--     limit 100

-- {% endif %}