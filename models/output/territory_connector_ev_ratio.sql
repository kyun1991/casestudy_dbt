with ev_aggregrated as (
    select 
    lower(TERRITORIAL_AUTHORITY) as lowercase_territorial_authority, 
    count(*) as ev_count 
    from {{ ref("clean_ev_vehicle")}} 
    group by TERRITORIAL_AUTHORITY
),
connectors_aggregated as (
    select 
    sum(number_of_connectors) as connector_count,
    lower(TERRITORIAL_AUTHORITY) as lowercase_territorial_authority
    from {{ ref("stations")}} 
    group by TERRITORIAL_AUTHORITY
)

select
a.lowercase_territorial_authority,
a.ev_count as total_evs,
coalesce(b.connector_count,0) as total_connectors,
round((a.ev_count * 1.0 /b.connector_count),2) as station_ev_ratio
from ev_aggregrated a
left join connectors_aggregated b
on a.lowercase_territorial_authority=b.lowercase_territorial_authority
order by station_ev_ratio desc