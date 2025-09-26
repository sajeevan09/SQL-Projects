
-- How insert data from a table
use sample;

drop table workcenter;
CREATE TABLE WorkCenter(
	WorkCenterID int primary key not null AUTO_INCREMENT, 
    location char(30) unique,
    index(location));
    
    Alter table WorkCenter
    add column phone int;
    
    Alter table workcenter alter column phone set default 1000; 
    insert into workcenter (location, phone) value ("Toronto", 416000);
    select * from workcenter;
    insert into workcenter (location) values ("Calgary");
    insert into workcenter values (3, "Hamilton", 123000);
    insert into workcenter values (1, "Toronto", 647000) on duplicate key update phone = 647000;
 insert into workcenter (Location) values 
   ("Vaughn"),
   ("Aurora"),
    ("Oshawa"),
    ("Thornhill"),
    ("Markham");

create table workcenterCopy(
	WorkCenterID int primary key not null AUTO_INCREMENT, 
	location char(30) unique,
    phone int default 1000, 
	index(location));
	insert into workcentercopy select * from workcenter;
    select * from workcentercopy;
  

-- --------------------------------------------------------------------------------
-- How to delete data from a table
select * from workcentercopy;
delete from workcentercopy where location = "toronto";
delete from workcentercopy where location = "calgary" or location = "vaughn";
delete from workcentercopy where phone = 1000;
delete from workcentercopy;    -- delete all rows from the table
insert into workcentercopy select * from workcenter;	-- re copy workcenter to workcentercopy
delete from workcentercopy order by workcenterid limit 2;  -- delete id bottom three in descending order(8, 7, 6)
insert into workcentercopy (location, phone) values ("victoria", 400000000);

--  ----------------------------------------------------------------------------------
-- How to update data from a table
select * from workcenter;
update workcenter
	set location = "winnipeg"
    where workcenterid = 4;

update workcenter
set phone = 1000;
select * from workcenter order by location;

update workcenter
	set phone = 2000
    order by location 
    limit 3;
    
-- -------------------------------------------------------------------------------------
-- How to retrieve data from a table
use world;
select * from country;
select code, name, continent from country;
select code, name, continent from country where continent = "north america";

select code, name ,continent, lifeexpectancy, population from country
	where continent = "north america" and lifeexpectancy >= 78;

select code, name ,continent, lifeexpectancy, population from country
	where continent != "north america" and lifeexpectancy >= 78;
    
select code, name ,continent, lifeexpectancy as le, population from country
	where continent <> "north america" and lifeexpectancy >= 78;
	-- != => <>
    
select code, name ,continent, lifeexpectancy as le, population from country cont
	where continent <> "north america" and cont.lifeexpectancy >= 78;

-- ----------------------------------------------------------------------------------
-- How to use wildcards
select code, name, continent
		from country
        where continent not in ("north america", "south america");
select name from country
	where name like "_a_a_a%";

select * from country;
select name, indepyear from country where indepyear is not null;
        
-- ----------------------------------------------------------------------------------------
-- How to create and use views
use sample;
select * from product;
create view expensiveStuff as 
	select productID, productDescription, unitprice
    from product
    where unitprice > 300
    with check option;		-- make sure you stick to the definition of view

select * from expensivestuff;

update expensivestuff
	set unitprice = 295
    where productid = 101;




