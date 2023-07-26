with 
    source_store as (
        select
            cast(store_id as int) as loja_id
            , cast(manager_staff_id as int) as funcionario_id
            , cast(address_id as int) as endereco_id
            --last_update
        from {{ source('erp', 'store') }}
    )

select *
from source_store