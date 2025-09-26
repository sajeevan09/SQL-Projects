use world;
drop table if exists city_copy;
create Table city_copy As select * from city;
select * from city_copy;

drop table if exists city_delete_log;
CREATE TABLE city_delete_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    deleted_at DATETIME NOT NULL,
    city_id INT NOT NULL,
    city_name VARCHAR(255),
    country_name VARCHAR(100)
);
select * from city_delete_log;

drop trigger if exists after_city_delete;
Delimiter $$
CREATE TRIGGER after_city_delete AFTER DELETE ON city_copy
FOR EACH ROW
BEGIN
    CALL log_city_deletion(OLD.ID, OLD.Name, OLD.Countrycode);
END $$
Delimiter ;
delete from city_copy where Name = 'Kabul';


drop procedure if exists log_city_deletion;
Delimiter ^
Create procedure log_city_deletion(in city_id int, in city_name varchar(100), in country_code char(3))
Begin
	declare country_name varchar(100);
    select Name into country_name from world.country where Code = country_code;
	insert into city_delete_log(deleted_at, city_id, city_name, country_name)
    values(now(), city_id, city_name, country_name);
end ^
Delimiter ;
delete from city_copy where ID =2;
select *  from city_delete_log;

select * from world.country;

set autocommit =0;
call delete_and_log_city(3);
drop procedure if exists delete_and_log_city;
DELIMITER $$
CREATE PROCEDURE delete_and_log_city(IN city_id INT)
BEGIN
    DECLARE city_name VARCHAR(255);
    DECLARE country_code CHAR(3);
    -- Get the city details before deletion
    SELECT Name, CountryCode INTO city_name, country_code FROM city_copy WHERE ID = city_id;
    -- Delete the city
    DELETE FROM city_copy WHERE ID = city_id;
    -- Log the deletion using the existing procedure
    CALL log_city_deletion(city_id, city_name, country_code);
    -- Commit the transaction
    COMMIT;
END$$
set autocommit =1;

DELIMITER ;
rollback;

SELECT * FROM city_delete_log;
