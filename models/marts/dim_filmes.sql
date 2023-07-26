{{ config(materialized='table')}}

with
    inventorio as (
        select *
        from {{ ref('stg_erp__inventory') }}
    )

    , filme as (
        select *
        from {{ ref('stg_erp__film') }}
    )

    , ator as (
        select *
        from {{ ref('stg_erp__actor') }}
    )

    , categoria as (
        select *
        from {{ ref('stg_erp__category') }}
    )

    , filme_categoria as (
        select *
        from {{ ref('stg_erp__film_category') }}
    )

    , filme_ator as (
        select * 
        from {{ ref('stg_erp__film_actor') }}
    )

    , join_filme as (
        select
        inventorio.inventorio_id
        , inventorio.loja_id
        , filme.titulo
        , filme.ano_lancamento
        , filme.lingua_id
        , filme.duracao_aluguel
        , filme.taxa_aluguel
        , filme.duracao_filme
        , filme.custo_reposicao
        , filme.nota
        , filme.caracteristicas_especiais
        , ator.nome_completo_ator
        , categoria.nome_categoria
        from filme
        left join inventorio using(filme_id)
        left join filme_ator using(filme_id)
        left join ator using(ator_id)
        left join filme_categoria using(filme_id)
        left join categoria using(categoria_id)
    )

select *
from join_filme