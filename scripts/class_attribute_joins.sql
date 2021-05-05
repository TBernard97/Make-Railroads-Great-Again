-- Airport attribute join
-- NOTE: Airport distance is in miles
-- Data acquired from: https://github.com/RossDickinson/CS540_Project_Airport
select * from volusia.airport_distance limit 100;
select a.distance, a.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.airport_distance a 
	inner join volusia.parcel p on p.parid = a.parid
	inner join volusia.sales_analysis s on s.parid = a.parid;
	
-- School attribute join
-- NOTE: School distance is in miles
-- Data acquired from: https://github.com/Hanan2265/parcel_schools-
select * from volusia.school_distance limit 100;
select c.scdistance, c.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.school_distance c 
	inner join volusia.parcel p on p.parid = c.parid
	inner join volusia.sales_analysis s on s.parid = c.parid;
	
-- Hospital attribute join
-- NOTE: Hospital distance is in miles
-- Data acquired from: https://github.com/ArwaAlshamikh/volusia.parcel_hospitals
select * from volusia.hospital_distance limit 100;
select h.hdistance, h.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.hospital_distance h 
	inner join volusia.parcel p on p.parid = h.parid
	inner join volusia.sales_analysis s on s.parid = h.parid;

select * from volusia.sales_analysis limit 100;
	
-- Groceries attribute join
-- NOTE: Grocery distance is in miles
-- Data acquired from: https://github.com/albluwif/Nearest-Grocery
select * from volusia.groceries_distance limit 100;
select g.groc_distance, g.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.groceries_distance g 
	inner join volusia.parcel p on p.parid = g.parid
	inner join volusia.sales_analysis s on s.parid = g.parid;
	
-- Crime attribute join
-- NOTE: Crime distance is in miles
-- Scripts to create data set acquired from: https://github.com/cobosd/diogo_volusia_sales_analysis
select * from volusia.crime_sales_analysis limit 100;
select c.crime_dist, c.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.crime_sales_analysis c 
	inner join volusia.parcel p on p.parid = c.parid
	inner join volusia.sales_analysis s on s.parid = c.parid;
	
	
	
-- All attributes
select a.distance, a.parid, p.rrdistance, s.total_area, s.aprland, s.price, e.scdistance, h.hdistance, g.groc_distance, c.crime_dist from volusia.airport_distance a 
	inner join volusia.parcel p on p.parid = a.parid
	inner join volusia.sales_analysis s on s.parid = a.parid
	inner join volusia.school_distance e on e.parid = a.parid
	inner join volusia.hospital_distance h on h.parid = a.parid
	inner join volusia.groceries_distance g on g.parid = a.parid
	inner join volusia.crime_sales_analysis c on c.parid = a.parid;

-- Queries filtering for railroad distance and rooms
-- Have to introduce these constraints based on correlation and findings in previous rrdistance_regression notebook and related queries

--Airport distance
select a.distance, p.rrdistance, s.total_area, s.aprland, s.price from volusia.airport_distance a  
	inner join volusia.parcel p on p.parid = a.parid 
	inner join volusia.sales_analysis s on s.parid = a.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100' ;

--School distance
select c.scdistance, c.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.school_distance c 
	inner join volusia.parcel p on p.parid = c.parid
	inner join volusia.sales_analysis s on s.parid = c.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100';

--Hospital distance
select h.hdistance, h.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.hospital_distance h 
	inner join volusia.parcel p on p.parid = h.parid
	inner join volusia.sales_analysis s on s.parid = h.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100' ;

--Groceries distance
select g.groc_distance, g.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.groceries_distance g 
	inner join volusia.parcel p on p.parid = g.parid
	inner join volusia.sales_analysis s on s.parid = g.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100' ;

--Crime distance
select c.crime_dist, c.parid, p.rrdistance, s.total_area, s.aprland, s.price from volusia.crime_sales_analysis c 
	inner join volusia.parcel p on p.parid = c.parid
	inner join volusia.sales_analysis s on s.parid = c.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100';
	

-- All attributes
select a.distance, a.parid, p.rrdistance, s.total_area, s.aprland, s.price, e.scdistance, h.hdistance, g.groc_distance, c.crime_dist from volusia.airport_distance a 
	inner join volusia.parcel p on p.parid = a.parid
	inner join volusia.sales_analysis s on s.parid = a.parid
	inner join volusia.school_distance e on e.parid = a.parid
	inner join volusia.hospital_distance h on h.parid = a.parid
	inner join volusia.groceries_distance g on g.parid = a.parid
	inner join volusia.crime_sales_analysis c on c.parid = a.parid
	where p.rrdistance < 401 and s.rmbed = 3 and s.luc = '0100';
	
	
