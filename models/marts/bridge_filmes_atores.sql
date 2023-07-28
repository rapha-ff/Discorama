with 
    filme_ator as (
        select *
        from {{ ref('stg_erp__film_actor') }}
    )

select *
from filme_ator