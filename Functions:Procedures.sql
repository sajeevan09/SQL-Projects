use week10;
drop procedure if exists my_procedure;
delimiter %%
create procedure my_procedure(in start_date date)
begin
	select * from enrollmentdate where enroll_date = start_date;
    
end %%

delimiter ;
 call my_procedure ('2024-11-23');

 drop function if exists most_populated_city;

delimiter DD
create function most_populated_city(con_name varchar(13)) returns char(35)
reads SQL Data
begin
	declare cityname char(35);
    set cityname = (select city.name from world.city, world.country where country.Continent = con_name and city.countrycode = country.code and city.population = 
		(select max(city.population) from world.city, world.country where country.continent = con_name and city.countrycode = country.code));
	return cityname;
end DD
delimiter ;

select most_populated_city('africa');