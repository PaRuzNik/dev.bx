create table language
(
	LANGUAGE_ID varchar(2) not null ,
	PRIMARY KEY (LANGUAGE_ID),
	NAME varchar(500)
);

create table movie_title
(
	MOVIE_ID int not null,
	FOREIGN KEY FK_MA_MOVIE (MOVIE_ID)
		REFERENCES movie(ID)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT,
	LANGUAGE_ID varchar(2) not null,
	FOREIGN KEY FK_ML_LANGUAGE (LANGUAGE_ID)
		REFERENCES language(LANGUAGE_ID)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT,
	TITLE varchar(500) not null
);

alter table movie
	drop column TITLE;

insert into language(LANGUAGE_ID, NAME)
values ('ru', 'russian'),
       ('en', 'english'),
       ('de', 'dutch');

insert into movie_title(MOVIE_ID, LANGUAGE_ID, TITLE)
select ID,'ru', TITLE
from movie;