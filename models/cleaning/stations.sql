select a.*, b.TERRITORIAL_AUTHORITY from {{ ref("parsed_charging_stations")}} a
left join {{ ref("charging_stations_geo")}} b
on st_within(To_geometry(st_point(a.longitude,a.latitude)) ,b.geometry)

-- st_point > geography type. we need to use geometry type. st_within(geometry,geometry) or st_within(geography,geography)