with yellow_tripdata as (
    select 
        {{ dbt_utils.generate_surrogate_key(['VendorId', 'tpep_pickup_datetime', 'tpep_dropoff_datetime', 'PULocationID', 'DOLocationID']) }} as trip_id,
        VendorId as vendor_id,
        tpep_pickup_datetime as pickup_datetime,
        tpep_dropoff_datetime as dropoff_datetime,
        passenger_count,
        trip_distance,
        RateCodeID as rate_code_id,
        PULocationID as pickup_location_id,
        DOLocationID as dropoff_location_id,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
    from 
        {{ ref('stg_yellow_tripdata') }}
    where 
        VendorID = 1 
        or 
        VendorID = 2
)

select *
from 
    yellow_tripdata
where
    passenger_count > 0
    and
    trip_distance > 0