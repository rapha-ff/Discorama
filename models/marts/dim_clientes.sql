with 
    clientes as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , endereco as (
        select *
        from {{ ref('stg_erp__addressies') }}
    )

    , cidade as (
        select *
        from {{ ref('stg_erp__cities') }}
    )

    , pais as (
        select *
        from {{ ref('stg_erp__countries') }}
    )

    , join_clientes as (
        select
            clientes.cliente_id
            , clientes.loja_id
            , clientes.nome_completo_cliente
            , clientes.data_de_criacao
            , clientes.is_ativo
            , endereco.endereco
            , endereco.distrito
            , cidade.cidade
            , pais.pais
            , clientes.ultima_atualizacao
        from clientes
        left join endereco using(endereco_id)
        left join cidade using(cidade_id)
        left join pais using(pais_id)
    )

select *
from join_clientes
