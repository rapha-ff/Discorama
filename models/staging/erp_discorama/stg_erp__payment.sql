with
    source_payment as (
        select 
            cast(payment_id as int) as pagamento_id
            , cast(customer_id as int) as cliente_id
            , cast(staff_id as int) as funcionario_id
            , cast(rental_id as int) as aluguel_id
            , cast(amount as numeric) as valor
            , cast(payment_date as datetime) as data_pagamento
        from {{ source('erp', 'payment') }}
    )

select *
from source_payment
