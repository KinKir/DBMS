1. create table sectors( sid int(6) primary key, s_name varchar(18));
Query OK, 0 rows affected (1.79 sec)

2. create table pack_grades( grade_id int(6), gname varchar(18), min_price INT(10), max_price int(10));
Query OK, 0 rows affected (0.38 sec)

3. create table packages( pack_id int(6), speed int(6), start_date date, monthly_payment int(10), sid int(6), foreign key(sid)  references sectors(sid));
Query OK, 0 rows affected (0.59 sec)

4. alter table packages add primary key (pack_id);

5. create table customers ( cid int(6) primary key, fname varchar(18), lname varchar(18), dob date, joining_date date, city varchar(18), state varchar(18), street varchar(18), phone_no int(15), fax varchar(18), monthly_discount int(10), pack_id int(6), foreign key(pack_id) references packages(pack_id));

6. insert into sectors values(1, "private");

7. insert into sectors values(2, "business");
8. select * from sectors;
+-----+----------+
| sid | s_name   |
+-----+----------+
|   1 | private  |
|   2 | business |
+-----+----------+

9. select * from packages;
+---------+-------+------------+-----------------+------+
| pack_id | speed | start_date | monthly_payment | sid  |
+---------+-------+------------+-----------------+------+
|       7 |   100 | 2017-09-13 |            2900 |    1 |
|     100 |   150 | 2017-10-09 |            2000 |    1 |
|     102 |   250 | 2017-10-11 |            2500 |    1 |
|     105 |   600 | 2017-10-13 |            3900 |    2 |
|     107 |   350 | 2017-09-11 |             500 |    2 |
+---------+-------+------------+-----------------+------+

10. select * from customers;
+-----+-------+-------+------------+--------------+-----------+-----------+--------+----------+--------+------------------+---------+
| cid | fname | lname | dob        | joining_date | city      | state     | street | phone_no | fax    | monthly_discount | pack_id |
+-----+-------+-------+------------+--------------+-----------+-----------+--------+----------+--------+------------------+---------+
| 100 | smith | k     | 1991-10-13 | 2017-10-10   | mumbai    | maha      | lik    |    12563 | 15gcd  |             2000 |    NULL |
| 101 | alice | m     | 1995-09-13 | 2016-12-10   | surathkal | kar       | lok    |   134563 | 16gcde |             7000 |       7 |
| 102 | blake | g     | 1989-12-07 | 2015-10-10   | jaipur    | rajasthan | kee    |   123456 | 123ac  |             1500 |     102 |
| 103 | bob   | u     | 1990-10-23 | 2017-05-10   | hyd       | ap        | bok    |    87363 | 5ggcde |              100 |     107 |
+-----+-------+-------+------------+--------------+-----------+-----------+--------+----------+--------+------------------+---------+

(a) 11.  select a.fname, a.lname, a.pack_id, b.speed from customers as a left join packages as b on a.pack_id=b.pack_id;
+-------+-------+---------+-------+
| fname | lname | pack_id | speed |
+-------+-------+---------+-------+
| smith | k     |    NULL |  NULL |
| alice | m     |       7 |   100 |
| blake | g     |     102 |   250 |
| bob   | u     |     107 |   350 |
| clive | j     |     100 |   150 |
+-------+-------+---------+-------+
5 rows in set (0.00 sec)


(b) 12. select a.fname, a.lname, a.pack_id, b.speed from customers as a left join packages as b on a.pack_id=b.pack_id where a.pack_id =100 or a.pack_id = 107 order by lname asc;
+-------+-------+---------+-------+
| fname | lname | pack_id | speed |
+-------+-------+---------+-------+
| clive | j     |     100 |   150 |
| bob   | u     |     107 |   350 |
+-------+-------+---------+-------+
2 rows in set (0.00 sec)

(c) 13.  select a.pack_id, a.speed, a.start_date,a.monthly_payment, b.s_name from packages as a left join sectors as b on a.sid=b.sid;
+---------+-------+------------+-----------------+----------+
| pack_id | speed | start_date | monthly_payment | s_name   |
+---------+-------+------------+-----------------+----------+
|       7 |   100 | 2017-09-13 |            2900 | private  |
|     100 |   150 | 2017-10-09 |            2000 | private  |
|     102 |   250 | 2017-10-11 |            2500 | private  |
|     105 |   600 | 2017-10-13 |            3900 | business |
|     107 |   350 | 2017-09-11 |             500 | business |
+---------+-------+------------+-----------------+----------+
5 rows in set (0.00 sec)

(d) 14. select a.fname, a.lname, a.pack_id, b.speed, b.monthly_payment, c.s_name from customers as a left join packages as b on a.pack_id=b.pack_id left join sectors as c on b.sid=c.sid;
+-------+-------+---------+-------+-----------------+----------+
| fname | lname | pack_id | speed | monthly_payment | s_name   |
+-------+-------+---------+-------+-----------------+----------+
| alice | m     |       7 |   100 |            2900 | private  |
| blake | g     |     102 |   250 |            2500 | private  |
| clive | j     |     100 |   150 |            2000 | private  |
| bob   | u     |     107 |   350 |             500 | business |
| smith | k     |    NULL |  NULL |            NULL | NULL     |
+-------+-------+---------+-------+-----------------+----------+
5 rows in set (0.00 sec)

(e) 15.  select a.fname, a.lname, a.pack_id, b.speed, b.monthly_payment, c.s_name from customers as a left join packages as b on a.pack_id=b.pack_id left join sectors as c on b.sid=c.sid where c.s_name= "business";
+-------+-------+---------+-------+-----------------+----------+
| fname | lname | pack_id | speed | monthly_payment | s_name   |
+-------+-------+---------+-------+-----------------+----------+
| bob   | u     |     107 |   350 |             500 | business |
+-------+-------+---------+-------+-----------------+----------+
1 row in set (0.00 sec)

(f) 16.  select a.fname, a.lname,a.joining_date,a.pack_id, b.speed,c.s_name from customers as a left join packages as b on a.pack_id=b.pack_id left join sectors as c on b.sid=c.sid where c.s_name= "private" and year(a.joining_date)= 2017;
+-------+-------+--------------+---------+-------+---------+
| fname | lname | joining_date | pack_id | speed | s_name  |
+-------+-------+--------------+---------+-------+---------+
| clive | j     | 2017-04-10   |     100 |   150 | private |
+-------+-------+--------------+---------+-------+---------+
1 row in set (0.00 sec)

17. alter table pack_grades add column pack_id int(6);
18. alter table pack_grades add foreign key(pack_id) references packages(pack_id);

19. select * from pack_grades;
+----------+-------+-----------+-----------+---------+
| grade_id | gname | min_price | max_price | pack_id |
+----------+-------+-----------+-----------+---------+
|        1 | a     |      1500 |      4000 |       7 |
|        2 | b     |      2500 |      5000 |     100 |
|        3 | c     |       500 |      1000 |     102 |
|        4 | d     |      5000 |      7000 |     105 |
|        5 | e     |       700 |      2500 |     107 |
+----------+-------+-----------+-----------+---------+
5 rows in set (0.00 sec)

(g) 20.  select a.pack_id, a.speed, a.monthly_payment, b.gname from packages as a left join pack_grades as b on a.pack_id= b.pack_id;
+---------+-------+-----------------+-------+
| pack_id | speed | monthly_payment | gname |
+---------+-------+-----------------+-------+
|       7 |   100 |            2900 | a     |
|     100 |   150 |            2000 | b     |
|     102 |   250 |            2500 | c     |
|     105 |   600 |            3900 | d     |
|     107 |   350 |             500 | e     |
+---------+-------+-----------------+-------+
5 rows in set (0.00 sec)

(h) 21. select a.fname, a.lname, b.speed, b.monthly_payment from customers as a inner join packages as b on a.pack_id= b.pack_id;
+-------+-------+-------+-----------------+
| fname | lname | speed | monthly_payment |
+-------+-------+-------+-----------------+
| alice | m     |   100 |            2900 |
| blake | g     |   250 |            2500 |
| bob   | u     |   350 |             500 |
| clive | j     |   150 |            2000 |
+-------+-------+-------+-----------------+
4 rows in set (0.00 sec)

(i) 22. select a.fname, a.lname, b.speed, b.monthly_payment from customers as a left join packages as b on a.pack_id= b.pack_id;
+-------+-------+-------+-----------------+
| fname | lname | speed | monthly_payment |
+-------+-------+-------+-----------------+
| smith | k     |  NULL |            NULL |
| alice | m     |   100 |            2900 |
| blake | g     |   250 |            2500 |
| bob   | u     |   350 |             500 |
| clive | j     |   150 |            2000 |
+-------+-------+-------+-----------------+
5 rows in set (0.00 sec)

(j) 23.  select a.fname, a.lname, b.speed, b.monthly_payment from customers as a right join packages as b on a.pack_id= b.pack_id;
+-------+-------+-------+-----------------+
| fname | lname | speed | monthly_payment |
+-------+-------+-------+-----------------+
| alice | m     |   100 |            2900 |
| clive | j     |   150 |            2000 |
| blake | g     |   250 |            2500 |
| NULL  | NULL  |   600 |            3900 |
| bob   | u     |   350 |             500 |
+-------+-------+-------+-----------------+
5 rows in set (0.00 sec)

(k) 24. select a.fname, a.lname, b.speed, b.monthly_payment from customers as a left join packages as b on a.pack_id= b.pack_id union select a.fname, a.lname, b.speed, b.monthly_payment from customers as a right join packages as b on a.pack_id= b.pack_id;
+-------+-------+-------+-----------------+
| fname | lname | speed | monthly_payment |
+-------+-------+-------+-----------------+
| smith | k     |  NULL |            NULL |
| alice | m     |   100 |            2900 |
| blake | g     |   250 |            2500 |
| bob   | u     |   350 |             500 |
| clive | j     |   150 |            2000 |
| NULL  | NULL  |   600 |            3900 |
+-------+-------+-------+-----------------+
6 rows in set (0.02 sec)

(l) 25. select fname, lname, pack_id from customers where pack_id in (select pack_id from customers where fname="blake" or fname="smith") and fname!='smith' and fname!='blake';
Empty set (0.00 sec)

(m) 26. select lname, fname, monthly_discount from customers where monthly_discount < (select monthly_discount from customers where cid=102);
+-------+-------+------------------+
| lname | fname | monthly_discount |
+-------+-------+------------------+
| u     | bob   |              100 |
| j     | clive |              100 |
+-------+-------+------------------+
2 rows in set (0.02 sec)

(n) 27.  select pack_id, speed from packages where speed = ( select speed from packages where pack_id=7) and pack_id !=7;
Empty set (0.01 sec)
