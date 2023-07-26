with 
    source_addressies as (
        select
            cast(address_id as int) as endereco_id
            , cast(address as string) as endereco
            --address2 Todos os resultados são nulos
            , cast(district as string) as distrito
            , cast(city_id as int) as cidade_id
            --postal_code
            --phone
            --last_update
        from {{ source('erp', 'addressies') }}
    )

select *
from source_address
