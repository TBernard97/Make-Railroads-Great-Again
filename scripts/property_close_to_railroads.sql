
select r.gid, r.geom, ST_Distance(r.geom, (select g2.geom from volusia.gis_parcels g2 where g2.altkey=3565215))
from
volusia.railroads r
order by 
r.geom <-> (select g2.geom from volusia.gis_parcels g2 where g2.altkey=3565215) limit 15;

-- select * from volusia.gis_parcels where sub is not null limit 15;
-- select * from volusia.parcel limit 15;

-- Select parcel data closest to a chunk of railroad
select p.parid, p.geom, p.luc_desc, p.nbhd_desc, ST_DISTANCE(p.geom, (select r.geom from volusia.railroads r where r.gid=1))
from volusia.parcel p
order by
p.geom <-> (select r.geom from volusia.railroads r where r.gid=1);

-- 195 rows in railroads
select count(*) from volusia.railroads;

-- Need to modify golf course script to update the volusia.sales table with closest railroad track geometry to parid

--given altkey select closest railraod
select r.gid, r.geom, ST_Distance(r.geom, (select p.geom from volusia.parcel p where p.parid=3565215))
from
volusia.railroads r
order by 
r.geom <-> (select p.geom from volusia.parcel p where p.parid=3565215) limit 1;

select linearid from volusia.railroads where gid = 60;

select * from volusia.parcel where parid = 122;

select count(*) from volusia.parcel where geom is not null;

--Finalized rrdistance column
select geom, parid, rrdistance from volusia.parcel where geom is not null limit 100;
