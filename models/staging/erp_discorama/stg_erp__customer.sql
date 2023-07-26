with 
    source_customer as (
        select
            customer_id
            , cast(store_id as int) as loja_id 
            , cast(first_name as string) as nome_cliente
            , cast(last_name as string) as sobrenome_cliente
            , cast(concat(first_name, " ", last_name) as string) as nome_completo_cliente
            -- email
            , cast(address_id as int) as endereco_id
            -- activebool possui todos os valores como true, incondizente com a coluna active, dessa maneira utilizarei a coluna active
            , cast(create_date as datetime) as data_de_criacao
            , cast(last_update as datetime) as ultima_atualizacao
            , case when active = 0 then False else True end as is_ativo
        from {{ source('erp', 'customer') }}
    )

select count(*)
from source_customer
