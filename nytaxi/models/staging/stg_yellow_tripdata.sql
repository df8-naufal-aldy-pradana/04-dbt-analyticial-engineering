select 
    *
from
    {{ source('nytaxi', 'yellow_tripdata_raw') }}