with dim_zone as (
    select 
        {{ dbt_utils.generate_surrogate_key(['pickup_location_id', 'dropoff_location_id']) }} as zone_id,
        pickup_location_id,
        dropoff_location_id,
    from 
        {{ ref('stg_zone') }}
), pickup_location as (
    select 
        zone_lookup.LocationID as pickup_location_id,
        zone_lookup.Borough as pickup_borough_name,
        zone_lookup.Zone as pickup_zone_name,
        zone_lookup.service_zone as pickup_service_zone,
    from 
        dim_zone
    left join 
        {{ref('stg_zone_lookup')}} as zone_lookup
    on 
        dim_zone.pickup_location_id = zone_lookup.LocationID
), dropoff_location as (
    select 
        zone_lookup.LocationID as dropoff_location_id,
        zone_lookup.Borough as dropoff_borough_name,
        zone_lookup.Zone as dropoff_zone_name,
        zone_lookup.service_zone as dropoff_service_zone,
    from 
        dim_zone
    left join 
        {{ref('stg_zone_lookup')}} as zone_lookup
    on 
        dim_zone.dropoff_location_id = zone_lookup.LocationID
)

select 
    zone_id,
    pickup_borough_name,
    pickup_zone_name,
    pickup_service_zone,
    dropoff_borough_name,
    dropoff_zone_name,
    dropoff_service_zone,

from 
    dim_zone
left join
    pickup_location
on
    dim_zone.pickup_location_id = pickup_location.pickup_location_id
left join
    dropoff_location
on
    dim_zone.dropoff_location_id = dropoff_location.dropoff_location_id