select 
    *
from
    {{ source('nytaxi', 'yellow_tripdata_raw') }}
where
    VendorID = 1 or VendorID = 2
    and
    RateCodeID between 1 and 6 
    and 
    RateCodeID != 99
    and
    payment_type between 1 and 6