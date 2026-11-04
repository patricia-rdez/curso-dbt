with orders as(
    select * 
    from {{ ref('slv_sql_server_dbo__orders') }}
), addresses as(
    select * 
    from {{ ref('slv_sql_server_dbo__addresses') }}
), promos as(
    select * 
    from {{ ref('slv_sql_server_dbo__promos') }}
)
       
select * 
from orders
left join addresses
    on orders.address_id = addresses.address_id
left join promos
    on orders.promo_id = promos.promo_id