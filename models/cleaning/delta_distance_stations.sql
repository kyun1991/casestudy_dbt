select
a.address,
a.station_name,
a.territorial_authority,
a.longitude,
a.latitude,
round(st_distance(st_point(a.longitude,a.latitude),st_point(b.longitude,b.latitude))*1.0/1000,1) as delta_distance,
b.address as closest_address,
b.station_name as closest_station

from {{ ref("stations")}} a 
cross join {{ ref("stations")}} b 
where a.address != b.address