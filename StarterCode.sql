-- drops the schema if you have one that is called week8
drop schema if exists week8;

-- creates a database called week8
create schema week8;

-- makes the database active
use week8;

-- creates customers table
create table customers (
credit int not null primary key,
name varchar(20),
address varchar (25),
phone int
);
insert into customers(credit, name)
	values(100,'John'), (200, 'Jane'), (300, 'Jack'), (400, 'Jade'), (500,'Joe');

select * from customers;
-- creates flights table
create table flights (
flight varchar(6) not null, 
date date not null,
type varchar (25) check(type in ('Airbus', 'Avro RJ',  'Boing')),
constraint pk primary key (flight, date), 
index(date)
);
insert into flights(flight, date, type)
	values
		('FT100', '2023-03-07', 'Airbus'),
        ('FT100', '2023-03-08', 'Boing'),
        ('FT200', '2023-03-07', 'Airbus'),
        ('FT300', '2023-03-07', 'Boing');

select * from flights;
-- creates bookings table
create table bookings (
credit int  not null,
flight  varchar(6) not null,
date date not null, 
rowNo  int,
seat int,
constraint p_k primary key (credit, flight, date),
constraint f_k_1 FOREIGN KEY (credit) REFERENCES Customers(Credit) on delete restrict,
constraint f_k_2 FOREIGN KEY (flight, date) REFERENCES flights(flight, date)
);

insert into bookings(credit, flight, date)
	values
		(100, 'FT100', '2023-03-07'),
        (200, 'FT100', '2023-03-07');
insert into bookings(credit, flight, date)
	values
		(450, 'FT100', '2023-03-07');
select * from bookings;

create table bookings_backup as select * from bookings;
INSERT INTO customers (credit, name, address, phone)
SELECT credit, 'John Doe', address, phone
FROM customers
WHERE name = 'John';


