PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS MoviePreformance;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS MovieReservation;
DROP TABLE IF EXISTS Location;
PRAGMA foreign_keys=ON;


create table Movie (
	title varchar(20),
	primary key (title)
);

create table MoviePreformance (
	date date,
	prefNbr integer,
	primary key (date, prefNbr)
);

create table Theater (
	name varchar(20),
	seats int,
	primary key (name)
);

create table Plays (
	title varchar(20),
	prefNbr integer,
	date date,
	primary key (date, title),
	foreign key (title) references Movie(title),
	foreign key (prefNbr, date) references MoviePreformance(prefNbr, date)
);

create table Location(
	name varchar(20),
	date date,
	prefNbr integer,
	primary key (name, prefNbr),
	foreign key (name) references Theater(name),
	foreign key (date, prefNbr) references MoviePreformance(date, prefNbr)
);

create table Reservation (
	id integer,
	primary key (id)
);

create table MovieReservation(
	id integer references Reservation(id),
	date date,
	prefNbr integer,
	primary key (id),
	foreign key (prefNbr, date) references MoviePreformance(prefNbr, date)
);

create table User (
	username varchar(20),
	name varchar(20),
	adress varchar(20),
	telephone int,
	primary key (username)
);

create table Ticket (
	
	date date,	
	username varchar(20),
	id integer,
	primary key (id),
	foreign key (id) references Reservation(id),
	foreign key (username) references User(username)
	foreign key ( date) references MoviePreformance(movie,date)
);

insert into Movie(title)
values ("Star Wars");

-- insert into Movie(title)
-- values ("Star Wars");

insert into Movie(title)
values ("Assassin's Creed");

insert into Movie(title)
values ("Lala Land");

insert into Theater(name, seats)
values ("Salong 1", 300);

-- insert into Theater(name, seats)
-- values ("Salong 1", 200);

insert into Theater(name, seats)
values ("Salong 2", 170);

insert into MoviePreformance(date, prefNbr)
values ("11-11-11", 1);

insert into MoviePreformance(date, prefNbr)
values ("11-11-11", 2);

insert into MoviePreformance(date, prefNbr)
values ("11-11-12", 1);

insert into Plays(title, prefNbr, date)
values ("Star Wars", 1, "11-11-11");

-- insert into Plays(title, prefNbr, date)
-- values ("Star Wars", 2, "11-11-11");

insert into Reservation(id)
values (5);

insert into MovieReservation(id, date, prefNbr)
values (5, "11-11-11", 1);

insert into Ticket(username, id)
values("Arcombe", 5);







