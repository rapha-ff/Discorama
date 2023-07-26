with 
    source_film as (
        select
            cast(film_id as int) as filme_id
            , cast(title as string) as titulo
            --description
            , cast(release_year as int) as ano_lancamento
            , cast(language_id as int) as lingua_id
            , cast(rental_duration as int) as duracao_aluguel
            , cast(rental_rate as numeric) as taxa_aluguel
            , cast(length as int) as duracao_filme
            , cast(replacement_cost as numeric) as custo_reposicao
            , cast(rating as string) as nota 
            --last_update
            , special_features as caracteristicas_especiais
            --fulltext 
        from {{ source('erp', 'film') }}
    )

select *
from source_film