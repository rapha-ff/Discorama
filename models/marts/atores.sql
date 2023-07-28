with
    atores as (
        select *
        from {{ ref('stg_erp__actor') }}
    )

select *
from atores
