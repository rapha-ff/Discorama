with
    source_countries as (
        select
            cast(country_id as int) as pais_id 
            , cast(country as string) as pais
            -- last_update
        from {{ source('erp', 'countries') }}
    )

select *
from source_countries