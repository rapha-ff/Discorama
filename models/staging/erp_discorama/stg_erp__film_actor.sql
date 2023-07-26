with 
    source_film_actor as (
        select
            cast(actor_id as int) as ator_id
            , cast(film_id as int) as filme_id
            --last_update
        from {{ source('erp', 'film_actor') }}
    )

select *
from source_film_actor
