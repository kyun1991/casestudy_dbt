with ev_temp as (
    select 
    registration_year, 
    count(*) as ev_count
    from {{ ref("clean_ev_vehicle")}}
    group by registration_year
),

station_temp as (
    select 
    year(DATE_FIRST_OPERATIONAL) as registration_year,
    sum(NUMBER_OF_CONNECTORS) as connector_count
    from {{ ref("stations")}}
    group by registration_year
)

select 
coalesce(a.registration_year,b.registration_year) as year,
coalesce(a.ev_count,0) as total_ev,
coalesce(b.connector_count,0) as total_connectors,
sum(total_ev) over (order by coalesce(a.registration_year,b.registration_year)) as cumulativte_total_ev,
sum(total_connectors) over (order by coalesce(a.registration_year,b.registration_year)) as cumulativte_total_connectors,
round(cumulativte_total_ev*1.0/cumulativte_total_connectors ,2) as ev_ratio_now,
10.0 as upper_threshold
from ev_temp a full outer join station_temp b
on a.registration_year=b.registration_year 
order by year 