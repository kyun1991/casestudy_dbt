select a.*,
b.major_name, 
c.territorial_authority 
from {{ source('rawdata_dbt', 'area_population') }} a left join {{ source('rawdata_dbt', 'area_name') }} b
on a.suburb_locality_id=b.suburb_locality_id
left join {{ source('rawdata_dbt', 'area_territory') }} c
on a.suburb_locality_id=c.suburb_locality_id
