PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS MoviePreformance;
DROP TABLE IF EXISTS Threater;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Location;
PRAGMA foreign_keys=ON;

create table MoviePreformance (
	movie varchar(20),
	date date,
	primary key (movie, date)
);

create table Threater (
	name varchar(20),
	seats int,
	primary key (name)
);

create table User (
	username varchar(20),
	name varchar(20),
	adress varchar(20),
	telephone int,
	primary key (username)
);

create table Ticket (
	id integer,
	movie varchar(20),
	date date,
	username varchar(20),
	primary key (movie, date),
	foreign key(movie, date) references MoviePreformance(movie, date)
);

create table Location (
	movie varchar(20),
	date date,
	name varchar(20),
	primary key (movie, date, name),
	foreign key (movie, date) references MoviePreformance(movie, date)
);

insert into MoviePreformance(movie, date)
values ("Star Wars", "11-11-11");

insert into MoviePreformance(movie, date)
values ("Lala Land", "11-11-11");

insert into User(username, name, adress, telephone)
values ("arcombe", "Alexander Arcombe", "Lund", 0706456761);

insert into Threater(name, seats)
values ("Salong 1", 120);

-- insert into Threater(name, seats)
-- values ("Salong 1", 150);

insert into Threater(name, seats)
values ("Salong 2", 200);

insert into Location(movie, date, name)
values ("Star Wars", "11-11-11", "Salong 1");