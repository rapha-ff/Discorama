with 
    alugueis as (
        select *
        from {{ ref('stg_erp__rental') }}
    )

    , pagamentos as (
        select *
        from {{ ref('stg_erp__payment') }}
    )

    , inventario as (
        select *
        from {{ ref('stg_erp__inventory') }}
    )

    , join_alugueis as (
        select 
            alugueis.aluguel_id
            , alugueis.cliente_id as fk_clientes
            , alugueis.funcionario_id as fk_funcionarios
            , inventario.filme_id as fk_filmes
            , inventario.loja_id as fk_lojas
            , inventario.inventario_id

            , pagamentos.valor

            , pagamentos.cliente_id as cliente_pagamento
            , pagamentos.funcionario_id as funcionario_pagamento

            , alugueis.data_aluguel
            , alugueis.data_devolucao
            , pagamentos.data_pagamento

            , pagamentos.pagamento_id
        from alugueis
        left join inventario using(inventario_id)
        left join pagamentos using(aluguel_id)
    )

    , metricas as (
        select
            *
            , date_diff(data_pagamento, data_devolucao, day) as pagamento_devolucao
            , date_diff(data_devolucao, data_aluguel, day) as duracao_aluguel
        from join_alugueis
    )

select *
from metricas
