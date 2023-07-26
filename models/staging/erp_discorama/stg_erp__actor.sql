with
    source_actor as (
        select 
            cast(actor_id as int) as ator_id
            , cast(first_name as string) as nome_ator
            , cast(last_name as string) as sobrenome_ator
            , cast(concat(first_name,' ', last_name) as string) as nome_completo_ator
            , cast(last_update as datetime) as ultima_atualizacao
        from {{ source('erp', 'actor') }}
    )

select *
from source_actor
