with dim_taxi as (
    select
        {{ dbt_utils.generate_surrogate_key(['vendor_id', 'passenger_count', 'trip_distance', 'store_and_fwd_flag', 'rate_code_id']) }} as taxi_id,
        {{ decode_vendor_id('vendor_id') }} as vendor_name,
        passenger_count,
        trip_distance,
        store_and_fwd_flag,
        {{ decode_rate_code('rate_code_id') }} as rate_code_name,
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