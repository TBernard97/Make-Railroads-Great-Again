select * from volusia.sales_analysis;
select * from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) limit 100;
-- going to select top two features from volusia regression notebook along with my railroad data
select price, total_area, volusia.sales_analysis.aprland, rrdistance from volusia.sales_analysis inner join volusia.parcel on (volusia.sales_analysis.parid = volusia.parcel.parid) limit 100;