select
    --  Use : to access the JSON key, then :: to set the data type
    variant_col:NAME ::varchar as major_name,
    to_date(variant_col:dateFirstOperational ::varchar, 'DD/MM/YYYY') as date_first_operational,
    variant_col:numberOfConnectors ::number as number_of_connectors,

    variant_col:latitude ::float as latitude,
    variant_col:longitude ::float as longitude

from {{ source("rawdata_dbt", "charging_stations")}}