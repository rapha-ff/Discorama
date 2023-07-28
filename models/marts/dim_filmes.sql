with 
    filme as (
        select *
        from {{ ref('stg_erp__film') }}
    )

select *
from filme