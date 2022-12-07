select 
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    payment_type,

from
    `data-fellowship-8.nytaxi.yellow_trip_data_raw`
where VendorID is not null