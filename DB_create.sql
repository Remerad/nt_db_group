CREATE DATABASE Music;
		   
create table if not exists Genre(
id serial primary key,
Name varchar(128) not null
);

create table if not exists Artist(
id serial primary key,
Name varchar(128) not null
);

create table if not exists Album (
id serial primary key,
Name varchar(128) not null,
LaunchDate integer not null
);

create table if not exists Collection(
id serial primary key,
Name varchar(128) not null,
LaunchDate integer not null
);

create table if not exists Track(
id serial primary key,
Name varchar(128) not null,
Duration integer check(Duration >= 1),
AlbumID integer references Album(id)
);

create table if not exists CollectionTrackCard(
id serial primary key,
CollectionID integer references Collection(id),
TrackID integer references Track(id)
);

create table if not exists AlbumArtistCard (
id serial primary key,
AlbumID integer references Album(id),
ArtistID integer references Artist(id)
);

create table if not exists ArtistGenreCard (
id serial primary key,
ArtistID integer references Artist(id),
GenreID integer references Genre(id)
);
