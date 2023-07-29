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

-- Existem 5 pagamentos para o mesmo aluguel_id (4591), por serem feitos por clientes diferente, em lojas diferente e em datas diferentes considero um erro
-- Na tabela de alugueis aparece que o aluguel foi feito pelo cliente 182 e o inventário é o 2276. 
-- O valor de 3.99 é condizente, uma vez que um mesmo aluguel_id (7534) teve a mesma duração (9 dias) e teve esse mesmo valor.
-- Assim deixarei apenas o pagamento_id 31069.0 e os outros serão eliminados do database

    , source_payment_clean as (
        select *
        from source_payment
        where aluguel_id not in (select aluguel_id from source_payment group by aluguel_id having count(*) > 1) or (pagamento_id = 31069)
    )
  
select *
from source_payment_clean
