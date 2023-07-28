with 
    filme_ator as (
        select *
        from {{ ref('stg_erp__film_category') }}
    )

select *
from filme_ator