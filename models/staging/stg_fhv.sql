{{ config(materialized='view') }}

select 
    dispatching_base_num
    , cast(pickup_datetime as timestamp) as pickup_datetime
    , cast(dropOff_datetime as timestamp) as dropoff_fatetime 
    , cast(PUlocationID as numeric) as pickup_location_id
    , cast(DOlocationID as numeric) as dropoff_location_id
    , cast(SR_Flag as numeric) as sr_flag
    , Affiliated_base_number as affiliated_base_number
from {{ source('staging','fhv_tripdata_ext') }}
limit 10
