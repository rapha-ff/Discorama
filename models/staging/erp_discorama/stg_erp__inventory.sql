with 
    source_inventory as (
        select
            cast(inventory_id as int) as inventorio_id
            , cast(film_id as int) as filme_id
            , cast(store_id as int) as loja_id
            --last_update
        from {{ source('erp', 'inventory') }}
    )

select *
from source_inventory
