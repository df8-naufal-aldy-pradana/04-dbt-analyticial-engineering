with stg_payment as (
    select distinct
        payment_type,
    from
        {{ ref('stg_yellow_tripdata') }}
)

select 
    payment_type as payment_id,
    {{ decode_payment_type('payment_type') }} as payment_type,
from
    stg_payment
where 
    payment_type is not null
order by
    payment_type asc