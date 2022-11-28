create table language (
	language_id serial primary key,
	language_name varchar(70) not null unique,
	nationality_id int2 not null references nationality(nationality_id)
	)

create table nationality (
	nationality_id serial primary key,
	nationality_name varchar(70) not null unique,
	country_id int2 not null references country(country_id)
	)
	
create table country (
	country_id serial primary key,
	country_name varchar(70) not null unique
	)
	
insert into country  (country_name)
values
	('England'),
	('Turkey'),
	('Belarus'),
	('Espain'),
	('Poland');

insert into nationality (nationality_name, country_id)
values
	('British', 1),
	('Turkish', 2),
	('Belarusian', 3),
	('Spanish', 4),
	('Polish', 5);


	
insert into "language" (language_name, nationality_id)
values
	('English', 4),
	('Turkish', 5),
	('Belarussian', 6),
	('Spanish', 7),
	('Polish', 8);
	
create table film_new (
	film_name_id serial primary key,
	film_name varchar(255) not null,
	film_year int2 check (film_year > 0),
	film_rental_rate numeric(4,2) default 0.99,
	film_duration int2 not null check (film_duration > 0)	
	)
	
insert into film_new (film_name, film_year, film_rental_rate, film_duration)
select *
from unnest (
	array['The Shawshank Redemption', 'The Green Mile', 'Back to the Future', 'Forrest Gump', 'Schindler’s List'],
	array[1994, 1999, 1985, 1994, 1993],
	array[2.99, 0.99, 1.99, 2.99, 3.99],
	array[142, 189, 116, 142, 195])
	
update film_new
set film_rental_rate = film_rental_rate + 1.41

delete from film_new 
where film_name_id = 3

insert into film_new (film_name, film_year, film_rental_rate, film_duration)
values 
('Bad Boys', 2001, 2.9, 120)

select film_name, film_year, film_rental_rate, film_duration, round(film_duration/60.,2)
from film_new

drop table film_new