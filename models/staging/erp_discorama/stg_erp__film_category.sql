with 
    source_film_category as (
        select
            cast(film_id as int) as filme_id
            , cast(category_id as int) as categoria_id
            --last_update
        from {{ source('erp', 'film_category') }}
    )

select *
from source_film_category