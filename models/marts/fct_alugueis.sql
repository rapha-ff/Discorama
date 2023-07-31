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

    , filmes as (
        select *
        from {{ ref('stg_erp__film') }}
    )

    , join_alugueis as (
        select 
            alugueis.aluguel_id
            , alugueis.cliente_id as fk_cliente
            , alugueis.funcionario_id as fk_funcionario
            , inventario.filme_id as fk_filme
            , inventario.loja_id as fk_loja
            , inventario.inventario_id

            , pagamentos.cliente_id as cliente_pagamento
            , pagamentos.funcionario_id as funcionario_pagamento

            , pagamentos.data_pagamento
            , alugueis.data_aluguel
            , alugueis.data_devolucao

            , pagamentos.pagamento_id
            , filmes.duracao_aluguel
            , pagamentos.valor
            , filmes.taxa_aluguel
        from alugueis
        left join inventario using(inventario_id)
        left join pagamentos using(aluguel_id)
        left join filmes using(filme_id)
    )

    , metricas as (
        select
            *
            , date_diff(data_pagamento, data_devolucao, day) as pagamento_devolucao
            , date_diff(data_devolucao, data_aluguel, day) as tempo_com_filme
            , case when duracao_aluguel >= date_diff(data_devolucao, data_aluguel, day) then 0
            when duracao_aluguel < date_diff(data_devolucao, data_aluguel, day) then date_diff(data_devolucao, data_aluguel, day) - duracao_aluguel
            else null end as atraso
        from join_alugueis
    )

select *
from metricas
