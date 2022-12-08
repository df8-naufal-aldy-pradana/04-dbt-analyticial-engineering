select 
    PULocationID as pickup_location_id,
    DOLocationID as dropoff_location_id,

from 
    {{ source('nytaxi', 'yellow_tripdata_raw') }}