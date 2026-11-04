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
       
select 
      o.* exclude(date_load)
    , a.* exclude(address_id, date_load)
    , p.* exclude(promo_id, date_load)
    , o.date_load as date_load --como nos interesan las orders, nos quedamos con su fecha de carga
from orders o
left join addresses a
    on o.address_id = a.address_id
left join promos p
    on o.promo_id = p.promo_id