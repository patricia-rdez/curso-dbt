{% set excluida = ['event_id'] %}

select
    {{ dbt_utils.star(ref('slv_sql_server_dbo__events'), except= excluida) }}
from {{ ref('slv_sql_server_dbo__events') }}