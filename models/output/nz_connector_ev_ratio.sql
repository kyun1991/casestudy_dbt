select 

(select sum(NUMBER_OF_CONNECTORS) from {{ ref("stations")}}) as total_connectors ,
(select count(*) from {{ ref("clean_ev_vehicle")}}) as total_evs,
round( (total_evs * 1.0 /total_connectors),2)  as station_ev_ratio 
