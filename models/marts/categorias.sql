with 
    categorias as (
        select * 
        from {{ ref('stg_erp__category') }}
    )

select *
from categorias
