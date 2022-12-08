select 
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,

from
    {{ source('nytaxi', 'yellow_tripdata_raw') }}