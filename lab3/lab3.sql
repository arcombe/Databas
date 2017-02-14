PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS MoviePreformance;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Movie;
PRAGMA foreign_keys=ON;

create table Theater (
	name varchar(20),
	seats int,
	primary key (name)
);

create table Movie(
	title varchar(20),
	primary key(title)
);

create table MoviePreformance (
	title varchar(20),
	date date,
	name varchar(20),
	booked_seats integer,
	primary key (date, title),
	foreign key (title) references Movie(title),
	foreign key (name) references Theater(name)
);

create table Reservation (
	id integer,
	username varchar(20),
	title varchar(20),
	date varchar(20),
	primary key (id),
	foreign key (username) references User(username),
	foreign key (title, date) references MoviePreformance(title, date)
);

create table User (
	username varchar(20),
	name varchar(20),
	adress varchar(20),
	telephone int,
	primary key (username)
);

insert into Movie(title)
values ("Star Wars: Rouge One");

insert into Movie(title)
values ("Lala Land");

insert into Movie(title)
values ("Assassin's Creed");

insert into Movie(title)
values ("Fifty Shades Darker");

insert into Movie(title)
values ("The Lego Batman Movie");

insert into User(username, name, adress, telephone)
values ("Arcombe", "Alexander Arcombe", "Lund", 0706456761);

-- insert into Movie(title)
-- values ("Star Wars");

insert into Theater(name, seats)
values ("Salong 1", 300);

insert into MoviePreformance(title, date, name, booked_seats)
values ("Star Wars: Rouge One", "11-11-11", "Salong 1", 300);

insert into MoviePreformance(title, date, name, booked_seats)
values ("Star Wars: Rouge One", "11-11-12", "Salong 1", 300);

insert into MoviePreformance(title, date, name, booked_seats)
values ("Star Wars: Rouge One", "11-11-14", "Salong 1", 300);

-- insert into Reservation(username, title, date)
-- values ("Arcombe", "Star Wars: Rouge One", "11-11-11");

-- insert into Reservation(username, title, date)
-- values ("Arcombe", "Star Wars: Rouge One", "11-11-11");

-- insert into Reservation(username, title, date)
-- values ("Arcombe", "Star Wars: Rouge One", "11-11-11");

-- insert into Reservation(username, title, date)
-- values ("Arcombe", "Star Wars: Rouge One", "11-11-11");

-- insert into Reservation(username, title, date)
-- values ("Arcombe", "Star Wars: Rouge One", "11-11-11");

-- select *
-- from Reservation;
