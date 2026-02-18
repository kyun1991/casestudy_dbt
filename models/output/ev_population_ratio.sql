select
a.TERRITORIAL_AUTHORITY,
a.population_connector_ratio,
b.station_ev_ratio
from {{ ref("station_population_ratio")}} a left join {{ ref("territory_connector_ev_ratio")}} b
on LOWER(a.TERRITORIAL_AUTHORITY)=b.lowercase_territorial_authority