PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Theater;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS MoviePreformance;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS ForPreformance;
PRAGMA foreign_keys=ON;


create table Movie (
	title varchar(20),
	primary key (title)
);

create table Theater (
	name varchar(20),
	seats int,
	primary key (name)
);

create table Reservation (
	date date,
	id integer,
	primary key (date, id)
);

create table MoviePreformance (
	date date references Reservation(date),
	title varchar(20) references Movie(title),
	name varchar(20) references Theater(name),
	primary key (date, title, name)
);

create table User (
	username varchar(20),
	name varchar(20),
	adress varchar(20),
	telephone int,
	primary key (username)
);

create table Ticket (	
	username varchar(20),
	id integer,
	primary key (id),
	foreign key (id) references Reservation(id),
	foreign key (username) references User(username)
);

/*create table Ticket (	
	id integer,
	username varchar(20),
	primary key (id),
	foreign key (id) references Reservation(id),
	foreign key (username) references User(username)
);*/





create table Plays (
	title varchar(20),
	prefNbr integer,
	date date,
	primary key (date, prefNbr),
	foreign key (title) references Movie(title),
	foreign key (prefNbr, date) references MoviePreformance(prefNbr, date)
);

/*create table Location(
	name varchar(20),
	prefNbr integer,
	date date,
	primary key (date),
	foreign key (name) references Theater(name),
	foreign key (prefNbr, date) references MoviePreformance(prefNbr, date)
);*/

/*create table ForPreformance(
	id integer,
	prefNbr integer,
	primary key (id),
	foreign key (id) references Reservation(id),
	foreign key (prefNbr) references MoviePreformance(prefNbr)
);*/



insert into Movie(title)
values ("Star Wars");

insert into Movie(title)
values ("Assassin's Creed");

insert into Movie(title)
values ("Lala Land");

insert into Theater(name, seats)
values ("Salong 1", 300);

insert into Theater(name, seats)
values ("Salong 2", 170);

/*insert into MoviePreformance(date, title, name)
values ("11-11-11", "Star Wars", "Salong 1");

insert into MoviePreformance(date, title, name)
values ("11-11-12", "Star Wars", "Salong 2");*/

insert into MoviePreformance(date, prefNbr)
values ("11-11-11", 1);

insert into MoviePreformance(date, prefNbr)
values ("11-11-11", 2);

/*insert into MoviePreformance(date, prefNbr)
values ("11-11-12", 2);*/

insert into Plays(title, prefNbr, date)
values ("Star Wars", 1, "11-11-11");

insert into Plays(title, prefNbr, date)
values ("Star Wars", 2, "11-11-11");

/*insert into Plays(title, prefNbr, date)
values ("Star Wars", 2, "11-11-12");*/






