with stg_vendor as (
    select distinct
        VendorID as vendor_id,
    from
        {{ ref('stg_yellow_tripdata') }}
)

select 
    vendor_id,
    {{ decode_vendor_id('vendor_id') }} as vendor_name,
from
    stg_vendor
order by
    vendor_id asc