create schema week10;
use week10;

create table country like world.country;
insert into country select * from world.country;


create table countriesInContinents(
	continent enum('Asia', 'Europe', 'North America', 'Africa', 'Oceania', 'Antarctica', 'South America') primary key,
    numberOfCountries int
);
-- ---------------------------------------------------------------------------------------------------
-- triggers
insert into countriesInContinents
	select continent, Count(name)
    from country
    group by continent;
    
select * from countriesInContinents;

create trigger addCountryNumber after insert on Country
	for each row
    update countriesInContinents
    set numberOfCountries = numberOfCountries +1
    where countriesInContinents.continent = NEW.continent;
    
insert into country (code, name, continent) values('MAH', 'Marzieh.Lan', 'North America');
select * from country where code = 'MAH';
select * from countriesInContinents;
drop trigger addCountryNumber;
 
create table enrollmentDate(
	studentID int not null primary key,
    enroll_date date);
create trigger addDate before insert on enrollmentDate
	for each row 
    set NEW.enroll_date = current_date();
insert into enrollmentDate(studentId) value (10000);
select * from enrollmentDate;
insert into enrollmentDate(studentId) value (20000);
select * from enrollmentDate;

create trigger getInfo before delete on enrollmentDate
	for each row set @studentid = OLD.studentID;
delete from enrollmentDate where studentId = 10000;
select @studentId;
-- --------------------------------------------------------------------------------------------

 

