with
    source_category as (
        select 
            cast(category_id as int) as categoria_id
            , cast(name as string) as nome
            -- last_update
        from {{ source('erp', 'category') }}
    )

select *
from source_category