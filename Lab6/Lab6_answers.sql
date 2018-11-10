CREATE TABLE actor(Act_id INT PRIMARY KEY, Act_Name varchar(25), Act_Gender char);

CREATE TABLE director(Dir_id int PRIMARY KEY, Dir_Name varchar(10), Dir_Phone int(10));

CREATE TABLE movies(Mov_id int PRIMARY KEY, Mov_Title varchar(10), Mov_Year int, Mov_Lang varchar(10), Dir_id int, FOREIGN KEY(Dir_id) REFERENCES director(Dir_id));

CREATE TABLE movie_cast(Act_id int, Mov_id int, Role varchar(10), FOREIGN KEY(Act_id) REFERENCES actor(Act_id), FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id));

CREATE TABLE rating(Mov_id int, Rev_Stars int, FOREIGN KEY(Mov_id) REFERENCES movies(Mov_id));

INSERT INTO director VALUES(1, 'Stephen', 12344556);
INSERT INTO director VALUES(2, 'Michael', 12344553);
INSERT INTO director VALUES (3, 'Daniel', 2335435);
INSERT INTO director VALUES (4, 'Spielberg', 1234532);

INSERT INTO actor VALUES(1, 'Matt Damon', 'M');
INSERT INTO actor VALUES(2, 'Anna Kendrick', 'F');
INSERT INTO actor VALUES(3, 'Anne Hathaway', 'F');;
INSERT INTO actor VALUES(4, 'DiCaprio', 'M');
INSERT INTO actor VALUES(5, 'George Clooney', 'M');
INSERT INTO actor VALUES(6, 'Blake Lively', 'F');


INSERT INTO movies VALUES(1, 'The Intern', 2018, 'English', 2);
INSERT INTO movies VALUES(2, 'Oceans 11', 2005, 'English', 2);
INSERT INTO movies VALUES(3, 'Titanic', 2006, 'English', 4);
INSERT INTO movies VALUES(4, 'Gravity', 2018, 'English', 1);

insert into movie_cast values(1, 1, "lead");
insert into movie_cast values(1, 2, "lead");


1. select Mov_Title from movies, director where movies.Dir_id=director.Dir_id and director.Dir_Name='Michael';
+------------+
| Mov_Title  |
+------------+
| The Intern |
| Oceans 11  |
+------------+


2. select Mov_Title from movies inner join movie_cast on movies.Mov_id=movie_cast.Mov_id inner join (select a.Act_id, count(*) as c from actor as a,movie_cast as m where a.Act_id=m.Act_id) as x on movie_cast.Act_id=x.Act_id where x.c>1;
+------------+
| Mov_Title  |
+------------+
| The Intern |
| Oceans 11  |
+------------+


3. select distinct Act_name
from actor, movies m1, movies m2, movie_cast
where actor.Act_id = movie_cast.Act_id and movie_cast.Mov_id = m1.Mov_id and 
	movie_cast.Mov_id = m2.Mov_id and m1.Mov_Year<2010 and m2.Mov_Year>2017;
+------------+
| Act_name   |
+------------+
| Matt Damon |
+------------+

4. select Mov_Title, MAX(Rev_Stars) from rating
join movies on movies.Mov_id=rating.Mov_id
group by movies.Mov_id
order by Mov_Title;

5. update rating set Rev_Stars=4 where Mov_id in (select Mov_id from movies where Dir_id=(select Dir_id from director where Dir_Name="Stephen");

6. SELECT Dir_Name, Mov_Title FROM  director NATURAL JOIN movies NATURAL JOIN movie_cast WHERE Role IS NOT NULL AND Mov_Title='Innocents';

7. SELECT Mov_Title FROM movies WHERE Mov_id NOT IN (SELECT Mov_id FROM rating);

