PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS movie_stars;
PRAGMA foreign_keys=ON;



create table movies(
	title varchar(20),
	year int,
	lenght int,
	typ varchar(20),
	primary key (title, year)
);

create table movie_stars(
	title varchar(20),
	year int,
	star_name varchar(20),
	primary key (title, year)
);

create view old_movies as
select *
from movies
join movie_stars
using (title, year);