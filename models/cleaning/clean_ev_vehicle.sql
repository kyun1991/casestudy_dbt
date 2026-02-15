select 
first_nz_registration_year as registration_year,
first_nz_registration_month as registration_month,
motive_power as motive_power,
tla as territorial_authority
from {{ source("rawdata_dbt","motor_vehicle_register")}}
where motive_power = 'ELECTRIC'