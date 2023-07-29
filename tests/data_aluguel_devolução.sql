with
    devolucao_maior_entrega as (
        select *
        from {{ ref('stg_erp__rental') }}
        where data_devolucao < data_aluguel
    )

select * 
from devolucao_maior_entrega