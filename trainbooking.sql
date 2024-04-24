-- create table i213_trainclass(
-- train_class_id int,class_name varchar(20),fare_factor numeric
-- )
-- insert into i213_trainclass values(1,'First AC',8),(2,'Second AC',6),(3,'Third AC',4),(4,'Sleeper',2),(5,'General',1);
-- create table i213_trainfares (
-- distance int,base_fare numeric
-- );
-- insert into i213_trainfares values(50,6.0),(100,5.5),(150,5.2),(200,5.0),(250,4.5),(300,4.0) 
-- create table i213_stationdistance(from_station_code char(4),to_station_code char(4),distance int);

-- INSERT INTO i213_stationdistance (from_station_code, to_station_code, distance)
-- VALUES
-- ('BZA', 'CHE', 100),
-- ('BZA', 'VSKP', 150),
-- ('BZA', 'TPTY', 200),
-- ('BZA', 'RJY', 220),
-- ('BZA', 'OGL', 230),
-- ('BZA', 'GDR', 260),
-- ('BZA', 'NLR', 350),

-- ('CHE', 'VSKP', 200),
-- ('CHE', 'TPTY', 250),
-- ('CHE', 'RJY', 300),
-- ('CHE', 'OGL', 320),
-- ('CHE', 'GDR', 330),
-- ('CHE', 'NLR', 360),

-- ('VSKP', 'TPTY', 120),
-- ('VSKP', 'RJY', 150),
-- ('VSKP', 'OGL', 180),
-- ('VSKP', 'GDR', 190),
-- ('VSKP', 'NLR', 220),

-- ('TPTY', 'RJY', 200),
-- ('TPTY', 'OGL', 230),
-- ('TPTY', 'GDR', 260),
-- ('TPTY', 'NLR', 275),

-- ('RJY', 'OGL', 260),
-- ('RJY', 'GDR', 300),
-- ('RJY', 'NLR', 390),

-- ('OGL', 'GDR', 450),
-- ('OGL', 'NLR', 480),

-- ('GDR', 'NLR', 50);

-- create or replace function i213_getfare(class_id int,from_station char(4),to_station char(4))
-- returns numeric
-- language plpgsql
-- as $body$
-- declare
-- farefactor int;
-- basefare int;
-- distance_total int;
-- begin
-- select distance into distance_total from i213_stationdistance where from_station_code=from_station and to_station_code=to_station;
-- select base_fare into basefare from i213_trainfares offset div(distance_total,50)-1 limit 1;
-- select fare_factor into farefactor from i213_trainclass where train_class_id=class_id;
-- return(distance_total*basefare*farefactor);
-- end;
-- $body$
-- select i213_getfare(5,'CHE','OGL')






