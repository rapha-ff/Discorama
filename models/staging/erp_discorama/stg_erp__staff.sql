with
    source_staff as (
        select 
            cast(staff_id as int) as funcionario_id
            , cast(first_name as string) as nome_funcionario
            , cast(last_name as string) as sobrenome_funcionario
            , cast(concat(first_name, ' ', last_name)as string) as nome_completo_funcionario
            , cast(store_id as int) as loja_id
            --address_id
            --email
            --active
            --username
            --password
            --last_update
        from {{ source('erp', 'staff') }}
    )

select *
from source_staff
