use world;
select * from country;
select count(*) from country;
select * from country where Continent = 'North America';
select * from country where Region = 'Caribbean';
select count(*) from country where Region = 'North America';
select * 
	from country 
	Order By Region Desc,
    Name Asc;
select * 
	from country 
    where Population > 0
    Order By Population Asc;
select count(distinct Continent) from country;

select count(distinct CountryCode) from countrylanguage;

select * from city;
select countryCode, SUM(Population) As total_population
	from city
    group by countryCode
	Order By total_population Asc;
SELECT CountryCode, MIN(Population) AS LeastCityPopulation
	FROM City
	GROUP BY CountryCode
	HAVING LeastCityPopulation < 1000;
select countrycode, Name, Population 
	from city
    where Population = (
		select min(population)
        from city As sub
        Where sub.CountryCode = city.CountryCode
        )
	And Population < 1000
    Order By Population Asc;


    