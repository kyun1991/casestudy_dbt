with area as(
select 
TERRITORIAL_AUTHORITY,
sum(population_estimate) as population
from {{ ref("area_info")}}
group by TERRITORIAL_AUTHORITY
),

regional_chargers as (
    select
    TERRITORIAL_AUTHORITY,
    sum(NUMBER_OF_CONNECTORS) as connector_total
    from {{ ref("stations")}}
    group by TERRITORIAL_AUTHORITY
)

select
a.TERRITORIAL_AUTHORITY,
a.population,
b.connector_total,
round(a.population*1.0/b.connector_total ,2) as population_connector_ratio
from area a left join regional_chargers b 
on a.TERRITORIAL_AUTHORITY=b.TERRITORIAL_AUTHORITY