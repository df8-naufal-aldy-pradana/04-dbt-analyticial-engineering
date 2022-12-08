select 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,

from 
    {{ source('nytaxi', 'yellow_tripdata_raw') }}
