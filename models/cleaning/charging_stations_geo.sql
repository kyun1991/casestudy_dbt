select territorial_authority, geometry
from {{ source("geo_dbt","SUBURB_AND_LOCALITIES")}}

-- table with territory and corresponding range of long/latitutde 