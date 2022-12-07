{#  
    This macro returns the desciprtion of the payment type
#}

{% macro get_payment_type_description(payment_type) -%}

    case {{ payment_type }}
        when 1 then 'Credit card'
        when 2 then 'Cash'
        when 3 then 'No charge'
        when 4 then 'Dispute'
        when 5 then 'Unknown'
        when 6 then 'Voided trip'
    end

{%- endmacro %}

select 
    {{ get_payment_type_description('payment_type') }} as payment_type_description,
from 
    {{ source('nytaxi', 'yellow_trip_data_raw') }}
where VendorID is not null

-- create or alter view {{ ref('taxi') }} as
-- select 
--     case payment_type
--         when 1 then 'Credit card'
--         when 2 then 'Cash'
--         when 3 then 'No charge'
--         when 4 then 'Dispute'
--         when 5 then 'Unknown'
--         when 6 then 'Voided trip'
--     end as payment_type_description,
-- from 
--     {{ source('nytaxi', 'yellow_trip_data_raw') }}
-- where VendorID is not null