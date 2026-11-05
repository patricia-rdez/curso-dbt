{{
    config(
        severity='error',
        error_if='>0'
    )
}}

with orders as(
    select * from {{ref('fct_orders')}}
),
order_items as(
    select * from {{ref('fct_order_items')}}
), 
joined as(
    select 
          o.*
        , oi.* exclude(order_id, date_load)
    from orders o
    left join order_items oi
        on o.order_id = oi.order_id
),
sin_linea as(
    select
        *
    from joined
    where order_item_id is null
)

select * from sin_linea
