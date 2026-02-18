select 
a.*
from {{ ref("delta_distance_stations")}} a
qualify row_number() over (partition by a.address order by a.delta_distance)= 1