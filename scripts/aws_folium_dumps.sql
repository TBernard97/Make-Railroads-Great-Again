-- Single Family 3 bedroom homes 
select parid, luc, luc_desc, aprland, total_area, ST_AsText(geom) as wkt, price from volusia.sales_analysis 
	where luc = '0100' and 
	rmbed = 3;

select COUNT(*) from volusia.sales_analysis 
	where luc = '0100' and 
	rmbed = 3;