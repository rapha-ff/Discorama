with 
    source_rental as (
        select
            cast(rental_id as int) as aluguel_id
            , cast(date(rental_date) as date) as data_aluguel
            , cast(inventory_id as int) as inventario_id
            , cast(customer_id as int) as cliente_id
            , cast(date(return_date) as date) as data_devolucao
            , cast(staff_id as int) as funcionario_id
            -- last_update
        from {{ source('erp', 'rental') }}
    )

select *
from source_rental
