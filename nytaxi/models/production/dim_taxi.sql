with dim_taxi as (
    select
        {{ dbt_utils.generate_surrogate_key(['vendor_id', 'passenger_count', 'trip_distance', 'store_and_fwd_flag', 'rate_code_id']) }} as taxi_id,
        vendor_id,
        passenger_count,
        trip_distance,
        store_and_fwd_flag,
        rate_code_id,
    from
        {{ ref('stg_taxi') }}
    where 
        rate_code_id is not null
)

select * 
from 
    dim_taxi
where 
    passenger_count > 0
    and 
    trip_distance > 0