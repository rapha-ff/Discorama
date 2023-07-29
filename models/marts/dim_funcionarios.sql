with
    funcionario as (
        select 
            funcionario_id
            , nome_completo_funcionario
        from {{ ref('stg_erp__staff') }}
    )

select *
from funcionario