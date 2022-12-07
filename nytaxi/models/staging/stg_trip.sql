select
    VendorID as vendor_id,
    passenger_count,
    trip_distance,
    RatecodeID as rate_code_id,

from 
    `data-fellowship-8.nytaxi.yellow_trip_data_raw`

where VendorID is not null