select 
    tpep_pickup_datetime,
    tpep_dropoff_datetime,

from 
    `data-fellowship-8.nytaxi.yellow_trip_data_raw`

where VendorID is not null