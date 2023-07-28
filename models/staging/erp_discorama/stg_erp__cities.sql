with 
    source_cities as (
        select
            cast(city_id as int) as cidade_id
            , cast(city as string) as cidade
            , cast(country_id as int) as pais_id
            -- last_update 15/02/2006
        from {{ source('erp', 'cities') }}
    )

select *
from source_cities
