with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

final as (
    select
          order_id
        , user_id
        , address_id
        , promo_id
        , created_at
        , estimated_delivery_at
        , delivered_at
        , tracking_id
        , shipping_service
        , shipping_cost
        , order_cost
        , order_total
        , status
        , date_load
    from orders
)

select * from final