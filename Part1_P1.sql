 create schema week7;
 use week7;
 
 drop table if exists flights;
 create table flights(
	flight VARCHAR(6) not null,
    date DATE not null, 
    primary key (flight, date),
    type VARCHAR(25) check(type in ('Airbus', 'Avro RJ', 'Boing'))
);

drop table if exists customers;
create table customers(
	credit INT Primary Key not null,
    name VARCHAR(20),
    address VARCHAR(25),
    phone int
);

drop table if exists bookings;
create table bookings(
	credit INT not null,
    flight VARCHAR(6) not null,
    rowNo SMALLINT,
    seat SMALLINT,
    primary key(credit, flight), 
    foreign key(credit) references customers(credit) on delete cascade,
    foreign key(flight) references flights(flight) on delete cascade
);

alter table flights rename flight;
alter table customers rename customer;
alter table bookings rename booking;
alter table booking add unique(credit);
