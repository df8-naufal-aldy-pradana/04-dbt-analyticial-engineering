select
    VendorID as vendor_id,
    passenger_count,
    trip_distance,
    store_and_fwd_flag,
    RatecodeID as rate_code_id,

from 
    {{ source('nytaxi', 'yellow_tripdata_raw') }}
