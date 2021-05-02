select * from volusia.sales_analysis;
select * from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) limit 100;
-- going to select top two features from volusia regression notebook along with my railroad data
select price, total_area, volusia.sales_analysis.aprland, rrdistance from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) limit 100;
-- Getting parid and geometries to do some sanity checking
select volusia.parcel.parid, volusia.parcel.geom, price, total_area, volusia.sales_analysis.aprland, rrdistance from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rrdistance < 5281 limit 100;
-- Search up 0100 land use codes
select luc, luc_desc, price, total_area from volusia.sales_analysis where luc = '0100';
-- Filter down to certain bedroom amount
select luc, luc_desc, price, total_area, rmbed from volusia.sales_analysis where luc = '0100' and rmbed = 2;
-- How many of each bedroom size?
select rmbed, count(rmbed) from volusia.sales_analysis where rmbed is not null and luc = '0100' group by rmbed order by count(rmbed);
-- going to focus on top 3 bedroom counts for joins
-- Join for 3 bedroom
select price, total_area, volusia.sales_analysis.aprland, rrdistance, rmbed, volusia.sales_analysis.luc from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 3 and volusia.sales_analysis.luc = '0100' limit 100;
-- Join for 2 bedroom
select price, total_area, volusia.sales_analysis.aprland, rrdistance, rmbed, volusia.sales_analysis.luc from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 2 and volusia.sales_analysis.luc = '0100' limit 100;
-- Join for 4 bedroom
select price, total_area, volusia.sales_analysis.aprland, rrdistance, rmbed, volusia.sales_analysis.luc from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 4 and volusia.sales_analysis.luc = '0100' limit 100;
-- 3 bedrooms within 400 ft of railroad?
select price, total_area, volusia.sales_analysis.aprland, rrdistance, rmbed, volusia.sales_analysis.luc from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 3 and volusia.sales_analysis.luc = '0100' and rrdistance < 401 limit 100;
-- 254 3 bedrooms within 400 ft of railroad
select count(*) from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 3 and volusia.sales_analysis.luc = '0100' and rrdistance < 401;
-- Looking for a few properties close to railroad to compare with Zillow
select volusia.sales_analysis.parid, rrdistance, total_area, price from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 3 and volusia.sales_analysis.luc = '0100' and rrdistance < 401;

-- Getting a few addresses
-- address:509 Dorset Cir, altkey:3459083, pid:533316000020
select address from volusia.gis_address where pid = '533316000020';
select price, total_area, volusia.sales_analysis.aprland, rrdistance, rmbed, volusia.sales_analysis.luc from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) where rmbed = 3 and volusia.sales_analysis.luc = '0100' and rrdistance < 401 and volusia.sales_analysis.parid = '3459083';
-- address: 2461 Anastasia Dr, altkey:3436857, pid:532804010230
select address from volusia.gis_address where pid = '532804010230'; 
-- address: 480 REDWOOD AV, altkey: 5562671, pid:800905170260
select address from volusia.gis_address where pid = '800905170260';
-- address: 287 EAST FIESTA KEY LOOP, altkey:8002023, pid:700713000800
select address from volusia.gis_address where pid = '700713000800';
-- address: 1807 SEGRAVE ST, altkey:3555449, pid:534403020030
select address from volusia.gis_address where pid = '534403020030';