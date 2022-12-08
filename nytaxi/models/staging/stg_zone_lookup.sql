select
    *
from
    {{ source('nytaxi', 'taxi_zone_lookup_raw') }}