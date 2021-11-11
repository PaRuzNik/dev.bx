-- 1).  Вывести список фильмов, в которых снимались одновременно Арнольд Шварценеггер* и Линда Хэмилтон*.
select movie.ID, movie_title.TITLE, director.NAME
from movie
    left join  director
        on director.ID = movie.DIRECTOR_ID
    inner join movie_title
        on movie.ID = movie_title.MOVIE_ID
where (MOVIE_ID in (
    select MOVIE_ID
    from movie_actor
    where ACTOR_ID = 1) and MOVIE_ID in(select MOVIE_ID
    from movie_actor
    where ACTOR_ID = 3)) and LANGUAGE_ID = 'ru';
-- 2). Вывести список названий фильмов на английском языке с "откатом" на русский, в случае если название на английском не задано.
select MOVIE_ID, TITLE
from movie_title
where LANGUAGE_ID in ('en','ru')
group by MOVIE_ID;
-- 3). Вывести самый длительный фильм Джеймса Кэмерона*.
select ID, TITLE, LENGTH
from movie
    inner join movie_title
        on movie.ID = movie_title.MOVIE_ID
where DIRECTOR_ID = 1 and length in (
    select max(LENGTH) as LENGTH
    from movie) and LANGUAGE_ID = 'ru';
-- 4). Вывести список фильмов с названием, сокращённым до 10 символов. Если название короче 10 символов – оставляем как есть. Если длиннее – сокращаем до 10 символов и добавляем многоточие.
select ID, IF(char_length(TITLE) > 10, concat(left(TITLE, 10), '...'), TITLE) as TITLE
from movie
	     inner join movie_title
	         on ID = MOVIE_ID;
-- 5).Вывести количество фильмов, в которых снимался каждый актёр.
select NAME, (select count(MOVIE_ID) from movie_actor where ID = ACTOR_ID)
from actor;
-- 6).Вывести жанры, в которых никогда не снимался Арнольд Шварценеггер*.
select ID, NAME
from genre
where NAME not in (
    select distinct NAME
    from genre
    inner join movie_genre mg
        on genre.ID = mg.GENRE_ID
    inner join  movie m
        on mg.MOVIE_ID = m.ID
where m.ID IN (
    select MOVIE_ID
    from movie_actor
    where ACTOR_ID = 1));
-- 7).Вывести список фильмов, у которых больше 3-х жанров.
select ID, TITLE
from movie
    inner join movie_title mt
        on movie.ID = mt.MOVIE_ID
where LANGUAGE_ID = 'ru' and (
    select count(MOVIE_ID)
    from movie_genre
    WHERE movie.ID = movie_genre.MOVIE_ID) > 3;
-- 8).Вывести самый популярный жанр для каждого актёра.
select a.NAME, g.NAME
from movie m
     inner join movie_actor ma
         on m.ID = ma.MOVIE_ID
     inner join actor a
         on ma.ACTOR_ID = a.ID
     inner join movie_genre mg
         on m.ID = mg.MOVIE_ID
     inner join genre g
         on mg.GENRE_ID = g.ID
where g.ID =
      (
      select g2.ID
      from movie m2
           inner join movie_genre mg2
               on m2.ID = mg2.MOVIE_ID
           inner join genre g2
               on mg2.GENRE_ID = g2.ID
           inner join movie_actor ma2
               on m2.ID = ma2.MOVIE_ID
          inner join actor a2
               on ma2.ACTOR_ID = a2.ID
      where ma2.ACTOR_ID = a.ID
      group by g2.ID
      order by count(1) desc
      limit 1)
group by a.NAME;