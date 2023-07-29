with
    loja as (
        select *
        from {{ ref('stg_erp__store') }}
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

    , join_loja as (
        select
            loja.loja_id
            , endereco.endereco
            , endereco.distrito
            , cidade.cidade
            , pais.pais
        from loja
        left join endereco using(endereco_id)
        left join cidade using(cidade_id)
        left join pais using(pais_id)
    )

select * 
from join_loja
