with stg_rate_code as (
    select distinct
        RateCodeID as rate_code_id,
    from
        {{ ref('stg_yellow_tripdata') }}
)

select 
    rate_code_id,
    {{ decode_rate_code('rate_code_id') }} as rate_code_name,
from
    stg_rate_code
where
    rate_code_id is not null
order by
    rate_code_id asc