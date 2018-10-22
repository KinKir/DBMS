CREATE TABLE actor(act_id INT PRIMARY KEY, act_name varchar(25), act_gender char);

CREATE TABLE director(dir_id int PRIMARY KEY, dir_name varchar(10), dir_phone int(10));

CREATE TABLE movies(mov_id int PRIMARY KEY, mov_title varchar(10), mov_year int, mov_lang varchar(10), dir_id int, FOREIGN KEY(dir_id) REFERENCES director(dir_id));

CREATE TABLE movie_cast(act_id int, mov_id int, role varchar(10), FOREIGN KEY(act_id) REFERENCES actor(act_id), FOREIGN KEY(mov_id) REFERENCES movies(mov_id));

CREATE TABLE rating(mov_id int, rev_start int, FOREIGN KEY(mov_id) REFERENCES movies(mov_id));

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


3. select distinct(Act_name) from actor inner join movie_cast on actor.Act_id=movie_cast.Act_id inner join (select Mov_id from movies where Mov_Year<2010 or Mov_Year>2017) as x on movie_cast.Mov_id=x.Mov_id; 
+------------+
| Act_name   |
+------------+
| Matt Damon |
+------------+

