with users as (
    select * from {{ ref('slv_sql_server_dbo__users') }}
),

addresses as (
    select * from {{ ref('dim_addresses') }} --no sé si es así o tengo que cogerla de la silver
),

final as (
    select
          u.user_id
        , u.first_name
        , u.last_name
        , u.email
        , u.phone_number
        , u.address_id
        , a.* exclude(address_id,date_load)
        , u.date_load
    from users u
    left join addresses a on u.address_id = a.address_id
)

select * from final