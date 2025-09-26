use world;

select * from city;
select * from city where CountryCode = "CAN";
select * from city where District = "Ontario";
select * from city where CountryCode = "USA";
select * from city order by district ASC;
select * from city order by population ASC;
select count(Distinct district) AS distinct_districts from city;
select count(Distinct CountryCode) AS distinct_country from city;
select countryCode, SUM(Population) as total_population 
	from city 
	group by CountryCode 
	order by total_population DESC;

SELECT COUNT(*) AS countries_with_smallest_city_population_below_1000
FROM (
    SELECT CountryCode
    FROM City
    GROUP BY CountryCode
    HAVING MIN(Population) < 1000
) AS subquery;
    
SELECT *
FROM City
WHERE Population < 1000
ORDER BY Name DESC;