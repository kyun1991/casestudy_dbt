select territorial_authority, geometry
from {{ sources('geo_dbt','SUBURB_AND_LOCALITIES') }}