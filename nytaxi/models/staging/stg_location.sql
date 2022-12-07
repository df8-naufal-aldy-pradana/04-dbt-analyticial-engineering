select 
    PULocationID as pickup_location_id,
    DOLocationID as dropoff_location_id,
    store_and_fwd_flag,

from 
    `data-fellowship-8.nytaxi.yellow_trip_data_raw`